Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.3])
 by mx.groups.io with SMTP id smtpd.web10.5827.1621501823301462388
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 May 2021 02:10:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=PS9gIMMT;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.3, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1621501820; i=@fujitsu.com;
	bh=6lFm8TT2ebLfB0IljmN3sY1JlYD4BZVxJrOhRJrQxhY=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=PS9gIMMTC2wjOL4lLAbkqdM3m6cOA0oaEI5fzv05oZdd1yfTqFfIVjxONJoSiqzYD
	 D9/MNG2xUSVxlDbmSwfCif7MrF7PJhKR66cjJiGjWa58yF14YFURC2qoa0hvAQuy0y
	 44rR+3WwKdRdAlsxzLXkp1JCIrirdRYhUAqxDv0h+nCKNl3XvIM0gqHW5BXk+spmnU
	 OyiFwFggQIoF4mVUAaguYvVz/uFhzoZW7g0z/iYAKCbaTEi0/mJmxclkCTCbP2xSxr
	 A0THK8zNslgOEhOoRVUW5sK+UvbODGbwwF7B/6uv188n3UOI1Xl+Xd3eGQ+1hv6C1h
	 QezE6FsucVFyg==
Received: from [100.113.3.92] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-a.eu-central-1.aws.symcld.net id A3/B1-19780-C7726A06; Thu, 20 May 2021 09:10:20 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFuphkeJIrShJLcpLzFFi42Kxs+GYqlujviz
  B4NJlSYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPi3NUsBQc4KzqOmzQwvuboYuTiEBKYzSTR
  /u8pC4RzglFizfaHzF2MnBxsAjoSHS+6WUBsEQF9iaWz94DFhQX8JJ4f3soEYrMIqEo87p/FC
  GLzCrhLLH61lBXElhBQkJjy8D0zRFxQ4uTMJ2BzmAUkJA6+eMEMUaMosX3nGRYIu0JixoxtbB
  MYeWYhaZmFpGUBI9MqRsukosz0jJLcxMwcXUMDA11DQ2NdY11DM0O9xCrdRL3UUt3k1LySokS
  grF5iebFecWVuck6KXl5qySZGYCClFDIv3MH44/UHvUOMkhxMSqK8ZvcXJQjxJeWnVGYkFmfE
  F5XmpBYfYpTh4FCS4BUBhqaQYFFqempFWmYOMKhh0hIcPEoivNyyQGne4oLE3OLMdIjUKUZFK
  XHed6pACQGQREZpHlwbLJIuMcpKCfMyMjAwCPEUpBblZpagyr9iFOdgVBLmnawGNIUnM68Ebv
  oroMVMQIv/Ny4CWVySiJCSamBinfJIIoLxr/qLWhPHd8Gi2m2TGteIrpY62PDN7auds1ikUE0
  Sc69fuceaNbqcp+U6WzV3/vB4vibPb21ZKOvlu13XLsmdYWXt4wjbuqJQcbHbv/QVJqFXLSN8
  eo/aTliWnbaG37e4bEq3z7wXkqbN3HxOe4Snr/Dl8vq5eLaRbFryvWj5k4Y3Xffu67f32CX2+
  VX7XbnGQyc/89z4MXcSzxJZmQm7t7JJrZYsnDwl+ODTYtvzHww/r5Z9vuXs4pVLtbo/RBrrR/
  +JnPwrZ+UF+/A1W+W6ZjdydT5UmDf9zvz7DGXz0t715czYkjmxb9pOlZu/Uo5M+bwhIjbp/cv
  zS3O7Xhv2TTjiMVX9QHWeEktxRqKhFnNRcSIA47AkDx8DAAA=
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-18.tower-228.messagelabs.com!1621501819!222133!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 26140 invoked from network); 20 May 2021 09:10:20 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-18.tower-228.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 20 May 2021 09:10:20 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 14K9AJuo005329
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Thu, 20 May 2021 10:10:19 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Thu, 20 May 2021 10:10:18 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-protobuf: upgrade 3.14.0 -> 3.17.0
Date: Thu, 20 May 2021 17:10:12 +0800
Message-ID: <1621501812-17559-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 .../{python3-protobuf_3.14.0.bb => python3-protobuf_3.17.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-protobuf_3.14.0.bb => python3-protobuf_3.17.0.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-protobuf_3.14.0.bb b/meta-python/recipes-devtools/python/python3-protobuf_3.17.0.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-protobuf_3.14.0.bb
rename to meta-python/recipes-devtools/python/python3-protobuf_3.17.0.bb
index 3cf850d1f4..be846f7993 100644
--- a/meta-python/recipes-devtools/python/python3-protobuf_3.14.0.bb
+++ b/meta-python/recipes-devtools/python/python3-protobuf_3.17.0.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=19e8f490f9526b1de8
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "1d63eb389347293d8915fb47bee0951c7b5dab522a4a60118b9a18f33e21f8ce"
+SRC_URI[sha256sum] = "05dfe9319939a8473c21b469f34f6486646e54fb8542637cf7ed8e2fbfe21538"
 
 # http://errors.yoctoproject.org/Errors/Details/184715/
 # Can't find required file: ../src/google/protobuf/descriptor.proto
-- 
2.25.1

