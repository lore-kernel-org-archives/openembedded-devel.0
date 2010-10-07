Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1P3zOO-0002gh-H8
	for openembedded-devel@lists.openembedded.org;
	Fri, 08 Oct 2010 00:56:54 +0200
Received: by iwn37 with SMTP id 37so424715iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Oct 2010 15:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=NkMIlBVwukcnhSJwFvLxD6H/48/cQdhrAnr43wBPBIE=;
	b=BYsY4WqG6Jszu7GDH0IM97bqJ7VYJgmR9rga8JPbWuLr3KlezzQtgy/5jsVLYM3VE1
	zSMsKC3blpx5OpQWBOln3XO+uDWkSGlRqdo9NTCiV1h6z3xTy3gD+HEL/KyExHTtsWB3
	AfFyRrtUpRWGhh2o6lf6b7lT4F0i/qLH1VX6w=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=MzYvtZhFm7rmRnaPwAzK55fd7+1tg1ZZRzDPFQsUvgrrPMJNFTSAYVMeOE+ZF4k+ih
	pYAnPrA7rk1ufXyS0IFhHRv5dRYdK1hwCMM9jkHwo2T2/PsE970JWXJx1EtRPLw4pKoF
	cXVqoPXHtcX+6lQy8LKTtinpRy/NSeAfTLsro=
MIME-Version: 1.0
Received: by 10.231.35.202 with SMTP id q10mr1600876ibd.138.1286492191736;
	Thu, 07 Oct 2010 15:56:31 -0700 (PDT)
Received: by 10.231.158.147 with HTTP; Thu, 7 Oct 2010 15:56:31 -0700 (PDT)
In-Reply-To: <AANLkTinatBiNfBgMiKPzDGa+rac7FjQU02hBBammKGQE@mail.gmail.com>
References: <1286415971-9960-1-git-send-email-raj.khem@gmail.com>
	<i8jufe$299$1@dough.gmane.org>
	<AANLkTinatBiNfBgMiKPzDGa+rac7FjQU02hBBammKGQE@mail.gmail.com>
Date: Fri, 8 Oct 2010 09:26:31 +1030
Message-ID: <AANLkTinM3tq_0J-Jg5VsT3tLYiCd4w=U9-PtDwJCX8kE@mail.gmail.com>
From: Graham Gower <graham.gower@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH,V2 0/6] libtool 2.4 upgrade
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
X-List-Received-Date: Thu, 07 Oct 2010 22:56:54 -0000
Content-Type: text/plain; charset=ISO-8859-1

I've done a bitbake -k world with this patch set. Below is a list of
tasks that were found to fail with the patch, but succeeded in my last
world build without the patch (about a week ago).

atk-1.30.0-r0: do_compile:
blipomoko-0.2.99+gitr0+73ffa20d535d7bcf693981ac00d488db72dd2f68-r0: do_compile:
ccrtp-1.7.0-r0: do_compile:
clamav-0.96.3-r5.0: do_compile:
clish-0.7.3-r1: do_compile:
cwiid-0.6.00+svnr192-r0: do_compile:
dbus-hlid-1_1.0.1+gitr0+5df7f49fe8881804aaab544a569fd164c3e93afb-r0:
do_configure:
devilspie-0.22-r0: do_configure:
enchant-1.6.0-r2: do_compile:
exiv2-0.20-r0: do_compile:
fluidsynth-1.0.8-r1: do_compile:
fso-monitord-1_0.0.0+gitr0+b4ae1e9b10e710042624c2cf1a15b91a7d5b1d44-r0:
do_configure:
geda-xgsch2pcb-0.1.2-r2: do_configure:
glrr-20050529-r0: do_compile:
gputty-0.9.8-r0: do_compile:
gstreamer-0.10.30-r0: do_compile:
ibrdtn-0.4.2-r0: do_compile:
ido-0.1.6-r0: do_compile:
irdadump-0.9.16-r1: do_install:
json-glib-0.10.4-r0: do_compile:
konqueror-embedded-20070316-r7: do_configure:
libecj-bootstrap-3.6-r0: do_compile:
libgpod-0.7.92-r0: do_compile:
libsdl-ttf-2.0.9-r0: do_compile:
libvpx-0.9.1-r4.0: do_configure:
libwmf-0.2.8.4-r1: do_compile:
lxpanel-0.5.5-r0: do_compile:
mediatomb-0.11.0-r1: do_compile:
moko-gtk-engine-0.1.0+svnr4734-r0: do_compile:
mokoeightball-0.2+svnr45-r0: do_compile:
mousepad-0.2.16-r3: do_configure:
neolight-1.4.0+svnr16-r1: do_compile:
nxcompext-3.4.0-1-r0: do_compile:
openldap-2.4.23-r1: do_compile:
oprofile-0.9.6-r13.0: do_compile:
orrery-2.7-r0: do_compile:
piccontrol-0.4-r1: do_compile:
python-pygobject-native-1_2.20.0-r1: do_compile:
refdbg-1.2-r0: do_compile:
shr-today-0.0.1+gitr0+7b69649a9df0e85f0c0f7985fd1d93543c3b11e2-r3: do_compile:
telepathy-gabble-0.7.27-r0: do_configure:
toppler-1.1.3-r0: do_compile:
vmedit-0.02-r1: do_compile:
xapian-bindings-python-1.0.14-r0: do_compile:
gst-plugin-bc-0.10.1.1-r1+gitre14e249ef6cb67e91be9198b71efc61eb84c11b5:
do_configure:


