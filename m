Return-Path: <jonathan.richardson@broadcom.com>
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
	[209.85.210.177])
	by mail.openembedded.org (Postfix) with ESMTP id 7ADDA60C6F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Feb 2020 23:22:33 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id q8so3846702pfh.7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Feb 2020 15:22:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=broadcom.com; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=v+dp33dIXYZIvesRhokNJchcFbOFmRmUs8Fb1W2VUL8=;
	b=Ymn95kgg3ozTG4GduwefXBp5M1c7rHs191t/ekr9WFceduKCn7T0Igf0h0hzszqQBv
	6UgzEQx2nZenZr0/HLOoTFh6nFPXpNtq3xGv9Pr6tTGRQUMFaipaFShJoD/7aowpwiJa
	KyBTvv1m495KCTbvlVELUcz2HI5zLO+Hqs/n8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=v+dp33dIXYZIvesRhokNJchcFbOFmRmUs8Fb1W2VUL8=;
	b=iLdCs82quTsygm9wJyZkcNw94aQJIsCRZbdK4UUL+ApUIWZXorUJPrbtYoOxUXZvAG
	S47jSEPIfwlwxUO+awxsHyjY+0K7bZ41DQDPE5r7fH9jy7PadVy5QW8wGd7X2FcPABRw
	t2UJLnmxc5ZOlTIQOXJctmFBX3D68aWJrJWI7jfnW5Eta9kaCzgaw9tjVMENt5FYLioc
	3TRdlALeGQ2vF7Vo/dr3CtnQYRFER3fG/e8qk+YgQlFuHRNXso7uQbdunXskCrhKHt25
	z/s6HOABQfuZtlE//qz9ar8w/2y2qbr8AnoxEjH0RqNbVXh6YiOZZXZYT9rBwvXkowi2
	qq+Q==
X-Gm-Message-State: APjAAAWXnHcGy9D7LuD1VV+uj5PBTXYZYCUezSda/AARP0AThieJY/o+
	rt8c4scKuolW7FfVZ9e8Z/ADliFVVQ0gYm0nFt0rynFk+HQCKi0v2iuJAqIG2sye1WUPiHkxXcD
	DT0gIVXIuraqP1t7EI8fYBRBUIOF4qmT1Ombehv952E8qvH0TZevL1RF48d3gJa/YWA/KLngpJr
	dtabnhSaPncls2kcvkyd46z2dSp3qrddE=
X-Google-Smtp-Source: APXvYqwqul1mYV9ThTbZK2TGBtD79T/nC+F1NtGiVRKr7Zc3gkHXMnmlvSblbVYCl+F1p/XA4nN2Zw==
X-Received: by 2002:a63:514b:: with SMTP id r11mr289809pgl.329.1581636154189; 
	Thu, 13 Feb 2020 15:22:34 -0800 (PST)
Received: from lbrmn-lnxub108.ric.broadcom.com ([192.19.228.250])
	by smtp.gmail.com with ESMTPSA id
	g72sm4593833pfb.11.2020.02.13.15.22.32
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 13 Feb 2020 15:22:33 -0800 (PST)
From: Jonathan Richardson <jonathan.richardson@broadcom.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 13 Feb 2020 15:22:20 -0800
Message-Id: <20200213232220.109189-1-jonathan.richardson@broadcom.com>
X-Mailer: git-send-email 2.17.1
Cc: Randy Schacher <stuart.schacher@broadcom.com>
Subject: [meta-oe] pcimem: add initial version 2.0
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
X-List-Received-Date: Thu, 13 Feb 2020 23:22:33 -0000

From: Randy Schacher <stuart.schacher@broadcom.com>

Initial revision from 09724edb1783a98da2b7ae53c5aaa87493aabc9b

Reviewed-by: Jonathan Richardson <jonathan.richardson@broadcom.com>
Reviewed-by: Randy Schacher <stuart.schacher@broadcom.com>
Signed-off-by: Jonathan Richardson <jonathan.richardson@broadcom.com>
---
 meta-oe/recipes-devtools/pcimem/pcimem_2.0.bb | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/pcimem/pcimem_2.0.bb

diff --git a/meta-oe/recipes-devtools/pcimem/pcimem_2.0.bb b/meta-oe/recipes-devtools/pcimem/pcimem_2.0.bb
new file mode 100644
index 000000000..ee2b1846b
--- /dev/null
+++ b/meta-oe/recipes-devtools/pcimem/pcimem_2.0.bb
@@ -0,0 +1,18 @@
+SUMMARY = "Simple program to read & write to a pci device from userspace"
+HOMEPAGE = "https://github.com/billfarrow/pcimem"
+BUGTRACKER = "https://github.com/billfarrow/pcimem/issues"
+SECTION = "devel"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+COMPATIBLE_HOST = "(x86_64|aarch64|arm)"
+
+SRCREV = "09724edb1783a98da2b7ae53c5aaa87493aabc9b"
+SRC_URI = "git://github.com/billfarrow/pcimem.git "
+
+S = "${WORKDIR}/git"
+
+do_install() {
+    install -d ${D}${bindir}
+    install -m 0755 ${B}/pcimem ${D}${bindir}
+}
-- 
2.17.1


