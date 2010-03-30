Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <bmentink@gmail.com>) id 1Nwg10-0008RP-BA
	for openembedded-devel@lists.openembedded.org;
	Tue, 30 Mar 2010 20:18:15 +0200
Received: by pwj5 with SMTP id 5so4225115pwj.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Mar 2010 11:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:received:message-id:subject:from:to:content-type;
	bh=BCotLsZgc3s8Vl7rUcwq02L7meLAkzipXFjZ8ovrYKA=;
	b=W8vfu04df5lstZiAjIhWuPFcPSnOiZtqrU9IXystDZ79kSVbcSFFJ9LW3XafYAQTK6
	ZSl5+XV6MJjP4HjIn1vNMSQaYfPiNa6D3kSnoFkfyNrscv25/WviaZPwkWIGWWYIcQpD
	UIWG31QsRHdqEbsIlYF4IZHwWqn/1OYTb/whs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=QIbeERFRvIk8EOUanv19+W+83WmpgZxrdbY9/08yGHfYhNvBacyr0dV2CMD2KEioAT
	SR/blch1Eo+dasaiWAm7ex9C8+xGs3rQK4lBAfiei+drQZHZ2VypKLi993yC75dJMK5X
	Pzdx+bFeirHvqqRb0Qjinm9fxojv+Anx2gaz4=
MIME-Version: 1.0
Received: by 10.142.157.6 with HTTP; Tue, 30 Mar 2010 11:14:57 -0700 (PDT)
In-Reply-To: <19c1b8a91003301103xfcfefddubdc73a584d8c41cc@mail.gmail.com>
References: <a25fc1971003291229o686565d7if29755e2b4bbe482@mail.gmail.com>
	<19c1b8a91003301103xfcfefddubdc73a584d8c41cc@mail.gmail.com>
Date: Wed, 31 Mar 2010 07:14:57 +1300
Received: by 10.142.1.41 with SMTP id 41mr1476003wfa.289.1269972897839; Tue, 
	30 Mar 2010 11:14:57 -0700 (PDT)
Message-ID: <a25fc1971003301114k3b1e53bch8d22ea79c26a41a0@mail.gmail.com>
From: Bernard Mentink <bmentink@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.47
X-SA-Exim-Mail-From: bmentink@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Porting OE to new hardware
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
X-List-Received-Date: Tue, 30 Mar 2010 18:18:15 -0000
Content-Type: text/plain; charset=ISO-8859-1

Thanks Khem,

That helps a lot. On the kernel config issue there is one thing I don't
understand.

I have set up to do an ARM  i.mx31 build, but when I did a "make menuconfig"
in the /build/tmp/.../kernelxxxxx directory, it only shows x86 options, I
don't know where all the i.mx31 kernel options are.

Thanks,
Bernie

On Wed, Mar 31, 2010 at 7:03 AM, Khem Raj <raj.khem@gmail.com> wrote:

> On Mon, Mar 29, 2010 at 12:29 PM, Bernard Mentink <bmentink@gmail.com>
> wrote:
> > Hi All,
> >
> > I am jumping across to this email list as the user one has very little
> > traffic.
> >
> > I have just found OE and would like to use it to get Linux up and running
> on
> > some custom hardware. The hardware is currently running the logicloader
> > bootloader from LogicPD and a YAFFS2 filesystem.
> >
> > I have found very little info on the steps necessary to port to new
> > hardware. As far as OE is concerned, I have built an image after altering
> > the MACHINE and DISTRO to something close to what I need.
> > I now have a zimage (kernel) and a rootFS.
> >
> > However I have a number of questions:
> >
> > 1. To boot with zimage with  logicloader, I have to load the image into
> > memory at an address, and then execute it at the start code which I
> presume
> > is an offset the start of the image. Can anyone tell me how I can find
> > the relevant map file to work out
> > what offset I need to apply? I did a search for *.map files in the
> build/tmp
> > direcory and found nada ..
>
> this post tells how to load linux kernel using logicloader. It might help
> you.
>
> http://forums.freescale.com/t5/Other-Microcontrollers/load-zImage-or-vmlinux-using-LogicLoader/td-p/32749;jsessionid=F6F40E5BF81249CFF86028A7AB86DE29
>
> >
> > 2. How do I do a kernel config? Is there an option to pass to bitbake to
> do
> > that, or do I have to find the kernel source and do it manually, then
> > rebuild with bitbake?
>
> You can copy the .config you want into
> recipes/linux/<chosen-kernel-version>/<machine>/defconfig file and it
> will use
> it to build the kernel for you machine. You can also edit the .config
> on fly search the ml on how to do it.
>
> >
> > 3. What src files in the kernel do I need to to maybe alter to get the
> > serial port and memory map right for my target hardware ..
> >
>
> you can specify serial port in kernel commandline too unless your board
> needs
> a special handling of serial port.
>
> > 4. Once I get the kernel booting, I need it to load the rootfs, initially
> I
> > can boot that from NFS, but I would like to eventually load it from my
> YAFFS
> > NAND partition, how do I do that?
>
> you can do that thru kernel commandline.
>
> >
> >
> > Hope someone can give me some pointers in the right direction ... I would
> > love to kick off WinCE from this hardware ;-)
> >
> > Cheers,
> > Bernie
> >
> > --
> > You always have believers and scepticts.. A True inventor is always a
> > believer..
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> >
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



-- 
You always have believers and scepticts.. A True inventor is always a
believer..

