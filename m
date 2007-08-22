Received: from [209.85.198.191] (helo=rv-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <cliff.brake@gmail.com>) id 1INg23-00059G-Vq
	for openembedded-devel@openembedded.org; Wed, 22 Aug 2007 04:33:20 +0200
Received: by rv-out-0910.google.com with SMTP id c24so26439rvf
	for <openembedded-devel@openembedded.org>;
	Tue, 21 Aug 2007 19:32:16 -0700 (PDT)
Received: by 10.114.95.1 with SMTP id s1mr137623wab.1187749932881;
	Tue, 21 Aug 2007 19:32:12 -0700 (PDT)
Received: by 10.114.191.17 with HTTP; Tue, 21 Aug 2007 19:32:11 -0700 (PDT)
Message-ID: <f96d234e0708211932n4370bd94j2a91f597edc89adb@mail.gmail.com>
Date: Tue, 21 Aug 2007 22:32:12 -0400
From: "Cliff Brake" <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <46CB6D5B.40501@dominion.kabel.utwente.nl>
MIME-Version: 1.0
References: <E1INbyh-0006rm-0y@linuxtogo.org>
	<46CB6D5B.40501@dominion.kabel.utwente.nl>
Cc: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@openembedded.org>,
	openembedded-commits@openembedded.org
Subject: Re: [oe-commits] org.oe.dev compulab-pxa270.conf: fix serial console setup for 2.6.22 kernel,
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
X-List-Received-Date: Wed, 22 Aug 2007 02:33:20 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 8/21/07, Koen Kooi <koen@dominion.kabel.utwente.nl> wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> cbrake commit schreef:
>
> > conf/machine/compulab-pxa270.conf
>
> > +# the following is require for building tiny images that can fit in NOR flash.
> > +# recommend using uclibc, Angstrom, and angstrom-minimal-image bitbake target
> > +# note, if these are define in your local.conf, they will be overwritten
> > +MACHINE_ESSENTIAL_EXTRA_RDEPENDS ?= "mtd-utils ipkg"
>
> I have a real hard time believing that a device needs ipkg[1] and mtd-utils to boot. This
> does not belong in task-base, but in your local.conf or image recipe. Please remove it
> from the machine file.

Hello Koen,

You are right about ipkg.

Let me explain what I'm trying to do, and perhaps someone will have a
suggestion how I can better do this.  I need to build a small NOR
image that fits in less than 2.4MB that includes mtd-utils so that the
NOR rootfs can be used to program the NAND flash.  This is required to
get away from the proprietary compulab NAND driver and use JFFS2.
What I'm trying to do is make a way for someone to use OE out-of-the
box on the cm-x270 without a lot of hassle.  This means having
reasonable out-of-the box defaults that can be used to produce a
working system.

As a side (maybe you have some suggestions), this is one of the
biggest areas where I see OE is lacking for the new user.  What do I
put in local.conf, and what image should I be building.  To those of
us who use OE a lot and keep up with it, this is no problem, but for
the new user, this is a daunting task, and many probably give up
before figuring out the magic combination that happens to work at the
moment.  Maybe we don't care -- and I guess if OE is hard, that is
more business for people like me :-)  But no, that is a faulty train
of thought.  I still need to look into the autobuilder stuff --
perhaps there is some configuration info there.

So I see my options as:
 1) Write an article that describes how to do all this, example
local.conf, etc and point to that.  I'll do this anyway, so perhaps
that is the solution.
  2) create a custom image for the cm-x270 NOR rootfs -- where should
I put this?

Appreciate any suggestions.

Have a great day!
Cliff

-- 
=======================
Cliff Brake
http://bec-systems.com


