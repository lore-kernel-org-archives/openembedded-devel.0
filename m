Return-Path: <laurent.gourvenec@qarnot-computing.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 7D44F60107
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Sep 2016 15:56:18 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id l132so14742530wmf.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Sep 2016 08:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=qarnot-computing-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=yojxBam/X6wMdaElfKnbLr0ysDuFdhuAMDbmkFTHPyE=;
	b=KPTHGsl3yEZEedfSlv2hnwJQu0dd4E4YYfGCgXHqzslf+LZko/IIa14rjf+PikK9Im
	EsO4joXYft8yW/CfCdgvC6q9kzsONTj4gYsTlt3R2qsS1g1+OF0uGtyjtEPO8i6tNp0+
	35cg47a+KQe6VKWPoKK8OpYWhKAgjsqahC5mBIzQie1qTmIEJfs87QvXopx+qXlXAbcS
	Eq/9I9eJeATkFe6wPLXAWb3wnl9b9/x91alDN6qg5kAyk8d7iplYkYxS6mKU8nE2wr4B
	OJsmORbhbOx9LJERyV/52yZaqDewSLSsvfgsltCj6NbB0msTLHYjHqxie4DaAnTgxm7T
	aRiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=yojxBam/X6wMdaElfKnbLr0ysDuFdhuAMDbmkFTHPyE=;
	b=lIrf3I8zkcZUmdNk1LkZzm/YVUW0t6czIgoPIFqq372k5SFNtqQ3318GAvThxe1TwQ
	yWds/yPcQk8kDSRYeKvmMoIvcAR8dgH00lkzwjZVk/Ic1qC7sN1oZ1aAvZHob6fhYcCe
	1ykDspvW4eg4f4A1gwoqAVHmbLSQ1A7LuBUfMVjgtoYzTRolfapQsLoNhA6IWN93YLIj
	yJU6CG0vxYRAnyBnd2A9E+O4QQ/elYjo5d9ENdkavV1i9sS4bTbnkL+yg0IjcMgjFc4T
	l8EJn7i0DBT1SEAm6G1Zw1F4cwSI7CLan26duPtfZnyyunPlblmStqPmnJ2elBhI0azj
	/epQ==
X-Gm-Message-State: AE9vXwOGp+OiVgZadkVTjW0ULMlWUn4cNP6UUVy7iQE1TvAsjaLmHU/3Ql+hBmYbzGl7og==
X-Received: by 10.194.100.199 with SMTP id fa7mr22009968wjb.16.1474905379240; 
	Mon, 26 Sep 2016 08:56:19 -0700 (PDT)
Received: from debiang.dev.qarnot.loc (127.147.89.92.rev.sfr.net.
	[92.89.147.127]) by smtp.gmail.com with ESMTPSA id
	va3sm23121958wjb.18.2016.09.26.08.56.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 26 Sep 2016 08:56:18 -0700 (PDT)
From: =?UTF-8?q?Laurent=20Gourv=C3=A9nec?=
	<laurent.gourvenec@qarnot-computing.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 26 Sep 2016 17:56:12 +0200
Message-Id: <1474905372-17360-1-git-send-email-laurent.gourvenec@qarnot-computing.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Subject: [meta-python][PATCH] python-cython: update SRC_URI for new download location
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
X-List-Received-Date: Mon, 26 Sep 2016 15:56:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Laurent Gourvénec <laurent.gourvenec@qarnot-computing.com>
---
 meta-oe/recipes-devtools/python/python-cython_0.15.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/python/python-cython_0.15.1.bb b/meta-oe/recipes-devtools/python/python-cython_0.15.1.bb
index 0bf057a..65db532 100644
--- a/meta-oe/recipes-devtools/python/python-cython_0.15.1.bb
+++ b/meta-oe/recipes-devtools/python/python-cython_0.15.1.bb
@@ -8,7 +8,7 @@ SRCNAME = "Cython"
 BBCLASSEXTEND = "native"
 PR = "r3"
 
-SRC_URI = "http://www.cython.org/release/${SRCNAME}-${PV}.tar.gz \
+SRC_URI = "https://pypi.python.org/packages/source/C/Cython/Cython-${PV}.tar.gz \
            file://0001-Don-t-append-docs-to-_Extension.extension.__doc__.patch \
 "
 S = "${WORKDIR}/${SRCNAME}-${PV}"
-- 
2.1.4


