Return-Path: <straka.derek@gmail.com>
Received: from mail-yw0-f193.google.com (mail-yw0-f193.google.com
	[209.85.161.193])
	by mail.openembedded.org (Postfix) with ESMTP id 15B2176420
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Apr 2016 03:41:22 +0000 (UTC)
Received: by mail-yw0-f193.google.com with SMTP id p65so9612901ywb.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Apr 2016 20:41:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=cPx6xCVqbntQ6m3wy8XXTFnNv+PSCYAXp+s3PI1iPKc=;
	b=jf5opgF/leNM8Gcpf8oPhfOphIAYpiw6OX/sFMoUKDJY0Blc16jA5LeSPUs4/9uL3P
	YH1AJwp0oR9qCwW+eqdczd7BQjN7ovqpjvf0rxL4FdJo4voAphIfKsJajIXUWkQk4YJ0
	lt2LZBJB4lLqt/kYI/s0hKW4eSYg4JYPhAsaJJ07gzWYr2epgPW4FPLL2HKrOkyzNr6G
	KAgeBXnRDaVAsX0b9MPbkuEFRqpTbe+1C3Vv7ht6LCmpH79ZLHtGLqL7gYhQ0F/3ABrr
	UDLoGJvXntfJe8fn/hEkI8EOnBCpwKHArJFjv2ilYaaIjmcbQAMXp73QAQte4cXETNU2
	Vc3g==
X-Gm-Message-State: AD7BkJKDfAd3pjegOjrM411E4xWpxVd9/u9e7ocGu8uTxv9tsrUcdybvWX4an+ci8V8tGg==
X-Received: by 10.13.226.211 with SMTP id l202mr308097ywe.294.1459997331487;
	Wed, 06 Apr 2016 19:48:51 -0700 (PDT)
Received: from localhost.localdomain ([12.166.78.2])
	by smtp.gmail.com with ESMTPSA id
	d140sm3666112ywb.48.2016.04.06.19.48.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 06 Apr 2016 19:48:50 -0700 (PDT)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  6 Apr 2016 22:48:14 -0400
Message-Id: <1459997302-25271-3-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1459997302-25271-1-git-send-email-derek@asterius.io>
References: <1459997302-25271-1-git-send-email-derek@asterius.io>
Cc: Derek Straka <derek@asterius.io>
Subject: [meta-perl][PATCH 03/11] libclass-method-modifiers-perl: update to 2.11
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
X-List-Received-Date: Thu, 07 Apr 2016 03:41:24 -0000

Signed-off-by: Derek Straka <derek@asterius.io>
---
 ...-modifiers-perl_2.11.bb => libclass-method-modifiers-perl_2.12.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-perl/recipes-perl/libclass/{libclass-method-modifiers-perl_2.11.bb => libclass-method-modifiers-perl_2.12.bb} (84%)

diff --git a/meta-perl/recipes-perl/libclass/libclass-method-modifiers-perl_2.11.bb b/meta-perl/recipes-perl/libclass/libclass-method-modifiers-perl_2.12.bb
similarity index 84%
rename from meta-perl/recipes-perl/libclass/libclass-method-modifiers-perl_2.11.bb
rename to meta-perl/recipes-perl/libclass/libclass-method-modifiers-perl_2.12.bb
index 93d6e54..3979b31 100644
--- a/meta-perl/recipes-perl/libclass/libclass-method-modifiers-perl_2.11.bb
+++ b/meta-perl/recipes-perl/libclass/libclass-method-modifiers-perl_2.12.bb
@@ -10,8 +10,8 @@ LICENSE = "Artistic-1.0 | GPL-1.0+"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=16fd0ec7b73c0e158426f753943f1058"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/E/ET/ETHER/Class-Method-Modifiers-${PV}.tar.gz"
-SRC_URI[md5sum] = "c6982e9e89325713d5afaff82cfe1744"
-SRC_URI[sha256sum] = "debf979fbd9ac25cc6fe7d1cab81103c60a21f7027d2a9b4bf5cb264e313d392"
+SRC_URI[md5sum] = "f55400c7a8134acf3657f8af89bdd7af"
+SRC_URI[sha256sum] = "e44c1073020bf55b8c97975ed77235fd7e2a6a56f29b5c702301721184e27ac8"
 
 S = "${WORKDIR}/Class-Method-Modifiers-${PV}"
 
-- 
1.9.1


