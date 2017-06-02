Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id BD81F77EA5
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Jun 2017 15:55:22 +0000 (UTC)
Received: by mail-wm0-f54.google.com with SMTP id b84so29027892wmh.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 02 Jun 2017 08:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=brj1qoJuUcrkwE6yyR6lkppkvdW/lS3rI5Hq0pcsyUc=;
	b=0vFRoCUXtZDeq21x96VCHl5S7nYfKIxF36OwbLOz3JJ32sCcvpLeexDjGZPoKjbHau
	CIddVUOao1cXkERQYzogL6KXWtnBTYA0mHc4ZZi5cwTZ4cIgqXp85WvUEpVWUV6UNk41
	DWjmIf0eKH9Ycv4mbAtcH4o5hUSLJ8RaKhnrF0bKQq92Aoh95G4uXHubY1fkNNT95Lbe
	7N4BhjU5WtLyz7OyTwtfvyaFc4KtjFFGk2059wwgCD1vz39FJ0z9ZDvfMCumgrz+Razt
	xlahS6XSofkgCzLHfqnTObElQlk27TZQMzXXll/7EDCjcNURXwNgRKBZcvkaSGdBW2EI
	6RSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=brj1qoJuUcrkwE6yyR6lkppkvdW/lS3rI5Hq0pcsyUc=;
	b=j03VkszTWFWJuL2iT7GfhkKjVji6qYD0uQKuneXJGvYzqUISSV+beGZ3QD59nilpDZ
	W4dEyKE/W7LjTd93gPxifOmprw47Z0dSDKXrCXlq1jj/JsAi6zCV4Gi7M4143gG+Al/X
	Zm9dweNepaKKiqZekWH1bajcP8hJm3L6ZmkhNZrn1fXaVLpp74MCtix1tMbvm0Ww3o1l
	XJ6wJWdut//9uVj84BgugLA45Zw+8GGXNpayW9O8nY0EsiHACYhMBpAJiA1Nz20iDlXY
	cvMoWoKP3zkFvfIAe2XW4oe/wbRy+nCOv8xRje9XjDSY8mPqFijhHJOhuwSgVryKeQJd
	d90w==
X-Gm-Message-State: AODbwcDP++C7/bdxObza7Y875W7g9O/gdrlkltk5vNiAYi7Mpkx7JkqW
	qJXgJ2v4V90PuoqDHyY=
X-Received: by 10.28.71.147 with SMTP id m19mr4379wmi.92.1496418923219;
	Fri, 02 Jun 2017 08:55:23 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id m14sm2940059wmi.2.2017.06.02.08.55.22
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 02 Jun 2017 08:55:22 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  2 Jun 2017 16:55:16 +0100
Message-Id: <1496418916-17305-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1496418916-17305-1-git-send-email-ross.burton@intel.com>
References: <1496418916-17305-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 2/2] meson: set native tools
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
X-List-Received-Date: Fri, 02 Jun 2017 15:55:23 -0000

When cross-compiling meson respects the usual CC, CFLAGS and so on environment
variables for *native* tools not *cross* tools, so instead of unexporting CC we
should re-export the right tools.

Not only is this the right thing to do, but recent changes to oe-core means that
the default compiler binary (cc) isn't in PATH, so Meson can't build native
binaries.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta-oe/classes/meson.bbclass | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/meta-oe/classes/meson.bbclass b/meta-oe/classes/meson.bbclass
index 42f4005..0cf78e4 100644
--- a/meta-oe/classes/meson.bbclass
+++ b/meta-oe/classes/meson.bbclass
@@ -9,9 +9,13 @@ do_configure[cleandirs] = "${B}"
 # Where the meson.build build configuration is
 MESON_SOURCEPATH = "${S}"
 
-# These variables in the environment override the *native* tools not the cross,
-# so they need to be unexported.
-CC[unexport] = "1"
+# These variables in the environment override the *native* tools not the cross
+CPPFLAGS = "${BUILD_CPPFLAGS}"
+CC = "${BUILD_CC}"
+CFLAGS = "${BUILD_CFLAGS}"
+CXX = "${BUILD_CXX}"
+CXXFLAGS = "${BUILD_CXXFLAGS}"
+LDFLAGS = "${BUILD_LDFLAGS}"
 
 def noprefix(var, d):
     return d.getVar(var, True).replace(d.getVar('prefix', True) + '/', '', 1)
-- 
2.8.1


