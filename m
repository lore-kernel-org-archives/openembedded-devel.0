Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 3E3567839A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Aug 2017 11:28:12 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id u26so4589006wma.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Aug 2017 04:28:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=O1hQ1FniudBqgpJDak1RFMkCN5E6OCw+3K858ic13fE=;
	b=I/6ntouKL0iNzE6CqOtCcxW/qA6P9hXTSpBErkWADk/KfHtSYchG+Z2vSxyhNV+ap6
	aXZYO9lGSsMRl16JQXeiYg0L5lAndTyC+O3r0DkmUEnt/9ZFYmq1dVyNALBRf92tNSnq
	LL5+ZCrTntbCld7gApwy8jV8O37xIGEaEdUB8xhkY/jFYHWmRzFG53Wwz1X7A6hVac79
	OLM5MLe+DunZhZHScbNUHJyEw1xxArb3ikJWHBWWLhq472zWiF8a02XurONkY2LquX+U
	+x+hG8p+Xa/NpeRSIQU2dhofCSm5H2saDt5RjvS3qxHI2JmOJR8aJGOuHD1rEUTTh0o6
	Cp6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=O1hQ1FniudBqgpJDak1RFMkCN5E6OCw+3K858ic13fE=;
	b=nDhcXgHXJs9h55x39LQZcQYoV+Vk7I82vyp+80C28uqfd5qRHlEs/I62ENVGubp33g
	/oED/OQWvdYMRO7uS7kG6xasiNEXAS9hdKBPvgkVd1BPEEISBUAuJB0GMhvNk7teUJAz
	+Ls4WtegD8hlodmEAAwH56n2gePosQ1L/zstBsivVnVl/0JIO3gnhx9nRwIeTbozGrCB
	crDzSFhuZ0F/VqG4gUk+N53DjtKq1y889JGP1T9Az0kwDbZe1rxqhv6Yy6/TOYXwsxrG
	3+nREvTgDIjtOfBSVu4CCG9/oCwLD83vVA8oRUee15xRk0UPDhx6XMGQcXvutBIP7812
	vFoA==
X-Gm-Message-State: AHPjjUgtwb7vtw9IgXjOXzhj5c1PAsddrjNt60aAS16L6kzbTZoqejbE
	BdH7756z4VAQW+2F
X-Received: by 10.28.212.7 with SMTP id l7mr166382wmg.120.1504178893183;
	Thu, 31 Aug 2017 04:28:13 -0700 (PDT)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id s9sm8433248wrb.65.2017.08.31.04.28.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 31 Aug 2017 04:28:12 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 31 Aug 2017 13:30:08 +0200
Message-Id: <20170831113008.7247-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170831113008.7247-1-Martin.Jansa@gmail.com>
References: <20170831113008.7247-1-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 2/2] layer.conf: remove FREESMARTPHONE_GIT variable
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
X-List-Received-Date: Thu, 31 Aug 2017 11:28:12 -0000

* nothing in meta-oe is using it now and meta-fso is also gone now

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/conf/layer.conf | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf
index 5097f4b95..3896ff7f0 100644
--- a/meta-oe/conf/layer.conf
+++ b/meta-oe/conf/layer.conf
@@ -76,6 +76,4 @@ SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
   source-han-sans-tw-fonts->fontconfig \
 "
 
-FREESMARTPHONE_GIT = "git://git.freesmartphone.org"
-
 HOSTTOOLS += "id"
-- 
2.14.1


