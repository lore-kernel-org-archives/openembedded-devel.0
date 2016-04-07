Return-Path: <straka.derek@gmail.com>
Received: from mail-yw0-f193.google.com (mail-yw0-f193.google.com
	[209.85.161.193])
	by mail.openembedded.org (Postfix) with ESMTP id D348776EBF
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Apr 2016 02:48:56 +0000 (UTC)
Received: by mail-yw0-f193.google.com with SMTP id k197so5195070ywe.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Apr 2016 19:48:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=XOy6p+J/y+IVvsT21n0nFntwunnCSzBsrNZhPKMDyIw=;
	b=GarRZwLxn82lR8bciww4xUCg+pwVRwkPSwlIxardhxJFLyvhkarh3/LVXB8cFHRwbk
	pmzOPx2DgTCDQj61ddS3U4nc60b/oDo09UQfZamI3bpQGpLgsfxYKGfz/4iOSzGXGsLv
	TERrimCkixMGB+n1PdWw6/l9NKNF9n2lFoXolyHnIuXBjhzuinThZ1VTdKm7v8XOzMe0
	10wkDFJhFJiEpMEa4QgAr02PeadwK4qXI5NgXPTvAvWHq+fe90ZbiqZ7JFlyAW/I3Ypj
	kxHK6g+d494PNk/NwW/0di2jxIW3J+RbFbINpvh++036zaVOwt0s9sIsW4kkABwDPj+k
	3lww==
X-Gm-Message-State: AD7BkJLWaxGzS7s/caByLhA3eZ0mZKWYyKj5HCbnYt/jX5xpSilUseozbitKBgL3gZLO4g==
X-Received: by 10.129.128.70 with SMTP id q67mr329130ywf.326.1459997337449;
	Wed, 06 Apr 2016 19:48:57 -0700 (PDT)
Received: from localhost.localdomain ([12.166.78.2])
	by smtp.gmail.com with ESMTPSA id
	d140sm3666112ywb.48.2016.04.06.19.48.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 06 Apr 2016 19:48:56 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  6 Apr 2016 22:48:21 -0400
Message-Id: <1459997302-25271-10-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1459997302-25271-1-git-send-email-derek@asterius.io>
References: <1459997302-25271-1-git-send-email-derek@asterius.io>
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-perl][PATCH 10/11] libextutils-installpaths-perl: update to 0.011
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
X-List-Received-Date: Thu, 07 Apr 2016 02:48:57 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 ...llpaths-perl_0.010.bb => libextutils-installpaths-perl_0.011.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-perl/recipes-perl/libextutils/{libextutils-installpaths-perl_0.010.bb => libextutils-installpaths-perl_0.011.bb} (75%)

diff --git a/meta-perl/recipes-perl/libextutils/libextutils-installpaths-perl_0.010.bb b/meta-perl/recipes-perl/libextutils/libextutils-installpaths-perl_0.011.bb
similarity index 75%
rename from meta-perl/recipes-perl/libextutils/libextutils-installpaths-perl_0.010.bb
rename to meta-perl/recipes-perl/libextutils/libextutils-installpaths-perl_0.011.bb
index 8de375d..6eb434a 100644
--- a/meta-perl/recipes-perl/libextutils/libextutils-installpaths-perl_0.010.bb
+++ b/meta-perl/recipes-perl/libextutils/libextutils-installpaths-perl_0.011.bb
@@ -6,11 +6,11 @@ SECTION = "libs"
 HOMEPAGE = "http://search.cpan.org/~leont/ExtUtils-InstallPaths/"
 
 LICENSE = "Artistic-1.0 | GPL-1.0+"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=15bbcc2806d297df9e944b8955b38d82"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=b6fa54d873ce6bcf4809ea88bdf97769"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/L/LE/LEONT/ExtUtils-InstallPaths-${PV}.tar.gz"
-SRC_URI[md5sum] = "f0b00cc6c04653588a6298fa1f16c07f"
-SRC_URI[sha256sum] = "d14cbff118e467900c2c488b55b83ef697d6eb1b8f592c0521f1d82848bf2156"
+SRC_URI[md5sum] = "9c75894c3c8c899ab6bfafc5eaa97999"
+SRC_URI[sha256sum] = "7609fa048cdcf1451cad5b1d7d494f30e3d5bad0672d15404f1ea60e1df0067c"
 
 S = "${WORKDIR}/ExtUtils-InstallPaths-${PV}"
 
-- 
1.9.1


