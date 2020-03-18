Return-Path: <SRS0=VQHR=5D=stusta.de=bunk@stusta.mhn.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 9F78A605F2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Mar 2020 18:52:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 48jK025z42z5c
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Mar 2020 19:52:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1584557522;
	bh=W987JBGkck0JeeXa4FS5rrsHtN1lWOw4tF/ZPz7L118=;
	h=From:To:Subject:Date:From;
	b=iDorLaGnWj9MSb6CNthB9TkHZdVOFS000JwXzgg2wW6Z7tsm+FadjrvW2NkDL+8HW
	xUb8HjNuqtpUugX4xbGnfIFJMGUL0OOWHFQWZKYDQKQglBGFjAGlkavh2VmdeLmY5z
	ICmOeIvWz6UgdJ3mRH2R+FHvaS8TfKOvw8hmA7WlSZ4/foMfgO/tDu8J76Gi3svD1x
	OO7UJo/Maec98ymlunklDDnoDEOBF7+jgyK5JFFkG2q4N+kw3RpSrUlhAOjiA66mPU
	LRDBhs02nsVDDwSpmjccfp5MzUMioLWVaLeTZrtBntxbHpriStSkmzTcdvFrHa+BrD
	29zcy1nKO2lZxZDELtwi8ShpRz48VnpXAmHI37QmwoN0SsRNthuz1Jp/VF10O2oTg9
	JZYygIMo9tXZZVzaLUzHhfXdeS2QOXSyU9imSc7N4wlBaSZNZb78X6/Ol1jAEsdZyO
	uk4XaO1ffU7LvSa7MA1meBygce3KKStlUi/uQFacfcWCkXldcoapRFOFnVQnn4Tsg6
	NHERASCAaDfl4XGJWn7e3ZBdVXpff/Yo6kSKBLOvOXW9++uAbvZGw3cdnZ9bEvhj1i
	1mE/jPeR99du2NmFrDctrfugvLgSj9cpK9OdA/T/rHq1Y/JBOB5VtJGWRBiB57/SYn
	875FvXy+MLO4WJsf2qBZmx5E=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 18 Mar 2020 20:52:00 +0200
Message-Id: <20200318185200.28166-2-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [meta-oe][PATCH] modemmanager: Upgrade 1.12.6 -> 1.12.8
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
X-List-Received-Date: Wed, 18 Mar 2020 18:52:05 -0000

Bugfix release on the 1.12 stable branch.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../{modemmanager_1.12.6.bb => modemmanager_1.12.8.bb}         | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-oe/recipes-connectivity/modemmanager/{modemmanager_1.12.6.bb => modemmanager_1.12.8.bb} (93%)

diff --git a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.12.6.bb b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.12.8.bb
similarity index 93%
rename from meta-oe/recipes-connectivity/modemmanager/modemmanager_1.12.6.bb
rename to meta-oe/recipes-connectivity/modemmanager/modemmanager_1.12.8.bb
index ef6ba6bb4..47a86b919 100644
--- a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.12.6.bb
+++ b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.12.8.bb
@@ -14,8 +14,7 @@ DEPENDS = "glib-2.0 libgudev intltool-native libxslt-native"
 SRC_URI = "http://www.freedesktop.org/software/ModemManager/ModemManager-${PV}.tar.xz \
            "
 
-SRC_URI[md5sum] = "796bf7bfc156c4229cef1a9cb8c79f37"
-SRC_URI[sha256sum] = "2eb3353ee5518005c51d429308695c69d8c38cf2fd9102b04f785c03a0cc624c"
+SRC_URI[sha256sum] = "68b53d0615ba0d3e2bbf386ed029dfe644a6a30a79ab8d85523527bb4e713aff"
 
 S = "${WORKDIR}/ModemManager-${PV}"
 
-- 
2.17.1


