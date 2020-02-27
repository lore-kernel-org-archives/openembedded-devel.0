Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
	[209.85.221.45])
	by mail.openembedded.org (Postfix) with ESMTP id BD81061892
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Feb 2020 22:13:02 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id c13so670411wrq.10
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Feb 2020 14:13:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=gadv3pybqunJPEGrF9fKpoEGp1rHJaxtih04W1MlgxY=;
	b=FQRecraUH/fKS5gKvK13JmDlQPsxHxxYqBEbj7f65qt3WdpnJO4GY/fKSdah1yj7tf
	7Jwy/HXYXQo2eB7SHIUuuHcZRKuQ0+8fcX4Sd51dt5/+0qFkPQCl2efmaq/OmXUNxN2U
	y6RdMCDkS4Twk1z+ZF0CP8jhBufeZhmVxP63WxrOzBVBUMOdCo7pP11ZIbT4Gv9oBv6d
	Uv0ea23qfjxzl9baUICvP1Bl2rumeH/99dWC45K4m0wNe66Di4/tAnB+EMhhiIX+glJH
	NrLPUR9uNKDwMiH8abA0RBMydX6Xw8ZqLQW2JLRexaoOEFOx+I+MI+jDVL/vEFSWyvjN
	8++Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=gadv3pybqunJPEGrF9fKpoEGp1rHJaxtih04W1MlgxY=;
	b=KpuTaUcS8EgahpmfdRYzxj1z5z8dhLO1q78y/mZdip0gAyLVH+o23ozS05xTfq0GFV
	9xtlbfpLOVDTDiJPVUTuaLbzCx3gbWcO2qiI2MtPbo6RffXBmjFVshMwOFV2fp0bCdmL
	dw91tHZP66yJIvBO79O4vrjAox4raYQFTy6WfjH1E+aGn4EPjwRlUjsTEhhUYA5GNRjo
	NI5hdNOj8gszNm/xUZn/6kR5rMBS2LAtGc7jhn4/DRnS84OPUunCtyJ/K1TfuZWsBv2k
	TibMlrnYOTljjtCO9uN15Sv00MRrldYapyT6aGgW29Nx034gEAotaz02OeZ0hVn7p0ly
	AfWA==
X-Gm-Message-State: APjAAAUiNXbcYTacZCs2o8b3sszXIm87lnbJYMvm6YbgLFFHcD6uVwe1
	Ffv0XIP9u/uDLGxprZW1jAbUWjSH
X-Google-Smtp-Source: APXvYqz1vXlkTCujTvP9ZN+jA5v5A2ti6aniHaebBCsKMM+bLc1JX59qVBeRpZs8AVJlpePhQlB6cA==
X-Received: by 2002:a5d:5706:: with SMTP id a6mr967553wrv.318.1582841583272;
	Thu, 27 Feb 2020 14:13:03 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F102C9262505CD5EB98F253.dip0.t-ipconnect.de.
	[2003:f0:7f10:2c92:6250:5cd5:eb98:f253])
	by smtp.gmail.com with ESMTPSA id y8sm8911422wma.10.2020.02.27.14.13.02
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 27 Feb 2020 14:13:02 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 27 Feb 2020 23:12:45 +0100
Message-Id: <20200227221245.22944-8-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200227221245.22944-1-schnitzeltony@gmail.com>
References: <20200227221245.22944-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 8/8] gmime: upgrade 3.2.5 -> 3.2.6
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
X-List-Received-Date: Thu, 27 Feb 2020 22:13:03 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../recipes-gnome/gmime/{gmime_3.2.5.bb => gmime_3.2.6.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-gnome/gmime/{gmime_3.2.5.bb => gmime_3.2.6.bb} (72%)

diff --git a/meta-oe/recipes-gnome/gmime/gmime_3.2.5.bb b/meta-oe/recipes-gnome/gmime/gmime_3.2.6.bb
similarity index 72%
rename from meta-oe/recipes-gnome/gmime/gmime_3.2.5.bb
rename to meta-oe/recipes-gnome/gmime/gmime_3.2.6.bb
index 568083bf3..9d1bb7d04 100644
--- a/meta-oe/recipes-gnome/gmime/gmime_3.2.5.bb
+++ b/meta-oe/recipes-gnome/gmime/gmime_3.2.6.bb
@@ -9,8 +9,8 @@ inherit gnomebase gobject-introspection
 SRC_URI += "file://iconv-detect.h \
             file://nodolt.patch"
 
-SRC_URI[archive.md5sum] = "98970e3995e67ac3f23827ff52308f9e"
-SRC_URI[archive.sha256sum] = "fb7556501f85c3bf3e65fdd82697cbc4fa4b55dccd33ad14239ce0197e78ba59"
+SRC_URI[archive.md5sum] = "656548dc431004d1ebf95e5d0bb4b9c8"
+SRC_URI[archive.sha256sum] = "abff194c7c4802fba2e233890d09dde8bf7170c3ad5e13000601c8d5b3c44717"
 
 export ac_cv_have_iconv_detect_h="yes"
 do_configure_append = "cp ${WORKDIR}/iconv-detect.h ${S}"
-- 
2.21.0


