Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1PJIsM-0006G7-7q
	for openembedded-devel@lists.openembedded.org;
	Fri, 19 Nov 2010 05:47:07 +0100
Received: by gwaa11 with SMTP id a11so2530415gwa.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Nov 2010 20:45:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:content-type
	:content-transfer-encoding;
	bh=bgqcBGryf0UVaQV8RLzvT5/OH+6h8uUIYr2iUahnK9M=;
	b=J4lGC/t/d1cSTOUJMGbYqpZASjGplsR+cTs1tRVhxZJH9QwkNV3fOXV1Qwf6mErggX
	uxfvofaU92ah6cD2nFigCypu1D2y1yi2VlB/BqrBwnOos1WNtMXlRqWUj6bfjGdk6UjS
	Vtnjr2YBiZiJ89RllF/IgjjHH1ryDc3MsR60Y=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	b=MDqUw0Bd8egbW3n79x3O9E4bSPWIgmhi4SP/7XeQV9mlIz+0Aj2hSj6mS59xh9YMhY
	Zq/4gNx/tKFmVaDoi9pxycMblDi6ZQ2UJDIlakwEyFl5vCN5JxkBarOya1klZAHRKSVd
	K1TVDklEo8wFKFHFeBmxIIxoQioRMCtFbHcL0=
Received: by 10.100.37.18 with SMTP id k18mr1135168ank.235.1290141957682;
	Thu, 18 Nov 2010 20:45:57 -0800 (PST)
Received: from [10.0.0.5] (eth7090.sa.adsl.internode.on.net [150.101.58.177])
	by mx.google.com with ESMTPS id g6sm1300842anh.31.2010.11.18.20.45.55
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 18 Nov 2010 20:45:56 -0800 (PST)
Message-ID: <4CE600FF.4000207@gmail.com>
Date: Fri, 19 Nov 2010 15:15:51 +1030
From: Graham Gower <graham.gower@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.15) Gecko/20101113 Thunderbird/3.0.10
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [release-2010.12][PATCH] mioctl_git.bb: Add glib-2.0 to DEPENDS.
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
X-List-Received-Date: Fri, 19 Nov 2010 04:47:08 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit


| make[3]: Entering directory `/mnt/oe/tmp/work/mipsel-oe-linux/mioctl-1_0.1.0+gitr0+43fae6cf5e3aa57f5d7fed467896d2d4d0f69679-r0/git/tools/mioctl/src'
| mipsel-oe-linux-gcc -march=mips32 -DHAVE_CONFIG_H -I. -I.. -pthread -I/mnt/oe/tmp/sysroots/mipsel-oe-linux/usr/include/glib-2.0 -I/mnt/oe/tmp/sysroots/mipsel-oe-linux/usr/lib/glib-2.0/include   -include ../config.h   -isystem/mnt/oe/tmp/sysroots/mipsel-oe-linux/usr/include  -isystem/mnt/oe/tmp/sysroots/mipsel-oe-linux/usr/include -fexpensive-optimizations -fomit-frame-pointer -frename-registers -Os -MT main.o -MD -MP -MF .deps/main.Tpo -c -o main.o main.c
| main.c:25:18: fatal error: glib.h: No such file or directory
| compilation terminated.
| make[3]: *** [main.o] Error 1

Signed-off-by: Graham Gower <graham.gower@gmail.com>
---
 recipes/freesmartphone/mioctl_git.bb |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/recipes/freesmartphone/mioctl_git.bb b/recipes/freesmartphone/mioctl_git.bb
index c04fc9d..8d9571c 100644
--- a/recipes/freesmartphone/mioctl_git.bb
+++ b/recipes/freesmartphone/mioctl_git.bb
@@ -6,6 +6,7 @@ LICENSE = "GPL"
 SRCREV = "43fae6cf5e3aa57f5d7fed467896d2d4d0f69679"
 PV = "0.1.0+gitr${SRCPV}"
 PE = "1"
+DEPENDS = "glib-2.0"
 
 SRC_URI = "${FREESMARTPHONE_GIT}/cornucopia.git;protocol=git;branch=master"
 S = "${WORKDIR}/git/tools/mioctl"
-- 
1.7.1



