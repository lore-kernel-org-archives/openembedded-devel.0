Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 4AFFB78674
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Jan 2018 09:14:08 +0000 (UTC)
Received: by mail-wm0-f42.google.com with SMTP id f71so359498wmf.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Jan 2018 01:14:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=xMZDAihkqvI78uwRtf9BeBaDZXOIqwxwDXxfgJ95SQc=;
	b=nfsdvJungW3ZWRliw5mh8XSeRqLLFj52osZW8Re2uik+WINBpF30Jy29DxFxX0Z04m
	8F9HHrzCqVFxk8p+NEWvYisoSFgaIW2WXJC+sACQWSvZPVch2oORUcXvsHAwNs5JbY/U
	DT5mgmAqlA6ZGOb2uVKRlepVzeHo3vtYlDM0b4/ekVAZXUrLAFrYX6OCSKZdrScdvnWX
	EfNF64hnmR834l6mY5ZCOvTCGVqy+vKV4DOEx1Nr6FLKx3aGr+d9bCCquz2Qzdl0UnVH
	3IvkV/yWj9noM3v0c6p5lGSYm/zXd0WnJ2lAdaZIt3ucG620SmXYBmDfYdwI0hHH9fxS
	V2xA==
X-Gm-Message-State: AKwxytdEEjGdHdS+bQbkDUgUOlUTjfkTIFgqgtUFLDns7xk6+o5r7W5t
	x60BwVGlqIbwNgYYtzlwAxrpAYEQ
X-Google-Smtp-Source: ACJfBosqSAxIXP5Mww+DPYoGphJesGVLkSoJhECc3fT5qccsWLhSHryP4TmvDQAtAGJ5pU/1cW2UJw==
X-Received: by 10.80.192.72 with SMTP id u8mr8037200edd.109.1516007649788;
	Mon, 15 Jan 2018 01:14:09 -0800 (PST)
Received: from tfsielt31850.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	d3sm17254591edc.15.2018.01.15.01.14.08
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 15 Jan 2018 01:14:09 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 15 Jan 2018 09:14:01 +0000
Message-Id: <20180115091408.1133-1-git@andred.net>
X-Mailer: git-send-email 2.15.1
MIME-Version: 1.0
Subject: [meta-python][PATCH 1/8] python-flask-pymongo: replace startline=1 with beginline=1 in LIC_FILES_CHKSUM
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
X-List-Received-Date: Mon, 15 Jan 2018 09:14:09 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <andre.draszik@jci.com>

'startline' is not a recognised keyword, it's beginline

Signed-off-by: André Draszik <andre.draszik@jci.com>
---
 meta-python/recipes-devtools/python/python-flask-pymongo.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python-flask-pymongo.inc b/meta-python/recipes-devtools/python/python-flask-pymongo.inc
index e11283ed3..fb2d6ed8b 100644
--- a/meta-python/recipes-devtools/python/python-flask-pymongo.inc
+++ b/meta-python/recipes-devtools/python/python-flask-pymongo.inc
@@ -3,7 +3,7 @@ DESCRIPTION = "PyMongo support for Flask applications."
 HOMEPAGE = "https://github.com/mitsuhiko/flask/"
 SECTION = "devel/python"
 LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://flask_pymongo/wrappers.py;startline=1;endline=24;md5=424c4e1047d28e01b4e4634a069c019d"
+LIC_FILES_CHKSUM = "file://flask_pymongo/wrappers.py;beginline=1;endline=24;md5=424c4e1047d28e01b4e4634a069c019d"
 
 SRC_URI[md5sum] = "d7a1b717f27154e1f3a355f8ec2467d6"
 SRC_URI[sha256sum] = "2baaa2ba5107d72b3a8bd4b5c0c8881316e35340ad1ae979cc13f1f3c8843b3d"
-- 
2.15.1


