Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id C94A87317E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Feb 2016 21:18:01 +0000 (UTC)
Received: by mail-wm0-f46.google.com with SMTP id g62so77368420wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Feb 2016 13:18:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=ix+pIHJCQidaeZ8zMsB3ibXn1Aw8KyZ3KvnstKZaLQM=;
	b=rs4Z+j1lo2cYGcTjagmS+jDHleA8M1war5rEZWUPWM6YoHqhkR5Q6fvmPMCuldZWOD
	OkvxE+ONKsWZ0ihEWVyriU11HIc3nA7T1lbKN38bGVPoj4u6kPRt2+KRrEk1QLVbR1YK
	awzVbfyKhq23mZTvve2CWP7hzqMeEVAYDV1ZSBf/gFsXOS+XhGOcJCpdAYGs2nvfWOip
	LxbZZevGmEy79Tj00eK+UQNAGx2CLtc8tTsPpcFyBpiYJqP7y/CsBzup/fibhOiAhv5Q
	lgWvgH3SO06rqittRR6EDkRKGNQA6d97m+VeSXN7/vyNegmerFplJkmWw3ERVFsRBjvH
	8rUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=ix+pIHJCQidaeZ8zMsB3ibXn1Aw8KyZ3KvnstKZaLQM=;
	b=SxYR0nbG1l7k8RWX1s+G0d/PmA2eji5UyHyqVmdFWEva5HeXWbtoDph818Iohnv6jc
	7XH6SmUy8ONAKyurdEY6XxRlu0ye9c9OPwu/FV/3PymWMkdLmNsdW+ZmHgXINmIcR5Zn
	WGpTPUM1LSEEbzRzrrHi4ZhUmPEMekjXGsc4E0yeYHv1skqV780yiI8L3l1xb0tnrEZB
	I0Ol2Hh1gWf0zGY1upXMDINoIDdboVGR99ZBikRPpmRY9YWcPN7NJqYvC4W3Y6W9syyb
	7l4F4qysUb1WIydu9f9Varw0BqPr7a056mQBmy4mezoE/N+kfalT1T4HVgfmNqH5kHvg
	jf/A==
X-Gm-Message-State: AG10YOTWJWeIAktWTq9PDG+MqqeIeLM/HDYngGegohXx0FM8mxUV8DCXjPlVKkVuoCfF3Q==
X-Received: by 10.28.173.208 with SMTP id w199mr13996508wme.45.1455571082027; 
	Mon, 15 Feb 2016 13:18:02 -0800 (PST)
Received: from localhost.localdomain (p5B0A09DF.dip0.t-ipconnect.de.
	[91.10.9.223]) by smtp.googlemail.com with ESMTPSA id
	t8sm25773276wjy.41.2016.02.15.13.18.01
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 15 Feb 2016 13:18:01 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 15 Feb 2016 22:17:50 +0100
Message-Id: <1455571071-10666-3-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1455571071-10666-1-git-send-email-schnitzeltony@googlemail.com>
References: <1455571071-10666-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 3/4] libsdl2-ttf: update to 2.0.14
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
X-List-Received-Date: Mon, 15 Feb 2016 21:18:02 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Licence checksum was changed by change of copyright year.

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../{libsdl2-ttf_2.0.12.bb => libsdl2-ttf_2.0.14.bb}           | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)
 rename meta-oe/recipes-support/libsdl-ttf/{libsdl2-ttf_2.0.12.bb => libsdl2-ttf_2.0.14.bb} (66%)

diff --git a/meta-oe/recipes-support/libsdl-ttf/libsdl2-ttf_2.0.12.bb b/meta-oe/recipes-support/libsdl-ttf/libsdl2-ttf_2.0.14.bb
similarity index 66%
rename from meta-oe/recipes-support/libsdl-ttf/libsdl2-ttf_2.0.12.bb
rename to meta-oe/recipes-support/libsdl-ttf/libsdl2-ttf_2.0.14.bb
index 47ce115..af5a55c 100644
--- a/meta-oe/recipes-support/libsdl-ttf/libsdl2-ttf_2.0.12.bb
+++ b/meta-oe/recipes-support/libsdl-ttf/libsdl2-ttf_2.0.14.bb
@@ -2,20 +2,19 @@ SUMMARY = "Simple DirectMedia Layer truetype font library"
 SECTION = "libs"
 DEPENDS = "virtual/libsdl2 freetype"
 LICENSE = "Zlib"
-LIC_FILES_CHKSUM = "file://COPYING.txt;md5=cdd16c6436d6b8fcbdd22a54d68c6dd3"
+LIC_FILES_CHKSUM = "file://COPYING.txt;md5=cb33e7c4df9fbde389f149ad6bc93ce5"
 
 SRC_URI = " \
     http://www.libsdl.org/projects/SDL_ttf/release/SDL2_ttf-${PV}.tar.gz \
     file://use.pkg-config.for.freetype2.patch \
 "
+SRC_URI[md5sum] = "e53c05e1e7f1382c316afd6c763388b1"
+SRC_URI[sha256sum] = "34db5e20bcf64e7071fe9ae25acaa7d72bdc4f11ab3ce59acc768ab62fe39276"
 
 S = "${WORKDIR}/SDL2_ttf-${PV}"
-#EXTRA_OECONF += "SDL_CONFIG=${STAGING_BINDIR_CROSS}/sdl-config "
 
 inherit autotools
 
-TARGET_CC_ARCH += "${LDFLAGS}"
-
 do_configure_prepend() {
     touch ${S}/NEWS ${S}/README ${S}/AUTHORS ${S}/ChangeLog
 
@@ -26,6 +25,3 @@ do_configure_prepend() {
         rm -f ${S}/acinclude/$i
     done
 }
-
-SRC_URI[md5sum] = "79787216b56cb4707f39d538f2225e00"
-SRC_URI[sha256sum] = "8728605443ea1cca5cad501dc34dc0cb15135d1e575551da6d151d213d356f6e"
-- 
2.5.0


