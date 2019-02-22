Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
	[209.85.221.50])
	by mail.openembedded.org (Postfix) with ESMTP id 17A767CC1E
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Feb 2019 17:30:09 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id t18so3240264wrx.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Feb 2019 09:30:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=BO7xUtSOf7F3q51BQ7yR7+eopshbXn4ofugmHd3uw5c=;
	b=ZtWnk1AkEgiJ8Pr71V1ZgkGohUayamnFdv2I6xSC9vNOgmrOFzcXerb0ZD8lOurxjE
	ChqeL+4Zer3YB/Airsf/yI7coXI8wf2n04dE5m7ywF+QErj6HyT6pySasIyTRjFOUQjr
	3n/7pxTzGKF5Iz4/rVzckVF1RXxC89m+HAay6xTkGsdw/1W9xzkv8JJ7igm5vkUGjMvs
	o/bQ1kyy8K37UMI3+Z+6bY/w9qyIPVjCBvIfFgqY96B0r29zqmfNec/K/75ZI8UxpS0O
	lVGAfBllfrcG3SCFB9kLttWMNXP5pMstu3yx6Nrm/b575+S1wv18Eq8zEQCNOdGuHam7
	a6Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=BO7xUtSOf7F3q51BQ7yR7+eopshbXn4ofugmHd3uw5c=;
	b=PpzqmI7vqhjTEqcEDj5cEPR+5Wm9nIS4cu3hFmXMpP/WltGkdy5YlmWj2a5DCbnmxw
	BLsHhuc+lZHU+sZsKp9/QY2JzlJ2PZwNC2v/NZ+nXJQSdV8vyqoYVvUgHYlkXRVh08F1
	L1gm4rRwXQSNguV2gnbFUkBUlCRlLzvqaqgVFS1fO3YJLOdXz5TtZOLKq5xGg+lI24hO
	WTWixoM6phB2O0Ec7U7I52p2TNh1Wxt668G7rCu6NxV46kV2AlVCaL3VKvOuRjmjvp6r
	9gKOAqnX/+grwxVfdiwDZea4AdNfUDUA8vZJUCnDKkwFXZTri2nYe3q0MidGvy/U8u4i
	Tszw==
X-Gm-Message-State: AHQUAuaFCnRargWFC4URuYOIsfehTnqbCsOboOI/aoOAtL6IUT3f1eDP
	WtaHM+J2IYzKf4w6tpgSLLupAhodn2c=
X-Google-Smtp-Source: AHgI3Iagd/VJWoO/V3lqYm9ph/jcVPhcSW4WqI1xQu0xbp8+lZMooSfkSzICJIj766U3yf1NjER+/g==
X-Received: by 2002:adf:ee0f:: with SMTP id y15mr3632069wrn.197.1550856609369; 
	Fri, 22 Feb 2019 09:30:09 -0800 (PST)
Received: from localhost.localdomain (static.8.26.4.46.clients.your-server.de.
	[46.4.26.8]) by smtp.gmail.com with ESMTPSA id
	q24sm1337597wmq.16.2019.02.22.09.30.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 22 Feb 2019 09:30:08 -0800 (PST)
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 22 Feb 2019 18:29:46 +0100
Message-Id: <20190222172949.3661-2-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190222172949.3661-1-nicolas.dechesne@linaro.org>
References: <20190222172949.3661-1-nicolas.dechesne@linaro.org>
MIME-Version: 1.0
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [meta-oe][PATCH 1/4] meta-oe: fixup LAYERDEPENDS to include meta-python
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
X-List-Received-Date: Fri, 22 Feb 2019 17:30:09 -0000
Content-Transfer-Encoding: 8bit

meta-oe depends on meta-python, for mongodb recipe, since
5cf9a144ad16 (mongodb: Upgrade to 4.0.1 release)

Trying to run the yocto-check-layer script fails with:

ERROR: Nothing PROVIDES 'python-cheetah-native' (but /work/yocto/meta-openembedded/meta-oe/recipes-dbs/mongodb/mongodb_git.bb
DEPENDS on or otherwise requires it). Close matches:
  python3-git-native
  python-nose-native
  python-native
ERROR: Required build target 'meta-world-pkgdata' has no buildable
providers.
Missing or unbuildable dependency chain was: ['meta-world-pkgdata',
'mongodb', 'python-cheetah-native']

Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
---
 meta-oe/conf/layer.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf
index 23c10ce339..8cedcf0d0b 100644
--- a/meta-oe/conf/layer.conf
+++ b/meta-oe/conf/layer.conf
@@ -28,6 +28,7 @@ BBFILE_PRIORITY_openembedded-layer = "6"
 LAYERVERSION_openembedded-layer = "1"
 
 LAYERDEPENDS_openembedded-layer = "core"
+LAYERDEPENDS_openembedded-layer = "meta-python"
 
 LAYERSERIES_COMPAT_openembedded-layer = "thud"
 
-- 
2.20.1


