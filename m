Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web08.6974.1616724380674610908
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Mar 2021 19:06:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Lr12Ml94;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1616724378; i=@fujitsu.com;
	bh=03JH1ShtBIAmRvgpEBAwbC6jvRgLREzrgaxRDkWi4AE=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=Lr12Ml94pK9xmY7dgeIEY/to00xg4k2OE8XGJtrfekr9m6YVxodvSa5Zp17ZSVpyM
	 HvIvETFR+pVS3kRn9JYkVOethXrhIpi5guuHNbnS2XwZqoPLa+aT/ZOMqfK5qcUZhX
	 cYRlcwkN5UJdHOsXiU+Rml2A5YIXz1O5Bn1BuKHLWtKVikncd+QvFsovQzGYqsaDx1
	 BbkTsiFQca6VOH13Lckzj5zPf2OAqEwSdHBJm4RcmUUOBgwkzCUu9E9EHXsNmvgQUY
	 SmF/JAaiWp7EuARgeaP6hMN4TTE+hWGTUslvp6fATG2AblCRJAUnYkp9r0C6+5uxnz
	 Ifzaa2xgHbl0w==
Received: from [100.113.6.176] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-b.eu-central-1.aws.symcld.net id 25/DB-38008-A914D506; Fri, 26 Mar 2021 02:06:18 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprGIsWRWlGSWpSXmKPExsViZ8MRojvTMTb
  B4MlefYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNeP7l4csBWc4K4639rA0ML7g6GLk5BAS2MIk
  cXurchcjF5B9glHi59WTTCAJNgEdiY4X3SwgtoiAvsTS2XuYQWxhAVeJnlfLwOIsAqoSa9tus
  IPYvALuEnsWHWAFsSUEFCSmPHzPDBEXlDg58wlYPbOAhMTBFy+YIWoUJbbvPAMU5wCyqySOzF
  SbwMgzC0nHLCQdCxiZVjFaJBVlpmeU5CZm5ugaGhjoGhoa65rpWpjrJVbpJumlluomp+aVFCU
  CJfUSy4v1iitzk3NS9PJSSzYxAoMopZAtfAfjmdcf9A4xSnIwKYnyHjoRkyDEl5SfUpmRWJwR
  X1Sak1p8iFGGg0NJgneqQ2yCkGBRanpqRVpmDjCgYdISHDxKIrw/bIHSvMUFibnFmekQqVOMu
  hxfVi1ZxCzEkpeflyolzssAMkMApCijNA9uBCy6LjHKSgnzMjIwMAjxFKQW5WaWoMq/YhTnYF
  QS5uUCxqoQT2ZeCdymV0BHMAEdsfFHJMgRJYkIKakGpuV2tulB060yVT/euVm31W7Zm91vZwi
  dXTLf8dC2/2EnV8WnX6rh6IxWiC1jrDNcKhnN7h72/3PkO5VzZyeI7xWcUt+x1UF5o0FPYLro
  o+UKfvp7dWaode3Q+9Nh1qife/hKjQyTl1v2ntj/ubEHvC++6nD2j/3ervopf8o9m9O+oSInv
  6e0+11fU30lSk9y9ZGNTduOXNrVySLL0yTkabvobkFInFAPa0Al35tiXX+P9W9nvf60TT3Z4E
  FL9Jc3Fe7N3I/q+cxXtXNv0OeN4va/NmWG+IKnJ6xXv9ZaU7SdsS9uZtLsWcu35W5oXCM9lfF
  wx619z/rezK+vr/ix5deZHSuzr+1iz3W/KH7cSImlOCPRUIu5qDgRABwi6HgpAwAA
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-3.tower-238.messagelabs.com!1616724377!537965!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.60.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 17333 invoked from network); 26 Mar 2021 02:06:17 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-3.tower-238.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 26 Mar 2021 02:06:17 -0000
Received: from r01ukexcasm214.r01.fujitsu.local (ex2k13_214.fs.fujitsu.com [10.182.185.116])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 12Q26HnJ023958
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Fri, 26 Mar 2021 02:06:17 GMT
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 r01ukexcasm214.r01.fujitsu.local (10.182.185.116) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Fri, 26 Mar 2021 02:06:15 +0000
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] live555: upgrade 20210129 -> 20210322
Date: Fri, 26 Mar 2021 10:06:08 +0800
Message-ID: <1616724368-25389-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD05.g08.fujitsu.local (10.167.33.203) To
 r01ukexcasm214.r01.fujitsu.local (10.182.185.116)
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 .../live555/{live555_20210129.bb => live555_20210322.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-multimedia/live555/{live555_20210129.bb => live555_20210322.bb} (97%)

diff --git a/meta-oe/recipes-multimedia/live555/live555_20210129.bb b/meta-oe/recipes-multimedia/live555/live555_20210322.bb
similarity index 97%
rename from meta-oe/recipes-multimedia/live555/live555_20210129.bb
rename to meta-oe/recipes-multimedia/live555/live555_20210322.bb
index 1e7a674f4..891338548 100644
--- a/meta-oe/recipes-multimedia/live555/live555_20210129.bb
+++ b/meta-oe/recipes-multimedia/live555/live555_20210322.bb
@@ -16,7 +16,7 @@ SRC_URI = "https://download.videolan.org/pub/contrib/live555/live.${URLV}.tar.gz
 # only latest live version stays on http://www.live555.com/liveMedia/public/, add mirror for older
 MIRRORS += "http://www.live555.com/liveMedia/public/ http://download.videolan.org/contrib/live555/ \n"
 
-SRC_URI[sha256sum] = "85ab8d4337d414482586089b6f64fc39af64ff4be5b51976b54b0e10dceb333b"
+SRC_URI[sha256sum] = "b451c7ded8becbfa239e8f4fbe69784413270fb4c5e9b2e74269247dc3dd2e59"
 
 S = "${WORKDIR}/live"
 
-- 
2.25.1

