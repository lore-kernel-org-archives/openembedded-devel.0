Return-Path: <marc.ferland@gmail.com>
Received: from mail-wg0-f51.google.com (mail-wg0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 2BEAE617AA
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  3 Apr 2014 14:20:54 +0000 (UTC)
Received: by mail-wg0-f51.google.com with SMTP id k14so1907503wgh.34
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 03 Apr 2014 07:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id;
	bh=WcWkfEPBnGhyjhQYElnCFb1CbCTU6KKf8B8s42quGC8=;
	b=J+xrWOE5i7KXIy4XdFRJSHi9jt7T4XmfC/ABNaIIGglsn93KDDTu7CvmSGsew1IV6t
	Zun2RhiYaMAawo4xLMMvDeGTdeztSnnrbqhKaJ5IQKGX2FNOiYC88uWLVib33eEcS4+9
	L5OsIjEfjzVTZSWGO98mrPEQ8Q332B+X1MlFXFxz7xm1CkLmlZylkHUwXr5pFnCAzcKA
	L8LZ67yrlwQR/iXr7rTGxeNullPs+zxHKiuJx9+OPQM6dl+/pusT3ZF5ZTuXEQf4on+J
	HTi3XIanRnpVv7xC2BOQUOmQOKKZfJWd2J7EYffM6g5gRjhPh0souPxInVtOPkSI+1ht
	tTCg==
X-Received: by 10.180.39.173 with SMTP id q13mr11657381wik.26.1396534855106;
	Thu, 03 Apr 2014 07:20:55 -0700 (PDT)
Received: from ferlandm@sonatest.com
	(modemcable066.15-37-24.static.videotron.ca. [24.37.15.66])
	by mx.google.com with ESMTPSA id ee5sm11513585wib.8.2014.04.03.07.20.52
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Thu, 03 Apr 2014 07:20:54 -0700 (PDT)
Sender: Marc Ferland <marc.ferland@gmail.com>
Received: by ferlandm@sonatest.com (sSMTP sendmail emulation);
	Thu, 03 Apr 2014 10:20:51 -0400
From: Marc Ferland <ferlandm@sonatest.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  3 Apr 2014 10:20:51 -0400
Message-Id: <1396534851-14248-1-git-send-email-ferlandm@sonatest.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [meta-oe][PATCH] autobahn: fix 'Missing sha256 SRC_URI checksum'
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 03 Apr 2014 14:20:58 -0000

---
 meta-oe/recipes-devtools/python/python-autobahn_0.8.6.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-devtools/python/python-autobahn_0.8.6.bb b/meta-oe/recipes-devtools/python/python-autobahn_0.8.6.bb
index a1e8c5f..ac775c4 100644
--- a/meta-oe/recipes-devtools/python/python-autobahn_0.8.6.bb
+++ b/meta-oe/recipes-devtools/python/python-autobahn_0.8.6.bb
@@ -9,6 +9,7 @@ LIC_FILES_CHKSUM = " file://autobahn/__init__.py;beginline=1;endline=17;md5=1fde
 
 SRC_URI = "https://pypi.python.org/packages/source/a/autobahn/autobahn-${PV}.zip"
 SRC_URI[md5sum] = "160429e7fb043940e79aa7f4ebbab57a"
+SRC_URI[sha256sum] = "94ae5c6f37f9fe7c9d3f12c170fcc273afed4104a1c5508b26d6014bb9e6373e"
 
 S = "${WORKDIR}/autobahn-${PV}"
 
-- 
1.8.3.2


