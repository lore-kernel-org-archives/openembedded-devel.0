Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1L23Cq-0004GY-63
	for openembedded-devel@openembedded.org; Mon, 17 Nov 2008 13:27:52 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1L23AY-0003a4-AJ
	for openembedded-devel@openembedded.org; Mon, 17 Nov 2008 12:25:30 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Mon, 17 Nov 2008 12:25:30 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Mon, 17 Nov 2008 12:25:30 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 17 Nov 2008 13:25:21 +0100
Message-ID: <gfrnrh$e05$1@ger.gmane.org>
References: <1226923118.6891.54.camel@akaza1>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b2pre) Gecko/20081114 Shredder/3.0b1pre
In-Reply-To: <1226923118.6891.54.camel@akaza1>
Sender: news <news@ger.gmane.org>
Subject: Re: KERNEL_INCLUDES in uClibc.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 17 Nov 2008 12:27:52 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17-11-08 12:58, Mikael Rosbacke wrote:
> Good day.
>
> I'm currently trying to get a uClibc based minimal image for x86 to
> build and have some problems with it. I'm using DISTRO='minimal-uclibc'
> and MACHINE='x86' and trying to build the target 'minimal-image'.

Try using the angstrom distribution, since minima-uclibc isn't really 
support or working currently.

regards,

Koen

>
> I get a failed build on the packet uclibc-initial. I tried doing the
> install stage which went fine. But with the command:
>    bitbake -b uclibc-initial_0.9.30 -c build -D -D
>
> I get:
> ...
> # Remove ifaddrs.h since the corresponding functionality is disabled
> rm
> -f /home/mikaelr/oe/tmp/staging/i486-linux-uclibc/usr/include/ifaddrs.h
>    AS lib/crt1.o
> CROSS COMPILE Badness: /usr/include in INCLUDEPATH: /usr/include/
> cc1: internal compiler error: in add_path, at c-incpath.c:362
> Please submit a full bug report,
> with preprocessed source if appropriate.
> See<URL:http://gcc.gnu.org/bugs.html>  for instructions.
> make: *** [lib/crt1.o] Error 1
> DEBUG:
> Parsing /home/mikaelr/oe/openembedded/packages/uclibc/uclibc-initial_0.9.30.bb (full)
> DEBUG:
> BB /home/mikaelr/oe/openembedded/packages/uclibc/uclibc-initial_0.9.30.bb: handle(data)
> DEBUG: BB uclibc_0.9.30.bb: handle(data, include)
> DEBUG: BB uclibc.inc: handle(data, include)
> DEBUG: update_data()
> DEBUG: update_data()
> DEBUG: update_data()
> NOTE: package uclibc-initial-0.9.30: started
> ...
>
> It seems gcc is complaining about trying to include host system headers
> while cross compiling. I managed to reproduce the error in a normal
> build from the uclibc tarball using the i486 compiler built with the oe
> toolchain.
>
> The uclibc accepts another make variable KERNEL_HEADERS. I've modified
> the tree according to this patch:
>
> mikaelr@akaza1:~/oe/openembedded$ git diff
> diff --git a/packages/uclibc/uclibc-initial_0.9.30.bb
> b/packages/uclibc/uclibc-initial_0.9.30.bb
> index c56e5fb..679a55e 100644
> --- a/packages/uclibc/uclibc-initial_0.9.30.bb
> +++ b/packages/uclibc/uclibc-initial_0.9.30.bb
> @@ -9,13 +9,18 @@ PACKAGES = ""
>
>   do_stage() {
>          # Install initial headers into the cross dir
> +       echo "Hello!"
>          make PREFIX= DEVEL_PREFIX=${UCLIBC_STAGE_PREFIX}/ \
>                  RUNTIME_PREFIX=${UCLIBC_STAGE_PREFIX}/ \
> +
> KERNEL_HEADERS=/home/mikaelr/oe/tmp/work/i486-linux-uclibc/linux-libc-headers-2.6.23-r3/image/usr/include/ \
>                  pregen install_dev
> +       echo "Hello2!"
>          make PREFIX= DEVEL_PREFIX=${UCLIBC_STAGE_PREFIX}/ \
>                  RUNTIME_PREFIX=${UCLIBC_STAGE_PREFIX}/ \
> +               KERNEL_HEADERS=
> ${WORKDIR}/i486-linux-uclibc/linux-libc-headers-2.6.23-r3/image/usr/include/ \
>                  lib/crt1.o lib/crti.o lib/crtn.o
>
> +       echo "Hello3!"
>          install -d ${CROSS_DIR}/${TARGET_SYS}
>          ln -sf include ${CROSS_DIR}/${TARGET_SYS}/sys-include
>
> diff --git a/packages/uclibc/uclibc.inc b/packages/uclibc/uclibc.inc
> index 9b27e1f..5f8d15d 100644
> --- a/packages/uclibc/uclibc.inc
> +++ b/packages/uclibc/uclibc.inc
> @@ -147,6 +147,7 @@ do_configure() {
>   }
>
>   do_stage() {
> +       echo "Hello4!"
>          # This MUST be done first because we
>          # will install crt1.o in the install_dev stage and gcc needs it
>
> mikaelr@akaza1:~/oe/openembedded$
>
> The build error changes to:
> ...
> # Remove ifaddrs.h since the corresponding functionality is disabled
> rm
> -f /home/mikaelr/oe/tmp/staging/i486-linux-uclibc/usr/include/ifaddrs.h
>    AS lib/crt1.o
> libc/sysdeps/linux/alpha/crt1.S: Assembler messages:
> libc/sysdeps/linux/alpha/crt1.S:43: Error: alignment not a power of 2
> libc/sysdeps/linux/alpha/crt1.S:45: Error: unknown pseudo-op: `.ent'
> libc/sysdeps/linux/alpha/crt1.S:57: Error: unknown pseudo-op: `.frame'
> libc/sysdeps/linux/alpha/crt1.S:58: Error: no such instruction: `br
> $29,1f'
> libc/sysdeps/linux/alpha/crt1.S:59: Error: no such instruction: `ldgp
> $29,0($29)'
> libc/sysdeps/linux/alpha/crt1.S:60: Error: suffix or operands invalid
> for `sub'
> libc/sysdeps/linux/alpha/crt1.S:61: Error: suffix or operands invalid
> for `mov'
> libc/sysdeps/linux/alpha/crt1.S:62: Error: unknown pseudo-op:
> `.prologue'
> libc/sysdeps/linux/alpha/crt1.S:65: Error: no such instruction: `lda
> $16,main'
> libc/sysdeps/linux/alpha/crt1.S:67: Error: no such instruction: `ldl
> $17,16($30)'
> libc/sysdeps/linux/alpha/crt1.S:68: Error: no such instruction: `lda
> $18,24($30)'
> libc/sysdeps/linux/alpha/crt1.S:71: Error: no such instruction: `lda
> $19,_init'
> libc/sysdeps/linux/alpha/crt1.S:72: Error: no such instruction: `lda
> $20,_fini'
> libc/sysdeps/linux/alpha/crt1.S:75: Error: suffix or operands invalid
> for `mov'
> libc/sysdeps/linux/alpha/crt1.S:78: Error: no such instruction: `stq
> $30,0($30)'
> libc/sysdeps/linux/alpha/crt1.S:82: Error: no such instruction: `jsr
> $26,__uClibc_main'
> libc/sysdeps/linux/alpha/crt1.S:86: Error: invalid character '_' in
> mnemonic
> make: *** [lib/crt1.o] Error 1
> ERROR: function do_stage failed
> ERROR: see log
> in /home/mikaelr/oe/tmp/work/x86-linux-uclibc/uclibc-initial-0.9.30-r0/temp/log.do_stage.4580
> ...
>
> Of some reason, the uclibc want to build the alpha version which, by
> coincidence is the first target listed when manually configuring the
> uclibc sources. I would suspect there is a missing configuration at this
> stage.
>
> In the log, I can see the 'Hello1' message but not the second one so it
> should be the first make command failing.
>
> Is this a known issue and is there a simple workaround for this? It
> seems to be the type of thing that would hit more ppl than me. I've done
> the initial build with gcc 4.3 but also had it with a manually built
> native toolchain for 4.1.2.
>
> Is it worthwhile to continue along this path or is there a better way to
> get an x86 uclibc image using open embedded?
>
> Thanks in advance for any advice.
>
> --- Mikael R




