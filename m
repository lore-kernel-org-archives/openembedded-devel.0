Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Oe3I8-0002hW-3n
	for openembedded-devel@lists.openembedded.org;
	Wed, 28 Jul 2010 11:51:33 +0200
Received: by eyf5 with SMTP id 5so989705eyf.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Jul 2010 02:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=Cqa31vOTsL+cowWEWjVLAAQ32rSeb484aFj6clEXFoU=;
	b=scijjWcRl8NDXAqx+1eO7eCYPt71tqpOTE/jMRqm28NVmh+bjyjLRkjgxOxzMKZ85F
	HSe2+MtiOyZd/M8Lwxcb60aDwy3e4q0hJu9y1pYk3lxjuNvr9tNUy0z5Sev7OelIMiSa
	gmxVn+ZvbG5rfQzaB7oHnBI3nIMDDWANl6Mcw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=oNtxga3aywBcF/bf6BWS/iBsxvgVryo4z4Pw6tUiJGeXeDZ76r9Cbes/m1SLuAAkKG
	icr/TnPo0V0QqyD0xgkXBrBrywzeLbmZAJZxO43vuaSolKHvE3xGkDRmMxt1pUnkDKxs
	RkZ90yopWt2iKNeiqmMtYoXtWKWxWnI1WebE0=
Received: by 10.213.36.18 with SMTP id r18mr8137846ebd.28.1280310655933;
	Wed, 28 Jul 2010 02:50:55 -0700 (PDT)
Received: from localhost.localdomain (atwork-193.r-212.178.107.atwork.nl
	[212.178.107.193])
	by mx.google.com with ESMTPS id x54sm9213991eeh.17.2010.07.28.02.50.55
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 28 Jul 2010 02:50:55 -0700 (PDT)
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 28 Jul 2010 11:50:36 +0200
Message-Id: <1280310636-29889-2-git-send-email-fransmeulenbroeks@gmail.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1280310636-29889-1-git-send-email-fransmeulenbroeks@gmail.com>
References: <1280310636-29889-1-git-send-email-fransmeulenbroeks@gmail.com>
X-SA-Exim-Connect-IP: 209.85.215.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 2/2] squashfs-tools: added dependency to attr/attr-native
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
X-List-Received-Date: Wed, 28 Jul 2010 09:51:34 -0000

Signed-off-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
---

I also had a quick stab at removing legacy staging and adding BBCLASSEXTEND = "native"
but somehow I can't get it working. Guess it is something trivial but don't have
any time right now, so according to "commit early; commit often" here is what I have right now
(which works but is still using legacy staging and a native recipe).

Appreciate if someone can fix this. One of the issues is a hard-coded path in the Makefile
(INSTALL_DIR)

have fun! Frans

diff --git a/recipes/squashfs-tools/squashfs-tools-native_4.0.bb b/recipes/squashfs-tools/squashfs-tools-native_4.0.bb
index cc01604..1789417 100644
--- a/recipes/squashfs-tools/squashfs-tools-native_4.0.bb
+++ b/recipes/squashfs-tools/squashfs-tools-native_4.0.bb
@@ -2,7 +2,7 @@ require squashfs-tools_4.0.bb
 
 inherit native
 
-DEPENDS = "zlib-native"
+DEPENDS = "attr-native zlib-native"
 
 PACKAGES = ""
 
diff --git a/recipes/squashfs-tools/squashfs-tools.inc b/recipes/squashfs-tools/squashfs-tools.inc
index fb5a648..44f6a4b 100644
--- a/recipes/squashfs-tools/squashfs-tools.inc
+++ b/recipes/squashfs-tools/squashfs-tools.inc
@@ -1,8 +1,8 @@
 DESCRIPTION = "Squashfs is a highly compressed read-only filesystem for Linux."
 SECTION = "base"
 LICENSE = "GPLv2"
-DEPENDS = "zlib"
-INC_PR = "r3"
+DEPENDS = "attr zlib"
+INC_PR = "r4"
 
 S = "${WORKDIR}/squashfs${@bb.data.getVar('PV',d,1).replace('r','-r')}/squashfs-tools"
 
-- 
1.7.0.4



