Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id E38547F9B4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Nov 2019 19:49:52 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id a17so8308569wmb.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Nov 2019 11:49:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=TsU7GQLHcJw5F39H0sz9jheazHTNrBK/BLKVEd7QeHA=;
	b=DP6WZ+4+sn1dIDOr50IiHsn42PQof38+0KxS1aG0VNrTsOT4bV2cckZvpw2jRzF7yC
	HT+ReFoZAnnSf+mhn5wNpCcOsHBHis4MVn1yzSV7eJ3+NWrsBZZy5eQLVJDQPxbD6K5/
	AQDD4//4ovmvlVLdfyyg0Zj50mEkH3C/ujDdHTaKHK89oYOHDQvaJwExF+r7TQD8Kjza
	eKKZDee3Yu/i+jQo2TN4DWcyxtoxbxiBBGYyQoTQ1XdpmfI1VSISw2AqECxfKahrg+30
	R1goXyDKY7mSyYRp1BlQKYIAugzXlTfib2Uywdy3HLWaCFiOiNOCszsoadWK3wAz8Qoz
	Eb1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=TsU7GQLHcJw5F39H0sz9jheazHTNrBK/BLKVEd7QeHA=;
	b=nsceECgCtbRyCvHqChsR9fBp2lfXGN8oIO0iZj6bdTUFD3POXofHQ70eUyLXHO/3Bi
	Ri2eh+gEh4Tvk7oHz4laYlscHNEtSHyvCdxmuA2GyF7Gqiyl7FWZT7HUjGlBX04JH5iD
	Bgvk8SRmpuNBTNpZIlCrc8/i5L1JHyB3YXpkatkwlZdlseHFAxPP/mPqUNcnWGSfT+p1
	8DFXdapXIyyA0Knw8vPafUGhNxT5xp7307WknwOGTB1yF+gCWt2AcSNLVGwaRLVF2xYn
	Bx6OlGFFdfeT3egIfeunhMfGtnD8yK8UWC4KbFd1pzEJ7E6r/q3o2wD0GGS5tPRpNUXf
	lfPA==
X-Gm-Message-State: APjAAAV1Yq9Ck3nJgh80c6MYzOCk7Ahok33/RwGQrFHDunOUQMLkRrPO
	grMl3ihTd9H+dsZw+WtzPD9GCAiH
X-Google-Smtp-Source: APXvYqxG1Cbeoe7XdgN4xatv0FeDm+D99iI8IdC6nrrTIEd7Yruv5yq8juMfDA8/NPitklKs/E32Sw==
X-Received: by 2002:a7b:c762:: with SMTP id x2mr9753354wmk.128.1573760993457; 
	Thu, 14 Nov 2019 11:49:53 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F072F08821A0DCFF2B58A35.dip0.t-ipconnect.de.
	[2003:f0:7f07:2f08:821a:dcf:f2b5:8a35])
	by smtp.gmail.com with ESMTPSA id
	f13sm8013074wrq.96.2019.11.14.11.49.52
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 14 Nov 2019 11:49:52 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 14 Nov 2019 20:49:29 +0100
Message-Id: <20191114194930.2786-16-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191114194930.2786-1-schnitzeltony@gmail.com>
References: <20191114194930.2786-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 15/16] libwacom: initial add 0.33
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
X-List-Received-Date: Thu, 14 Nov 2019 19:49:53 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* it is a dependency for upcoming gnome-settings-daemon
* there are later versions of libwacom availabvle but due to genaration of
  udev-rule at build time these versions open nasty native dependencies:
  libgudev-native -> udev-native

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
2.21.0


