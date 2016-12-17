Return-Path: <joe@deserted.net>
Received: from mail-io0-f195.google.com (mail-io0-f195.google.com
	[209.85.223.195])
	by mail.openembedded.org (Postfix) with ESMTP id 6238C773F0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Dec 2016 02:15:19 +0000 (UTC)
Received: by mail-io0-f195.google.com with SMTP id p13so13767698ioi.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Dec 2016 18:15:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=deserted-net.20150623.gappssmtp.com; s=20150623;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=VgjskWRHGvMKWVt5o+voRvq0OTWjYNkmKS/3de17rZU=;
	b=dtmfa/aCcS6wAsbtIn2gE+m6juTajOU1NSdEssQ5hBRbbJ2WJPjBf/OhtqSqyxc/AG
	J6Nxl6yfipAqgjMKAQ65nae2UvrTuQLJWDCyAhkaY34/ngiCbPxUKXLd/URFrm1oVIOi
	jZT0xoJfMsH2oBMhbXwDxoFXRY83Bx3mFW6NTu/crqMTnrOjmZucifRFLrEsXQYRC72O
	lFhK1ai0cZN3F8QhFTDYgzfYYxxFCN1ZMnXVq8nyvpKxG/5wUgZLJhlNq5huIJyslFG3
	BAPpxVAfgrDXLs8vO/x9BCRVpErLDF62BYc8oZ1a4XmGicQtFTHsjv/Ez5mmQHN0lWyc
	aalw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=VgjskWRHGvMKWVt5o+voRvq0OTWjYNkmKS/3de17rZU=;
	b=VBP/su6ZrO6J6uGzYQMNwMoXMFT7745TynRjSH9mpBsQsfbO6wfF17BI5O3aJC1ZZK
	AsjfeJ8WSx9drpU4/HIBBrCXu2V06ZKohvSXQ23VN3sIjoMTvvhr3viItCAJz7BRmH/D
	5AP5cIJjCJXlV/Ivt5QBXkW7OdbtNKTTKAC8C5wodunInw8fChSY+oolqTqidBLaWz4+
	NeNe2Cy5EnCzPSWm96Gt/1iR2uV+2Fz/X5Pi0ngLfAfiNU3FDcd7nqcCsl5boayO8cmx
	wsNpgFWxeQTE1mS3CoZz7VPZVamwQ74Nf7JDCWgJ2jIKG65IIgCgcnJYbOtF4sEpKquB
	qOtQ==
X-Gm-Message-State: AIkVDXKwHLf1Gb92qVqpYd7dBLg0lFoc5uedlBjU1ORwM0nKw0FzJfqr1beAtiWQNrC9Tw==
X-Received: by 10.107.153.134 with SMTP id b128mr6623597ioe.160.1481940921459; 
	Fri, 16 Dec 2016 18:15:21 -0800 (PST)
Received: from mir.deserted.net (23-233-31-74.cpe.pppoe.ca. [23.233.31.74])
	by smtp.gmail.com with ESMTPSA id l73sm3804122ioe.1.2016.12.16.18.15.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 16 Dec 2016 18:15:20 -0800 (PST)
Sender: Joe MacDonald <joe@deserted.net>
From: Joe MacDonald <joe_macdonald@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 16 Dec 2016 21:15:17 -0500
Message-Id: <1481940923-12914-6-git-send-email-joe_macdonald@mentor.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1481940923-12914-1-git-send-email-joe_macdonald@mentor.com>
References: <1481940923-12914-1-git-send-email-joe_macdonald@mentor.com>
Subject: [meta-networking][PATCH 05/11] samba: install manpages
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
X-List-Received-Date: Sat, 17 Dec 2016 02:15:21 -0000

From: Andreas Oberritter <obi@opendreambox.org>

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
---
 meta-networking/recipes-connectivity/samba/samba_4.4.5.bb | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb b/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
index 37dabb6..c4b31df 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
@@ -97,6 +97,15 @@ EXTRA_OECONF += "--enable-fhs \
 LDFLAGS += "-Wl,-z,relro,-z,now ${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', ' -fuse-ld=bfd ', '', d)}"
 
 do_install_append() {
+    for section in 1 5 7; do
+        install -d ${D}${mandir}/man$section
+        install -m 0644 ctdb/doc/*.$section ${D}${mandir}/man$section
+    done
+    for section in 1 5 7 8; do
+        install -d ${D}${mandir}/man$section
+        install -m 0644 docs/manpages/*.$section ${D}${mandir}/man$section
+    done
+
     install -d ${D}${systemd_system_unitdir}
     install -m 0644 packaging/systemd/*.service ${D}${systemd_system_unitdir}
     sed -i 's,\(ExecReload=\).*\(/kill\),\1${base_bindir}\2,' ${D}${systemd_system_unitdir}/*.service
-- 
1.9.1


