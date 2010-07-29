Received: from hsp-52.hspserver.com ([85.197.80.179])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ml@vdm-design.de>) id 1OePdn-0007m8-VU
	for openembedded-devel@lists.openembedded.org;
	Thu, 29 Jul 2010 11:43:05 +0200
Received: from localhost (localhost [127.0.0.1])
	by hsp-52.hspserver.com (Postfix) with ESMTP id 66886A2C457
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Jul 2010 11:42:46 +0200 (CEST)
Received: from hsp-52.hspserver.com ([127.0.0.1])
	by localhost (hsp-52.hspserver.com [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id gmAbmCbkNHGD
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Jul 2010 11:42:30 +0200 (CEST)
Received: from tomboy.localnet (pD9E177A6.dip.t-dialin.net [217.225.119.166])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by hsp-52.hspserver.com (Postfix) with ESMTPSA id D57D9A2C456
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Jul 2010 11:42:30 +0200 (CEST)
From: Thomas Zimmermann <ml@vdm-design.de>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 29 Jul 2010 11:42:30 +0200
User-Agent: KMail/1.13.5 (Linux/2.6.34-0.slh.11-sidux-amd64; KDE/4.4.5; x86_64;
	; )
References: <AANLkTimk_y-ntnLZpXfa_biLEcX_vO_Lk5PQXWPJcuec@mail.gmail.com>
In-Reply-To: <AANLkTimk_y-ntnLZpXfa_biLEcX_vO_Lk5PQXWPJcuec@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <201007291142.30925.ml@vdm-design.de>
X-SA-Exim-Connect-IP: 85.197.80.179
X-SA-Exim-Mail-From: ml@vdm-design.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: OE recipe tree quality
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
X-List-Received-Date: Thu, 29 Jul 2010 09:43:06 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

Am Donnerstag 29 Juli 2010, 10:50:53 schrieb Frans Meulenbroeks:
> Dear all,
> 
> Given the discussions on quality that sometimes pop up (and also triggered
> by Robert's message), I decided to kick off a bitbake -k world.
> Below are some initial findings. I would like to use this as a starter to
> kickoff the discusson on quality and what to do with broken stuff.
> And also I hope that people who feel attached to a recipe mentioned below
> will take action.
> 
> My setting:
> local.conf:
> IMAGE_LINGUAS = ""
> ENABLE_BINARY_LOCALE_GENERATION = "0"
> 
> MACHINE = "beagleboard"
> DISTRO = "angstrom-2008.1"
> 
> EXTRA_IMAGECMD_jffs2 = "--pad --eraseblock=0x20000"
> MKUBIFS_ARGS = "-m 2048 -e 129024 -c 1024"
> 
> IMAGE_FSTYPES = "tar squashfs ubifs jffs2"
> IMAGE_KEEPROOTFS = "1"
> OE_ALLOW_INSECURE_DOWNLOADS = "yes"
> 
> I opted for angstromg and beagleboard as I feel this is the most often
> build configuration, so it should have the least issues.
> host is ubuntu 10.04 on 64 bit. tree is oe dev git head (as of jul 29)
> 
> All results are not in yet (there are 71047 taksks, I am at 159 :-)
> However the parsing already gave some interesting output.
> I've ordered them somehwat:
> 
> Nothing PROVIDES errors
> ===================
> ...
Some of these 'Nothing PROVIDES' errors are because you are using angstrom as 
distro and some recipes are blacklisted there (e.g. fso-apm), because of that 
a lot of the shr specific recipes aren't buildable.

I think one should do such a test with minimal distro because nothing is 
blacklisted there.

Other recipes like etk or epsilon were moved to obsolete, but recipes 
depending on them weren't. So i think recipes depending on etk and epsilon can 
be moved to obsolete too.

Regards
Thomas


