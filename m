Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
	[209.85.128.48])
	by mail.openembedded.org (Postfix) with ESMTP id 2F0E47F937
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Nov 2019 06:54:46 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id c22so2033030wmd.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Nov 2019 22:54:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=FPyZNsyhgR67YLq283H5ahFEkKEIDqsLUjQ1EKfrkcE=;
	b=KF+B0DNn3VXbhz1bRTKO3f0Is6GhpzvNUg9CIQo3VXp9gxLf/6ZYX/VfiE+GLcXakT
	l5wOskLRpVWl9wsNrvXVkhWyYW/dAy0Ww2qlrZmuH1XL0Halb0/PZua1ssb30u977S5O
	94QgARdx1s68Uln1c7Kdxfn+rUSPJVF532qaaC6jnazyuGrKGqG9jDeyFcSHdbtWGp3A
	z6z6JaipY3D0QIru3E4yU38/p+il5/P+tRdCyhn0o1EnxmlMgpNn8G+T8d+cLFWxCBF8
	tz83EYKlwWQLKZrViphPCP4nnkJYxEYwhjk6isDwJzgRAetD21qnWyQkktVi6WtCHQgF
	5EEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=FPyZNsyhgR67YLq283H5ahFEkKEIDqsLUjQ1EKfrkcE=;
	b=httGGEmT8X4npXN+ZYC/Kbf22WZ2DrY5rJZYK2zzObv42/3mi3ws9df44apxgNYw5x
	x5OmQmsG/barffC1NkZEkgtNrBN6hKifsMtmX6BDNKFpFSqAqL9N+/mTMJK67LbBlwLU
	fRJWHgwE0L5drneVJPxP7BCPGHKYTpmWfgB+a5R9tuB+Px142SShkGYCCVow3NCl0iMH
	S5MnZV8es5XuYY/E375ylN54BbvZAUc2Xumlc/zC1iyRTmgkLAzBZvECQL5URiuZ5wy/
	EtQ9fAMNhVUk9WruXnObE78g3ZGYCbwkEjHj9r2mSXconykdjP0lyXJ8lxQ6dex+F9Zn
	MpRQ==
X-Gm-Message-State: APjAAAXdWQRC1RtsCFMNgQFGzkJaeIjjN1zJ5SlR4ArcGUA7H3aclOPD
	dQFa8W0XfHS5R/fBFb1VNF0KMdUA
X-Google-Smtp-Source: APXvYqw5Ur9g5tGXACcYEKxlD+TdPZ18xzQnFKslkHIZTh0cpdmOy+3mZkueudWgybfd1AUKs3dwCg==
X-Received: by 2002:a1c:a90f:: with SMTP id s15mr951138wme.100.1573023286669; 
	Tue, 05 Nov 2019 22:54:46 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F438C581B49BA34826387FE.dip0.t-ipconnect.de.
	[2003:f0:7f43:8c58:1b49:ba34:8263:87fe])
	by smtp.gmail.com with ESMTPSA id
	j14sm17996079wrp.16.2019.11.05.22.54.45
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 05 Nov 2019 22:54:45 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	Kai.Kang@windriver.com
Date: Wed,  6 Nov 2019 07:54:32 +0100
Message-Id: <20191106065433.3609-2-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191106065433.3609-1-schnitzeltony@gmail.com>
References: <20191106065433.3609-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [meta-xfce][PATCH 2/3] xfce4-time-out-plugin: upgrade 1.0.3 -> 1.1.0
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
X-List-Received-Date: Wed, 06 Nov 2019 06:54:46 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Release notes for 1.1.0
=======================
- GTK3 Port
- React to panel "mode," not "orientation" (Bug #15840)
- Make time out plugin respect panel icon size (Bug #15839)
- Allow compilation with panel 4.15
- Make build less verbose
- Translation Updates: Croatian, Galician, Italian

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...ime-out-plugin_1.0.3.bb => xfce4-time-out-plugin_1.1.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-panel-plugins/time-out/{xfce4-time-out-plugin_1.0.3.bb => xfce4-time-out-plugin_1.1.0.bb} (67%)

diff --git a/meta-xfce/recipes-panel-plugins/time-out/xfce4-time-out-plugin_1.0.3.bb b/meta-xfce/recipes-panel-plugins/time-out/xfce4-time-out-plugin_1.1.0.bb
similarity index 67%
rename from meta-xfce/recipes-panel-plugins/time-out/xfce4-time-out-plugin_1.0.3.bb
rename to meta-xfce/recipes-panel-plugins/time-out/xfce4-time-out-plugin_1.1.0.bb
index 4218c0c50..c3de5964d 100644
--- a/meta-xfce/recipes-panel-plugins/time-out/xfce4-time-out-plugin_1.0.3.bb
+++ b/meta-xfce/recipes-panel-plugins/time-out/xfce4-time-out-plugin_1.1.0.bb
@@ -6,5 +6,5 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 
 inherit xfce-panel-plugin
 
-SRC_URI[md5sum] = "81e1a961032c7b87d672bed09c681a73"
-SRC_URI[sha256sum] = "7f9cd4694e83d9cc5e41140d174dcc5ffe00fd546f2706f619031039ad7e0f6b"
+SRC_URI[md5sum] = "afa0ef865a49f28165098d3fe625df44"
+SRC_URI[sha256sum] = "ee4a51a35076d50cba3824079f8312585373ff2f0d9ebc740d8f3c0426430a19"
-- 
2.21.0


