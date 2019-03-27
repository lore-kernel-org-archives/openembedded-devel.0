Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
	[209.85.128.42])
	by mail.openembedded.org (Postfix) with ESMTP id B5EA87D14C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Mar 2019 15:35:31 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id o10so5106723wmc.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Mar 2019 08:35:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=N04VZSAWXfP0Kinz2mY6Nr4k/+hPCKf6tIFip88WT4k=;
	b=urnJ+EhCgRSyXVbF+BV11C+B7uS2Xis0E7GKB6fVLBc2P+RqTtDm392Yz1REyBq8v5
	5THp89bXXoqQ3k0apBvIQn8+2G4twKWq4lqdjZQmqjf907gRXVfGTDnny1tGInPPbhH1
	lj5bWnyQANVXFYl55u8+eBTYaxi8Gaxt7df5lwTamI7379EszBt3bhzb3NSH9DOqUq5k
	fPRgR8oFwdzU6W4R5KBiv0ZuQrOHFggIQLmDZPfX8HMujBQpRzBpN8P5kizmxI2Vaca3
	+pW3+yF9M4aR1PQfP8LcDEFaigBShgknifq4UJlmUMK+9djtOEbOB/LOBuHhsT/aIY+Y
	ts4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=N04VZSAWXfP0Kinz2mY6Nr4k/+hPCKf6tIFip88WT4k=;
	b=RdlleAbLWtm8dFnV6nn0KkF0CQK5KN+NneoNKgE2+F513aUMft0O+iycYUhbKgKKY4
	lINfFvAeK6byb3gzHtSdI+haNkxyTf42rxS81McdbAl8mrd0t0kWY6qLzlR5MfxQAzJd
	YxzrAQuXISCZ5ACfnUfRoosyU+UTsyw49u/tcNAwnKDD93z2A2mnh1nFO4wHAR1As8hL
	5yR/nkTjYur68bGb2iuc20YSPPULMLVnJbE9lBHxW0vtBMZoiDmrqDO3G9+e0Rdow/h3
	uJx6cm8pfQXzGYJvWrX9OYuU79N/V6b7F+rdztkirzQvCdfatGL6XpzO7ZCNjgmnBJcE
	ySUA==
X-Gm-Message-State: APjAAAXKcu2Mdw+EAqoV2jtlmszNmCmMv7IFXqoxROyAzBzHWLE6dYFC
	gGXggckT4JDf2XdZzq/PdS9iur1x
X-Google-Smtp-Source: APXvYqxg4DbjhrURauMEvOlS5PV+oZIIp0ixUtMvMN2eLZT/W8GwQ1nET1zb1N2WMHfZqOqoa+Up1A==
X-Received: by 2002:a1c:4e0a:: with SMTP id g10mr10293226wmh.128.1553700932336;
	Wed, 27 Mar 2019 08:35:32 -0700 (PDT)
Received: from localhost.localdomain (p509737a3.dip0.t-ipconnect.de.
	[80.151.55.163])
	by smtp.gmail.com with ESMTPSA id q4sm7517518wrx.25.2019.03.27.08.35.31
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 27 Mar 2019 08:35:31 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 27 Mar 2019 16:34:58 +0100
Message-Id: <20190327153509.23928-4-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190327153509.23928-1-schnitzeltony@gmail.com>
References: <20190327153509.23928-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 04/15] dconf-editor: upgrade 3.28.0 -> 3.32.0
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
X-List-Received-Date: Wed, 27 Mar 2019 15:35:32 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../dconf/{dconf-editor_3.28.0.bb => dconf-editor_3.32.0.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/dconf/{dconf-editor_3.28.0.bb => dconf-editor_3.32.0.bb} (67%)

diff --git a/meta-gnome/recipes-gnome/dconf/dconf-editor_3.28.0.bb b/meta-gnome/recipes-gnome/dconf/dconf-editor_3.32.0.bb
similarity index 67%
rename from meta-gnome/recipes-gnome/dconf/dconf-editor_3.28.0.bb
rename to meta-gnome/recipes-gnome/dconf/dconf-editor_3.32.0.bb
index 70f917ea5..999ed041a 100644
--- a/meta-gnome/recipes-gnome/dconf/dconf-editor_3.28.0.bb
+++ b/meta-gnome/recipes-gnome/dconf/dconf-editor_3.32.0.bb
@@ -8,8 +8,8 @@ DEPENDS = "dconf gtk+3"
 
 inherit gnomebase vala gettext gsettings bash-completion
 
-SRC_URI[archive.md5sum] = "cc9eb8020cc848812972d8519c3d05cf"
-SRC_URI[archive.sha256sum] = "455b53d827820efd28a176ee52e13eda5cda8cdf4e31e0145cfdd69931bf0c5a"
+SRC_URI[archive.md5sum] = "331a3603c0f8a9913e3a3c0f178b5310"
+SRC_URI[archive.sha256sum] = "f19d1332ac27e23ef3dc2ed07ba4e4646d9d7f05e2e78748aa525a1320adbaba"
 
 FILES_${PN} += " \
     ${datadir}/dbus-1 \
-- 
2.20.1


