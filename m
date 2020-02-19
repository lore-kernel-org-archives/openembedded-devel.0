Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
	[209.85.214.170])
	by mail.openembedded.org (Postfix) with ESMTP id CE33C611C4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Feb 2020 00:50:51 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id j7so8817825plt.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Feb 2020 16:50:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=T7AnshpY0UVe2tpdRJa/wyUk4BosTgQMWfP/ev7VvBI=;
	b=j02MSqzfEiweKAoxmpibYdBiWoLaIIPyKRq6w52S8d84eKvF7+YL+UzcxZcYya996g
	h8XYXwN6ICjHCNynwPqQNt0utWlXOrBB104hloU6qXbVuH6lHLD6+/FgJV4oNaHkwhLQ
	t2DEtF4CYvAa5u4OsBTNprJNFGdTvdUSZJ+7HB2esEsW2dEALSS08+WRaVN4asCKKq2J
	kqtx52q8zO214XH3hIY+h3qTnm+thKLJgP62TOlpB/d0NXbpu4OtO4sB3pjsOPcH+1G/
	JofpPM3OAnLlqaR7CWWU5YR81A2rbfcP20Cv4pSwWEsBsQfXEMxtoVsoVqPD76nZaht2
	JCmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=T7AnshpY0UVe2tpdRJa/wyUk4BosTgQMWfP/ev7VvBI=;
	b=al5GcVQG9QGM8lh5P9n51ABR7RQmay9IcSAd6dO4bRykXUOUvOIoIwyKwj/lSsfEjk
	WjMEgO0mZd93EvcrUjM/MxkzPCWI8KUSMVHHlwKcynyjR6HP9cl5v5WskfKlVFbLJgiC
	CTDtX+N2ZWwQoAa3hp5g0G9NHzGsfV73hQMtkNg5+8j7oBnDxk8652DCFxZrvKvAXLXu
	rVjrd0JJlj8MNJnCONEJnT2Pje1uivcLJfAjjMkyeCOM2WuKHWHEBZTOr8a7t6DrwIcV
	jf9odmrdfdHaGEhVJVG8q+Eie8TFgxtZhIau02M4rBENJtOPVd3SAw72QWxBnn3h++0v
	g30g==
X-Gm-Message-State: APjAAAUG6U/w1C0QedMS8NYH9OQMOSQJgFoUrKlr90xyrKD5sM9+MKHw
	TTbJ5ueXvvHvR9rQ9fX1mq/n+smWXRM=
X-Google-Smtp-Source: APXvYqylZtgEoeY4RgGA9OIIacF6eWh/1D2lk10YAGPCH43p2Fx61l5c/uksa5mdZzY8+4BOJDsChg==
X-Received: by 2002:a17:90a:b318:: with SMTP id
	d24mr6231037pjr.142.1582073452238; 
	Tue, 18 Feb 2020 16:50:52 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::396c])
	by smtp.gmail.com with ESMTPSA id c5sm207276pfi.10.2020.02.18.16.50.51
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 18 Feb 2020 16:50:51 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Feb 2020 16:50:55 -0800
Message-Id: <20200219005058.2921658-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH 1/4] graphviz: Depend on py3 at runtime
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
X-List-Received-Date: Wed, 19 Feb 2020 00:50:52 -0000
Content-Transfer-Encoding: 8bit

These packages are empty but python scripts
generally do not depend on python2

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-graphics/graphviz/graphviz_2.40.1.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-graphics/graphviz/graphviz_2.40.1.bb b/meta-oe/recipes-graphics/graphviz/graphviz_2.40.1.bb
index 176cf4498a..12ecb99091 100644
--- a/meta-oe/recipes-graphics/graphviz/graphviz_2.40.1.bb
+++ b/meta-oe/recipes-graphics/graphviz/graphviz_2.40.1.bb
@@ -66,8 +66,8 @@ FILES_${PN}-perl += "${libdir}/perl5/*/vendor_perl/ ${libdir}/graphviz/perl/"
 FILES_${PN}-demo += "${datadir}/graphviz/demo/"
 
 RDEPENDS_${PN}-perl += "perl"
-RDEPENDS_${PN}-python += "python"
-RDEPENDS_${PN}-demo += "python perl"
+RDEPENDS_${PN}-python += "python3"
+RDEPENDS_${PN}-demo += "python3 perl"
 
 INSANE_SKIP_${PN}-perl = "dev-so"
 INSANE_SKIP_${PN}-python = "dev-so"
-- 
2.25.1


