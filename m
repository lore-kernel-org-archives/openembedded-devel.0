Received: from [209.242.20.84] (helo=green.dls.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <mwester@dls.net>) id 1IvlKS-0000u2-MK
	for openembedded-devel@lists.openembedded.org;
	Sat, 24 Nov 2007 04:05:34 +0100
Received: from twilight (gw.mwester.net [209.242.5.110])
	by green.dls.net (Postfix) with ESMTP id D13354126DE
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Nov 2007 21:02:44 -0600 (CST)
Message-ID: <065701c82e46$68987730$6e01a8c0@twilight>
From: "Mike \(mwester\)" <mwester@dls.net>
To: <openembedded-devel@lists.openembedded.org>
References: <E1Iv6U0-0003D9-3S@linuxtogo.org><4746C4A5.6040501@student.utwente.nl><05db01c82dfe$1401e230$6e01a8c0@twilight>
	<c384c5ea0711231351u1b91c5b6o437ecc5d512991e8@mail.gmail.com>
Date: Fri, 23 Nov 2007 21:02:11 -0600
MIME-Version: 1.0
X-Priority: 3
X-MSMail-Priority: Normal
X-Mailer: Microsoft Outlook Express 6.00.2800.1914
X-MimeOLE: Produced By Microsoft MimeOLE V6.00.2800.1914
Subject: Re: [oe-commits] org.oe.dev SlugOS: ixp4xx-kernel - added2.6.23.8 recipe and supporting files. (Note that
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
X-List-Received-Date: Sat, 24 Nov 2007 03:06:16 -0000
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit


Leon Woestenberg writes:
> Sorry, this seems to be some misconception amongst the nslu2
> developers. The use base
> for the mainline bleeding edge kernels is much larger*. I assume that
> every active board
> developer want to try and verify the new kernels against his hardware
> *and* is using OpenEmbedded
> to do so ;-)
>
> Regards, Leon.
>
> *ok, so more than two, maybe three :-)

Well, that's 50% more - that's a lot! :)

Just to be clear, this is the ixp4xx kernel we are speaking of, not the
generic kernel recipe.  I'll be happy to be a bit broader in the
communications on the bleeding-edge kernel stuff, in that case.  The current
issues center around Krzysztof's IXP network driver - the kernel works ok as
long as the network driver is loaded as a module.  The current version in OE
will load a patch that prevents it from using all-zeros for the MAC address
when compiled into the kernel, but we still don't have firmware loading
until the system mounts the rootfs -- which eliminates the possibility of
nfsroot, of course.

Thanks!
Mike (mwester)



