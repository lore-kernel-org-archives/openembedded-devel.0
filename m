Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
	[209.85.214.194])
	by mail.openembedded.org (Postfix) with ESMTP id C2F51613DE
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Feb 2020 02:43:00 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id g6so6111845plt.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 16 Feb 2020 18:43:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=llp/D0QL5h3PWLDZPcrd9QeIw3cpofjnLOmGSuSFrvs=;
	b=CqhMQvSxESLeD11WeQrYs6QRIRkmOk7OiHaociDipODLX7Z42JzlYvgtqUe9a/oH+t
	DDjxgKG1Wwp0C0rUpAAHArgZK66C7w32TrVVQifcKyJZ4brfSUSv1e+u5ir6BbaaXheA
	taXX7zMPY97oWRxVsKpCmK/Cg/ZiCn9Tk70RQuMmLqfCRQYRLwhbMLA16j0pyWsNrzLd
	PgLxjKoBXIkaUubokC8HY2692UE6cPfxTH6NnUBh3urlnx7VUHjtmG1legOciTawJxP6
	P8MA/rJ4B3bgsa9cPDYxsYEnuSJintUFHEv0NLKaeQFeD9fI7VrwzRFK1S4iC/kH7EoS
	TwVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=llp/D0QL5h3PWLDZPcrd9QeIw3cpofjnLOmGSuSFrvs=;
	b=RWF/An7RkiToSF+exu1EOP1l+30UkVwdACEL7/uljbieRNQrT1LrrhJIGKvRv/804n
	wtKB3AE/uDwrKT03HAD61f+NslkA/Q94iUq3agHND19LswV415aJ5Lr4bXGGcVF4Q/NS
	qXQcXl8Ju8ABZbUIAKQbq86RuWAqQKm8CaW2Chmcu506fEhOZ0lHTMCBB/WOZ442ItSF
	zzVeiVF4TIOhs5JTduOT13jIF+rkhyWjmKkyHeNAx9PnE+OJ4BQYkuezHEJFUpOlI41m
	WxnkWpRMFYVHRu2o7WMnuHVK4doQrsfhh0zIOWFw2YNUJXCXvMjF06GA9hSRFEfVs8ad
	l2bw==
X-Gm-Message-State: APjAAAXVLIlLy/88d4AM9pmv13IRSF/CqCpOvg2rdwbKrHyS/At5PLQ5
	o/IXzFPToPZ4+QVAkcH9qMkTh9fOLp0=
X-Google-Smtp-Source: APXvYqzsI/4F1TwyDlUzvPzswd0m1U4YgCj3JnJB3Sqg451o+IRHxxxqIGeyzqEvLgD2seh54jNwXQ==
X-Received: by 2002:a17:90a:198e:: with SMTP id
	14mr17526871pji.44.1581907381600; 
	Sun, 16 Feb 2020 18:43:01 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::98a3])
	by smtp.gmail.com with ESMTPSA id
	64sm14141008pfd.48.2020.02.16.18.43.00
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 16 Feb 2020 18:43:00 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 16 Feb 2020 18:43:02 -0800
Message-Id: <20200217024304.1131392-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200217024304.1131392-1-raj.khem@gmail.com>
References: <20200217024304.1131392-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-gnome][PATCH 5/7] sysprof: Inherit mime and mime-xdg
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
X-List-Received-Date: Mon, 17 Feb 2020 02:43:02 -0000
Content-Transfer-Encoding: 8bit

Use += for depends to not override prior ones

Fixes
sysprof-3.34.1: package contains mime types but does not inhert mime: sysprof path '/work/aarch64-yoe-linux/sysprof/3.34.1-r0/packages-split/sysprof/usr/share/mime/packages/sysprof-mime.xml' [mime]
sysprof-3.34.1: package contains desktop file with key 'MimeType' but does not inhert mime-xdg: sysprof path '/work/aarch64-yoe-linux/sysprof/3.34.1-r0/packages-split/sysprof/usr/share/applications/org.gnome.Sysprof3.desktop' [mime-xdg]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-gnome/recipes-kernel/sysprof/sysprof_3.34.1.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-gnome/recipes-kernel/sysprof/sysprof_3.34.1.bb b/meta-gnome/recipes-kernel/sysprof/sysprof_3.34.1.bb
index 1e530efb17..ad69ab68c3 100644
--- a/meta-gnome/recipes-kernel/sysprof/sysprof_3.34.1.bb
+++ b/meta-gnome/recipes-kernel/sysprof/sysprof_3.34.1.bb
@@ -5,9 +5,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
                     file://src/sysprof/sysprof-application.c;endline=17;md5=a3de8df3b0f8876dd01e1388d2d4b607"
 
 GNOMEBASEBUILDCLASS = "meson"
-inherit gnomebase gettext systemd upstream-version-is-even gsettings
+inherit gnomebase gettext systemd upstream-version-is-even gsettings mime mime-xdg
 
-DEPENDS = "glib-2.0 libxml2-native glib-2.0-native"
+DEPENDS += "glib-2.0 libxml2-native glib-2.0-native"
 
 SRC_URI[archive.md5sum] = "cc32455277b31afb1965d627ae3e3629"
 SRC_URI[archive.sha256sum] = "844bbb8d8b65071b3bca96f8e921319ceef81f2d2c51fcc9da63a4b355c893d0"
-- 
2.25.0


