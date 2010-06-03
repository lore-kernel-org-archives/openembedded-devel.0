Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1OKIQl-0008Dm-JC
	for openembedded-devel@lists.openembedded.org;
	Thu, 03 Jun 2010 23:58:29 +0200
Received: by gyg10 with SMTP id 10so486461gyg.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 03 Jun 2010 14:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=SII9ETeTgE37dXjHVVMpcw93xtUsYVGOCz6DTYc/cOA=;
	b=lYFVm291e8TMlWj59vFELMkoYoNWz56cFTcX6YZDrILlKYctdPSf1wlJIAMxJLUkRv
	FFl2YUAIrXRWwFR/LfUW3WJ1Hjeh5XWMMkBmrSIz9GefK2FAvyRolnWE1nhck1W9q2fo
	UuTa0VcfjW2Jaicua326JZLbI0/CCjG3Nsvjw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=IWoPfmvirDB5K97FkK8gmquMU/6jK/smKtGbwIvDYrEoE2BoDS0JEb5CLKC2Kk8mB7
	NzNHALdY+7zOSNhGa8rA4Oagyygdv0P3HO3b0IP4m3znugIlk26+zHn+FwxULeosZfP3
	hZY06mbL+qhVQqDQvr8lXUG9gFR17Fx9Yx18U=
MIME-Version: 1.0
Received: by 10.100.245.13 with SMTP id s13mr10621322anh.95.1275602050520; 
	Thu, 03 Jun 2010 14:54:10 -0700 (PDT)
Received: by 10.100.232.16 with HTTP; Thu, 3 Jun 2010 14:54:10 -0700 (PDT)
Date: Thu, 3 Jun 2010 23:54:10 +0200
Message-ID: <AANLkTimkddVJqU15C0NqsM5L3zPVvgfX5sZo4hXU6385@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: andrea.adami@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: psplash vs. psplash-$DISTRO
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
X-List-Received-Date: Thu, 03 Jun 2010 21:58:29 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello,

building console-image for minimal distro I receive the following warning:

IMHO we have an issue with psplash-zap:
RRECOMMENDS_${PN} = "psplash-angstrom"
should probably be
RRECOMMENDS_${PN} = "${SPLASH}"

But here we have a new issue: not all distro are defining $SPLASH, in
particular look at the images using ZZSPLASH:
( from  http://fr.pastebin.ca/1876829 )

./console-base-image.bb:ZZAPSPLASH = '
${@base_contains("MACHINE_FEATURES", "screen", "psplash-zap", "",d)}'
./gnuradio-image.bb:ZZAPSPLASH = '
${@base_contains("MACHINE_FEATURES", "screen", "psplash-zap", "",d)}'

Now, for a distro using that images *does not* define $SPLASH, what happens is:

./image.bbclass:# set sane default for the SPLASH variable
./image.bbclass:SPLASH ?= ""

At first I thought to fix psplash-zap_1.0.bb but this would break some
distro/image combination...
In theory all distro should support all kind of images, with and
without splashscreen...

Confused

Andrea


