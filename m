Return-Path: <brendank310@gmail.com>
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by mail.openembedded.org (Postfix) with ESMTP id 487027964F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Oct 2018 16:41:54 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id z20-v6so9975461qti.9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Oct 2018 09:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ILu/wziPJ7BsiEGAWVf8C+tIOrY2BGV2H6lzIe99798=;
	b=OJbtc7hyWndW2h6c59Lb7H5ruypZ/vZB5Vja9L4IMbuP4d6fkNLAyXTS7MZbyoqHD3
	D+T8RapaS7FxZjk6Nkg6QXL6k3j74PCQSvg39k4iyZ+RL9UneBOWlTVEgK1GsgrN9WkI
	0F4w6KDQaCGTy32ujp8ozxRIR/HKGxAQ+z8XyrwGfu5Yo7KnY0vY91CZA/EqQUP+iMmu
	InuILghDYkXbMCNi3wx4X5Qd3QWVOnB4/p4EPTQNs5sAvgbEfj2xgqhZpftwyaySb3vn
	3v8e7iBNCJOjFCvlenCMFghK6MlTfbsSdwN8JFnN/5SKs7d8Igu3QmlolpYN2XIrGhrh
	j56A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ILu/wziPJ7BsiEGAWVf8C+tIOrY2BGV2H6lzIe99798=;
	b=pLQNaGHgzmbiTqdzVoJCqMPrnp2DP8xHz4gRKVLAsZmUydYEAedJ3vgrNDPTIcwlVe
	7zbF43SQnJeMGEobgBuxf3Ta473fBxUOUVXpu/p3xy8+ERyM2nx560L3HhPWH2Ej2XaJ
	AvROcNO4RNFoxnDd6Gubq2ZiX1EDjWkJ7NQiNTRvkJloC75ItYEbBHM0iyN3kJ32fyaj
	8V5ekK2Yv23pOrTidPsDX1sXSI8yUg0iG98Vj+yCtc6oC0k3jPtkq9opRD3Gp8xwwFu/
	2ZvZ8e3E6HY8O4CsG9PK2MaOwdR5ELrUfooD+OkDrjipSzQAYL1FTkBImfbjOG5CZpPu
	m2gQ==
X-Gm-Message-State: AGRZ1gIO/CiNCL5X+1tQayliLL4/cNBDQ910/BsnTBxqUy1PonfG3qsp
	+0Mg1kQS14Cy60gA+omUqb9SLG0n
X-Google-Smtp-Source: AJdET5eKyw0Lnw05grtMZxve8n5kjbfo0UteNMUUNmUDc1Bt4DuRSAkXfXjYDh2RLXy8Zj3M2HGaJQ==
X-Received: by 2002:ac8:2413:: with SMTP id
	c19-v6mr13303058qtc.194.1540831314708; 
	Mon, 29 Oct 2018 09:41:54 -0700 (PDT)
Received: from localhost.localdomain (209-217-208-226.northland.net.
	[209.217.208.226]) by smtp.gmail.com with ESMTPSA id
	i2-v6sm13471476qkf.42.2018.10.29.09.41.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 29 Oct 2018 09:41:53 -0700 (PDT)
From: brendank310 <brendank310@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 29 Oct 2018 12:41:08 -0400
Message-Id: <9b79042551b8a92258a425b5e05423a17cb55ab0.1540830650.git.brendank310@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1540830650.git.brendank310@gmail.com>
References: <cover.1540830650.git.brendank310@gmail.com>
Cc: schnitzeltony@googlemail.com
Subject: [RFC meta-gnome][PATCH 11/16] libwacom: add recipe for libwacom
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
X-List-Received-Date: Mon, 29 Oct 2018 16:41:54 -0000

From: Brendan Kerrigan <kerriganb@ainfosec.com>

Signed-off-by: Brendan Kerrigan <kerriganb@ainfosec.com>
---
 meta-gnome/recipes-gnome/gnome3/libwacom_git.bb | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/gnome3/libwacom_git.bb

diff --git a/meta-gnome/recipes-gnome/gnome3/libwacom_git.bb b/meta-gnome/recipes-gnome/gnome3/libwacom_git.bb
new file mode 100644
index 000000000..e60b76965
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnome3/libwacom_git.bb
@@ -0,0 +1,17 @@
+DESCRIPTION = "libwacom"
+LICENSE = "MIT"
+DEPENDS = " \
+            glib-2.0 \
+            libgudev \
+            libxml2 \
+          "
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=40a21fffb367c82f39fd91a3b137c36e"
+
+SRC_URI = "git://github.com/linuxwacom/libwacom.git;protocol=http;branch=master;tag=libwacom-0.31 \
+           "
+
+S = "${WORKDIR}/git"
+
+inherit autotools pkgconfig distro_features_check 
+
-- 
2.17.1


