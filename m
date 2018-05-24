Return-Path: <twoerner@gmail.com>
Received: from mail-it0-f52.google.com (mail-it0-f52.google.com
	[209.85.214.52])
	by mail.openembedded.org (Postfix) with ESMTP id 779C6749F0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 May 2018 14:39:31 +0000 (UTC)
Received: by mail-it0-f52.google.com with SMTP id 70-v6so2670638ity.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 May 2018 07:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=MNO3ZMOpWEEUumxAim5wthZwk2q8iV46Caofe0bMzak=;
	b=vgUP0BQtWyMFSxVHCS0IXE4nHAOgMN/9VyqCLfhn9Nhn4uOzy3z3d6CiUpkTK3Nkas
	I0AOzlvNECsJSGkQD+A80r2OrPx7BDP50lMpt6U2ku0xd3cme7XorEXWOuwQLKltP7N9
	Jh1yqU15u9NG3J8mKyeq+rbO44hsJDdBhGKkciQBLbJuNSWGEENo/sXzXYG1GqUyBz4r
	THHMPfoerw/eyWsVj2KeYSKZRAMYjkHEzTiv/la0qmmMzncdVes5CpNw/3TJwv8UBZJv
	dVkDUpsr5/5KXVjioiebwWHBaEvhKvVpDDtMpXfJmei/tjZPD45w0tGPTApkp1aOMxfA
	h/Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=MNO3ZMOpWEEUumxAim5wthZwk2q8iV46Caofe0bMzak=;
	b=Nx2MvLt59bd8ecB3eg9tHxZWpaEG6yK1ym0Txzt2lkyqpwk5nRssFadO5OvIo1OkBx
	hydQi7Qc83fY07up0V0uyKAvQTaHYT81NtNVrO18wiIga0GJ59y6/4oVTczAXOxwKi6h
	ZjJqWkbb7plkgDvbQDmTsSvcDZQtczbJLdEIo2+YXebtWv7trX2/4v3nnA1ZS0yAdLtn
	bAc3PWL/SCXGf+fNbEydhkk8z2zgrlvoySss7xuU1J/0w0ATv2WSu1vLBdBScY+BhY/b
	3+zE5LpiTZLkBCSQw+6gODEje9tjV0gtNkbxQHImkF2EdlgcPtSohtf97fy8eRKtCnvj
	jogw==
X-Gm-Message-State: ALKqPwf/rrOTVFQvXLzHkMdz30s789YkzoqSXgeJ1/4MDKvkPdbBWVQS
	VxCkeAsCC63cvcAVSRz3su56EUN5
X-Google-Smtp-Source: AB8JxZpFIGAexJz7jGpWaST85NBIdUmkndXnOJ+RB+fgkNMeIMAwC69XFwoNYPFcecVg6ip+zDatiw==
X-Received: by 2002:a24:584d:: with SMTP id
	f74-v6mr8718435itb.99.1527172772383; 
	Thu, 24 May 2018 07:39:32 -0700 (PDT)
Received: from linux-uys3.suse ([206.248.190.95])
	by smtp.gmail.com with ESMTPSA id
	a43-v6sm2435261itj.11.2018.05.24.07.39.30
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 24 May 2018 07:39:31 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 24 May 2018 10:38:53 -0400
Message-Id: <20180524143854.24096-17-twoerner@gmail.com>
X-Mailer: git-send-email 2.17.0.582.gccdcbd54c
In-Reply-To: <20180524143854.24096-1-twoerner@gmail.com>
References: <20180524143854.24096-1-twoerner@gmail.com>
Subject: [meta-oe][master-next][PATCH v3 16/17] opencv: rely on cmake.bbclass to put cmake package files in dev package
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
X-List-Received-Date: Thu, 24 May 2018 14:39:31 -0000

The cmake.bbclass in oe-core now ensures that ${libdir}/cmake and
${datadir}/cmake end up in the dev package, so recipes no longer need to
provide custom packaging rules to handles these files.

	http://git.openembedded.org/openembedded-core/commit/?id=d91dc4666683a96e9d03cbbd21b8a546f9069c93

Originally-conceived-by: Andre McCurdy <armccurdy@gmail.com>
Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 meta-oe/recipes-support/opencv/opencv_3.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/opencv/opencv_3.3.bb b/meta-oe/recipes-support/opencv/opencv_3.3.bb
index ca62de7c8f..1cadbdb533 100644
--- a/meta-oe/recipes-support/opencv/opencv_3.3.bb
+++ b/meta-oe/recipes-support/opencv/opencv_3.3.bb
@@ -167,7 +167,7 @@ PACKAGES_DYNAMIC += "^libopencv-.*"
 
 FILES_${PN} = ""
 FILES_${PN}-dbg += "${datadir}/OpenCV/java/.debug/* ${datadir}/OpenCV/samples/bin/.debug/*"
-FILES_${PN}-dev = "${includedir} ${libdir}/pkgconfig ${datadir}/OpenCV/*.cmake"
+FILES_${PN}-dev = "${includedir} ${libdir}/pkgconfig"
 FILES_${PN}-staticdev += "${datadir}/OpenCV/3rdparty/lib/*.a"
 FILES_${PN}-apps = "${bindir}/* ${datadir}/OpenCV"
 FILES_${PN}-java = "${datadir}/OpenCV/java"
-- 
2.17.0.582.gccdcbd54c


