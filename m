Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wg0-f46.google.com (mail-wg0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 0A80C71922
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Oct 2014 22:14:54 +0000 (UTC)
Received: by mail-wg0-f46.google.com with SMTP id l18so25800wgh.17
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Oct 2014 15:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=KC842b1GqDBVrmHheYTw4KtFE6nFrdsJAch+o+1H0xU=;
	b=jULQvklWnjMZq/JeS6g7qiWDUNzgHeXhYAyPuopkcqrWoHZpraEjDeoSYqyj4a8ugN
	jyBmAhEhFJOFzwlyqfpW7CD7ILRIy0eFDkHBKUPEnjHjY2+W7WZNOcmRXacKbqimBK0q
	X4avyStuQteeVjgdwGQSo76mfQXAL6WTvbj2HnYrqatPVEdey3GZAczOUy4tnLR4tS3X
	yvOtCdDx/j1S0Up8ErjfsEHfqCCpl43qvLmj94YeoBCx7q4LT8h3XPKYuUaPE6RJRADw
	hfOs5Atg752jYkK7U6v+9zAyKXR2gofwmyQA8oOVZYqF/pMGsuE0MLuksHRpmSdsntzn
	CclQ==
X-Received: by 10.180.96.226 with SMTP id dv2mr7941264wib.49.1413324895320;
	Tue, 14 Oct 2014 15:14:55 -0700 (PDT)
Received: from localhost.localdomain
	(ip-176-198-252-150.hsi05.unitymediagroup.de. [176.198.252.150])
	by mx.google.com with ESMTPSA id
	eg8sm17132892wib.15.2014.10.14.15.14.54
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 14 Oct 2014 15:14:54 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 15 Oct 2014 00:14:28 +0200
Message-Id: <1413324868-11856-16-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1413324868-11856-1-git-send-email-schnitzeltony@googlemail.com>
References: <1413324868-11856-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 15/15] libgphoto2: add bash to RDEPENDS
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
X-List-Received-Date: Tue, 14 Oct 2014 22:14:55 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

fix

libgphoto2-2.4.11: libgphoto2 requires /bin/bash, but no providers in its RDEPENDS [file-rdeps]

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-graphics/gphoto2/libgphoto2_2.4.11.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.4.11.bb b/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.4.11.bb
index ec96920..523efa7 100644
--- a/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.4.11.bb
+++ b/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.4.11.bb
@@ -48,6 +48,7 @@ do_install_append() {
 PACKAGES =+ "libgphotoport libgphoto2-camlibs"
 FILES_libgphoto2-camlibs = "${libdir}/libgphoto2*/*/*.so*"
 RRECOMMENDS_${PN} = "libgphoto2-camlibs"
+RDEPENDS_${PN} = "bash"
 
 FILES_libgphotoport = "${libdir}/libgphoto2_port.so.*"
 
-- 
1.8.3.1


