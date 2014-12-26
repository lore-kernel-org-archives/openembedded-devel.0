Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qa0-f43.google.com (mail-qa0-f43.google.com
	[209.85.216.43])
	by mail.openembedded.org (Postfix) with ESMTP id 5921D72818
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Dec 2014 19:21:33 +0000 (UTC)
Received: by mail-qa0-f43.google.com with SMTP id n4so4149176qaq.30
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Dec 2014 11:21:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:organization; bh=pYwInI1gPvqzCa8cojcTudtPiYB0xJvE/lpiKHXPEUU=;
	b=AVNPC42FTYUoEeEPpIeBWhYw0/oIxonDtmB6jLU3G345RwUPkNuiCbJ8X60+tZ2vJr
	5P4VHqrrsoXFfIy1aeLV2EBX719cN7ihwA+iusf4qTnEHmQDYeXCA6o35A+Zc/aaMlMk
	QPfc/o/Mp3Fl1I+wIh+4BHv5bp35NLwZSIb/mnesweKnSMMzf2Mx2D5G9QN9DQcjgLdv
	tn3U2vI38JXXrIi4qIcGhBOYUOQ3qtlX3lMa9FDjVErT853wGDWMev9MFsGxXOK11V2G
	eQNJ3/Ja9MIcv1y8ZDl8UVsU/vrPoSmWeSV7GmIcKI4jo/qV4r2EJQeB8ngSyuooZszN
	KX/g==
X-Received: by 10.224.15.78 with SMTP id j14mr72554596qaa.0.1419621694188;
	Fri, 26 Dec 2014 11:21:34 -0800 (PST)
Received: from centrium.lab.ossystems.com.br ([177.100.225.47])
	by mx.google.com with ESMTPSA id
	k11sm26659998qgf.18.2014.12.26.11.21.32
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 26 Dec 2014 11:21:33 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
Date: Fri, 26 Dec 2014 17:21:31 -0200
Message-Id: <1419621700-1102-3-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.1.3
In-Reply-To: <1419621700-1102-1-git-send-email-otavio@ossystems.com.br>
References: <1419621700-1102-1-git-send-email-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [meta-oe][PATCH 03/12] sound-theme-freedesktop: Fix license format QA error
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 26 Dec 2014 19:21:39 -0000

Fix the following QA error:

,----
| WARNING: Recipe sound-theme-freedesktop, LICENSE (GPLv2+ CC-BY-3.0
|     CC-BY-SA-3.0) has invalid format, LICENSES must have operator "([&|()
|     ])" between them.
`----

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta-oe/recipes-multimedia/sound-themes/sound-theme-freedesktop_0.8.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-multimedia/sound-themes/sound-theme-freedesktop_0.8.bb b/meta-oe/recipes-multimedia/sound-themes/sound-theme-freedesktop_0.8.bb
index ebcfd12..098b08d 100644
--- a/meta-oe/recipes-multimedia/sound-themes/sound-theme-freedesktop_0.8.bb
+++ b/meta-oe/recipes-multimedia/sound-themes/sound-theme-freedesktop_0.8.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Freedesktop sound theme"
 HOMEPAGE = "http://freedesktop.org/wiki/Specifications/sound-theme-spec"
-LICENSE = "GPLv2+ CC-BY-3.0 CC-BY-SA-3.0"
+LICENSE = "GPLv2+ & CC-BY-3.0 & CC-BY-SA-3.0"
 LIC_FILES_CHKSUM = "file://CREDITS;md5=3213e601ce34bb42ddc3498903ac4e69"
 
 # glib-2.0 for glib-gettext.m4 which provides AM_GLIB_GNU_GETTEXT
-- 
2.1.3


