Received: from koncepto.io (koncepto.io [195.154.119.111])
 by mx.groups.io with SMTP id smtpd.web10.7724.1586003791857584959
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Apr 2020 05:36:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@koncepto.io header.s=default header.b=Odzk5biq;
 spf=pass (domain: koncepto.io, ip: 195.154.119.111, mailfrom: pjtexier@koncepto.io)
Received: from menoah.home (lfbn-bor-1-1500-88.w193-250.abo.wanadoo.fr [193.250.66.88])
	by koncepto.io (Postfix) with ESMTPSA id 6AE0F603C7;
	Sat,  4 Apr 2020 14:36:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=koncepto.io;
	s=default; t=1586003790;
	bh=qnxuuL9XwCVeGa9ZjDvI0pL98tE/bPXN21p0tDRnSUk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Odzk5biqj+5TbCKTL09f+gaW1elHUpxnFYG/zzWh/NPlffyqJWdKa1qH2bEKDVyWd
	 zkyWmvzpO53fn4mo/KI5zXwMJpNAmSWEUPPXVwoEwAzMWu9EiIFgDXWFhvgoLEvjnT
	 l3aHB6RsjhxN1fH/tbWN568TotwTFAjiiBcDUzSp12an2W4haPt2/IgTM+IckzFqxm
	 hrTjo5hmN9QkgzK8h/Mga1cLaM2K5/9snmo6g6OapR6BczXDnnmc69P+ugpcJpCdci
	 XlCgc1df+2UteAgRBWmplM7zVo+j90FfxZjIk7s3FHz2OgDfYmfG7OwG5wl5ud3r5o
	 7jaeFruC4bOhQ==
From: "Pierre-Jean Texier" <pjtexier@koncepto.io>
To: openembedded-devel@lists.openembedded.org
Cc: Pierre-Jean Texier <pjtexier@koncepto.io>
Subject: [meta-networking][PATCH 3/5] ptpd: fix upstream check URL
Date: Sat,  4 Apr 2020 14:35:59 +0200
Message-Id: <1586003761-12873-3-git-send-email-pjtexier@koncepto.io>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1586003761-12873-1-git-send-email-pjtexier@koncepto.io>
References: <1586003761-12873-1-git-send-email-pjtexier@koncepto.io>

Fixes:

$: devtool check-upgrade-status ptpd
<...>

INFO: ptpd                      2.3.1           UNKNOWN_BROKEN  None

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 meta-networking/recipes-daemons/ptpd/ptpd_2.3.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-daemons/ptpd/ptpd_2.3.1.bb b/meta-networking/recipes-daemons/ptpd/ptpd_2.3.1.bb
index 2bd6427..cab0d94 100644
--- a/meta-networking/recipes-daemons/ptpd/ptpd_2.3.1.bb
+++ b/meta-networking/recipes-daemons/ptpd/ptpd_2.3.1.bb
@@ -31,6 +31,8 @@ SRC_URI = "http://downloads.sourceforge.net/project/ptpd/ptpd/${@get_sub(d)}/ptp
 SRC_URI[md5sum] = "253bab7ab51d969616ea811be1f132f3"
 SRC_URI[sha256sum] = "0dbf54dd2c178bd9fe62481d2c37513ee36636d8bf137cfdad96891490cdbf93"
 
+UPSTREAM_CHECK_URI = "http://sourceforge.net/projects/ptpd/files/releases"
+
 S = "${WORKDIR}/ptpd-${PV}"
 
 EXTRA_OEMAKE = ""
-- 
2.7.4

