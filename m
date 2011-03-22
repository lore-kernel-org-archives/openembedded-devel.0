Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jan.paesmans@gmail.com>) id 1Q28WW-0003sq-Fy
	for openembedded-devel@lists.openembedded.org;
	Tue, 22 Mar 2011 21:49:53 +0100
Received: by wwb17 with SMTP id 17so8246172wwb.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Mar 2011 13:48:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
	:subject:content-type:content-transfer-encoding;
	bh=djj8L0kMoWVemk/UCK738+Qajl0E/TaEdUjyOjtP2LE=;
	b=J8w96BY6H6PSjo/PrF7o9oJnuszTtKuzJ/VJbeIAiuaqChvPkDG+A7u4HLjcEw2z94
	7ynw6f462XNQzC9jsYOtcshe4SS2ksrzZsow1PUNGo3wgnPS4PDPABAoWYf72aO//Jo9
	1uwtfwzK8AGsHk0dzYCZpuTesdler0d2bqSFY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	b=pKorAN98r63L0sPkvEJn9IjLRve9O40M9FNxyQVshloE8jq+0zva7QvlJsPLwCiemF
	phRwj/G6FEXHch2LeW2UVi84mP2n2Ef+kF7WowN6GaDRyMMunTf540Uj/GEInljjocLY
	AgbYAleNWeDR0d1m10YV8MmJYC+5Kz+qwzePg=
Received: by 10.227.179.138 with SMTP id bq10mr5932964wbb.12.1300826881984;
	Tue, 22 Mar 2011 13:48:01 -0700 (PDT)
Received: from [192.168.1.103] (39.121-240-81.adsl-dyn.isp.belgacom.be
	[81.240.121.39])
	by mx.google.com with ESMTPS id w25sm3470631wbd.39.2011.03.22.13.48.00
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 22 Mar 2011 13:48:01 -0700 (PDT)
Message-ID: <4D890AFE.5060900@gmail.com>
Date: Tue, 22 Mar 2011 21:47:58 +0100
From: Jan Paesmans <jan.paesmans@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.15) Gecko/20110321 Thunderbird/3.1.9
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: qt4e-demo-image
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
X-List-Received-Date: Tue, 22 Mar 2011 20:49:53 -0000
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit

Hello,

When building qt4-embedded for the qt4e-demo-image, the build fails with
the following error:

|
/home/janp/src/openembedded/build/tmp/sysroots/x86_64-linux/usr/armv5te/lib/gcc/arm-oe-linux-uclibceabi/4.5.3/../../../../arm-oe-linux-uclibceabi/bin/ld:
/home/janp/src/openembedded/build/tmp/sysroots/armv5te-oe-linux-uclibceabi/usr/lib/uclibc_nonshared.a(atexit.os)(.text+0x12):
unresolvable R_ARM_THM_CALL relocation against symbol `__cxa_atexit'
|
/home/janp/src/openembedded/build/tmp/sysroots/x86_64-linux/usr/armv5te/lib/gcc/arm-oe-linux-uclibceabi/4.5.3/../../../../arm-oe-linux-uclibceabi/bin/ld:
final link failed: Nonrepresentable section on output
| collect2: ld returned 1 exit status
| make[1]: *** [../../lib/libQtGuiE.so.4.7.2] Error 1
| make[1]: Leaving directory
`/home/janp/src/openembedded/build/tmp/work/armv5te-oe-linux-uclibceabi/qt4-embedded-4.7.2-r27.0/qt-everywhere-opensource-src-4.7.2/src/gui'
| make: *** [sub-gui-make_default-ordered] Error 2
| + die 'oe_runmake failed'
| + oefatal 'oe_runmake failed'
| + echo FATAL: 'oe_runmake failed'
| FATAL: oe_runmake failed
| + exit 1
NOTE: package qt4-embedded-4.7.2-r27.0: task do_compile: Failed

I tried adding something like QT_CONFIG_FLAGS_append_libc-uclibc = "
--disable-pie". Something similar is done for samba. However the
configure of qt doesn't recognize this option and I didn't find anything
similar in 'configure --help'.

Build Configuration:
BB_VERSION        = "1.12.0"
METADATA_BRANCH   = "master"
METADATA_REVISION = "5b3df8c"
TARGET_ARCH       = "arm"
TARGET_OS         = "linux-uclibceabi"
MACHINE           = "ronetix-pm9263"
DISTRO            = "minimal-uclibc"
DISTRO_VERSION    = "dev-snapshot-20110322"
TARGET_FPU        = "soft"

Regards,

Jan


