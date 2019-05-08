Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
	[209.85.128.46])
	by mail.openembedded.org (Postfix) with ESMTP id 62A477D68F
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 May 2019 06:32:05 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id f2so1647679wmj.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 May 2019 23:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=6Y/yCymkWGWFknCFcCfEzj8evcCLZPXV25/pNRF9QFo=;
	b=YJUFCkgd9pGO7Tw4cP5raHcVhhpwcD7B8fYI2PRHhXzuORlkBn6zJH1E5P68qdGQNP
	ytPDBWLcCN0Lcl9F/LkvBFCML/tmosH2vDlvTs/juGThEzeTQqQSCWkrOyy258czcTwn
	KNldCLGdAvVOpAMCf8b7YOpa00stKT31OpTs433TI6f0j0aA5lxryDurTjUzPAtmukPw
	7i3nSw9QK93XVeQNOchPmUql4re/ajKYv8u8A/G1qURtp9vbONgevhu3Abk0VmLcwwig
	AAvY+7zirHgYiJsOksy58zszf722L+bMCfHZ35z403tGekBj5l1EHNRMU5gRvqWmS7DM
	ZAQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=6Y/yCymkWGWFknCFcCfEzj8evcCLZPXV25/pNRF9QFo=;
	b=mm4Zq2EngRzZPQ8AES5cMzprDZ3Oo+5c/7tm9HjgxwBkUm4bRuGuDgpv9qHNJIsxbh
	rJgG9fynJygNmELDr6LFQ1OGcmMhW2QeXLDhCfY9h33Pdig7ScEbEesqtGpOKH6uOipJ
	7ZspXTmt19uKCPO3QxppYOfauBKuHuK5XxXi+kK5NtDLu0D4DxM3j0FkzSpCBojDcKn2
	bc2QW8LzzSl1KejTTJSavnQtU+G2G0XmvhFcLreMGTZAREe3cNfVTNNTqLwffoMaM7bU
	DwFldyHLettd/bh3dcNHM1RLUK/flVvQXnpL+M0rxjJDW7d0HHRp9iCUH7fY7cyPQzPD
	P7FQ==
X-Gm-Message-State: APjAAAUjO9xdeYKfLPODj132YDK2JFhAJLbmbu4qrEgs6+q7EKaGXYkh
	MIHxsOf52hfevp3KeP/9opxQujnzttI=
X-Google-Smtp-Source: APXvYqzBq97nFhez8GhX7tPCSQqTbwr3+uV1tB4b4abCeNNpQB2fk6H7Lge4vtiOmNvSMtEFpUtU6A==
X-Received: by 2002:a7b:ce84:: with SMTP id q4mr1677023wmj.41.1557297125829;
	Tue, 07 May 2019 23:32:05 -0700 (PDT)
Received: from superandy.speedport.ip
	(p200300F07F0B31751CB5D2150A46C45C.dip0.t-ipconnect.de.
	[2003:f0:7f0b:3175:1cb5:d215:a46:c45c])
	by smtp.gmail.com with ESMTPSA id
	k206sm5637499wmk.16.2019.05.07.23.32.04
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 07 May 2019 23:32:04 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  8 May 2019 08:31:54 +0200
Message-Id: <20190508063154.10299-4-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190508063154.10299-1-schnitzeltony@gmail.com>
References: <20190508063154.10299-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 4/4] glade3: move to to meta-xfce
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
X-List-Received-Date: Wed, 08 May 2019 06:32:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* lubxfce4ui is the last recipe requiring glade3 optionally
* old glade3 is necessary to open xfce glade files based on gtk2
* meta-xfce depends on gnome-layer already so no adjustment in layer
  dependencies is necessary

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../0001-Add-G_GNUC_PRINTF-on-functions-with-format-strings.patch | 0
 .../glade3/0001-gnome-doc-utils.make-sysrooted-pkg-config.patch   | 0
 .../recipes-devtools/glade/glade3/0002-fix-gcc-6-build.patch      | 0
 {meta-gnome => meta-xfce}/recipes-devtools/glade/glade3_3.8.5.bb  | 0
 4 files changed, 0 insertions(+), 0 deletions(-)
 rename {meta-gnome => meta-xfce}/recipes-devtools/glade/glade3/0001-Add-G_GNUC_PRINTF-on-functions-with-format-strings.patch (100%)
 rename {meta-gnome => meta-xfce}/recipes-devtools/glade/glade3/0001-gnome-doc-utils.make-sysrooted-pkg-config.patch (100%)
 rename {meta-gnome => meta-xfce}/recipes-devtools/glade/glade3/0002-fix-gcc-6-build.patch (100%)
 rename {meta-gnome => meta-xfce}/recipes-devtools/glade/glade3_3.8.5.bb (100%)

diff --git a/meta-gnome/recipes-devtools/glade/glade3/0001-Add-G_GNUC_PRINTF-on-functions-with-format-strings.patch b/meta-xfce/recipes-devtools/glade/glade3/0001-Add-G_GNUC_PRINTF-on-functions-with-format-strings.patch
similarity index 100%
rename from meta-gnome/recipes-devtools/glade/glade3/0001-Add-G_GNUC_PRINTF-on-functions-with-format-strings.patch
rename to meta-xfce/recipes-devtools/glade/glade3/0001-Add-G_GNUC_PRINTF-on-functions-with-format-strings.patch
diff --git a/meta-gnome/recipes-devtools/glade/glade3/0001-gnome-doc-utils.make-sysrooted-pkg-config.patch b/meta-xfce/recipes-devtools/glade/glade3/0001-gnome-doc-utils.make-sysrooted-pkg-config.patch
similarity index 100%
rename from meta-gnome/recipes-devtools/glade/glade3/0001-gnome-doc-utils.make-sysrooted-pkg-config.patch
rename to meta-xfce/recipes-devtools/glade/glade3/0001-gnome-doc-utils.make-sysrooted-pkg-config.patch
diff --git a/meta-gnome/recipes-devtools/glade/glade3/0002-fix-gcc-6-build.patch b/meta-xfce/recipes-devtools/glade/glade3/0002-fix-gcc-6-build.patch
similarity index 100%
rename from meta-gnome/recipes-devtools/glade/glade3/0002-fix-gcc-6-build.patch
rename to meta-xfce/recipes-devtools/glade/glade3/0002-fix-gcc-6-build.patch
diff --git a/meta-gnome/recipes-devtools/glade/glade3_3.8.5.bb b/meta-xfce/recipes-devtools/glade/glade3_3.8.5.bb
similarity index 100%
rename from meta-gnome/recipes-devtools/glade/glade3_3.8.5.bb
rename to meta-xfce/recipes-devtools/glade/glade3_3.8.5.bb
-- 
2.20.1


