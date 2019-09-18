Return-Path: <vincent.prince.fr@gmail.com>
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
	[209.85.128.47])
	by mail.openembedded.org (Postfix) with ESMTP id 04335901D1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Sep 2019 11:26:31 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id o184so2143881wme.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Sep 2019 04:26:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=NdzQemPkL0IV3LsaU7Jf55E4KCvV68R5NCrXTKwDOhI=;
	b=s6H9B7bkjjt+nmZBoie0rm+1JdJ/Dlkj/C3b1yb1UAq5yNGgFM+E6XlE1DZSqpxQY3
	kD2HTSEE6NuhAOSsr9dMIF+tz6N8UaA6JbeqUmnRYXNKY+gJs4hjKav4ScR/gLESXKXL
	Itqi5sdnzlpWTJ41WL2C1N8Z81f2lAZc0e8qhNl2qMWCNCzI7RmQ60gsJ2Xup4B3VRc0
	QI99ak5b/qYywfM0vlv/8rSKbnEBmG/tY3RvufLPTbuB00skFxZD7HnN9iVw6yKu529V
	1VHBGQfaksDnlTQ3zqge1X7sxR1ajiwsve/4UXwiX3czyoN17UAPgzhtl8zty3tIYw6G
	xwCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=NdzQemPkL0IV3LsaU7Jf55E4KCvV68R5NCrXTKwDOhI=;
	b=mwV2I1ZHlUboYSyeiEHernHQWwiy7/6pp52nHYa0W1ULPeyWQAnyvv1HmwUXWEMniu
	ggk8TVKENl3YQSq/tSQQ5DK3t+oWYzrFh1F7MD3BCnulByIzk6e17kKKpE+aTQLoxspe
	v8A49YZGAvtDpTgOii90ltzgkUs+xvlPTueNGM50so/RrVUVbHhww3ERSF564TtXATJl
	6vcd54+tq0evLM7N3tyoUFxNI46d5pxVmo57QtFhdUNZhw3O03Vlrx300jqqy1BlUPGM
	9GCyigo0XgnpR1zl9DyHlbq/2wEpAc9cq7uca0afagLvREWePgS+7rKWcD9ja2hMw7m6
	aehQ==
X-Gm-Message-State: APjAAAVsJ9M1uE8zbSUUKM2fjl1IuA3Y8rQqdBpB9Ob3H0RB/vCELdo1
	CzNBJpBvWJAdmfjz6BwDWS0lxoAIdEqycQ==
X-Google-Smtp-Source: APXvYqxCVSZ8Bij8c+M25ixRBy1MAqbVkuV3z99ts0h+t9EsTmmt9SkAs+N+DLktwykBNC+59UihiQ==
X-Received: by 2002:a7b:caa9:: with SMTP id r9mr2606833wml.14.1568805992184;
	Wed, 18 Sep 2019 04:26:32 -0700 (PDT)
Received: from VM-VPR.corporate.saft.org
	(i19-lef01-t2-89-85-250-196.ft.lns.abo.bbox.fr. [89.85.250.196])
	by smtp.gmail.com with ESMTPSA id
	o193sm2191749wme.39.2019.09.18.04.26.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 18 Sep 2019 04:26:31 -0700 (PDT)
From: Vincent Prince <vincent.prince.fr@gmail.com>
X-Google-Original-From: Vincent Prince
	<vincent.prince.external@saftbatteries.com>
To: openembedded-devel@lists.openembedded.org,
	raj.khem@gmail.com
Date: Wed, 18 Sep 2019 13:25:49 +0200
Message-Id: <1568805952-19822-2-git-send-email-vincent.prince.external@saftbatteries.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1568805952-19822-1-git-send-email-vincent.prince.external@saftbatteries.com>
References: <1568805952-19822-1-git-send-email-vincent.prince.external@saftbatteries.com>
Cc: Vincent Prince <vincent.prince.external@saftbatteries.com>
Subject: [meta-oe] [PATCH 1/4] python*-psutil: Add native and nativesdk to BBCLASSEXTEND
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
X-List-Received-Date: Wed, 18 Sep 2019 11:26:32 -0000

Signed-off-by: Vincent Prince <vincent.prince.external@saftbatteries.com>
---
 meta-python/recipes-devtools/python/python-psutil.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python-psutil.inc b/meta-python/recipes-devtools/python/python-psutil.inc
index e466c5c..0908c1c 100644
--- a/meta-python/recipes-devtools/python/python-psutil.inc
+++ b/meta-python/recipes-devtools/python/python-psutil.inc
@@ -18,3 +18,5 @@ RDEPENDS_${PN} += " \
     ${PYTHON_PN}-threading \
     ${PYTHON_PN}-xml \
 "
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.7.4


