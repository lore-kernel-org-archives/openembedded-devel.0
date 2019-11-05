Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
	[209.85.221.54])
	by mail.openembedded.org (Postfix) with ESMTP id 9525F7F962
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Nov 2019 07:41:12 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id a11so20048119wra.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Nov 2019 23:41:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=LY/ZvuNbbKjn6uGhf/JUevBcbruIBShbZrWJyaad+fA=;
	b=Tbcjgtka5r20RKhmtk20mCor/hlv/cyvL62E/RG8BKJZIEEprvJVHkhMc6alnTuqUY
	J6ur+X59e9u4d6zBc5IqOLBfeiShrH/nCputL4oq7SWNKCpSL6jbkfVAPTApUwMajuWs
	EHsPk0zCYF14DJEJ9ufT8nkhmviAS8xRATm80L7q1rPYBiPALP3tfyDptYmX+c2xfFkS
	qaeXGP4aVC/QFXMTkNfPC0SoYdtQjk3bmM74ZDZ+qte3uqVMF6gVTbzvJ0Kk5nbKTMfz
	lzNwOGQ6Jxsw5c49hWuuGmfVGaoMPsDWYTBChRqlohXVPwRKYfB0kyhy8KLV5urOzgIC
	hRVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=LY/ZvuNbbKjn6uGhf/JUevBcbruIBShbZrWJyaad+fA=;
	b=J5MmoXzWKDQzlcwpWeFSrs5AG4SHKs2Np/y+f3xnsLLpvxAHXMzLFtUp1vR8hsmrDD
	kdENvqvIxxv1jS3TeilHljfJx1cNK6G38Uud+ARiwghX49/8wjjCUVhWW5T0cSmMB49L
	eOtJ1CDBGH4HNY/5eFIQ7InWOHhiFwFRp11VFZ9/fsL4VH56Bi6UALcNsEh9tG+Fb6Kh
	hB2xttb2XWJdt+yjhLsrdUP7skeY6Y1rb3e17Q9bS8093A9N4J4n8Yro9t+gqsrdfN47
	efIb9Z/16stvsmjzIhgn/vH+6JMgBZ9ejGs9s9UAJRKgka7weE43IqGlVDtbnqUbYryZ
	WWCQ==
X-Gm-Message-State: APjAAAXE+s9UOt6wQ45TU8Iidu5T4mcOCUn5FIJcUEUjSa9ueTY4/ktT
	Pr6FN1ZHPbYi2Zgey3HkIzsMfDCz
X-Google-Smtp-Source: APXvYqxHqqrQrBky0OTpA8XbQgj3GDZkm3FBUOKrGglwM4+sqHV/fgINrVqsKeVhljaaYOTWRihmjQ==
X-Received: by 2002:a5d:4e89:: with SMTP id e9mr14010926wru.342.1572939672208; 
	Mon, 04 Nov 2019 23:41:12 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F438C6391941C47DEED84EE.dip0.t-ipconnect.de.
	[2003:f0:7f43:8c63:9194:1c47:deed:84ee])
	by smtp.gmail.com with ESMTPSA id
	g5sm11168927wmf.37.2019.11.04.23.41.11
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 04 Nov 2019 23:41:11 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  5 Nov 2019 08:41:04 +0100
Message-Id: <20191105074104.24378-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH] Add gnome help packages to image according to IMAGE_LINGUAS
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
X-List-Received-Date: Tue, 05 Nov 2019 07:41:13 -0000
Content-Transfer-Encoding: 8bit

In case

* 'helpfiles' is in DISTRO_FEATURES and
* PACKAGE_NO_HELP_SPLIT is not set to '1'

those help packages matching language selections in IMAGE_LINGUAS are added to
image automatically.

For more details see:

[1] https://github.com/openembedded/meta-openembedded/blob/master/meta-gnome/classes/gnome-help.bbclass
[2] https://github.com/openembedded/openembedded-core/commit/3a9e9585aeb67234901b2f842113dbe20c3801b3
---
 meta-gnome/conf/layer.conf | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-gnome/conf/layer.conf b/meta-gnome/conf/layer.conf
index 862d622ee..996f4f64a 100644
--- a/meta-gnome/conf/layer.conf
+++ b/meta-gnome/conf/layer.conf
@@ -8,6 +8,8 @@ BBFILE_COLLECTIONS += "gnome-layer"
 BBFILE_PATTERN_gnome-layer := "^${LAYERDIR}/"
 BBFILE_PRIORITY_gnome-layer = "7"
 
+IMAGE_LINGUAS_COMPLEMENTARY_append = " *-help-%s"
+
 # This should only be incremented on significant changes that will
 # cause compatibility issues with other layers
 LAYERVERSION_gnome-layer = "1"
-- 
2.21.0


