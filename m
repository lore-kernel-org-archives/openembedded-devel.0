Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id C82C0771A3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Feb 2016 13:09:12 +0000 (UTC)
Received: by mail-wm0-f43.google.com with SMTP id c200so170336628wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Feb 2016 05:09:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=LceGNbUK1yUiRKnV7klcShTUnmESUZzBmLWemARz9K8=;
	b=lfrnp8Uu/FkoD7uHsRBEDDzowg9TUy6pMo1+GAnmx9mqOY+GRUhOJXlvCy410bIMIb
	9t6b3v82vxeTOCDoDI2uZVceRA25wkVlgTa3vEzZJb+N1HIPBW0pIbiBIKMkoUwt8cmU
	T7VWG8IYWWPlHTMTEH8moAmKsaIDzfrAVnTASIjqR55Qpxug8HMdEMOdpGPTQXZzelGn
	suKxfgV2rXRHolBF3qTDTKfvu8b2FTViP1M01H974KYPDIjOprJyqw91iB+DtvtwUvPR
	kZvDbODaxCy4TeZvvaHGwRw7woBAYBolFAyww42PdbtMO4rcX/p9pwQ/a6rGBSEpU/an
	gr0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=LceGNbUK1yUiRKnV7klcShTUnmESUZzBmLWemARz9K8=;
	b=OHXCkxij7uzHli5tNU7EgArHb/9fqLi6FiMZgb+G7Pvd2ifzc1aZXWR3yGFIp2DFvo
	BdFKoi7mDR1+ORi/OZjN6L//67QE/1SOTHoRG4BIut7mk7Ax66Q5lAjXS0zcjFd5+bA9
	Bch1miRLGFNDhi+u7rh5e2Ca/GQDaaKvK6DHo753sAp0anGvuT7usO7fadN0HrpawBe7
	ZQ9DAuV6eNgJ+lz96kD5Pe3ntKtVGMsZCn0accNhQXZ3SF1NrnBCSAgYEiIo169j9zwD
	0Fa78qka9s3Xz/KS7Vn//5T8uuA7+zH8ztMYgC7CzTtJcy2C+myv//OZ1ctoEuEKOfMa
	9A/g==
X-Gm-Message-State: AG10YOTY6scxD6abQUIYw8VtRG4MfAbVDWy2MrFafC0z9GPwuXRluHKjgqBJCWNBpqf3Dw==
X-Received: by 10.28.72.197 with SMTP id v188mr12763469wma.34.1456146552852;
	Mon, 22 Feb 2016 05:09:12 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	u132sm19937640wmd.1.2016.02.22.05.09.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 22 Feb 2016 05:09:12 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 22 Feb 2016 14:09:52 +0100
Message-Id: <1456146596-6976-6-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1456146596-6976-1-git-send-email-Martin.Jansa@gmail.com>
References: <1456146596-6976-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH][meta-oe 06/10] tesseract: Blacklist
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
X-List-Received-Date: Mon, 22 Feb 2016 13:09:13 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-graphics/tesseract/tesseract_3.02.02.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-graphics/tesseract/tesseract_3.02.02.bb b/meta-oe/recipes-graphics/tesseract/tesseract_3.02.02.bb
index 72bd423..652bcf2 100644
--- a/meta-oe/recipes-graphics/tesseract/tesseract_3.02.02.bb
+++ b/meta-oe/recipes-graphics/tesseract/tesseract_3.02.02.bb
@@ -18,3 +18,6 @@ inherit autotools pkgconfig
 FILES_${PN} += "${datadir}/tessdata"
 
 RRECOMMENDS_${PN} += "tesseract-lang-eng"
+
+# http://errors.yoctoproject.org/Errors/Details/35134/
+PNBLACKLIST[tesseract] ?= "BROKEN: QA Issue: tesseract.pc failed sanity test (tmpdir)"
-- 
2.7.1


