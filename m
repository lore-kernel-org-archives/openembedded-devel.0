Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A91C4C433EF
	for <webhook@archiver.kernel.org>; Thu, 14 Oct 2021 07:24:45 +0000 (UTC)
Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com
 [85.158.142.115])
 by mx.groups.io with SMTP id smtpd.web10.6066.1634196284228638255
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Oct 2021 00:24:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=lrinTrT2;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.115,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1634196282; i=@fujitsu.com;
	bh=lh7TWJ6QCesKl//0ychr26Qg8Pp2VNVjtdM2FdvC15E=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=lrinTrT2HvWUeYVYWphAoIDimhkbFAr1+Noqw50fZIZA88KGFNNisJcuQgCjjMFDz
	 VrurBeihTWZnVy5v9qPR08CF5h5AVRRZKHPma0DjdJ3w/2ZrWwhr9S1prfqmLbDYCG
	 7r/hL8QfI4uZc1t6MP9s+2EsqJrDMTBj7FAgSujP86IeZ+bTS5MCcVJfnMYrtjKLDf
	 t2N4jaX9qhTIeBrZIvyH5U8Ar4SUCENxgAR6GrDjTSAIhCuG1OnqioPeq1z98ECHzC
	 WKTZvAseZtyzbZxR3sabHcQMkXjV50LTSnXggoKkLNsSXuvbGWHwOS1XF0DyQCAtUo
	 tVTcGIDZshJfA==
Received: from [100.113.6.246] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-b.eu-central-1.aws.symcld.net id 9C/86-09058-A3BD7616;
 Thu, 14 Oct 2021 07:24:42 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrKIsWRWlGSWpSXmKPExsViZ8MxSdfqdnq
  iwc2vHBYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bcHx9ZCt5zVWyf08rcwPiJs4uRi0NI4Amj
  xLZLHSwQzgUmiS0POtggnD2MEruvtQFlODnYBHQlzj1eyw5iiwjoSyydvYcZxBYW8JW4/OURW
  A2LgKrEsSUvwWp4BTwkVvU9ZgKxJQQUJKY8fM8MEReUODnzCVg9s4CExMEXL4DiHEA1ihKzp8
  tDlFdIvD58iRnCVpO4em4T8wRGvllIumch6V7AyLSK0TKpKDM9oyQ3MTNH19DAQNfQ0FjXTNf
  QwkwvsUo3SS+1VDc5Na+kKBEoq5dYXqxXXJmbnJOil5dasokRGHophWy7djB+fv1B7xCjJAeT
  kijvvnPpiUJ8SfkplRmJxRnxRaU5qcWHGGU4OJQkeP/cAsoJFqWmp1akZeYA4wAmLcHBoyTCq
  3ATKM1bXJCYW5yZDpE6xagoJc67GqRPACSRUZoH1waLvUuMslLCvIwMDAxCPAWpRbmZJajyrx
  jFORiVhHlVQKbwZOaVwE1/BbSYCWhxYFQKyOKSRISUVAOT2XG9jCWH+tuaGIQdjjCWSLv9cpt
  +ZU/KkcvTTn+w3qv6V+HcRINHf9MfP6w0+pESF/s+rWRvcODbtnPnpIsVjxwvktsw68dSuXS3
  9wU5q8/sEZmxR/3IvGi7Wa4Pp/95sDDmRkvuC0fTn8qR4e/uPu4LvXm9VuQUe8PqrSJ28ivnr
  P6aOUVQVetq6rJk4QZJn61q0ie9RQuMBbdfk+/iXyKpunD//9elhsr7GgN9tY50ShlfZJ05df
  Xdc4EqYS9Pdme96K5fJt+57fd64wLboN6DzDd7I3zNjk3cExe18opy07kDlaEnuSwMFO2Lmua
  EscYddt6c99ZOptTyWcvSySJ7syuUo9drsZ+/4V2gxFKckWioxVxUnAgANoKZeTgDAAA=
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-14.tower-248.messagelabs.com!1634196281!195120!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 19748 invoked from network); 14 Oct 2021 07:24:42 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-14.tower-248.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 14 Oct 2021 07:24:42 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 9497D101B80
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Oct 2021 08:24:41 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 862071012DF
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Oct 2021 08:24:41 +0100 (BST)
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.23; Thu, 14 Oct 2021 08:24:25 +0100
From: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-urllib3: upgrade 1.26.6 -> 1.26.7
Date: Fri, 15 Oct 2021 00:23:55 +0800
Message-ID: <1634228635-12542-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Oct 2021 07:24:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93289

1.26.7 (2021-09-22)
-------------------
* Fixed a bug with HTTPS hostname verification involving IP addresses and lack
  of SNI. (Issue #2400)
* Fixed a bug where IPv6 braces weren't stripped during certificate hostname
  matching. (Issue #2240)

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../{python3-urllib3_1.26.6.bb => python3-urllib3_1.26.7.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-urllib3_1.26.6.bb => python3-urllib3_1.26.7.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-urllib3_1.26.6.bb b/meta-python/recipes-devtools/python/python3-urllib3_1.26.7.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-urllib3_1.26.6.bb
rename to meta-python/recipes-devtools/python/python3-urllib3_1.26.7.bb
index 5a2a6287f0..72696749bc 100644
--- a/meta-python/recipes-devtools/python/python3-urllib3_1.26.6.bb
+++ b/meta-python/recipes-devtools/python/python3-urllib3_1.26.7.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/shazow/urllib3"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=c2823cb995439c984fd62a973d79815c"
 
-SRC_URI[sha256sum] = "f57b4c16c62fa2760b7e3d97c35b255512fb6b59a259730f36ba32ce9f8e342f"
+SRC_URI[sha256sum] = "4987c65554f7a2dbf30c18fd48778ef124af6fab771a377103da0585e2336ece"
 
 inherit pypi setuptools3
 
-- 
2.25.1


