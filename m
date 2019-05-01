Return-Path: <akshay.bhat@timesys.com>
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com
	[209.85.160.174])
	by mail.openembedded.org (Postfix) with ESMTP id 3B1B37D70C
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 May 2019 19:23:24 +0000 (UTC)
Received: by mail-qt1-f174.google.com with SMTP id g7so21163985qtc.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 May 2019 12:23:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=timesys-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=YtWGpVMArR1ys0BPDsHNf6oRLePjWTM8xebjgTt1MgQ=;
	b=0fP0HzgQIaCzu+zKWH7U66IaEUHMG3u3ngVxxFA6J8FU2IMhP7SIV+mw9QJXU/Uxgs
	nCDF5dBrGgzqsAj7CVLcX+fTcXkLI+LlR3upBSjMtK6YQsUvGtLliqI5AFLsqSUcSOvH
	SkJDTF7kEM1U66XwilcMqJ9ewdBifIMlLV4HAZkPT1QDnin5Zdr/8Ni0KAKqPfznVI9L
	Jtb9jAPoIlcXF8P3dhRbbddq7STWBXaLLWhbWqBgsNaO0gUoK1lkOmV97p82tlPKJhJC
	CGxe4/AJq+EsuKUQg5QUdgwL4i76bUlCvrGMiWItMWDBhG1lAKZ8zT0CCyknmCoymTqg
	u6ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=YtWGpVMArR1ys0BPDsHNf6oRLePjWTM8xebjgTt1MgQ=;
	b=FtkQZG3MkqzbMcOLGVP8W+socnIPLDLwvh8HbeXQsAWrLlO3htZgboV1Pg31ZSNHNm
	aVr3Q1VoYE3guvY1p/7n6MpIG1BuImc40stoYZBnrjFUPYxUCU/x/aJ9UG4LLkGH5Pdh
	P0KfLwjTujUZ3gE1/0/onSFx060vLVCJm9Ma5AKUokLXLHzfA4ydLjNQDO78odF3fyPr
	asbGQmp8w9/E/U4RvOecnlIDDsHgHOIsGuNB9tmgRLxo3+EplHxXE31c4sv9aZ16CAaV
	THbAwpE0YPb+FEcaayjALuxSja6Fh/chKUQYvt1GUk3y/7sA7+sFmITOHVJAUj0MTrob
	ZYkA==
X-Gm-Message-State: APjAAAVDroge4KVkvkAAaEZihvZsJT0i5YPtW5Xp35EDjoVBQFF3bmYO
	D6gl/yptb0AWF5gDJ/WKhP6e8b8s4x3iCA==
X-Google-Smtp-Source: APXvYqxjBwVkPNMSLzqGpMgsyMBoe2KhxFoPixbfxIqvVazVPny3UG1h7PWZgxfoWV4vuh9P6ctk+Q==
X-Received: by 2002:ac8:4a0f:: with SMTP id x15mr22132117qtq.377.1556738605664;
	Wed, 01 May 2019 12:23:25 -0700 (PDT)
Received: from timesysax.timesys.com
	(96-94-100-129-static.hfc.comcastbusiness.net. [96.94.100.129])
	by smtp.gmail.com with ESMTPSA id
	k36sm10309041qtc.52.2019.05.01.12.23.24
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 01 May 2019 12:23:25 -0700 (PDT)
From: Akshay Bhat <akshay.bhat@timesys.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  1 May 2019 15:19:04 -0400
Message-Id: <1556738344-3933-1-git-send-email-akshay.bhat@timesys.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python-urllib3: Set CVE_PRODUCT
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
X-List-Received-Date: Wed, 01 May 2019 19:23:25 -0000

urllib3 is used in NVD for CVE's like:

https://nvd.nist.gov/vuln/detail/CVE-2016-9015

Signed-off-by: Akshay Bhat <akshay.bhat@timesys.com>
---
 meta-python/recipes-devtools/python/python-urllib3.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python-urllib3.inc b/meta-python/recipes-devtools/python/python-urllib3.inc
index 288ed8b..34f1478 100644
--- a/meta-python/recipes-devtools/python/python-urllib3.inc
+++ b/meta-python/recipes-devtools/python/python-urllib3.inc
@@ -16,4 +16,6 @@ RDEPENDS_${PN} += "\
     ${PYTHON_PN}-threading \
 "
 
+CVE_PRODUCT = "urllib3"
+
 BBCLASSEXTEND = "native nativesdk"
-- 
2.7.4


