Return-Path: <akshay.bhat@timesys.com>
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com
	[209.85.160.180])
	by mail.openembedded.org (Postfix) with ESMTP id BEE8F7D589
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 May 2019 19:41:41 +0000 (UTC)
Received: by mail-qt1-f180.google.com with SMTP id g4so21118896qtq.10
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 May 2019 12:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=timesys-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=w5D2JDCNhPqn3Q2MB+Jal7HLGtvTGD/NufNjXWixUfI=;
	b=c+TCg5lDvkOLrHqecDpdHRoP8EI0KaMgpTIeykGzB20sJgleucH9IqctVouaqNhlcG
	40TE71B0ql4Y8PTcXtRyHrMbRM7HjhPUqpi4CCWFgxKnxSqY65A/5TF9L3viw6/TeFpg
	hLrFFzeHDCiQ6ZJldpcdAhC8CVRsYR7+6D/f8eQvmPbHN5aZD2JuuN/MoPywbd6Tu/DN
	UXkLcYFRoO92AISc6hxZgD8/4o6CDELktziOSkQk8BsG2/eqdWqxtjtpc+LOozX+TCTA
	ETONLT/yQqWoEHKqWqfFP+72jirKxFDc41EU5FdIGcXXw3i4JIZ/9NzVtCqkr5az+yth
	C30g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=w5D2JDCNhPqn3Q2MB+Jal7HLGtvTGD/NufNjXWixUfI=;
	b=SBu7GYIC2keGlmchzFZagYewLlmzfh6dz2r8WbOM3m23rnt8fdQg4h/h6RoatLx53G
	8riInG0G4qS0HvptCVVddVmCRI0rphYvDNmE1lEOPvercD9MSK9WjkGKt6ddvDs0IreT
	bheWJYfP9hbWhlYhTea4enXJ581pu8B3qV2Mpklpd7TTa+GLPMRlArg1RUHQ7gvYgE0u
	f53ZnJnocEiuYT7Pv9ALbPfkw9UNKGiSwuR8UNdHcNobV4iVXCRJsqwpggH2vYwEoKP7
	GAxkVl91/Ak0FiZ96meCnQlMCBkwWs2NkVJZ8bNAs169pfYE1eZSzMB1Hxq2kV9MSRjG
	27pA==
X-Gm-Message-State: APjAAAXyOBFbWT3YE5jMyDA93o544Rm3Fh/pfX70y40jY5+fJJMcGT+l
	X3BJRIhid/CHQGKSmjoVlqz+8S68o1D4sA==
X-Google-Smtp-Source: APXvYqyLivfhYZQ1NaW+sV6CvY0YPbblEy0WIik3Q6jwKXvRwCvFpg/9qBGl2gQHvLwZFqHppga9Bg==
X-Received: by 2002:a0c:b99c:: with SMTP id v28mr20248qvf.10.1556739702479;
	Wed, 01 May 2019 12:41:42 -0700 (PDT)
Received: from timesysax.timesys.com
	(96-94-100-129-static.hfc.comcastbusiness.net. [96.94.100.129])
	by smtp.gmail.com with ESMTPSA id
	m17sm4747946qkk.44.2019.05.01.12.41.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 01 May 2019 12:41:41 -0700 (PDT)
From: Akshay Bhat <akshay.bhat@timesys.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  1 May 2019 15:37:02 -0400
Message-Id: <1556739422-5480-1-git-send-email-akshay.bhat@timesys.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-python][PATCH] python3-pillow: Set CVE_PRODUCT
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
X-List-Received-Date: Wed, 01 May 2019 19:41:42 -0000

pillow is used in NVD for CVE's like:
https://nvd.nist.gov/vuln/detail/CVE-2016-3076

Signed-off-by: Akshay Bhat <akshay.bhat@timesys.com>
---
 meta-python/recipes-devtools/python/python3-pillow_5.4.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python3-pillow_5.4.1.bb b/meta-python/recipes-devtools/python/python3-pillow_5.4.1.bb
index 746c184..6fce162 100644
--- a/meta-python/recipes-devtools/python/python3-pillow_5.4.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pillow_5.4.1.bb
@@ -23,6 +23,8 @@ DEPENDS += " \
     openjpeg \
 "
 
+CVE_PRODUCT = "pillow"
+
 S = "${WORKDIR}/git"
 
 BBCLASSEXTEND = "native"
-- 
2.7.4


