Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-qg0-f50.google.com (mail-qg0-f50.google.com
	[209.85.192.50])
	by mail.openembedded.org (Postfix) with ESMTP id 2B46E60796
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Dec 2015 16:36:21 +0000 (UTC)
Received: by qgz52 with SMTP id 52so12852376qgz.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Dec 2015 08:36:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=Yf4FbrgF6cUoP24R396G0/Bk6DWOVWNtrUKoMdh/Twc=;
	b=BJhIyjq14Tp0pbT5q+YI8Ip0/JYL/4imU2OzAchx+PPWljcfkJr8XKLpr2o5bqZiUe
	TUoh0Qjn1NRst3BN5YsSSH+/h+DfE+jtyaUxwT7E9mVpbZ0bMsLjjKQ6eP3O0d87l6/7
	hXgnIWW9m4IG41pQ/PzkhPMM1ilkKMjCo4UFGJwGXwNYviyb1ry3UPq7gxUvOeIRBbK+
	o/kTdUpHU6UkCs4Axe8nlhF2KlcXmzYx+OlrpEGkuDlBhL6Zm/TFA/6ZGQGCbvllMTB5
	mc4opkkmiFRtS+YUcOQx4j23slEWrBlDw/+LH9RF1xkN8oGEswnQCccrE6yi/pPB4Saw
	1KfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Yf4FbrgF6cUoP24R396G0/Bk6DWOVWNtrUKoMdh/Twc=;
	b=KOUZWUvoVUm0hhMEEvpj5bGLLWXaU/TFdlW2DAlfVB8TgGIoiQAlnPQXDRteuAuMWD
	fIWH2mCgDzMWVk63gBWhvttWTUb3QlbJf1yUP2lnQUk6AlRu0r+x1sBS7HQza4FBDRBy
	XKVHMn836DUtM5om9exblTEs4SuRiDL+g5ZztqWvyd9s0ZakalyaSfROdjjOK5BnXPJW
	Yk5mUAkmetMFkb0jILNPta7HG5PekF4CFyaVb8/bQ2OpWjpUoOsGs611ZMWEh5Lr9uKU
	uGImmU+S1Har1irsCv6bGpD5DcCDaW8CuoCOK3hjXGEKwk6S50rq1IuOq8sUhPGGcw9Z
	AepA==
X-Gm-Message-State: ALoCoQkFXNfBp+c1jUagqw0+bsM08iwnZ7ZdSewlm1hDceOyfIDsVxZK3z7qJhcuBl09OaYxsv9dvYRiP/2Bt2JNEgxW9BZCzg==
X-Received: by 10.140.36.232 with SMTP id p95mr25313314qgp.55.1449851781980;
	Fri, 11 Dec 2015 08:36:21 -0800 (PST)
Received: from localhost.localdomain ([177.194.217.47])
	by smtp.gmail.com with ESMTPSA id
	s74sm8271229qkl.36.2015.12.11.08.36.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 11 Dec 2015 08:36:21 -0800 (PST)
From: Fabio Berton <fabio.berton@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 11 Dec 2015 14:35:49 -0200
Message-Id: <1449851750-30926-1-git-send-email-fabio.berton@ossystems.com.br>
X-Mailer: git-send-email 2.1.4
Cc: Fabio Berton <fabio.berton@ossystems.com.br>
Subject: [meta-python][PATCH 1/2] python-daemonize: Update to version 2.4.1
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
X-List-Received-Date: Fri, 11 Dec 2015 16:36:22 -0000

Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
---
 .../python/{python-daemonize_2.3.1.bb => python-daemonize_2.4.1.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python-daemonize_2.3.1.bb => python-daemonize_2.4.1.bb} (72%)

diff --git a/meta-python/recipes-devtools/python/python-daemonize_2.3.1.bb b/meta-python/recipes-devtools/python/python-daemonize_2.4.1.bb
similarity index 72%
rename from meta-python/recipes-devtools/python/python-daemonize_2.3.1.bb
rename to meta-python/recipes-devtools/python/python-daemonize_2.4.1.bb
index 2fc9e63..e10c853 100644
--- a/meta-python/recipes-devtools/python/python-daemonize_2.3.1.bb
+++ b/meta-python/recipes-devtools/python/python-daemonize_2.4.1.bb
@@ -12,5 +12,5 @@ RDEPENDS_${PN} = "\
                python-resource \
 "
 
-SRC_URI[md5sum] = "f0d401a0a501ba9d36e516ea89146eb2"
-SRC_URI[sha256sum] = "6fa43b56c293ff8bb180008fe47ed49f7d006cdeb0eaa84f157249800d3194d4"
+SRC_URI[md5sum] = "f08ad971573a1d83d2d4adab13f59448"
+SRC_URI[sha256sum] = "2fbe8a4af6bafb3f53d64b8c05c073bfff6c8bc829b83563f5774b0052fc656e"
-- 
2.1.4


