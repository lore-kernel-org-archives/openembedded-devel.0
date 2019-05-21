Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
	[209.85.210.177])
	by mail.openembedded.org (Postfix) with ESMTP id 030FA7E144
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 May 2019 03:56:44 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id z28so8335601pfk.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 May 2019 20:56:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=xVu7bnjmzoEZkAdVunhkJMKVOF7+WmsmLUtASo2P3QM=;
	b=OsJKqcZGevDjhITHcAy8aHNf7AhdqCfv5+4sm9J8eYC7XQBIMybuyHgWiK9uGDA/wz
	aMyGR97J17rfRI4pL6YVeOJOa6z/U4kQMxzC4y9ifa2zW54nS2NNKM2OVnUsZ54YQJtt
	byLPcY0DdcJM1IWkCdyK/AvxxCo8XwaUlHD9L6aWPJm3QXteNz2J1+ZHeQzJSI3EbqkE
	tx5iTwiR4qyHDs0XSgcEVqLlnQd3LJP7LCJLgUavlm+BAqZ479j7NomHbeL5yJdhTzgx
	qPRmuNHoE2a7u+hlaUum0Hz/O5ieFhkMnLlmMkcaIwOEJ9Be3Wu+dgDpr/9Rao1DYoA1
	Jq/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=xVu7bnjmzoEZkAdVunhkJMKVOF7+WmsmLUtASo2P3QM=;
	b=RbvQWJ3nOl7e+sIFwLtJ4kR28jVubuLvLQpHRHVsqcpe4orfeZHIuc0p+hc3pw6gaH
	6Ol7FqFaG12eh/cKjKZQQqLuL/fPnGKonjjjfEhIpfagNchTtPiRElCCVVpt4ierplNk
	P9SJUXhdUC/bYZ1FLGAa8/oRm/1MCNBUxFL0dGxfARy3QI6BguzHZwoXwm1UMMly3GQb
	pk8trf7fgYgPw6Jiu4eY1Q1STyitKu3jQWuMt5JHKdA/bi1jA4t28EtKd3kOYAioFvWr
	nWSqm7S06Guy+Sl1siLSNAhWi4+3tjRXZej3gxM3+fxrHhzFHbnNLu+NB1zqQbI/9MDg
	dL/Q==
X-Gm-Message-State: APjAAAVuWFdtTi8j3qSz1ulB9ZZTjJZMd9XnUf2Ym6Vnjr1LhvYBX6US
	pQcbgNvz1eooKliI+oewPO5sZBWm
X-Google-Smtp-Source: APXvYqwgFdd9/xdUMCEDonFiT7RkuGcyc2bNLPvdoZMDLSsqxgi3sFcITFH0fsAtnVx/SNK36l4vgw==
X-Received: by 2002:a62:b517:: with SMTP id y23mr80206183pfe.182.1558411005141;
	Mon, 20 May 2019 20:56:45 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:199d:e2fe:5a4f:97f4])
	by smtp.gmail.com with ESMTPSA id
	h13sm23045273pfo.98.2019.05.20.20.56.44
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 20 May 2019 20:56:44 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 May 2019 20:56:08 -0700
Message-Id: <3265bb67550f49b0dd4a4ec9ad98af56c14cbb5d.1558410874.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1558410874.git.akuster808@gmail.com>
References: <cover.1558410874.git.akuster808@gmail.com>
MIME-Version: 1.0
Subject: [warrior][patch 08/34] gnome-desktop3: set correct meson gtk doc option
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
X-List-Received-Date: Tue, 21 May 2019 03:56:44 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Andreas Müller <schnitzeltony@gmail.com>

Fixes:
| ERROR: gnome-desktop3-3.32.0-r0 do_configure: QA Issue: gnome-desktop3: configure was passed unrecognised options: docs [unknown-configure-option]

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.32.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.32.0.bb b/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.32.0.bb
index ffd7dce..0acbb21 100644
--- a/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.32.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-desktop/gnome-desktop3_3.32.0.bb
@@ -27,6 +27,7 @@ DEPENDS += "itstool-native gsettings-desktop-schemas virtual/libx11 gtk+3 startu
 inherit distro_features_check gtk-doc
 REQUIRED_DISTRO_FEATURES = "x11"
 
+GTKDOC_MESON_OPTION = "gtk_doc"
 EXTRA_OEMESON = "-Ddesktop_docs=false"
 
 PACKAGES =+ "libgnome-desktop3"
-- 
2.7.4


