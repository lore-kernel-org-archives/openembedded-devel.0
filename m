Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 8950171A30
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Mar 2017 09:16:50 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id u132so3857986wmg.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Mar 2017 02:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=0Z7td9ZKxNr9GY9oTo2k8X/DgiK+4vteUsfV1cwysgI=;
	b=IwBpi4QgsOEG6olaKrPqmBgLySXKreYZCtmxY5VmySn1I13TW6oiKM0XQhi4D/PU4q
	K4SVCahuLszr0uJIe2VJLDmvNUlL82zk3y8WI5qi4X7DXXixeO/PChm6YWy5/uo5wPIf
	7saAY6OCWu/yVWHR2FYcW49l/z1oKxOwFYH59xsbH3JRdHT9ZAgGmwKQJS+P45EW/HuX
	L5BRSMEzvuajWqHOCxCEIL/9jJtrXpHcg7o9Oalds20iB/cSIm/2IIOz8GSaXArbugE5
	7YJzWGV1GVrBpx/CYHtfQonPxddA+5zgYdb/v0ThN2ZBz9GJsCoEgG47z0wrKx3E0OQl
	TX3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=0Z7td9ZKxNr9GY9oTo2k8X/DgiK+4vteUsfV1cwysgI=;
	b=fOXXi71ESnKVlCoBjQsUMdNdK8C1JDYR7XQB5LAKRnGqaxBea41BoW006HXQzQMzSh
	nvUt0krqETt7Busp3iroz2Jjnoww2/SG2/vgVZjHDQgconWz5BFRaMy1qnzzFiO2ePMI
	nkaOEL7PWkN3CWHcr4FX+zqbiDixGcE8q8xY71h+YjqZC9nZ4AZRbZSFHLguqezCKkWQ
	DhZsw7mZ2dhLTQLRgDGvdnict7DWYX4Vap3m4h8uXNhVh83cN1v7fc45Kn4WpBT9+j5/
	ok5120NQuIYguGGIZZ/6VE67ZVuiWHBu5OEGpEJ17SUUPYdSsreuoy6uHC+tajEX9gwm
	/ooA==
X-Gm-Message-State: AFeK/H3SK7BAEOSuOWyK3VsISttu1jVDtLHnRYs8cC9jndp2MIOPrdMYMoyIOecNm0LvXQ==
X-Received: by 10.28.199.129 with SMTP id x123mr322859wmf.7.1490779011742;
	Wed, 29 Mar 2017 02:16:51 -0700 (PDT)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id g23sm7312258wme.8.2017.03.29.02.16.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 29 Mar 2017 02:16:50 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 29 Mar 2017 11:16:39 +0200
Message-Id: <20170329091643.32180-5-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.12.2
In-Reply-To: <20170329091643.32180-1-Martin.Jansa@gmail.com>
References: <20170329091643.32180-1-Martin.Jansa@gmail.com>
Subject: [PATCH][meta-oe 5/9] ttf-liberation-sans-narrow: use pagure.org instead of retired fedorahosted.org
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
X-List-Received-Date: Wed, 29 Mar 2017 09:16:51 -0000

* https://fedoraproject.org/wiki/Infrastructure/Fedorahosted-retirement

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-graphics/ttf-fonts/ttf-liberation-sans-narrow_1.07.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-liberation-sans-narrow_1.07.4.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-liberation-sans-narrow_1.07.4.bb
index f36cf4b18..5b406bc65 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-liberation-sans-narrow_1.07.4.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-liberation-sans-narrow_1.07.4.bb
@@ -9,7 +9,7 @@ HOMEPAGE = "https://fedorahosted.org/liberation-fonts/"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
-SRC_URI = "https://fedorahosted.org/releases/l/i/liberation-fonts/liberation-fonts-ttf-${PV}.tar.gz \
+SRC_URI = "https://releases.pagure.org/liberation-fonts/liberation-fonts-ttf-${PV}.tar.gz \
            file://30-0-liberation-sans-narrow.conf \
 "
 
-- 
2.12.2


