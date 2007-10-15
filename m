Received: from [209.85.128.187] (helo=fk-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <philipp.zabel@gmail.com>) id 1IhW6A-0006kC-IP
	for openembedded-devel@openembedded.org; Mon, 15 Oct 2007 21:59:34 +0200
Received: by fk-out-0910.google.com with SMTP id 18so1827181fks
	for <openembedded-devel@openembedded.org>;
	Mon, 15 Oct 2007 12:53:10 -0700 (PDT)
Received: by 10.82.160.19 with SMTP id i19mr10267548bue.1192477989525;
	Mon, 15 Oct 2007 12:53:09 -0700 (PDT)
Received: by 10.82.119.15 with HTTP; Mon, 15 Oct 2007 12:53:09 -0700 (PDT)
Message-ID: <74d0deb30710151253i6390fbaax7a930b52c81c74c@mail.gmail.com>
Date: Mon, 15 Oct 2007 21:53:09 +0200
From: "pHilipp Zabel" <philipp.zabel@gmail.com>
To: "Richard Purdie" <rpurdie@rpsys.net>
In-Reply-To: <1192196037.24680.21.camel@localhost.localdomain>
MIME-Version: 1.0
References: <1192196037.24680.21.camel@localhost.localdomain>
Cc: openembedded-devel <openembedded-devel@openembedded.org>
Subject: Re: Kdrive 1.4 resume issues
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 15 Oct 2007 19:59:34 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 10/12/07, Richard Purdie <rpurdie@rpsys.net> wrote:
> I mentioned I knew something about the resume problem seen in Kdrive at
> OEDEM. I don't know if the details below apply to the problem people are
> seeing with 1.4 or not, just that this potential problem does exist
> (this was reported to happen in 1.1.something iirc). FWIW, I'm not the
> one who found this, I'm just passing on the info.
>
> There is a potential race condition with the virtual terminal refresh
> during resume:
>
> a) Device suspends
>
> b) The kernel VT subsystem delivers a signal to KDrive, requesting that
> the virtual console be released
>
> c) Kernel stalls suspend until KDrive makes an ioctl's on the terminal
> to switch it out of graphical mode
>
> d) Kernel immediately starts executing, and nothing from userspace ever
> gets scheduled again before suspending. This means that KDrive's main
> event loop (in os/WaitFor.c) is just done processing the VT release
> request, but hasn't yet made a select() call for the next iteration of
> its loop.
>
> e) System sleeps...
>
> f) Kernel resume code takes over, begins restoring things. Partway
> along, it attempts to restore the VT. So another signal is delivered to
> KDrive to restore the graphics.
>
> g) Async signal handler runs in KDrive (hw/kdrive/linux/linux.c,
> LinuxVTRequest), setting a flag ("kdSwitchPending") for inspection on
> the next time that select() returns in the main event loop.
>
> h) Unfortunately, since KDrive isn't yet scheduled after the resume,
> the main event loop hasn't even gotten around to doing select() yet. So
> this flag is never consulted before WaitForSomething() (os/WaitFor.c)
> goes to sleep blocking on input. The VT restoration is never processed.
>
> All this is not normally a problem, since there's some time between
> successive arrivals of VT signals.
>
> The patch below is not really a fix, but it checks whether a VT
> reset is needed immediately before making the select() call.
>
> An alternative that was suggested would be to stick the receiving end of
> a pipe into the set of fd's checked by the select() call. Then the
> LinuxVTRequest() signal handler would write a dummy byte into the pipe
> instead of setting a flag.
>
> I can't help feeling there must be a better solution entirely though.
> I'd be interested to hear if this patch below helps or not...
>
> Cheers,
>
> Richard
>
> diff -Nur xorg-server-X11R7.1-1.1.0.orig/os/WaitFor.c
> --- xorg-server-X11R7.1-1.1.0.orig/os/WaitFor.c
> +++ xorg-server-X11R7.1-1.1.0/os/WaitFor.c
> @@ -152,6 +152,8 @@
>   *     pClientsReady is an array to store ready client->index values into.
>   *****************/
>
> +extern Bool kdSwitchPending;
> +
>  int
>  WaitForSomething(int *pClientsReady)
>  {
> @@ -232,7 +234,7 @@
>         }
>  #endif /* XTESTEXT1 */
>         /* keep this check close to select() call to minimize race */
> -       if (dispatchException)
> +       if (dispatchException || kdSwitchPending)
>             i = -1;
>         else if (AnyClientsWriteBlocked)
>         {

Unfortunately that doesn't seem to be the same issue that I am
encountering. I don't even suspend the device. All I do ist the
following: Start

# Xfbdev -mouse tslib &

X starts, I can play with the mouse pointer

# killall -USR1 Xfbdev

X switches back to the console

# killall -USR1 Xfbdev

The X screen is visible again, no pointer, it hangs at

# gdb -p $(pidof Xfbdev)
...
(gdb) bt
#0  0x402e36ac in read () from /lib/libc.so.6
#1  0x000e4a0c in LinuxKeyboardEnable (ki=0x3) at keyboard.c:749
#2  0x00047aa4 in KdEnableInput () at kinput.c:338
#3  0x000444a8 in KdResume () at kdrive.c:351
#4  0x000444fc in KdEnableScreens () at kdrive.c:365
#5  0x00044984 in KdProcessSwitch () at kdrive.c:374
#6  0x0004650c in KdWakeupHandler (screen=-512, data=0xbeca4364, lresult=256,
    readmask=<value optimized out>) at kinput.c:2224
#7  0x0002f218 in WakeupHandler (result=-1, pReadmask=0x123098)
    at dixutils.c:478
#8  0x000d2db0 in WaitForSomething (pClientsReady=0xbeca4778) at WaitFor.c:240
#9  0x0002b4a0 in Dispatch () at dispatch.c:425
#10 0x00013e08 in main (argc=65535, argv=0x20, envp=<value optimized out>)
    at main.c:452

although the LinuxConsoleFd, which it reads from in keyboard.c:749 is
opened as nonblocking. Any further ideas?

cheers
Philipp


