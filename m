Return-Path: <zangrc.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF882C433F5
	for <webhook@archiver.kernel.org>; Thu, 14 Oct 2021 06:59:26 +0000 (UTC)
Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com
 [195.245.230.4])
 by mx.groups.io with SMTP id smtpd.web08.5987.1634194765207489969
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 13 Oct 2021 23:59:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=NJq31kx7;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.4,
 mailfrom: zangrc.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1634194763; i=@fujitsu.com;
	bh=5gRaSgcN35rTLn+mZcJSO6bzDmUIYTUzLf1RSHyZWu8=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=NJq31kx7dohAtX1RwnIyJQYCsiuSHgv8wis7AGs452j/soOklMrS0jpHkQNByJ8mV
	 B+TCs8FoMJJctKQrRAvNeAV4Net3Cptc8n6V0rMpONQO0jRbHoD6tcKfKzkLFkUdkd
	 0dZmJPhgJtolOBh5ZDjtde160DjjOrkRUCnNWsZ1qGCEe2ch2ovbikMo0RA0BGY5vN
	 T7sQ2YdWYEziLgPoCFfWHMAGpl+2ufwcea+xapiZZi48EelRTfzkt/1nKXQ9ck6t8B
	 9zCKtzJ1M+ba9I7AIP7Xwhrv1i9DYFhyFNlC3LWw3cRXM+GjuYZjXqg4wOo1OWHdE7
	 vC27r+ibTqo8A==
Received: from [100.112.192.69] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-a.eu-west-1.aws.symcld.net id FA/00-30013-B45D7616;
 Thu, 14 Oct 2021 06:59:23 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrMIsWRWlGSWpSXmKPExsViZ8ORqOt1NT3
  R4PokY4uLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPPtiVMBX1CFVvmnGFuYOzi72Lk4hASeMIo
  cf7+UjYI5wKTxINDHSwQzglGiWM3d7F2MXJysAnoSHS86GYBsUUE9CWWzt7DDGILCzhLtDc0A
  nVzcLAIqEpc3K0LEuYVcJNYsaCREcSWEFCQmPLwPTNEXFDi5MwnYGOYBSQkDr54wQxRoyixfe
  cZFgi7QuL14UtQcTWJq+c2MU9g5JuFpH0WkvYFjEyrGM2TijLTM0pyEzNzdA0NDHQNDY10DS1
  NdM3M9BKrdBP1Ukt1y1OLS3QN9RLLi/WKK3OTc1L08lJLNjECwy6l4JDTDsb3rz/oHWKU5GBS
  EuXddy49UYgvKT+lMiOxOCO+qDQntfgQowwHh5IEr+FFoJxgUWp6akVaZg4wBmDSEhw8SiK8R
  leA0rzFBYm5xZnpEKlTjIpS4rw9IAkBkERGaR5cGyzuLjHKSgnzMjIwMAjxFKQW5WaWoMq/Yh
  TnYFQS5j0IMoUnM68EbvoroMVMQIsDo1JAFpckIqSkGpjqXr7/eMDqR9k7UfetGfa1917MmR+
  4UWqH+syeMBN3WddOTW+mdVt2LX1Y1nZ06x++yOCPpWwrmH0y1UO27ZnPF3F/wTe+PdYTs9Je
  6y/zYflme9X7EbfkldWvjCd/DjwX6Z3dvCOz4tGLQh3WuOtJfokfju4pbNfm23xp++6Zrc6Vj
  f/UqpzNvd/9vHvzq5bRl9ylN87oMXperk2t9I5bH5f0dmvrlImb3i8IUdA5LsRWOPv0uy4ro+
  DMGM/YjYLC14+GV/P8deYyiVmzatXSB7Lz5b+9+rG/1XTi9EOuezPYwyt2yPPanO/o/3yyUrf
  7RC03x/tOa53TX97oLNCIT50d+1LkFuvijK9/TBcqsRRnJBpqMRcVJwIAltnAaDYDAAA=
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-10.tower-265.messagelabs.com!1634194762!292832!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 16472 invoked from network); 14 Oct 2021 06:59:22 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-10.tower-265.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 14 Oct 2021 06:59:22 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 424CA106EFD
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Oct 2021 07:59:22 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 35D69106EE6
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Oct 2021 07:59:22 +0100 (BST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.23; Thu, 14 Oct 2021 07:59:05 +0100
From: Zang Ruochen <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] poppler: upgrade 21.09.0 -> 21.10.0
Date: Fri, 15 Oct 2021 02:58:58 +0800
Message-ID: <1634237938-4812-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Oct 2021 06:59:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93285

From: Wang Mingyu <wangmy@fujitsu.com>

Release 21.10.0:
   core:
    * Add support for setting custom stamp annotations
    * Add default appearance for the well known stamp names
    * Correct encoding of signature's properties Reason & Location
    * Splash: Fix rendering of some odd patterns
    * SignatureHandler::validateCertificate: Add option to not do OCSP revocation check
    * SignatureHandler::validateCertificate: Add support for AIA fetching to verify certificates
    * greallocn: if memory allocation fails, free the previous pointer to avoid memory leak
    * Fix issues with malformed files
    * Internal code improvements

    utils:
    * pdfsig: Add a way to list certificate nicknames
    * pdfsig: You can now add signatures from pdfsig
    * pdfsig: Add option to not do OCSP revocation check
    * pdfsig: Add option for AIA fetching to verify certificates
    * pdfinfo: Add -custom option to print custom metadata
    * pdfinfo: add metadata flags

   qt:
    * Add support for setting custom stamp annotations
    * Add getters for signature's properties Reason & Location
    * Internal code improvements

   glib:
    * Remove incorrect PopplerAttachment deprecation

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../poppler/{poppler_21.09.0.bb => poppler_21.10.0.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/poppler/{poppler_21.09.0.bb => poppler_21.10.0.bb} (96%)

diff --git a/meta-oe/recipes-support/poppler/poppler_21.09.0.bb b/meta-oe/recipes-support/poppler/poppler_21.10.0.bb
similarity index 96%
rename from meta-oe/recipes-support/poppler/poppler_21.09.0.bb
rename to meta-oe/recipes-support/poppler/poppler_21.10.0.bb
index 0ecf199732..164a348815 100644
--- a/meta-oe/recipes-support/poppler/poppler_21.09.0.bb
+++ b/meta-oe/recipes-support/poppler/poppler_21.10.0.bb
@@ -7,7 +7,7 @@ SRC_URI = "http://poppler.freedesktop.org/${BP}.tar.xz \
            file://0001-Do-not-overwrite-all-our-build-flags.patch \
            file://basename-include.patch \
            "
-SRC_URI[sha256sum] = "5a47fef738c2b99471f9b459a8bf8b40aefb7eed92caa4861c3798b2e126d05b"
+SRC_URI[sha256sum] = "964b5b16290fbec3fae57c2a5bcdea49bb0736bd750c3a3711c47995c9efc394"
 
 DEPENDS = "fontconfig zlib cairo lcms glib-2.0"
 
-- 
2.25.1


