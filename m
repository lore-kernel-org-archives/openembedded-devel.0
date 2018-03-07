Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f65.google.com (mail-pl0-f65.google.com
	[209.85.160.65])
	by mail.openembedded.org (Postfix) with ESMTP id 3240278A1E
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Mar 2018 19:01:39 +0000 (UTC)
Received: by mail-pl0-f65.google.com with SMTP id u13-v6so1870500plq.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Mar 2018 11:01:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=abQhMbkYcoWbwk9a3iPOaa5ChBQiM+PyabHaApuMQz0=;
	b=Xg58dkbc5xdd1q7aXeFfV8oKYM5gdIw0CZ4E2/c/jQHmwT/DMF5NiYKQ1f67AHNW8F
	wJ9WSlzScSxvmQCFRLZNkNjB96VSM9lj51kvhcePazGlLMssdj4obXDvmqfKKKz/+mWw
	xtPDylw3cgWQd0bilFcMybXE2T/ZdKgvjKlPqVHVprq1jqjI3D8rwNzN2Wbnhi7t1Hqz
	Mi8xwxPcT8Fki3d799BbZoCS3+peQQDW5Pa/1acL9dDMPyX+ym8b3Izs7aBiQww1hKqE
	ZzIMhym/v73uHRBWR8dNQSHYufeJVFNqaTvp4qIoZ26t5mxnsvb1EZrPiC80m0x1a553
	rHww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=abQhMbkYcoWbwk9a3iPOaa5ChBQiM+PyabHaApuMQz0=;
	b=KxePE6GQe+SjBcgkcBPoLzpDV3cfk5CGmX9tBbs3GENh+WBQHCiG1bu1eQnChKc8oU
	m0edypk5IU9zS1QMnBM4YNL8KupPUA8PuW2h1LKY9yXJIh2wbd9CFxFzwpcRasnl66cl
	8XOSCVPdKCu1mmr38VURqA5rwXt8s1OI3Gb/1sdAZCjzH5GoYB3rM6tXQTMA/EPcAD7c
	C7eiU6vdF4Idug9927msVXYJKSvokFODpXEik09SLRJnwOru6nRwQ2axgzIYylqzzt8V
	jjYfERcl7eX+C7jCcXACWeZwzPCAcB7Bb9gF0GbjnocXefMFCBaEInPneOCfWA7m8VVg
	sLBQ==
X-Gm-Message-State: APf1xPDctsZfT0f0OnuuOhD0o/VWhlCpagYS10szbbcAMMj41GfYQJj7
	a3Dvyb6HJn9B1EpctPfkGFU=
X-Google-Smtp-Source: AG47ELv9UpLbcq3l9eE/NRzgd6ij97MjLJEOxJxKu5yAGuvXY3i7GGu7bymyexdh5LSIO3r6cMIp2g==
X-Received: by 2002:a17:902:34e:: with SMTP id
	72-v6mr21514723pld.277.1520449300839; 
	Wed, 07 Mar 2018 11:01:40 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:6d76:b853:98d2:431c])
	by smtp.gmail.com with ESMTPSA id
	s67sm36835461pfg.104.2018.03.07.11.01.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 07 Mar 2018 11:01:40 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Wed,  7 Mar 2018 11:01:11 -0800
Message-Id: <1520449275-29492-19-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1520449275-29492-1-git-send-email-akuster808@gmail.com>
References: <1520449275-29492-1-git-send-email-akuster808@gmail.com>
Subject: [meta-gnome][PATCH 19/23] libgnomecanvas: only include when x11 in DISTRO_FEATURES
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
X-List-Received-Date: Wed, 07 Mar 2018 19:01:39 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-gnome/recipes-gnome/libgnome/libgnomecanvas_2.30.3.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/libgnome/libgnomecanvas_2.30.3.bb b/meta-gnome/recipes-gnome/libgnome/libgnomecanvas_2.30.3.bb
index 41a89ce..f21cc5e 100644
--- a/meta-gnome/recipes-gnome/libgnome/libgnomecanvas_2.30.3.bb
+++ b/meta-gnome/recipes-gnome/libgnome/libgnomecanvas_2.30.3.bb
@@ -3,7 +3,9 @@ LICENSE = "LGPLv2"
 LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=55ca817ccb7d5b5b66355690e9abc605"
 SECTION = "x11/gnome/libs"
 
-inherit gnomebase gtk-doc
+inherit distro_features_check gnomebase gtk-doc
+
+REQUIRED_DISTRO_FEATURES = "x11"
 
 # intltool to provide IT_PROG_INTLTOOL
 # configure: line 12654: syntax error near unexpected token `0.35.0'
-- 
2.7.4


