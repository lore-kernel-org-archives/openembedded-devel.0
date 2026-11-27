Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10325.1795752988576110681
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 20:16:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=riVjBCiH;
 spf=pass (domain: gmail.com, ip: 74.125.82.41, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1ae58d17cd9so8649091c88.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 20:16:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795752988; x=1796357788; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yydLbiF0aCmqwOIE26xJnQCgantUraTFqeb0QYKCxU0=;
        b=riVjBCiHOqJQXoMJLGmSX7TZkWh1QReVaN1N5EJUk3KhClh6shcMyXKhTxA0Ap5I4/
         57qoG+5A6yobRl87r8jEopLcU5Dy/baof6CPX0Q9kRu2qoErsAVtjrk3A5UkSxYUDRfj
         MJrLcm38O1uj7JehfAXXBktO5Rei0LJVIjT4+Tcokjvp6e9Yb5+9k3m5LgSalFNI2uvM
         ikVuOPRkYDvFrM8i/tmbi4b10a6ufgloMcPifbJvL/vuQlCTE3iIwHMJ++8/tbbwt3Sh
         mTuSaVd+nW+DTRb6jLcD9G1ZcXzZIy7vjmT9MtNO6xUssD9XY3WVf1Nn971/M8+L1jsY
         y8Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795752988; x=1796357788;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yydLbiF0aCmqwOIE26xJnQCgantUraTFqeb0QYKCxU0=;
        b=g0BM92xxqRF1h5QzrVZy+UWvp2sDdXr29CkGJ+Hdi9rFCcVFoXpm1uPO8PHpOoXxuY
         p0ESgwrb+Bcc6KDuOnf0aqWPEFg63rk3buCUNXhqPMuf5mnC0ZLTTTvxfRvW53iqjcst
         gPEVsj3fZ+9Hg6ZuJYeTlVi0MZmVq3HCbJZGzZJf5TIyXh1moeu5j6SuoeQiZMF6hOvV
         NrXVzKRI4Ywr/hlJwMMNr9pTVeS3q24Uoc+H4VU2Q3vxY2Ra4zuLVLvAcz0BRll5bP/x
         XIPyju7EFpdcenTyfKQMEd7Jom/S57DZvRb9bUSsiGEcsWPLUSmCjHsyMLCnRcwMOlRk
         yD6A==
X-Gm-Message-State: APuU4Z+85LWlCtRIM6JMTJnBfUOmDdgEn4Q5osLoIsr5Ct6Jts1rpeVC
	mfvcJM5OrWUVC6jY/BdZEGJTxHoxi/goffZMD+nPCG1AqeR4Mjrda3+saL41BmDw
X-Gm-Gg: AZFdTZduJ0c6UjiIXroUW0byp0RP9dODfIWblXCU/3U4gZW322Zb5i8sE4EwM1ciKiO
	e/GESCmMp0dgQHY+8YUk+gKeHy85idBjtUsPP4Kh7y5qeurS9qYn7MwNvcJsU+lKS7vzTFMbkbo
	zXykGOKbqqyCEbLz8ThgcQWl30gWI/hqwntkq6Lm9l1hCPgT7Qa3i22KxcZMndb2CA+1fUsQ8YQ
	RFviwteCEYi/X90FolMPqgL7RK8hG6kBSwHBlC3GIjabrs0y/FMbLmqyM3AyDBsDuOGeo9ELzrH
	5DxGeQNvxOxPDcD3T7Gi8IdtY4+HO4tlMq8Vp0V41W+6aJ4pa6V3PSy4xlLWG3x6ZS9crQ+H4Ay
	9ssUC/1xwCXjRai13dGLjpKvOv/qADTBTkYrM9tPvh3lPOfnBMUoKPF5D23v97zlibbQb+hU1n4
	5d21OLUHGnQA2TZArIEVyxiRR+qB2Ap7+o322TCpSieH2ZtcgSgQvYGBO8zJfgkOVWSN3lp18FK
	5tzLP6f53+fkodWoPwRPIDNGgZCzS3pagHwy09C/FB16FsqebIe2kpcWIZY5rUqW5sr2o+WklLj
	RxX0Vqr2PiQ4+nZBS7l9Hw+EBByfLxmoXWx878wbVvcpmQJopLLSuSJKCBIqSwOiyzbGO6iu1MH
	g+YiNxgcQRU6EFSMjx8yw4CpG6ryCh2nQyYmwNwOG90fTYF3EfYPm998VxXPtfigwA9YxEeWw0P
	aGAEKcq9ym2twNGEVUjwvio+VGog8My4QufRVfGb2aQE41o/NgubDG08X3+zpHsTJn1zVeY6EJo
	lNjAIcQW7JsGg/vjrSjeoLUZamuaHwao7DsQamjJOlg1plp1JBRECdwuRf0kjT2q9d8CA7ARv2Y
	efMR
X-Received: by 2002:a05:701b:4541:20b0:1b5:92d7:4c38 with SMTP id a92af1059eb24-1b592d74d1cmr3078964c88.37.1795752987887;
        Thu, 26 Nov 2026 20:16:27 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5566c1142sm52062757c88.2.2026.11.26.20.16.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 20:16:27 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 08/32] python3-cvxopt: Fetch by tag and add upstream version check
Date: Thu, 26 Nov 2026 20:15:50 -0800
Message-ID: <20261127041614.1775064-9-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127041614.1775064-1-khem.raj@oss.qualcomm.com>
References: <20261127041614.1775064-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 04:16:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133227
Content-Type: text/plain; charset="utf-8"

Fetch the ${PV} tag and match the plain X.Y.Z release tags.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-python/recipes-devtools/python/python3-cvxopt_1.3.3.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-cvxopt_1.3.3.bb b/meta-python/recipes-devtools/python/python3-cvxopt_1.3.3.bb
index 00f84724c4..350d687758 100644
--- a/meta-python/recipes-devtools/python/python3-cvxopt_1.3.3.bb
+++ b/meta-python/recipes-devtools/python/python3-cvxopt_1.3.3.bb
@@ -3,10 +3,12 @@ HOMEPAGE = "https://cvxopt.org"
 LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=878d3698da0459c16007d32b4b2915a4"
 
-SRC_URI = "git://github.com/cvxopt/cvxopt;protocol=https;branch=master"
+SRC_URI = "git://github.com/cvxopt/cvxopt;protocol=https;branch=master;tag=${PV}"
 
 SRCREV = "add0181990cab7e018e82246028ded3d67778f2e"
 
+UPSTREAM_CHECK_GITTAGREGEX = "^(?P<pver>\d+(\.\d+)+)$"
+
 CVE_PRODUCT = "cvxopt"
 
 RDEPENDS:${PN} += "lapack suitesparse"
