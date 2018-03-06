Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f66.google.com (mail-pl0-f66.google.com
	[209.85.160.66])
	by mail.openembedded.org (Postfix) with ESMTP id 8B73D78A84
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 Mar 2018 01:55:15 +0000 (UTC)
Received: by mail-pl0-f66.google.com with SMTP id 93-v6so10947285plc.9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 05 Mar 2018 17:55:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=TTGG+HdOW/dXwPK9KrvQydGRKAEmQGdpZuPa4Te7HRI=;
	b=stID9Mm5QTtkC7etglbfropcNe4uBOkCjvNrriML37RmU2+mjMTrWjGlTDcKwWbAju
	av5TGMGD4ADQEY4HjTVRCz+1wd6Hdoqi8ZCjUsNiM310QBDgMmSiZHTEUnB8QcTsF63H
	lyVdsOM182B03gYXHIF5pUHjgfuJk/3X4mLmJlGl3J6ofK59KsLP7ZGqI7oL/X5W9Wea
	kILaHhbFAbkXBvdIcQtDUSolQu6HK7il2RQ4LmWTkANubf/gLkcJfAjDxvfCxp0Fy+jy
	m5t92sZXdcKO49OjTtDVQ95k/uBmGUl9yl/DjC1Cj8gGm3ANw7qgBbLrVwPhyHrXYgDi
	uwnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=TTGG+HdOW/dXwPK9KrvQydGRKAEmQGdpZuPa4Te7HRI=;
	b=Kr/kxbHvp9gh5ApRQkEEDuQkFIZGcKQZuTy3p0x9SfSGVlhj5uckw8tcaeys1I/9Y0
	ot0cvXV+vhwPhWtOBQRWWosoxzNBNQ+A+C4zJO0DZlj8O6HYYaKSr7qiOVxSivwBhBz3
	QLGSsMurwq07atoTRv1hja2A5MlOGb/Y4MO+wreb6oPwzMQGHk+H2dP2nvc1Zjs6KFeX
	+qDP/cvgKka3CrzzixM1Id7dU/xQwUxl7ThVjZ3uTx3E560kRH/IZeCTAFU046M2YKcD
	qelDRnmn9zBQ4n3B0+KCJbosmDUsh0gcHbQ0X1jZn/4ScubWI99kc44JVfkju7godNsi
	JPnA==
X-Gm-Message-State: APf1xPD0AE+4rFBaUFm9zwVl+jcKHbtptIIfoa8n3CL/n8NfUa7xu/CD
	bWzMoy1yTReTnx9lZmOsjss=
X-Google-Smtp-Source: AG47ELv0AGEXxrDKicUwD3tO3plny1KFuLaQkKnMeeB91g9TnqUCPkdy4yQISS41k87jz2Sofz1aBA==
X-Received: by 2002:a17:902:858c:: with SMTP id
	e12-v6mr15118664plo.39.1520301316726; 
	Mon, 05 Mar 2018 17:55:16 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:95c8:2b55:de97:f11f])
	by smtp.gmail.com with ESMTPSA id
	p125sm31985927pfp.43.2018.03.05.17.55.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 05 Mar 2018 17:55:16 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-devel@lists.openembedded.org
Date: Mon,  5 Mar 2018 17:55:12 -0800
Message-Id: <1520301312-29879-4-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1520301312-29879-1-git-send-email-akuster808@gmail.com>
References: <1520301312-29879-1-git-send-email-akuster808@gmail.com>
Subject: [meta-oe][PATCH 4/4] mosquito: move from oe to networking layer
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
X-List-Received-Date: Tue, 06 Mar 2018 01:55:15 -0000

mosquito has dependancy on meta-netowrking packages

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../files/0001-config.mk-allow-prefix-mandir-localedir-from-environ.patch | 0
 .../mosquitto/files/0002-uthash-remove-in-tree-version.patch              | 0
 .../recipes-connectivity/mosquitto/files/mosquitto.init                   | 0
 .../recipes-connectivity/mosquitto/files/mosquitto.service                | 0
 .../recipes-connectivity/mosquitto/mosquitto_1.4.14.bb                    | 0
 5 files changed, 0 insertions(+), 0 deletions(-)
 rename {meta-oe => meta-networking}/recipes-connectivity/mosquitto/files/0001-config.mk-allow-prefix-mandir-localedir-from-environ.patch (100%)
 rename {meta-oe => meta-networking}/recipes-connectivity/mosquitto/files/0002-uthash-remove-in-tree-version.patch (100%)
 rename {meta-oe => meta-networking}/recipes-connectivity/mosquitto/files/mosquitto.init (100%)
 rename {meta-oe => meta-networking}/recipes-connectivity/mosquitto/files/mosquitto.service (100%)
 rename {meta-oe => meta-networking}/recipes-connectivity/mosquitto/mosquitto_1.4.14.bb (100%)

diff --git a/meta-oe/recipes-connectivity/mosquitto/files/0001-config.mk-allow-prefix-mandir-localedir-from-environ.patch b/meta-networking/recipes-connectivity/mosquitto/files/0001-config.mk-allow-prefix-mandir-localedir-from-environ.patch
similarity index 100%
rename from meta-oe/recipes-connectivity/mosquitto/files/0001-config.mk-allow-prefix-mandir-localedir-from-environ.patch
rename to meta-networking/recipes-connectivity/mosquitto/files/0001-config.mk-allow-prefix-mandir-localedir-from-environ.patch
diff --git a/meta-oe/recipes-connectivity/mosquitto/files/0002-uthash-remove-in-tree-version.patch b/meta-networking/recipes-connectivity/mosquitto/files/0002-uthash-remove-in-tree-version.patch
similarity index 100%
rename from meta-oe/recipes-connectivity/mosquitto/files/0002-uthash-remove-in-tree-version.patch
rename to meta-networking/recipes-connectivity/mosquitto/files/0002-uthash-remove-in-tree-version.patch
diff --git a/meta-oe/recipes-connectivity/mosquitto/files/mosquitto.init b/meta-networking/recipes-connectivity/mosquitto/files/mosquitto.init
similarity index 100%
rename from meta-oe/recipes-connectivity/mosquitto/files/mosquitto.init
rename to meta-networking/recipes-connectivity/mosquitto/files/mosquitto.init
diff --git a/meta-oe/recipes-connectivity/mosquitto/files/mosquitto.service b/meta-networking/recipes-connectivity/mosquitto/files/mosquitto.service
similarity index 100%
rename from meta-oe/recipes-connectivity/mosquitto/files/mosquitto.service
rename to meta-networking/recipes-connectivity/mosquitto/files/mosquitto.service
diff --git a/meta-oe/recipes-connectivity/mosquitto/mosquitto_1.4.14.bb b/meta-networking/recipes-connectivity/mosquitto/mosquitto_1.4.14.bb
similarity index 100%
rename from meta-oe/recipes-connectivity/mosquitto/mosquitto_1.4.14.bb
rename to meta-networking/recipes-connectivity/mosquitto/mosquitto_1.4.14.bb
-- 
2.7.4


