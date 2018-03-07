Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 2D95F78694
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Mar 2018 04:03:47 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id e3so435583pga.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Mar 2018 20:03:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=bvg5ucG4mgOA6rV16KHZstLBWnCHxQDCic6mYb6jvAI=;
	b=klzlio1WQM/tF+3MxE9TCqEtvTPZpg58do41QiFaCH3U0zskE2ly37jEFSzLnX+qnB
	3gjMOGWD3LXRekQhRbEpcnS+X40NLzo7OmeJ/JtWHuz80L3ZbRppPqntpht10I3NBTrz
	RVUmdCallsIL/R8I/n1nY6ppG/CCcgOt0zH1t0zgXFjgXAdeWx8R2ttNMdPZZMoswRoy
	pBIi13exvIVIVOVKs6FIQJ2VassIhEp80MMOHpw3vigK+SUFfCTsJMHL51oTz0mFbdlJ
	gVhHFgBmjKW1N4KYRSWjQsjc/RjJTpMlRGg+6XB5UgOSzOkFYvA1N6NmLpn5y/kr5jaf
	JsuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=bvg5ucG4mgOA6rV16KHZstLBWnCHxQDCic6mYb6jvAI=;
	b=Quz1yl4tdGLvP3bOcM5xENXZJNNhgzHYF+9fMMILidr/UIEP7298q1ltUTKPfiQrzG
	bSpUxsDS4NBjPyNoGB4pt8Zv7g0nm0mlB9MgYYezCvDliST26D+W4j02b9VQ2LLBkJWV
	DcmyrliPfewaiwHdahIvHTSB+ZO21FORU/Gv5ubC+xjmNuC7UkOQ0w6CIYRY9EkD4hRL
	GzzDPzG1+DmWxo64qsFIiszHld/RpJTsfLbLJDaHqwN0JgsWIZ2LbRUKc2RfKNn9CEdV
	1XgwDSUjpaUfLbHFZPhO70HHxhmLrHabwnNZAlIrcF4WhKyGI97IFkGsiwwAmPYk34X4
	JkbA==
X-Gm-Message-State: APf1xPDFy4fZYvcjWUckfFZVg7sjStiJ1MAkMuL27oglP8nW06Z8jpEx
	YA2msnHoolJD6ONMK2aPbFk=
X-Google-Smtp-Source: AG47ELuT35FppJpZyuCkUrAg0R2u4WEiHL9cQj19fUd4nCITbd+5ekOL+XsrOrOwUaZUgB9e2l/VZg==
X-Received: by 10.99.109.138 with SMTP id i132mr17342068pgc.417.1520395429390; 
	Tue, 06 Mar 2018 20:03:49 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:6d76:b853:98d2:431c])
	by smtp.gmail.com with ESMTPSA id
	14sm30677152pga.53.2018.03.06.20.03.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 06 Mar 2018 20:03:48 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Tue,  6 Mar 2018 20:03:24 -0800
Message-Id: <1520395408-19266-21-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1520395408-19266-1-git-send-email-akuster808@gmail.com>
References: <1520395408-19266-1-git-send-email-akuster808@gmail.com>
Subject: [meta-oe][PATCH 21/25] xorg-data-common: only include when x11 in DISTRO_FEATURES
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
X-List-Received-Date: Wed, 07 Mar 2018 04:03:49 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-graphics/xorg-data/xorg-data-common.inc | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/xorg-data/xorg-data-common.inc b/meta-oe/recipes-graphics/xorg-data/xorg-data-common.inc
index b230962..cb6b5ac 100644
--- a/meta-oe/recipes-graphics/xorg-data/xorg-data-common.inc
+++ b/meta-oe/recipes-graphics/xorg-data/xorg-data-common.inc
@@ -7,4 +7,6 @@ XORG_PN = "${BPN}"
 SRC_URI = "${XORG_MIRROR}/individual/data/${BP}.tar.bz2"
 S = "${WORKDIR}/${XORG_PN}-${PV}"
 
-inherit autotools pkgconfig
+inherit distro_features_check autotools pkgconfig
+
+REQUIRED_DISTRO_FEATURES = "x11"
-- 
2.7.4


