Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web11.3398.1622097910201411344
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 May 2021 23:45:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=tg1AQVYb;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1622097908; i=@fujitsu.com;
	bh=2pOS5j8e2kkz/hk9u9dxLgPh05jeR/oZ/yskjcx/lYM=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=tg1AQVYbfNk/0zKHhuPeoAF46AVLFtf1Da9qc2cNDsT6em8K7iu6ReD7of3Q1Gm0h
	 1n6izx6TA+0Pv0ltFQ9vWr50LvGSdfDV+BylmiIa5ALwxMwrL8pcdYnhY8D2C7HGim
	 zlCUgSro6+Tpx6fnjHP8pSK7kVngJ3PwhrdEaJe72KAMv9X3R3rWWQOdDoAU9XZbQ8
	 ppPjjQLm3W1NMxFkZ9vlYAqTchIqTkvnKjXtVV329W1WGjiQlvhkoEGugpL3S2rwHb
	 A+QpzMs0jBtVOHonwhIgwWnVeqB6I/6x5zgfZlgKGuW4DPN3O5OiZmqgCz1nzL4V9x
	 torKf7Any+c3g==
Received: from [100.113.5.216] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-b.eu-central-1.aws.symcld.net id 5E/2D-15146-4FF3FA06; Thu, 27 May 2021 06:45:08 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuphkeJIrShJLcpLzFFi42Kxs+EI1f1svz7
  B4OMxA4uLh5cyOzB6nNu4gjGAMYo1My8pvyKBNeNCy07GglNcFVeOP2RsYLzH2cXIxSEkMJtJ
  YvqBdsYuRk4g5wSjxNLpwiA2m4CORMeLbhYQW0RAX2Lp7D3MILawgIdE59xPrCA2i4CqxLF1s
  9lAbF4Bd4m2BdfB5kgIKEhMefieGSIuKHFy5hOwOcwCEhIHX7xghqhRlNi+8wwLhF0hMWPGNr
  YJjDyzkLTMQtKygJFpFaNlUlFmekZJbmJmjq6hgYGuoaGxrqmuoamxXmKVbpJeaqlucmpeSVE
  iUFYvsbxYr7gyNzknRS8vtWQTIzCQUgpZZ+5g/PT6g94hRkkOJiVR3gk66xOE+JLyUyozEosz
  4otKc1KLDzHKcHAoSfAutAPKCRalpqdWpGXmAIMaJi3BwaMkwjvRGijNW1yQmFucmQ6ROsWoK
  CXOe8MWKCEAksgozYNrg0XSJUZZKWFeRgYGBiGegtSi3MwSVPlXjOIcjErCvNkg23ky80rgpr
  8CWswEtFgocR3I4pJEhJRUA1N8782v3F/CpbSjV81mvD/X/EKjRdzPSf6+MrPOtS+6ym9QdO/
  rvHrTy+rv1+bFe17y2fhGrX35xq0i544s2z/PbUfvPqPprgZaH4xzTrNtaBbpMdAN2134wqKy
  5pYl49rVy2Z1qMvnzOT6fXv3ZV23Z7uOPph4XsTs662rdyo/t31oq4kIPbFy0YJjtUkix5V2r
  hI8/WrXZ+e5LDxbN0zirrf/IyW/W4zdJmkaR0Zy1P1aD41dvtwn6rUKuP9xWLC3Ppv3cnGEsb
  n3/xsXp6gcrf+mtj+Ik7++59HtqUeCri+uePSgM9DpxoyDyedWmd9NyH4rOm138rzNFy8ttb9
  R5vcxZfKp3PSGCZGLwtqMlFiKMxINtZiLihMBkiRBXB8DAAA=
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-4.tower-245.messagelabs.com!1622097907!119007!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 8163 invoked from network); 27 May 2021 06:45:07 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
  by server-4.tower-245.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 27 May 2021 06:45:07 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 14R6j7tU023715
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 27 May 2021 07:45:07 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Thu, 27 May 2021 07:45:05 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-gnome] [PATCH] libgweather: upgrade 3.36.1 -> 3.36.2
Date: Thu, 27 May 2021 14:44:59 +0800
Message-ID: <1622097899-10570-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 .../{libgweather_3.36.1.bb => libgweather_3.36.2.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/libgweather/{libgweather_3.36.1.bb => libgweather_3.36.2.bb} (79%)

diff --git a/meta-gnome/recipes-gnome/libgweather/libgweather_3.36.1.bb b/meta-gnome/recipes-gnome/libgweather/libgweather_3.36.2.bb
similarity index 79%
rename from meta-gnome/recipes-gnome/libgweather/libgweather_3.36.1.bb
rename to meta-gnome/recipes-gnome/libgweather/libgweather_3.36.2.bb
index 3ee382937e..c2cb2f19be 100644
--- a/meta-gnome/recipes-gnome/libgweather/libgweather_3.36.1.bb
+++ b/meta-gnome/recipes-gnome/libgweather/libgweather_3.36.2.bb
@@ -7,8 +7,8 @@ GNOMEBASEBUILDCLASS = "meson"
 
 inherit gnomebase gsettings gobject-introspection gettext gtk-doc vala features_check upstream-version-is-even
 
-SRC_URI[archive.md5sum] = "d6081108f9c224c5cb594f8ccb025db9"
-SRC_URI[archive.sha256sum] = "de2709f0ee233b20116d5fa9861d406071798c4aa37830ca25f5ef2c0083e450"
+SRC_URI[archive.md5sum] = "ff399cf89e97a3e574ae05db5617b96b"
+SRC_URI[archive.sha256sum] = "ee1201a8fc25c14e940d3b26db49a34947c8aebf67dee01ee67fbcb06ecb37a0"
 
 # gobject-introspection is mandatory and cannot be configured
 REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"
-- 
2.25.1

