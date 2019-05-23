Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 313F47E42D
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 May 2019 06:49:34 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id x64so4503585wmb.5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 May 2019 23:49:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=LUw21gaRauBzQZr1wsH1TUa71AYwfV7wcu6Bb5BSDWA=;
	b=CwroIhTMjyyPgx6xpbiPDEiKgNRXEO9OMfE2jBYLU0F2Dbxof5LsEs8lasQpERGCQZ
	46vEr6207AmU1SYDiBC92GEVN/ciU0ig5+s7+dmXoCbwTTGPXOqp9qLw7sJV6GTyenA7
	QbRx5HkFVc8UrrXfNpgY8JRUsF5LeH6gscNTS/QTDQ1VwmYljV9lcqBDZhfG7OcrVoiJ
	B2nJuq5VVgXVYACuPU3/NHBFB722HQCEHRtzFGPjPBpkw0nQM4RpOvcSNEQ26jmKT13A
	MUZO8t0HdAEtrn6NwbxlSo4Si/GPxbMqEmPTa+1cLcM1WlDcvjdWeTZ5khVancWqg10H
	owVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=LUw21gaRauBzQZr1wsH1TUa71AYwfV7wcu6Bb5BSDWA=;
	b=WGys8EXolqVLZrRAVl9H04KWfZsKTeg0zN6V4GsWnRi8N4f+FTNzjrcLWNFvQ5qMfc
	7yWImPjwQnSf4HKGpRHLblwdQ9C57MOSuEm6OVtx2yGvXyXSCJqoEW1UMnKBzF/SlECN
	u01gsb/SSUJWP2QUcGlJFEuUInSpju2ubBPNclFK95ZD2kQDheA+4d2RFsrXrkJDoWsB
	ZqvpxFWKmIj/JQykDwIj7OCb6A29WZ0Dcp9ukN/BrFGA7Zrl7ht0LqooJFIdVaCiXUqo
	8RBmhwFJOVjdl8R9A7R/QjkcKLDnw/7WGMg14UE3Pfv7Qn1QdM/t7v6AePaUNHdmtpD8
	yMkQ==
X-Gm-Message-State: APjAAAXyvTppF6cJ8ZwXJDNtwJDUNZY8pzrlbCqFS/zViSaRcuDOjy8y
	ajriWnanvM7j8LIKo4M8hnqVOHrD4ss=
X-Google-Smtp-Source: APXvYqzC1tR6iynoXE5fi2CpbV1Equg6wocihsXgPamAqk8jbyDhje3U4KNUY4puO3AqJ1MFwTtbuA==
X-Received: by 2002:a7b:c397:: with SMTP id s23mr10547533wmj.85.1558594174929; 
	Wed, 22 May 2019 23:49:34 -0700 (PDT)
Received: from mueller-a-nb-linux.speedport.ip
	(p200300F07F04E634002574DE25662558.dip0.t-ipconnect.de.
	[2003:f0:7f04:e634:25:74de:2566:2558])
	by smtp.gmail.com with ESMTPSA id
	d9sm33827524wro.26.2019.05.22.23.49.34
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 22 May 2019 23:49:34 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 May 2019 08:48:49 +0200
Message-Id: <20190523064859.24336-32-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190523064859.24336-1-schnitzeltony@gmail.com>
References: <20190523064859.24336-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 31/41] libwacom: initial add 0.33
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
X-List-Received-Date: Thu, 23 May 2019 06:49:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

It is a dependency for upcoming gnome-settings-daemon

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../recipes-support/libwacom/libwacom_0.33.bb      | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta-gnome/recipes-support/libwacom/libwacom_0.33.bb

diff --git a/meta-gnome/recipes-support/libwacom/libwacom_0.33.bb b/meta-gnome/recipes-support/libwacom/libwacom_0.33.bb
new file mode 100644
index 000000000..6fb3b82ef
--- /dev/null
+++ b/meta-gnome/recipes-support/libwacom/libwacom_0.33.bb
@@ -0,0 +1,14 @@
+SUMMARY = "A tablet description library"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=40a21fffb367c82f39fd91a3b137c36e"
+
+DEPENDS = " \
+    libxml2-native \
+    libgudev \
+"
+
+inherit autotools pkgconfig
+
+SRC_URI = "git://github.com/linuxwacom/libwacom.git"
+SRCREV = "87cc710e21a6220e267dd08936bbec2932aa3658"
+S = "${WORKDIR}/git"
-- 
2.20.1


