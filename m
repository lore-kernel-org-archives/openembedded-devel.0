Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by mail.openembedded.org (Postfix) with ESMTP id 194267E16D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 May 2019 03:56:55 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id i21so7819362pgi.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 May 2019 20:56:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=auWIfJfADhIItNHCRzJdEZ4AHIu+/zM93dIG8UBplQc=;
	b=ogDe0pk6xf7ntd/dNwFOlJxJwhvEBGqlonyfia9My3dKJaIbZSj2wLjkt8bH+2Q81d
	TSd5frJKVQJy3ifn4hjVU+s0eU6BFceXa9onL1XyWPRAvKJU+Uo0mCL+PDclx/IpwLJK
	ghTCSCSlSO3IxP8W/OFz0/2jsLe7DiM7dF/fPk5fvlVWz++2kh+V0cZN7PVZLWpFtRvx
	ILi1a/grsDp/Wt5GDOgRHGg9RO3YXIvrww3MpmUZjdBAFP1EBttiPjVAFBNYHOFIbxZi
	3u3G7gY0XERUrJWpzebKz536xeay830ud8tjxzmixTg2nGbMWW09zUd9h9UmgE2rBypq
	NuDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=auWIfJfADhIItNHCRzJdEZ4AHIu+/zM93dIG8UBplQc=;
	b=JT/VgXGkDo4gAHdhTvc8SXTeLVQiwlHWxguNmIhrHICrFJEJ0dbrgGHcr6v+BdYqIs
	ypQPzIFBZlK1+wSzuB5PzS/2jmEwcLPYwxRjH8Y4KOK291iQgowHK7Itezc2Qie2NbCx
	zouAp4QAl8jJ5xpygxNyUcdfdh/LcglQm/n0oAGbRPjjcg3pwC6QDSUneeXaBGm5SDKS
	jtDriXsjuOZDnq6HTROFo2erTjNa56dnd6cVv8n1l+NUIGQd8ijXa2m0Spw4K04hxFLb
	nkwYOin9ofViMD5umYY/S9o+iHkS8Jn3/Ywa/hUvphQ7V4weLFfqQ99Z8dLo/SkRQjnf
	vHsA==
X-Gm-Message-State: APjAAAWIGe0HcAmIIfS3wEXHncXtzdJjzneFZgzqf9scDIl2Hm/+SH91
	SQ3R3eBW7UUpJ+xDTtko+k8VfAXt
X-Google-Smtp-Source: APXvYqzY8P3GWsRECVvt1la/H8apwYKHVP4OhsISrv2axg/dXouV0IyUZXLQ2ztLEe6p36OUYhEV+Q==
X-Received: by 2002:aa7:8b12:: with SMTP id f18mr20368469pfd.178.1558411016964;
	Mon, 20 May 2019 20:56:56 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:199d:e2fe:5a4f:97f4])
	by smtp.gmail.com with ESMTPSA id
	h13sm23045273pfo.98.2019.05.20.20.56.56
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 20 May 2019 20:56:56 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 May 2019 20:56:23 -0700
Message-Id: <9923b210b46f167f57c563491ef2527fe2a61bd4.1558410874.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1558410874.git.akuster808@gmail.com>
References: <cover.1558410874.git.akuster808@gmail.com>
MIME-Version: 1.0
Subject: [warrior][patch 23/34] itstool: rework - it went out too early
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
X-List-Received-Date: Tue, 21 May 2019 03:56:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Andreas Müller <schnitzeltony@gmail.com>

* adjust dependencies
* adjust shebang correctly - caused errors not easy to debug in dependent
  packages

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-support/itstool/itstool_2.0.5.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-support/itstool/itstool_2.0.5.bb b/meta-oe/recipes-support/itstool/itstool_2.0.5.bb
index b74d5f6..166e95b 100644
--- a/meta-oe/recipes-support/itstool/itstool_2.0.5.bb
+++ b/meta-oe/recipes-support/itstool/itstool_2.0.5.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59c57b95fd7d0e9e238ebbc7ad47c5a5"
 
 inherit autotools python3native
 
-DEPENDS = "python3-native python3-lxml-native"
+DEPENDS = "python3-lxml-native"
 
 SRC_URI = "http://files.itstool.org/${BPN}/${BPN}-${PV}.tar.bz2"
 SRC_URI[md5sum] = "655c6f78fc64faee45adcc45ccc5a57e"
@@ -13,10 +13,10 @@ SRC_URI[sha256sum] = "100506f8df62cca6225ec3e631a8237e9c04650c77495af4919ac6a100
 
 do_install_append() {
     # fix shebang of main script
-    sed -i 's:${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN}:${bindir}/${PYTHON_PN}:g' ${D}${bindir}/itstool
+    sed -i 's:^#!${WORKDIR}.*${PYTHON_PN} -s:#!${bindir_native}/${PYTHON_PN} -s:' ${D}${bindir}/itstool
 }
 
 BBCLASSEXTEND = "native"
 
-RDEPENDS_${PN} += "python3 python3-lxml"
+RDEPENDS_${PN} += "python3-lxml"
 
-- 
2.7.4


