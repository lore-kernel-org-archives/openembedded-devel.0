Return-Path: <rehsack@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 955B3747FF
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Oct 2018 06:58:51 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id y16so4366551wrw.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Oct 2018 23:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id;
	bh=7gZpuwoVwh9fGMDXY0zVjPfPBJkVcfJk6S+tpC65CMQ=;
	b=I7oKGZVA6uaLNhXyLQDS1T24LA4xq8MWIOOO15NksZAhf/wJf5VUlUBlIMLdODc+PN
	vgzHRJ5+nogTqPw74LQ3koqpwyT6YiZ+IEYdo73lmnET2goDPhe7B6cXf9PuIwfc8WXm
	QsqDdGxv3iO0TFF418Q/KZakiHN0JPsvwTkE/Q0omkBCuS2fGPpCM9meRMmqvyKJcBFG
	sNGOlP9tohK3wZaiRqHmtOXIalW8Us3NSKBL5M844yMUsS7qIEOpK6QhZmZUZuonuGR9
	wxDWq/amZ5EAF7KNGLTvgAsV493pouCK3YWRawDq9xQErcd9Hfn6CoACwBniDJZX0k79
	vZCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=7gZpuwoVwh9fGMDXY0zVjPfPBJkVcfJk6S+tpC65CMQ=;
	b=pS5fTL58ruOapI+LQLMrRxJx663SX19sMMU8r4X86rphUVbHPvrGF654X/uY6nqp8p
	VT6rqOMw1WOAfeI1ZAjctVt+95tkEHqmWhYbxhMlcWPUDGozVyPjhuGpmNYcciyJMBhM
	VAJAtE6nET+VRBBYiO32DJ/yCq/zPrW7Gu/9OWpOeFbljCYlTRkaYMYDDnLgM0GGoTqF
	VALMItcd6lBEOyPejBfIucWNNd23yz0EsbFV2Pkm7mUj5gM7ukPZIIWue5wGVOg/+ajD
	q2SeJGqqQSfvXHmAOcIus7T4cUCkxcvMWoJJVL/S8+nTDJBYu7NB7+GFRBclBJN77S28
	u2fA==
X-Gm-Message-State: ABuFfognra5TPzbiWtZ6CB8Asxd7BdaW2MuZbqJYMqn5AoT+lEUfQKVj
	dmr1BLEUCJXtxvDorszJL5vQ1a13
X-Google-Smtp-Source: ACcGV60Y55rL4lOPgc+i//knm1GjgN4R5c/3i0PTwEUSuOXuaolZhGjlqj8Y8DjmguvW3JWYYExECQ==
X-Received: by 2002:a5d:5701:: with SMTP id
	a1-v6mr23759627wrv.289.1539154731830; 
	Tue, 09 Oct 2018 23:58:51 -0700 (PDT)
Received: from beaker.muppets.liwing.de (b2b-78-94-80-58.unitymedia.biz.
	[78.94.80.58]) by smtp.gmail.com with ESMTPSA id
	201-v6sm16695465wmf.30.2018.10.09.23.58.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 09 Oct 2018 23:58:50 -0700 (PDT)
Sender: Jens Rehsack <rehsack@gmail.com>
From: Jens Rehsack <sno@netbsd.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 10 Oct 2018 08:58:33 +0200
Message-Id: <20181010065833.18551-1-sno@netbsd.org>
X-Mailer: git-send-email 2.17.1
Cc: Jens Rehsack <sno@netbsd.org>,
	=?UTF-8?q?Sven=20H=C3=A4drich?= <svenha@external.miltenyibiotec.de>,
	Igor Kreps <igork@miltenyibiotec.de>
Subject: [meta-java][PATCH] layer.conf: update layer compatibility sumo->thud
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
X-List-Received-Date: Wed, 10 Oct 2018 06:58:52 -0000

Signed-off-by: Jens Rehsack <sno@netbsd.org>
---
 conf/layer.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/conf/layer.conf b/conf/layer.conf
index 8e8a300..4bcf834 100644
--- a/conf/layer.conf
+++ b/conf/layer.conf
@@ -7,7 +7,7 @@ BBFILES += "${LAYERDIR}/recipes*/*/*.bb ${LAYERDIR}/recipes*/*/*.bbappend"
 BBFILE_COLLECTIONS += "meta-java"
 BBFILE_PATTERN_meta-java := "^${LAYERDIR}/"
 BBFILE_PRIORITY_meta-java = "10"
-LAYERSERIES_COMPAT_meta-java = "sumo"
+LAYERSERIES_COMPAT_meta-java = "sumo thud"
 
 LICENSE_PATH += "${LAYERDIR}/licenses"
 
-- 
2.17.1


