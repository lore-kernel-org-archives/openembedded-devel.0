Return-Path: <brgl@bgdev.pl>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 8BB486C637
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Nov 2018 07:35:30 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id r11-v6so17023528wmb.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Nov 2018 23:35:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=/9ICIib1XD8sXtC3Bl14o22Ood6Hdl95KCnOE71Hrro=;
	b=KiwGZx9Zdrus9Y5FJzVE8RUPq3A/TgVAWr8lMWkMdhJNxq10TkvIdlHdMaU9KQ/h2S
	DhcqZoonXfWpPiaLWH2buPaFrBCWv6sw5RVAb+9rn9t9rl0QoGTLtZ7Tvf9/0RrmXk8E
	zeBjYm8eh/wUDAUbrFd7xtmqhj3UoUbzg3axqgJFQKTkDl4scUj85mI21MnXTbBx0z8D
	K59igEypnXmZe1SeL7HOagEObv2y1zeXK84A4avd8uSFniO35UgJ8xYtOg1Uy3I13y1i
	0oDWRa18xP88n8wWrlUWrIsdBgN72Dk1TNu0kXVCX3UAoy6O4JI5uILB/ICUVi1/rQUI
	IvKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=/9ICIib1XD8sXtC3Bl14o22Ood6Hdl95KCnOE71Hrro=;
	b=Wmj/R5q7e5GW0AjjextyakmlpOKPI9Aopql+Md/YXYaFvDaqED+EvpbkXzpQsxBQye
	qHHHgayuGgsYo4BluQv97gltMThcfO2tT9Qtp26n7Oy2ZIq+HGQNYSDk3POrjBcbXU5u
	3EJ4nLX7YWb0DQjkl4KFP2v0J1GNmFnNxiYTyiga7820+LI9S9xqNsO/80Jws94K51H+
	R81ENlHSw//8hi4E/Pac3egbooc91Xze1z589a9G71D/lQTHcZ0pluq/KU7lNeS1znJq
	8GsIeNEqwB79qXiKwHo+gN3aDu1UAK+V5meS1Jlg1VKvWC6klUUb3TmLOhKjdza3lXmH
	6S0g==
X-Gm-Message-State: AGRZ1gJYLuTQu5/7yjxBhEgmb7Lwt4xK7GM/Ru3lQ/Xiuf1/U6i7YIDV
	NpIsw2sZEFFJ/FvmjblQPoPaF6hX/tc=
X-Google-Smtp-Source: AFSGD/XGo0ujO7K0xRabNfI0rYFBgABZH9bFRauZFBgSBup/54xs6oM27xW9AdlGfXg6e5Qc/2nGIw==
X-Received: by 2002:a1c:91d1:: with SMTP id
	t200mr22320332wmd.111.1543217731048; 
	Sun, 25 Nov 2018 23:35:31 -0800 (PST)
Received: from debian-brgl.home ([2a01:cb1d:af:5b00:6d6c:8493:1ab5:dad7])
	by smtp.gmail.com with ESMTPSA id g2sm9479986wrw.78.2018.11.25.23.35.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 25 Nov 2018 23:35:30 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: openembedded-devel@lists.openembedded.org,
	Khem Raj <raj.khem@gmail.com>
Date: Mon, 26 Nov 2018 08:35:20 +0100
Message-Id: <20181126073520.18859-7-brgl@bgdev.pl>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181126073520.18859-1-brgl@bgdev.pl>
References: <20181126073520.18859-1-brgl@bgdev.pl>
MIME-Version: 1.0
Subject: [meta-oe][PATCH v2 6/6] sigrok-cli: new package
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
X-List-Received-Date: Mon, 26 Nov 2018 07:35:31 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 .../sigrok/sigrok-cli_0.7.0.bb                 | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 meta-oe/recipes-extended/sigrok/sigrok-cli_0.7.0.bb

diff --git a/meta-oe/recipes-extended/sigrok/sigrok-cli_0.7.0.bb b/meta-oe/recipes-extended/sigrok/sigrok-cli_0.7.0.bb
new file mode 100644
index 000000000..d31bcd282
--- /dev/null
+++ b/meta-oe/recipes-extended/sigrok/sigrok-cli_0.7.0.bb
@@ -0,0 +1,18 @@
+DESCRIPTION = "sigrok-cli is a command-line frontend for sigrok."
+HOMEPAGE = "http://sigrok.org/wiki/Main_Page"
+
+LICENSE = "GPLv3"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
+
+DEPENDS = "libsigrok"
+
+PACKAGECONFIG[decode] = "--with-libsigrokdecode,--without-libsigrokdecode,libsigrokdecode"
+
+PACKAGECONFIG ??= "decode"
+
+inherit autotools pkgconfig
+
+SRC_URI = "http://sigrok.org/download/source/sigrok-cli/sigrok-cli-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "77cb745e2fa239c7bd1ea81e2d67ede9"
+SRC_URI[sha256sum] = "5669d968c2de3dfc6adfda76e83789b6ba76368407c832438cef5e7099a65e1c"
-- 
2.19.1


