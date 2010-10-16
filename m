Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1P7CNd-0005Uy-5b
	for openembedded-devel@lists.openembedded.org;
	Sat, 16 Oct 2010 21:25:22 +0200
Received: by bwz9 with SMTP id 9so2061635bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Oct 2010 12:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=FrMGQQ01Z6aqVRElGUBknTXTdhNUsyzJFJFHY+MQwr4=;
	b=d3gvRRyW7BrTiI5ccC0Q0xud/PwxFlLy0S8/89FAC+ZDweNrwWDdvf1aTMx2TDZwqU
	4UeQxTqFTAt2eXXuShPNP3xxmVtbY6ioZjeZxtoZVoZUfuVMuQxp4snRRaGWU33z0D2W
	vhGnkL0dIbMqUU/frj/Pw1dLZa0bHuYst9U+A=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=p6fODYA0onnOM4UqkMWplVGmw0Mb8e1aqz8SC5F5/lduUdnWgfuVPJvQs7l7wiy236
	X8mfro+aG00tUAobhSdREuQPizCNlrKiXRgwhajvM/RrCme9MzUTgtXDpDuCC2abmMcL
	XDpN7Ob80eu8IOccCKtjL0jlbc5Xl9upSI5Bg=
Received: by 10.204.78.8 with SMTP id i8mr2288375bkk.176.1287257088768;
	Sat, 16 Oct 2010 12:24:48 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 4sm11966335bki.13.2010.10.16.12.24.47
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 16 Oct 2010 12:24:48 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 16 Oct 2010 21:24:41 +0200
Message-Id: <1287257081-25608-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.3.1
In-Reply-To: <AANLkTikrgw76+iAr8n3a3Kv+1joHN0ZAKTMcmOvNXrbU@mail.gmail.com>
References: <AANLkTikrgw76+iAr8n3a3Kv+1joHN0ZAKTMcmOvNXrbU@mail.gmail.com>
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] bitbake.conf: don't append MACHINE_OVERRIDES to OVERRIDES when it's empty
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
X-List-Received-Date: Sat, 16 Oct 2010 19:25:22 -0000

* empty MACHINE_OVERRIDES adds :: to OVERRIDES (then in FILESPATH skips
  every directory after this)
* strip() is needed to remove space in case some distribution has ie
  MACHINE_OVERRIDES ?= ""
  and then
  MACHINE_OVERRIDES += ""
  or
  MACHINE_OVERRIDES ?= "${MACHINE_CLASS}", where MACHINE_CLASS is empty   again
---
 conf/bitbake.conf |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/conf/bitbake.conf b/conf/bitbake.conf
index 155c593..5c45e1e 100644
--- a/conf/bitbake.conf
+++ b/conf/bitbake.conf
@@ -676,8 +676,9 @@ BUILDCFG_NEEDEDVARS ?= "TARGET_ARCH TARGET_OS"
 # Overrides are processed left to right, so the ones that are named later take precedence.
 # You generally want them to go from least to most specific.
 MACHINE_OVERRIDES ?= ""
-OVERRIDES = "pn-${PN}:fail-fast:build-${BUILD_OS}:${TARGET_ARCH}:${TARGET_OS}:\
-${DISTRO}:${@':'.join(d.getVar('MACHINE_OVERRIDES', True).split())}:${MACHINE}:local"
+OVERRIDES = "pn-${PN}:fail-fast:build-${BUILD_OS}:${TARGET_ARCH}:${TARGET_OS}:${DISTRO}:\
+${@[':'.join(d.getVar('MACHINE_OVERRIDES', True).split())+':',''][d.getVar('MACHINE_OVERRIDES', True).strip() == '']}\
+${MACHINE}:local"
 
 ##################################################################
 # Include the rest of the config files.
-- 
1.7.3.1



