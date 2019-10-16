Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id A5F1D6C4D8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Oct 2019 22:48:25 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id z9so80657wrl.11
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Oct 2019 15:48:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=DlUx8KhttvpoxkUP/7PkZg/p9pZPaKvU/KnnQiWkJCQ=;
	b=gD+WJ3Ej4kWgL9Dp+GlPuPWHDmqSR0Ziq1AdejmsegorrVW/bKbOGQnDHrsogTlaII
	ioScOhXndLCqEj44bXndWmAgeDAFA+fhP2mM7aj9OFvdMYTBPrJsl3TDSA4ZBciQ/vr9
	Fw1sqJyRFcypzU7mVdUNqedLu8G5mx9RJJUPz80oAkiz+0/vnKEMJnwwvU8t152h/29f
	+WXFiZVOImZ2LBgbWYUqgDOuStekzlrDMHupxGZhokzyjrdgHWEGN3/AxBsQkarQlV3y
	LLQLcmog+9vOB/1rkFx4sA/XoI5RfQvN6hQdkDx6lTctpcEww9sT2OpmaQPYb1vTMEgh
	xPIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=DlUx8KhttvpoxkUP/7PkZg/p9pZPaKvU/KnnQiWkJCQ=;
	b=DPrObLRtwyQJ4sqSiGaoCNjAE8YKfFlBvYBuYaeZ9FMdvLu6EVZmbBEHbUbJJbKWqS
	lyRMgpTKSeNgRvcJj6fl0GdGSwTxILSho0ycD5w744QEZObgnXv0y6XEgcLO0LSiPsyt
	F9nchHKhsR2XQwmxET0JJZPHR8af+J74aD+t24vslhTcnGA+6SmIHUK0lFsNbcT3XAMu
	T7wg4kDE/f2GlZIsd7K690f2Lb2P/v5R+iK66owlv7LERcJHTYqVE4UE4LWOEsqatyKa
	ci9/22od4aIkKrj52M/w6li/tnBLmIcuGx/jRwtVBjruOhmYBGWw0wtNT+rAvX14NPLj
	nkBw==
X-Gm-Message-State: APjAAAW9IuCzbqzrHriCHkLF2fg5g3ooiJymGHEBBu12W7kg4Fpna5f8
	x5cVGvOKMQPUGskbZzC/FhALKMMI
X-Google-Smtp-Source: APXvYqx9Vf4vrdZS+aWkvxUMLenKkuYs5FDtxIuedBwJUYcK1vMhZE+ZXzEUvJsYLrncURG4uTmT5A==
X-Received: by 2002:a05:6000:1051:: with SMTP id
	c17mr202954wrx.124.1571266105859; 
	Wed, 16 Oct 2019 15:48:25 -0700 (PDT)
Received: from superandy.speedport.ip
	(p200300F07F0A1D63A9BE116FE394DBDF.dip0.t-ipconnect.de.
	[2003:f0:7f0a:1d63:a9be:116f:e394:dbdf])
	by smtp.gmail.com with ESMTPSA id d4sm276939wrc.54.2019.10.16.15.48.24
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 16 Oct 2019 15:48:25 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 17 Oct 2019 00:48:17 +0200
Message-Id: <20191016224817.16707-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH] libmbim: upgrade 1.18.0 -> 1.20.0
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
X-List-Received-Date: Wed, 16 Oct 2019 22:48:26 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fixes build errors that popped up by upgrade of glib-2.0 to 2.62.1 in
oe-core/master [1]

[1] http://lists.openembedded.org/pipermail/openembedded-core/2019-October/287944.html

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../libmbim/{libmbim_1.18.0.bb => libmbim_1.20.0.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-connectivity/libmbim/{libmbim_1.18.0.bb => libmbim_1.20.0.bb} (82%)

diff --git a/meta-oe/recipes-connectivity/libmbim/libmbim_1.18.0.bb b/meta-oe/recipes-connectivity/libmbim/libmbim_1.20.0.bb
similarity index 82%
rename from meta-oe/recipes-connectivity/libmbim/libmbim_1.18.0.bb
rename to meta-oe/recipes-connectivity/libmbim/libmbim_1.20.0.bb
index 9f59ad6b4..17d784766 100644
--- a/meta-oe/recipes-connectivity/libmbim/libmbim_1.18.0.bb
+++ b/meta-oe/recipes-connectivity/libmbim/libmbim_1.20.0.bb
@@ -14,5 +14,5 @@ inherit autotools pkgconfig bash-completion
 SRC_URI = "http://www.freedesktop.org/software/${BPN}/${BPN}-${PV}.tar.xz \
            file://clang.patch \
 "
-SRC_URI[md5sum] = "840cd133bc0f715a7ee4797dd9ac5562"
-SRC_URI[sha256sum] = "6cf40128d83d087946a7d8577e735526202e034d52f90047735329609097b282"
+SRC_URI[md5sum] = "b5506db07fb2a0b118e0d6e59b3d5b8f"
+SRC_URI[sha256sum] = "2cf7c6c7aa9e962a589f61bff2766035b61792ef961131a21fcbbe043f91a866"
-- 
2.21.0


