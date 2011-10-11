Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RDVOP-00048t-74
	for openembedded-devel@lists.openembedded.org;
	Tue, 11 Oct 2011 08:00:45 +0200
Received: by iadx2 with SMTP id x2so8773030iad.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Oct 2011 22:55:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=I7wtFdlMr5i+LOP5Awv4LLiWM68ocUo4osSLfSQ+lww=;
	b=qOA3z247tE+zPq8eedTZP5A68D3/u3vaHFXv15JGDVj7g2OGNqGv0/QPsuwNEbaeWW
	97k01kAJ/aR5Lbey1sBYOk0phsPP9CKSCu/+lO2NkXgXo7fVpsJXEKSsMr4WNLNLwinL
	YRDa0/O1lOfJEKWNziws3cVv/6IZN6G7a/9V8=
Received: by 10.42.156.133 with SMTP id z5mr22722417icw.39.1318312503195;
	Mon, 10 Oct 2011 22:55:03 -0700 (PDT)
Received: from [192.168.1.70] (99-57-141-118.lightspeed.sntcca.sbcglobal.net.
	[99.57.141.118])
	by mx.google.com with ESMTPS id jm11sm28937787ibb.1.2011.10.10.22.54.55
	(version=SSLv3 cipher=OTHER); Mon, 10 Oct 2011 22:54:57 -0700 (PDT)
Message-ID: <4E93DA2C.1000402@gmail.com>
Date: Mon, 10 Oct 2011 22:54:52 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:7.0.1) Gecko/20110929 Thunderbird/7.0.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <201110110048.58769.schnitzeltony@gmx.de>
In-Reply-To: <201110110048.58769.schnitzeltony@gmx.de>
Subject: Re: [meta-oe] bitbake udev fails at parse ( util-linux-blkid missing )
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
X-List-Received-Date: Tue, 11 Oct 2011 06:00:46 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

On 10/10/2011 3:48 PM, Andreas Müller wrote:
> Hi
>
> with latest pulls I get after pseudo pre run:
>
> OE Build Configuration:
> BB_VERSION        = "1.13.3"
> TARGET_ARCH       = "arm"
> TARGET_OS         = "linux-gnueabi"
> MACHINE           = "overo"
> DISTRO            = "angstrom"
> DISTRO_VERSION    = "v2011.10-core"
> TUNE_FEATURES     = "armv7a vfp neon cortexa8"
> TARGET_FPU        = "vfp-neon"
> meta-angstrom     = "master:4f06c3f0376e0704210a2e61005748f168369d07"
> meta-oe
> meta-efl
> meta-gpe
> meta-gnome
> meta-xfce         = "master:9278fe715d5eebd16af1a2d20a92255744913dbb"
> meta-texasinstruments = "master:7a45605f91536519a53e6f18dedee5f1f62d88e0"
> meta-efikamx      = "master:2ef47fdd4e8232d766c0c63d9427253ee56e31d0"
> meta-nslu2        = "master:9080394ae0a040dd7b05ac49f9480e4d71631b55"
> meta-htc
> meta-nokia
> meta-openmoko
> meta-palm         = "master:7d12d5c09a5303952c2ffa22aa2f0274025f9fc2"
> meta-sugarbay
> meta-crownbay
> meta-emenlow
> meta-fishriver
> meta-jasperforest
> meta-n450         = "master:e0e52850cf5f84fb4ee1bfa15571aaf61e068450"
> meta              = "master:4732222c46652951e66aae377631f4a361179d8f"
> meta-freescale    = "master:8716233e1c13e8c49096c4606f836275ee22009a"
> meta-gumstix      = "master:d721d7815c7f4706401f4cef9c1f0a535e056d08"
>
> NOTE: Resolving any missing task queue dependencies
> ERROR: Nothing RPROVIDES 'util-linux-blkid' (but /home/Superandy/data/oe-core/sources/meta-openembedded/meta-oe/recipes-core/udev/udev_173.bb RDEPENDS on or otherwise requires it)
> NOTE: Runtime target 'util-linux-blkid' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['util-linux-blkid']
> ERROR: Required build target 'udev' has no buildable providers.
> Missing or unbuildable dependency chain was: ['udev', 'util-linux-blkid']
>
> Could somebody take care please?

It should be fixed when

http://patches.openembedded.org/patch/12969/

is applied to oe-core. Until then cherry-pick it
if you have the pw-am.sh script from oe.dev then

pw-am.sh 12969




