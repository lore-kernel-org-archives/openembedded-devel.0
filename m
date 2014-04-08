Return-Path: <fathi.boudra@linaro.org>
Received: from mail-bk0-f43.google.com (mail-bk0-f43.google.com
	[209.85.214.43])
	by mail.openembedded.org (Postfix) with ESMTP id 850D365DE1
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Apr 2014 17:22:09 +0000 (UTC)
Received: by mail-bk0-f43.google.com with SMTP id v15so863730bkz.16
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Apr 2014 10:22:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=8mjhRvc4vwdWscj7caYR25Jb4Jx6BUJahLxM8RgQSDc=;
	b=GI4Us5LTKTpI4W8QuRHgLDWr0g5jdWwAHkgd21YkisU14B6hcifkWQCwYfGEOCojbU
	gFKGrIyvlP/cPU9mPAbA4lw6hyNoZBOrq9e48ZGj8j65nkQxlfbUdyWnoGS3YkfMyqwS
	EdnZApWPNcKFpZS6rZYi5rj7sZ/UZ+05EBYFxdJeH/RBiFyot1SGo0TDdkw/vEG50mnf
	M4DgwLJF3qFNmMx2hLssskU96Os+W1n6+vfwXfyjGpxTv23XAaRbgybxcP4uFURralaI
	+KUSSJt6CprqR444cr9XmnT2va0jxj0F//JdwyBNMVB9Ub7dMNCxBifRuKn72Lf2WdNQ
	F29w==
X-Gm-Message-State: ALoCoQn93x7JXXgYmc5uHBrGH3YgfO+jqWIJ/URddXoYc5BveAt/C+yhWfpNWP6trlwhg63eM63F
X-Received: by 10.152.42.196 with SMTP id q4mr3765517lal.14.1396977730357;
	Tue, 08 Apr 2014 10:22:10 -0700 (PDT)
Received: from localhost.localdomain (a91-152-78-194.elisa-laajakaista.fi.
	[91.152.78.194])
	by mx.google.com with ESMTPSA id el7sm2542238lac.10.2014.04.08.10.22.09
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 08 Apr 2014 10:22:09 -0700 (PDT)
From: Fathi Boudra <fathi.boudra@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  8 Apr 2014 20:22:05 +0300
Message-Id: <1396977725-13411-1-git-send-email-fathi.boudra@linaro.org>
X-Mailer: git-send-email 1.9.1
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH 1/1] acpica: update to 20140325 release
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
X-List-Received-Date: Tue, 08 Apr 2014 17:22:12 -0000

Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
---
 .../acpica/{acpica_20140114.bb => acpica_20140325.bb}                 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-extended/acpica/{acpica_20140114.bb => acpica_20140325.bb} (91%)

diff --git a/meta-oe/recipes-extended/acpica/acpica_20140114.bb b/meta-oe/recipes-extended/acpica/acpica_20140325.bb
similarity index 91%
rename from meta-oe/recipes-extended/acpica/acpica_20140114.bb
rename to meta-oe/recipes-extended/acpica/acpica_20140325.bb
index 2bb7ad7..0210b04 100644
--- a/meta-oe/recipes-extended/acpica/acpica_20140114.bb
+++ b/meta-oe/recipes-extended/acpica/acpica_20140325.bb
@@ -14,8 +14,8 @@ DEPENDS = "bison flex"
 SRC_URI = "https://acpica.org/sites/acpica/files/acpica-unix2-${PV}.tar.gz \
     file://no-werror.patch \
     "
-SRC_URI[md5sum] = "fcd4b7304f1bfabc7d4b9cfdecc6b0c6"
-SRC_URI[sha256sum] = "0d5bd32690ab77e21ab143ef25361c314a4ed13c33a5fb3ddd6f5559ab24ebc3"
+SRC_URI[md5sum] = "08efe232bca06a7c54462695bbc2f87c"
+SRC_URI[sha256sum] = "12a7a3c9f2d81e46b0c7095bb7c268ec4bf231178fcbe54ff0c30cd83d2ac38c"
 
 S = "${WORKDIR}/acpica-unix2-${PV}"
 
-- 
1.9.1


