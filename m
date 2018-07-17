Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f65.google.com (mail-pl0-f65.google.com
	[209.85.160.65])
	by mail.openembedded.org (Postfix) with ESMTP id 8492A78869
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Jul 2018 01:51:01 +0000 (UTC)
Received: by mail-pl0-f65.google.com with SMTP id m16-v6so16076494pls.11
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Jul 2018 18:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=ohQ2GTt8Rs6fSFw+D6MBpSCt/3qhEfeWlIYcenQl05w=;
	b=jJJePrkSs4rBkQbxrMRVeFw9aQNR84IG3bTqRFXeed1qeTmdkZm+IO/Z1ZeYOAH9FH
	fzcgLSdeXNBFfwS36dTYMfDsBzCZ+PSpWXbqa79iF48pFyhnf1r+Tdz4YdFHd+6PJyIx
	vgxeTD2I/BmMeRbgoiA2Sun4/akhXTvfifIOsYwpJXgUm2s2qdf37wrJecXVVerdubfI
	or9CbjHp3ddJp5D1Ro9jra8vb3/OZmRwJTra2EJyCI/0bwjJAyfM7/3o3C7+n6XRaeSo
	j9RwM8ZtADy2Z25PWWhv03QHsUGXuyYPYj1varEZX0WrFgfcsUtywgi5MyRdd29hS0H5
	6Gyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ohQ2GTt8Rs6fSFw+D6MBpSCt/3qhEfeWlIYcenQl05w=;
	b=YCLgDzIy5wtO7dsJnOEV2H61t+3NWwWzKSGIRRNitZ3I0nyOYvbk11PO3QYEzQurpa
	Tuf4uc4rcdoa/WT7nnvO8qSdltZstLauICO/birh7J620nSyJW6cp+r4rHcIYQ8dp4ff
	o1q9+7fbg629hbW3NW7021fK+lwFv7OWoOt8FtYO5BdM7CEbmHa4GRBHtpBAnbNSqhYM
	7PY5VFDnR1ex/2KFFx9EsQfLF9dEhyUfa3J+lHFHV46IXXi27bZdfIrFzFJhOAAzqkeA
	G3xqr08M6pn8zamwcIBgCkV6YOqnKnMO7rJf7U774lWh80xeKTUW9d/PII0zxK3oHkux
	2p3A==
X-Gm-Message-State: AOUpUlH60A8XrTb8gcDmc7o3U76Jcj2U44uboTAyER9Y0IzITxhJI5z9
	FBgaBe569mJMBEzOpA6NJUih/w==
X-Google-Smtp-Source: AAOMgpdR0PA/BbRw2rIZtOl4SZIWf1RC4V72qq/l2OcpAfGAxNaqdcBOsR0brJ6D6pu1nVu12A5c5w==
X-Received: by 2002:a17:902:112b:: with SMTP id
	d40-v6mr18975942pla.123.1531792262271; 
	Mon, 16 Jul 2018 18:51:02 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::1736])
	by smtp.gmail.com with ESMTPSA id
	66-v6sm27878586pfd.71.2018.07.16.18.51.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Jul 2018 18:51:01 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 Jul 2018 18:50:49 -0700
Message-Id: <20180717015053.8191-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
Subject: [meta-gnome][PATCH] libgnome-keyring: Force ARM ISA on arm arches <= v5
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 17 Jul 2018 01:51:01 -0000

when global ISA is selected to be thumb then the build
fails since it will use thumb1 on these machines and fails
to compile, it however compiles fine with armv7+ with thumb2
hence limit the fix to armv4/armv5

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../gnome-keyring/libgnome-keyring_3.12.0.bb         | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/meta-gnome/recipes-gnome/gnome-keyring/libgnome-keyring_3.12.0.bb b/meta-gnome/recipes-gnome/gnome-keyring/libgnome-keyring_3.12.0.bb
index 82abe33491..ba69e2e0cd 100644
--- a/meta-gnome/recipes-gnome/gnome-keyring/libgnome-keyring_3.12.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-keyring/libgnome-keyring_3.12.0.bb
@@ -15,3 +15,15 @@ DEPENDS = "dbus libgcrypt glib-2.0 glib-2.0-native intltool-native"
 
 SRC_URI[archive.md5sum] = "6696e4f2e9aed4625cdc3af30bd8c238"
 SRC_URI[archive.sha256sum] = "c4c178fbb05f72acc484d22ddb0568f7532c409b0a13e06513ff54b91e947783"
+
+
+# Fails to build with thumb-1 (qemuarm)
+#| {standard input}: Assembler messages:
+#| {standard input}:823: Error: shifts in CMP/MOV instructions are only supported in unified syntax -- `mov r12,r12,ror#3'
+#| {standard input}:823: Error: shifts in CMP/MOV instructions are only supported in unified syntax -- `mov r12,r12,ror#13'
+#| {standard input}:824: Error: shifts in CMP/MOV instructions are only supported in unified syntax -- `mov r12,r12,ror#29'
+#| {standard input}:824: Error: shifts in CMP/MOV instructions are only supported in unified syntax -- `mov r12,r12,ror#19'
+#| {standard input}:825: Error: lo register required -- `orr r10,r10,r10'
+ARM_INSTRUCTION_SET_armv5 = "arm"
+ARM_INSTRUCTION_SET_armv4 = "arm"
+
-- 
2.18.0


