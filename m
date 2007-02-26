Received: from [192.132.34.13] (helo=amail.unina.it)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <ranaldo@unina.it>) id 1HLdN6-0001Bi-37
	for openembedded-devel@openembedded.org; Mon, 26 Feb 2007 11:46:20 +0100
Received: from blaster.unina.it ([192.132.34.15]) (authenticated bits=0)
	by amail.unina.it (8.13.4/8.13.4) with ESMTP id l1QAkI95016198
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 26 Feb 2007 11:46:18 +0100
From: Nicola Ranaldo <ranaldo@unina.it>
To: Paul Sokolovsky <pmiscml@gmail.com>, openembedded-devel@openembedded.org
Date: Mon, 26 Feb 2007 11:44:48 +0100
User-Agent: KMail/1.9.6
References: <200702231326.37015.ranaldo@unina.it>
	<7010259346.20070225203430@gmail.com>
In-Reply-To: <7010259346.20070225203430@gmail.com>
MIME-Version: 1.0
Message-Id: <200702261144.48348.ranaldo@unina.it>
Subject: Re: Angstrom and h2200
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
X-List-Received-Date: Mon, 26 Feb 2007 10:46:20 -0000
Content-Disposition: inline
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Sunday 25 February 2007 19:34:30 Paul Sokolovsky wrote:

Hello Paul!

[...]
> Friday, February 23, 2007, 2:26:36 PM, you wrote:
> > Hoping i'm not boring you
>
>   No, but this is OpenEmbedded list. Your report would give more use
> if posted to the proper list - angstrom-distro-users (where I route
> this reply).

Ok!, i will redirect angstrom related questions there.

> > New test images boots over my ipaq h2200, and bug #1677 is now closed,
> > howewer i had to disable the S10checkroot.sh startup as it wanted to run
> > fsck over a readwrite mounted filesystem, claiming it's very dangerous
> > and asking the user for a confirmation. This should be patched in some
> > manner.
>
>   Well, this is one boring problem which is very hard to solve,
> because it is rooted in machine idiosyncrasies. You fix it for one
> machine, and it pops up with another, etc., until it goes thru the
> full circle, something changes outside, and the first machine breaks
> again.
>
>   Someone indeed should break this vicious cycle and make a solution
> which either cuts down mentioned idiosyncrasies or flies above them.

Are there so many differences between machines? i thinked the only difference 
was in the kernel and input devices configuration files.

>   There's an RFC to have consistent (feature-wise) defconfigs for all
> machines. h3900 & h4000 already joined the party. You're welcome to
> work towards h2200 support, please start here:
> http://defconfigman.sourceforge.net/
>
> > And now some other issues about gpe-image:
> > * the usb0-eth device is not present, is it normal?
>
>   No, it is not. See about defconfig consistency above.

I will take a look at it, howewer to customize my kernel configuration is 
there a tool, bitbake config, etc, to submit a .config or to run make 
menuconfig before building the kernel?

[...]
> > * i was not able to compile a custom gpe-image (i used the prereleased
> > for tests), the build failed on package freetype with:
> > ./configure: line 2943: i686-pc-linux-gnu: command not found
> > configure: error: native C compiler is not working
>
>   There's some incompatibility with freetype's configure and your
> gentoo gcc.

Other peoples seems to have the same problem,  with patch in #1906 it seems to 
be fixed, if some one may review the proposed patch and commit to the 
tree.

> > * the last, may i use some kind of emulator before deploying the fs image
> > to the ipaq?
>
>   Yes, QEMU.

fork in a new thread !

Thanks Paul!

	Nicola Ranaldo


