Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com
	[209.85.160.174])
	by mail.openembedded.org (Postfix) with ESMTP id 71E497C4B5
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Feb 2019 17:37:04 +0000 (UTC)
Received: by mail-qt1-f174.google.com with SMTP id b15so775572qto.8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Feb 2019 09:37:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:organization:content-transfer-encoding;
	bh=39BW1jgA+RQ+TFsg6xs9jTTi0G7TEIjmHKlFvd9Xzv0=;
	b=YHs6SN5RUyNSEGw5bfdnMzSycMWcsN7pPFb1QSBR6y+FdVo5Q/EfF9RjYwNzK48o55
	EatV5gDy0iWkJNXnqA4VHfAwsmcHu1IJ5cMl71FzJ42vcARDkEw39f5u1BcV795g0n/K
	GjcgFNaLZe+T8M4kwRT+Dpgx0T8tp8SlPCnKBW0HyGIJ4Db5JS2FUc4c5g+ChmNtDYR/
	nCgb5v5L79Ens4JgjrWtY5XIPVxW6Da5O4AtNz6cINUNBls1P+nRd1j4FS42PP6U8TrO
	GndclIZ3oPoThbStN2K+cujNDMpdluen/N0FVU5+u/s86R2jdo3QRGBdQRx1H8xzSJ/M
	4FXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:organization:content-transfer-encoding;
	bh=39BW1jgA+RQ+TFsg6xs9jTTi0G7TEIjmHKlFvd9Xzv0=;
	b=Fvro/rS1cDj+gL5TYUVdcanFimIG5t7jduq9zYWxDOtCEB/UZGGfKslvfkE539Iqi1
	MxnQtTDT8QD6E9/eNWxR0wNzt9iae+0lZaYzdjBiEat7MNXot/dj7ss2VodukCWEegh1
	eWPI4GhusvuOlW3wBn3g3xiynXXq7+mWPPQLfvLBssCcbq6z6qP/Zag7li/V9UDfgmkB
	Dq55XNNMcrZaZyPhBM0HMzt86HYtf+MN8w8iZhJuC75hMpjLVkt1yhUPvxA43700wtrh
	3IRq67jpcF/kPa0GFqqvIcUCMR6O1ma4f/A3QKUHwlW0+cUQRtCbf0hGitgLSxl//weH
	8DpQ==
X-Gm-Message-State: AHQUAuZhSeRLcxBnZpFz7dBSNjcLldt9RIlJeK6tiEL5JbariRsJUJzp
	E4iNuDvpTww/cnRFYDRihe0YN/h+aqwlnA==
X-Google-Smtp-Source: AHgI3IbCJX5j24T6o5HI4a+4lcO+1CS3B7uKs1lb90AjHwht2r2wXXAXcfRXRkGrMt+JNkVq30zGKw==
X-Received: by 2002:ac8:296a:: with SMTP id z39mr13049152qtz.264.1549561025195;
	Thu, 07 Feb 2019 09:37:05 -0800 (PST)
Received: from centrium.lab.ossystems ([181.220.86.121])
	by smtp.gmail.com with ESMTPSA id
	n9sm10983987qtn.59.2019.02.07.09.37.03
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 07 Feb 2019 09:37:04 -0800 (PST)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  7 Feb 2019 15:36:41 -0200
Message-Id: <20190207173643.20893-2-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190207173643.20893-1-fabio.berton@ossystems.com.br>
References: <20190207173643.20893-1-fabio.berton@ossystems.com.br>
MIME-Version: 1.0
Organization: O.S. Systems Software LTDA.
Subject: [meta-python][PATCH 2/4] python*-markupsafe: Add native and nativesdk to BBCLASSEXTEND
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
X-List-Received-Date: Thu, 07 Feb 2019 17:37:04 -0000
Content-Transfer-Encoding: 8bit

SIGNED-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
---
 meta-python/recipes-devtools/python/python-markupsafe.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python-markupsafe.inc b/meta-python/recipes-devtools/python/python-markupsafe.inc
index 927f84452..437a60cfb 100644
--- a/meta-python/recipes-devtools/python/python-markupsafe.inc
+++ b/meta-python/recipes-devtools/python/python-markupsafe.inc
@@ -10,3 +10,5 @@ PYPI_PACKAGE = "MarkupSafe"
 inherit pypi
 
 RDEPENDS_${PN} += "${PYTHON_PN}-stringold"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.20.1


