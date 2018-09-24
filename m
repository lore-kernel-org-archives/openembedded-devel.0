Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 9F1FF79017
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Sep 2018 20:19:39 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id 206-v6so3145025wmb.5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Sep 2018 13:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=6eNmQgNcdnyw0cjW7hIJME1rB4AoWPI+MwhX1VU1Jac=;
	b=YqCKKCmsH6zgKrtEfEiTrVUjyMi+kebU5KbtBGZScNLcr7lQDwWXO+09Hj2DZp8ltU
	V70hkDbVlFx5YG2bswDh1RUspW/mOkk/qo1GVSZX5Ewu1+Q+J9p8dk4bfEAVfLKQ9Tbz
	1qXy7qb4Mb9hhLQEC3JJ0OtvJk84/3GCOPsIo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=6eNmQgNcdnyw0cjW7hIJME1rB4AoWPI+MwhX1VU1Jac=;
	b=mobSuZ8z6tPFSxNiHsBSgqt2Vs54BdMQBZilhFOdoyCnhWdDRnoYfwENl3J/ng0sv6
	WfA6pAjQUt5ztyHX9JtoxKuAsDROnAlO97/itt6otbF7tuIKP1kMh6n+b6lrWdVGTunr
	K/OdWr3EXVN8tL6Osihk0p0La1qgYqr2dAGOugxiWjDQDMl/GP3dtZ+gYOnTdqlEk2lg
	wwBtEr6YKccTuHcE/NZTJfZZxopb5+ShDeNfTc3MuOUndWN8wd6K2OoEiNC1CK0TDF/3
	c8fI5YXmCH2+1g4Li6Au6OQv3CfOL/MCZ1j9cra40usr9r5QSMXzMFLFVtTqfXp6fSv/
	oTdw==
X-Gm-Message-State: ABuFfohcNfVP2X21wIy+XwEev9RLewxigPYNfuGx3gFyEc9DyH5G3iZI
	BPlnVDqrw/2r8/JWzvQC/7NqMKYuK8r3Pg==
X-Google-Smtp-Source: ACcGV63SP/t2LFag9mk1CbYTmKl8pikcMLGBojZTM8YTyCIr8pbrZeEp8Y1/USjhQ6OBbaHWLkaELg==
X-Received: by 2002:a1c:64c:: with SMTP id 73-v6mr36257wmg.7.1537820379770;
	Mon, 24 Sep 2018 13:19:39 -0700 (PDT)
Received: from localhost.localdomain (static.8.26.4.46.clients.your-server.de.
	[46.4.26.8]) by smtp.gmail.com with ESMTPSA id
	v2-v6sm197051wrs.54.2018.09.24.13.19.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 24 Sep 2018 13:19:38 -0700 (PDT)
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 24 Sep 2018 22:17:05 +0200
Message-Id: <20180924201705.30209-1-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 2.18.0
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [meta-oe][PATCH] meta-multimedia: fixup LAYERDEPENDS
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
X-List-Received-Date: Mon, 24 Sep 2018 20:19:40 -0000

libebml depends on dos2unix classe since 26dafa0f3542 (libebml: inherit
dos2unix), so LAYERDEPENDS needs to be updated accordingly, otherwise we are
getting a ParseError:

ERROR: ParseError at
/srv/work/oe/meta-openembedded/meta-multimedia/recipes-mkv/libebml/libebml_1.3.0.bb:13:
Could not inherit file classes/dos2unix.bbclass

It was initially found with yocto-check-layer script.

Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
---
 meta-multimedia/conf/layer.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/conf/layer.conf b/meta-multimedia/conf/layer.conf
index cfedf2f6b..a1dfed4e9 100644
--- a/meta-multimedia/conf/layer.conf
+++ b/meta-multimedia/conf/layer.conf
@@ -27,6 +27,6 @@ BBFILE_PRIORITY_multimedia-layer = "6"
 # cause compatibility issues with other layers
 LAYERVERSION_multimedia-layer = "1"
 
-LAYERDEPENDS_multimedia-layer = "core"
+LAYERDEPENDS_multimedia-layer = "core openembedded-layer"
 
 LAYERSERIES_COMPAT_multimedia-layer = "sumo"
-- 
2.18.0


