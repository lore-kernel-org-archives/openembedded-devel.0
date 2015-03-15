Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f174.google.com (mail-wi0-f174.google.com
	[209.85.212.174])
	by mail.openembedded.org (Postfix) with ESMTP id 4F14A73929
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Mar 2015 23:34:14 +0000 (UTC)
Received: by wibg7 with SMTP id g7so21288964wib.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Mar 2015 16:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=bY1xEublNRfFtbKMeoGiBDdDjECBViMSirnd4Yw0B4o=;
	b=MDQQoWBO5bThNXcQbAfBIExyR+fiB16We7Mrn2GYF28ub9Qw8Dfobec75lX6iCGrbv
	poQl+9FrMxu6rGrJOrTaSVUE32XV6xliQwk2HFetT670dNonnSRO28Gyb97x3yVFUHmh
	t2IwuKSdqVFvr6Sq797yuWmzkrHjmXDKnObvUkw2CQDkx4AEuqtKumrdi4tgsHV+gRkp
	M8csJpAhaGv2BFIiupxBGHuXOdsCYpK4VXCLQQOz9L0MxrhPto1Leo8ZY4ljRMTvvOBw
	LlOeQ9O2ag8B07KbRbjEc2HTRwua4lnhf/hm1L9OLCd0ZHjhpZVAOKgD+8vCXxMvqbT+
	ZJQg==
X-Received: by 10.194.86.194 with SMTP id r2mr119891086wjz.41.1426462455969;
	Sun, 15 Mar 2015 16:34:15 -0700 (PDT)
Received: from localhost.localdomain (p54AA52CC.dip0.t-ipconnect.de.
	[84.170.82.204]) by mx.google.com with ESMTPSA id
	r14sm12804945wiv.13.2015.03.15.16.34.14
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 15 Mar 2015 16:34:15 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 Mar 2015 00:33:25 +0100
Message-Id: <1426462419-10173-17-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1426462419-10173-1-git-send-email-schnitzeltony@googlemail.com>
References: <1426462419-10173-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH][meta-xfce 16/30] ristretto: update to 0.8.0
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
X-List-Received-Date: Sun, 15 Mar 2015 23:34:15 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../ristretto/{ristretto_0.6.3.bb => ristretto_0.8.0.bb}            | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)
 rename meta-xfce/recipes-apps/ristretto/{ristretto_0.6.3.bb => ristretto_0.8.0.bb} (65%)

diff --git a/meta-xfce/recipes-apps/ristretto/ristretto_0.6.3.bb b/meta-xfce/recipes-apps/ristretto/ristretto_0.8.0.bb
similarity index 65%
rename from meta-xfce/recipes-apps/ristretto/ristretto_0.6.3.bb
rename to meta-xfce/recipes-apps/ristretto/ristretto_0.8.0.bb
index 8e485f9..66399cf 100644
--- a/meta-xfce/recipes-apps/ristretto/ristretto_0.6.3.bb
+++ b/meta-xfce/recipes-apps/ristretto/ristretto_0.8.0.bb
@@ -9,5 +9,7 @@ inherit xfce-app
 
 RRECOMMENDS_${PN} += "tumbler"
 
-SRC_URI[md5sum] = "6b8c9a5d7ed319e4c84a9fefaa18792c"
-SRC_URI[sha256sum] = "2b6816de298e9a0d9b95662664690713c4123a9ac813a27bdde4727a03472d79"
+SRC_URI[md5sum] = "94c778850325a4e5a12e3433c8a05432"
+SRC_URI[sha256sum] = "71625324cecda7199acbc95a3ea5132d0dcbf808771e7a209ea2b9503ae4f328"
+
+FILES_${PN} += "${datadir}/appdata"
-- 
1.9.3


