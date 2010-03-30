Received: from mail-iw0-f178.google.com ([209.85.223.178])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Nwfpd-0008AW-3m
	for openembedded-devel@lists.openembedded.org;
	Tue, 30 Mar 2010 20:06:29 +0200
Received: by iwn8 with SMTP id 8so315300iwn.16
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Mar 2010 11:03:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:received:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=NXUwWpoBy2CQqmNCqdqVEUZg8AAGGts745CaWkrz0Vw=;
	b=tlVq7hlfFCXbuW+o6p7GpmUXNJksDZaPbwoSs+VxtkNUuy4M5h8CNLHLwq3Vkhx3lb
	gjP+bbXwplUqFNyqRR5VbG5/4DvfhCaY9loKrYt3RC7QURHUblPdHzjgdIrbtyMVZaAB
	uioM4bJLBDG5U+6A56wgT9F+lbhGB0ZwK/oV8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=wJN1VQ73+7HnnXsw6XB2YwTP6SAwc0r1rFXjXRUn+KUG/4a4x0s2yc98Afw8HaWFOk
	SaKJF4FO7K/IGMNiDOeI66B+VmvcOIaZzx3oOcduAKMXrH49PStPJnInSviyTpYJyKz/
	/uVtiAXf4GsNc18oXNUqKCZPjWknOB7+zuJjo=
MIME-Version: 1.0
Received: by 10.231.32.66 with HTTP; Tue, 30 Mar 2010 11:03:13 -0700 (PDT)
In-Reply-To: <a25fc1971003291229o686565d7if29755e2b4bbe482@mail.gmail.com>
References: <a25fc1971003291229o686565d7if29755e2b4bbe482@mail.gmail.com>
Date: Tue, 30 Mar 2010 11:03:13 -0700
Received: by 10.231.169.144 with SMTP id z16mr1889752iby.25.1269972193451; 
	Tue, 30 Mar 2010 11:03:13 -0700 (PDT)
Message-ID: <19c1b8a91003301103xfcfefddubdc73a584d8c41cc@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.223.178
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
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
X-List-Received-Date: Tue, 30 Mar 2010 18:06:30 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 29, 2010 at 12:29 PM, Bernard Mentink <bmentink@gmail.com> wrot=
e:
> Hi All,
>
> I am jumping across to this email list as the user one has very little
> traffic.
>
> I have just found OE and would like to use it to get Linux up and running=
 on
> some custom hardware. The hardware is currently running the logicloader
> bootloader from LogicPD and a YAFFS2 filesystem.
>
> I have found very little info on the steps necessary to port to new
> hardware. As far as OE is concerned, I have built an image after altering
> the MACHINE and DISTRO to something close to what I need.
> I now have a zimage (kernel) and a rootFS.
>
> However I have a number of questions:
>
> 1. To boot with zimage with =A0logicloader, I have to load the image into
> memory at an address, and then execute it at the start code which I presu=
me
> is an offset the start of the image. Can anyone tell me how I can find
> the relevant map file to work out
> what offset I need to apply? I did a search for *.map files in the build/=
tmp
> direcory and found nada ..

this post tells how to load linux kernel using logicloader. It might help y=
ou.
http://forums.freescale.com/t5/Other-Microcontrollers/load-zImage-or-vmlinu=
x-using-LogicLoader/td-p/32749;jsessionid=3DF6F40E5BF81249CFF86028A7AB86DE2=
9

>
> 2. How do I do a kernel config? Is there an option to pass to bitbake to =
do
> that, or do I have to find the kernel source and do it manually, then
> rebuild with bitbake?

You can copy the .config you want into
recipes/linux/<chosen-kernel-version>/<machine>/defconfig file and it
will use
it to build the kernel for you machine. You can also edit the .config
on fly search the ml on how to do it.

>
> 3. What src files in the kernel do I need to to maybe alter to get the
> serial port and memory map right for my target hardware ..
>

you can specify serial port in kernel commandline too unless your board nee=
ds
a special handling of serial port.

> 4. Once I get the kernel booting, I need it to load the rootfs, initially=
 I
> can boot that from NFS, but I would like to eventually load it from my YA=
FFS
> NAND partition, how do I do that?

you can do that thru kernel commandline.

>
>
> Hope someone can give me some pointers in the right direction ... I would
> love to kick off WinCE from this hardware ;-)
>
> Cheers,
> Bernie
>
> --
> You always have believers and scepticts.. A True inventor is always a
> believer..
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


