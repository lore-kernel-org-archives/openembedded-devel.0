Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.5])
 by mx.groups.io with SMTP id smtpd.web11.6676.1628157112420530581
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Aug 2021 02:51:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=wQe5k5Ph;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.5, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1628157110; i=@fujitsu.com;
	bh=hATuJyhxwbwE7ZsmjKiFMJUY2azaQKQgq8U+hSgP6Uo=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=wQe5k5Phb/oM2NU7p7vg45JszbwamIMz3m1K+PgEzdMjwHFjpEHIYL2rakPIyW/Qn
	 fjIkEyEEwvUe90F+U9N1frVAszhLzIwAxFR6qWF0uQowPLLJq5O+2FnOh3oQ7uEqAF
	 SJMo4vJa1M6rfVXGJL23uAZe7q8deOrdJruPkgLixWdsmc6UanT9De7JFP5V0earIn
	 5WSMuhnIscJLCriUDuK7cQ4np8JeIzAe8ohJCiLhpM7xnRD9lj8CXoNAXGhC7Gkguv
	 P7ROkp5y3FUhkoPJDi8PakRP2rkLf/rn4C28fCY7Mgdlhl7uITKxfE39RVvb0NDqET
	 /E9gI+XjjJbbg==
Received: from [100.113.1.116] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-5.bemta.az-a.eu-central-1.aws.symcld.net id DB/E1-17945-6B4BB016; Thu, 05 Aug 2021 09:51:50 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupmkeJIrShJLcpLzFFi42Kxs+GYqrttC3e
  iwbNP7BYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bM118YCxq5Kr7uLWlgnMDZxcjFISQwi0li
  weZDzBDOcUaJTye6WLoYOTnYBHQkOl50g9kiAvoSS2fvYQaxhQX8JI7MmMYKYrMIqEhMOD6XD
  cTmFXCTWP1kKiOILSGgIDHl4XtmiLigxMmZT8DmMAtISBx88YIZokZRYvvOMywQdoXE68OXmC
  cw8sxC0jILScsCRqZVjBZJRZnpGSW5iZk5uoYGBrqGhsa6RrqmhnqJVbqJeqmlusmpeSVFiUB
  JvcTyYr3iytzknBS9vNSSTYzAMEopZDLewXjt9Qe9Q4ySHExKorz6vdyJQnxJ+SmVGYnFGfFF
  pTmpxYcYZTg4lCR4VTYD5QSLUtNTK9Iyc4AhDZOW4OBREuFdvAkozVtckJhbnJkOkTrFqCglz
  tsKkhAASWSU5sG1weLoEqOslDAvIwMDgxBPQWpRbmYJqvwrRnEORiVh3kKQKTyZeSVw018BLW
  YCWnwhlhNkcUkiQkqqgamltkLC/ue6H5v+Ceo/OSwp4cO1menmjK62mIpfIroqt5fNenfkx9z
  5G62nbq2JuqC26eV1Za/c5qDE1HfXtevUhS1mK7qIVDlkvVi0uePZg7OhKy7ez74XVRG/r2tn
  gCH34ggDRaGY00p6P8VawnaJsM3jYWTy7P8auG6X6BePyoKMhNef+e7fCl7v4SwVVxhXxBVjb
  /6k09yCv2YVU9KfiSttdmfxa8QZR/f9yhHWKBJdcIJf0SLjX3F3/pm9u13/aE5+LvPt3JZbJ0
  2nrMtPqBL5fsbAu+JUWEscU5duYBOXSsdt+b6Qzv8qjWIa94MyFESmz3/J9UvL9JKCslS65mn
  /xWU5nzeLN3MosRRnJBpqMRcVJwIAoRrYfx4DAAA=
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-22.tower-226.messagelabs.com!1628157109!10503!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 17589 invoked from network); 5 Aug 2021 09:51:50 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-22.tower-226.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 5 Aug 2021 09:51:50 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1759pnTP021363
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 5 Aug 2021 10:51:49 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Thu, 5 Aug 2021 10:51:47 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-xlsxwriter: upgrade 1.4.4 -> 1.4.5
Date: Fri, 6 Aug 2021 05:51:41 +0800
Message-ID: <1628200301-4774-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Release 1.4.5 - July 29 2021
----------------------------

 * Added Description/Alt Text and Decorative accessibility options for charts,
   textboxes and buttons. These options were already available for images.

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 ...{python3-xlsxwriter_1.4.4.bb => python3-xlsxwriter_1.4.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-xlsxwriter_1.4.4.bb => python3-xlsxwriter_1.4.5.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-xlsxwriter_1.4.4.bb b/meta-python/recipes-devtools/python/python3-xlsxwriter_1.4.5.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-xlsxwriter_1.4.4.bb
rename to meta-python/recipes-devtools/python/python3-xlsxwriter_1.4.5.bb
index ef4a6baa43..ffd3072a99 100644
--- a/meta-python/recipes-devtools/python/python3-xlsxwriter_1.4.4.bb
+++ b/meta-python/recipes-devtools/python/python3-xlsxwriter_1.4.5.bb
@@ -16,6 +16,6 @@ RDEPENDS:${PN} += " \
 	python3-io \
 "
 
-SRC_URI[sha256sum] = "791567acccc485ba76e0b84bccced2651981171de5b47d541520416f2f9f93e3"
+SRC_URI[sha256sum] = "0956747859567ec01907e561a7d8413de18a7aae36860f979f9da52b9d58bc19"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.25.1

