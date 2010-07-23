Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OcMFd-0001Yt-Uv
	for openembedded-devel@lists.openembedded.org;
	Fri, 23 Jul 2010 19:41:53 +0200
Received: by pzk2 with SMTP id 2so180360pzk.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Jul 2010 10:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=T5YpivFtTndi13LsDNy6OH3YN8eBN2x5wR9sK2HPoOw=;
	b=rEDTZGyLZL46TttliNMkidNvvHH6R0kKQu664zSkclTFNCUAgCzUo2IEe3D87hhPxE
	DrkG29vThLSpzkdLsnO20Xt4Zp5jLLYCi1Xrz9gP3s99GlrW735hpg96G1HvVL0KWFbl
	FJhUDsqaHVXgBkeXcqn7Y878v/N881I28lbRY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=p01xEeZqh2jc9ctDYo+/iNRGRa/l4CMHsfphAD3K0tIJlCIbfx0V3f480unyP/rOcp
	WUsVyXzuueTgCyLhhodHjvbAVYSouDSfpO2J1LERmcbxzsCWN5Ox+LscRzwarIcFFG1S
	vMMbW6THoYtHr6tBVgqtyoqD44QYi36VUFaUI=
Received: by 10.114.109.10 with SMTP id h10mr5945933wac.132.1279906878667;
	Fri, 23 Jul 2010 10:41:18 -0700 (PDT)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id k17sm504692rvf.7.2010.07.23.10.41.17
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 23 Jul 2010 10:41:18 -0700 (PDT)
Date: Fri, 23 Jul 2010 10:41:46 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100723174146.GA15294@gmail.com>
References: <1279735486-7050-1-git-send-email-raj.khem@gmail.com>
	<i2bg5t$mvp$1@dough.gmane.org>
	<1279872152.21888.149.camel@lenovo.internal.reciva.com>
	<i2bir6$un3$1@dough.gmane.org> <1279875548.13006.32.camel@rex>
	<AANLkTi=XnYtiTtUke0aiPgvFao3De6-xxb1cWt3hr7=X@mail.gmail.com>
	<AANLkTinJZ-Nst4HvkGtuPG5Y9X3MQuqfFhmkoU=cKaER@mail.gmail.com>
	<AANLkTin0jdsw3Pu9BkmEp0O9908dtMDN_=mmgsAehgH0@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTin0jdsw3Pu9BkmEp0O9908dtMDN_=mmgsAehgH0@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.210.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 0/4][RFC] Remove CROSS_DIR, install cross-packages into native sysroot
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
X-List-Received-Date: Fri, 23 Jul 2010 17:41:55 -0000
X-Groupsio-MsgNum: 21351
Content-Type: multipart/mixed; boundary="1yeeQ81UyVL57Vl7"
Content-Disposition: inline

--1yeeQ81UyVL57Vl7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (23/07/10 10:30), Chris Larson wrote:
> On Fri, Jul 23, 2010 at 10:20 AM, Khem Raj <raj.khem@gmail.com> wrote:
> 
> > On Fri, Jul 23, 2010 at 2:18 AM, Frans Meulenbroeks
> > <fransmeulenbroeks@gmail.com> wrote:
> > > 2010/7/23 Richard Purdie <rpurdie@rpsys.net>
> > >
> > >> On Fri, 2010-07-23 at 10:11 +0200, Koen Kooi wrote:
> > >> > -----BEGIN PGP SIGNED MESSAGE-----
> > >> > Hash: SHA1
> > >> >
> > >> > On 23-07-10 10:02, Phil Blundell wrote:
> > >> > > On Fri, 2010-07-23 at 09:25 +0200, Koen Kooi wrote:
> > >> > >> There is a BIG problem with these patches, they break multimachine
> > >> builds.
> > >> > >>
> > >> > >> The previous situation had:
> > >> > >>
> > >> > >> cross/armv7a-angstrom-foo/usr/bin/
> > >> > >> cross/armv5te-angstrom-foo/usr/bin/
> > >> > >> etc
> > >> > >>
> > >> > >> The new situation has:
> > >> > >>
> > >> > >> x86_64-linux/usr/bin
> > >> > >>
> > >> > >> So all the toolchains get dropped into the *same* directory, which
> > >> > >> breaks horribly.
> > >> > >
> > >> > > Which are the actual binaries that collide?  I would have thought
> > that
> > >> > > everything which gets installed into the cross bindir ought to be
> > >> > > prefixed with TARGET_SYS (i.e. usr/bin/armv7a-angstrom-linux-gcc,
> > etc).
> > >> >
> > >> > It's all 'arm-angstrom-foo', I was just about to make the suggestion
> > to
> > >> > change it to 'armv7a-angstrom-foo' :)
> > >>
> > >> I've just been talking to Koen about this. When building for armv7a,
> > >> TARGET_ARCH which goes into TARGET_PREFIX and TARGET_SYS is "arm".
> > >>
> > >> I suspect if we change TARGET_ARCH to be armv7a, nasty things will
> > >> happen but I could be wrong.
> > >>
> > >
> > > I've been pondering if TARGET_ARCH should be the real arch (like armv7a)
> > and
> > > whether adjacent to that there should be a TARGET_ARCH_FAMILY or so.
> > >
> > > Changing TARGET_ARCH to armv7a without other changes definitely is going
> > to
> > > break things.
> >
> >
> > maybe we should not change TARGET_ARCH but use FEED_ARCH to construct
> > TARGET_SYS
> 
> 
> Using a variable from packaging / rootfs creation as a field passed to
> configure at build time strikes me as a terrible idea.

we have MULTIMACH_* variables in bitbake.conf I have done this patch 
using them. I trying a meta-toolchain build lets see

-Khem

> -- 
> Christopher Larson
> clarson at kergoth dot com
> Founder - BitBake, OpenEmbedded, OpenZaurus
> Maintainer - Tslib
> Senior Software Engineer, Mentor Graphics
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--1yeeQ81UyVL57Vl7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=diff

diff --git a/classes/cross.bbclass b/classes/cross.bbclass
index 75b2abe..cadf245 100644
--- a/classes/cross.bbclass
+++ b/classes/cross.bbclass
@@ -8,7 +8,7 @@ EXCLUDE_FROM_WORLD = "1"
 # In order to keep TARGET_PREFIX decoupled from TARGET_SYS, let's force the
 # binary names to match the former, rather than relying on autoconf's implicit
 # prefixing based on the latter.
-EXTRA_OECONF_append = " --program-prefix=${TARGET_PREFIX}"
+EXTRA_OECONF_append = " --program-prefix=${MULTIMACH_TARGET_PREFIX}"
 
 # Save PACKAGE_ARCH before changing HOST_ARCH
 OLD_PACKAGE_ARCH := "${PACKAGE_ARCH}"
diff --git a/conf/bitbake.conf b/conf/bitbake.conf
index 748abba..1564f10 100644
--- a/conf/bitbake.conf
+++ b/conf/bitbake.conf
@@ -135,6 +135,7 @@ PACKAGE_ARCHS = "all any noarch ${TARGET_ARCH} ${PACKAGE_EXTRA_ARCHS} ${MACHINE}
 MULTIMACH_ARCH = "${PACKAGE_ARCH}"
 MULTIMACH_TARGET_SYS = "${MULTIMACH_ARCH}${TARGET_VENDOR}-${TARGET_OS}"
 MULTIMACH_HOST_SYS = "${MULTIMACH_ARCH}${HOST_VENDOR}-${HOST_OS}"
+MULTIMACH_TARGET_PREFIX = "${MULTIMACH_TARGET_SYS}-"
 BASEPKG_HOST_SYS = "${BASE_PACKAGE_ARCH}${HOST_VENDOR}-${HOST_OS}"
 BASEPKG_TARGET_SYS = "${BASE_PACKAGE_ARCH}${TARGET_VENDOR}-${TARGET_OS}"
 

--1yeeQ81UyVL57Vl7--
