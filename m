Return-Path: <brendank310@gmail.com>
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by mail.openembedded.org (Postfix) with ESMTP id 5705379B9F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Oct 2018 16:41:58 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id z20-v6so9975733qti.9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Oct 2018 09:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=wKM4dZCLHZTJU0XunLjG4M0xPusiBNSYOizFdbOeyJ4=;
	b=H4399vK/K8ArFbTHposGnDqMPkEf6Df3fwekQCxUH1VTnYBSTwLIGVNTfE78RI4CWr
	AcExB1GR9axwpgyGYvpcuxYI6BVMQ4nH+3fARp9NkWVJIaLfrmeI1vW8kmMF93Uj3hGg
	7WfOYqdc2SImwh64muuyHYA4CG5wutO4VXPzw0+EzoZ9a2k79VflRpxbMzHofI4uxmTE
	sRfT78ooMPUZLYTUDIv5x1j+WFxg1ErmnxDL9cjSBn5aaERbZWZZ6WXLtW5ao/n1hB1D
	yYtr9v7ZoARAo+pima7d90vNcVW0aDkmZQ/HOQeE10Pw/ed1wExpM0YVxsfI21u7iNiM
	Oleg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=wKM4dZCLHZTJU0XunLjG4M0xPusiBNSYOizFdbOeyJ4=;
	b=nb3NC9fAWgGOjPUmWTWbPvZ6zGhcrDgSUb2cGm4WMyh5dtx18oHhTlhuybCXykGu79
	BuQV2ZTHWktLnRu/2L4H5JTNQY2ZKtsnSJNdsRiHz8/hLJlQxEh0vOWphiwxdSHHvwxm
	97os235ZYiNv0yY4o+anmC6FAEkIz3I9z/MTbx0Ba0ZwIO1+xK+KkpDS8bsgg1uMSmru
	xEjeICYXmsNCqyg2+7YGsdaAAJDnRnSMqFIo5Wn0ohoVOsefKD6i/jS74DM7wg9dyy88
	UM6rNb32BxfGm38tuz1C5SfyT1vj5vtz6yFMyksMtOUiYkMyZefRVsW38ovB1aWXbUMM
	xvaQ==
X-Gm-Message-State: AGRZ1gJupMX1Arsey+UiSkwjWZdR3ezLRyT0042DcrcjDQ3aXmyklIep
	4rwTInAe65P+6xVz89N+sq07P0TQ
X-Google-Smtp-Source: AJdET5dF1zD3UBnjtN7De8FdXjCYDyoT+VWUoJrogGsb5Yx3cun7A64kOwyWkJj5ZMMoQRCYg7Mqyg==
X-Received: by 2002:aed:2f27:: with SMTP id
	l36-v6mr13436364qtd.71.1540831319057; 
	Mon, 29 Oct 2018 09:41:59 -0700 (PDT)
Received: from localhost.localdomain (209-217-208-226.northland.net.
	[209.217.208.226]) by smtp.gmail.com with ESMTPSA id
	i2-v6sm13471476qkf.42.2018.10.29.09.41.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 29 Oct 2018 09:41:57 -0700 (PDT)
From: brendank310 <brendank310@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 29 Oct 2018 12:41:11 -0400
Message-Id: <9f5b028fdf90a7650a62e538889580dc31864a6b.1540830650.git.brendank310@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1540830650.git.brendank310@gmail.com>
References: <cover.1540830650.git.brendank310@gmail.com>
Cc: schnitzeltony@googlemail.com
Subject: [RFC meta-gnome][PATCH 14/16] packagegroup-gnome3-base: add packagegroup for installing gnome3/gnome-shell
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
X-List-Received-Date: Mon, 29 Oct 2018 16:41:58 -0000

From: Brendan Kerrigan <kerriganb@ainfosec.com>

Signed-off-by: Brendan Kerrigan <kerriganb@ainfosec.com>
---
 .../packagegroups/packagegroup-gnome3-base.bb | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/packagegroups/packagegroup-gnome3-base.bb

diff --git a/meta-gnome/recipes-gnome/packagegroups/packagegroup-gnome3-base.bb b/meta-gnome/recipes-gnome/packagegroups/packagegroup-gnome3-base.bb
new file mode 100644
index 000000000..8484087b8
--- /dev/null
+++ b/meta-gnome/recipes-gnome/packagegroups/packagegroup-gnome3-base.bb
@@ -0,0 +1,27 @@
+SUMMARY = "All packages required for a base install of Gnome Shell"
+SECTION = "x11/wm"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
+PR = "r0"
+
+inherit packagegroup distro_features_check
+
+REQUIRED_DISTRO_FEATURES = "x11"
+
+RDEPENDS_${PN} = " \
+    packagegroup-core-x11 \
+    xinit \
+    atk \
+    at-spi2-core \
+    at-spi2-atk \
+    cairo \
+    gnome-shell \
+    gnome-bluetooth \
+    upower \
+    pulseaudio \
+    librsvg \
+    ibus \
+    gnome-desktop3 \
+    accountsservice \
+    gnome-settings-daemon \
+"
-- 
2.17.1


