Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <coolaj86@gmail.com>) id 1OeMZm-0004hk-TW
	for openembedded-devel@lists.openembedded.org;
	Thu, 29 Jul 2010 08:26:43 +0200
Received: by gxk2 with SMTP id 2so151180gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Jul 2010 23:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:from:date
	:message-id:subject:to:content-type;
	bh=b3dy9shwZwAoCVbTL+FydRz+D1JV+vPwUKmCdDma0z0=;
	b=nGMbwPdO99hsPMYyAFbDgT/rVt/J+ewLAbVodowRLgKL2pf5fQilGPcd1Ts2QexWUI
	yM2D6PV5PoG7Pt7uHFRuCR6uCTvq75FRokOtih/TO/gytiilcu2So+xpvhVoZEFmiMcL
	p7TV0uNjsZqR4zrWtHyhqVdl5fSmzKVfrHHGE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:from:date:message-id:subject:to:content-type;
	b=ldHXAgvARTUIM/VzQWXEZOCo1/pcN1jLkKUc19Yx1ury9vkS0Ys60+9fb6OKujPB5K
	ySbrHGHLjEA5cfONogHxYQfdC5WDvRvYTKfiH+yjEjjpoftqzkEGSMP+MWtxD/9ykKqL
	rMbiKMqIxkP531Z7xURGISfmdwg/rA362fqWU=
Received: by 10.150.69.11 with SMTP id r11mr439361yba.446.1280384783336; Wed, 
	28 Jul 2010 23:26:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.42.7.138 with HTTP; Wed, 28 Jul 2010 23:26:03 -0700 (PDT)
From: AJ ONeal <coolaj86@gmail.com>
Date: Thu, 29 Jul 2010 00:26:03 -0600
Message-ID: <AANLkTi=mUvLSyPha_-LvKXyHHMs5YQNWRn7KGDDxgaHw@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.175
X-SA-Exim-Mail-From: coolaj86@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: inherit scons -- arm-angstrom-linux-gcc: command not found
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
X-List-Received-Date: Thu, 29 Jul 2010 06:26:43 -0000
Content-Type: text/plain; charset=ISO-8859-1

I'm trying to compile v8 for angstrom (gumstix overo) and this is my recipe:
v8_r5144.bb:

DESCRIPTION = "V8 JavaScript Engine"
PR = "r0"
DEPENDS = ""
SRC_URI = " \svn://v8.googlecode.com/svn;module=trunk;proto=http;rev=5144 \
"
S = "${WORKDIR}/trunk"
FILES_${PN} = "${bindir}/libv8"

inherit scons





and this is how it fails:

|* arm-angstrom-linux-gnueabi-gcc -march=armv7-a -mtune=cortex-a8
-mfpu=neon*-mfloat-abi=softfp -o obj/release/dtoa-config.o -c
-isystem/home/coolaj86/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/include
-fexpensive-optimizations -frename-registers -fomit-frame-pointer -O2 -ggdb3
-Werror -Wno-uninitialized -m32 -O3 -fomit-frame-pointer -fdata-sections
-ffunction-sections -ansi
-isystem/home/coolaj86/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/include
-DV8_TARGET_ARCH_IA32 -DENABLE_VMSTATE_TRACKING
-DENABLE_LOGGING_AND_PROFILING -DENABLE_DEBUGGER_SUPPORT -Isrc
src/dtoa-config.c
|* /bin/bash: arm-angstrom-linux-gnueabi-gcc: command not found*|*
scons: *** [obj/release/dtoa-config.o] Error 127*



The problem appears to be that the PATH is not set properly. I tried setting
the path manually in scons.bbclass to the exact location of the gcc binary,
but that also fails.


Any suggestions?


Note: I uninstalled ccache, since I saw that scons was using that.



AJ ONeal

