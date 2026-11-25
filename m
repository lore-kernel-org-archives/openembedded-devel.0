Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.37928.1795594081329563779
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Nov 2026 00:08:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=DQkcWRWg;
 spf=pass (domain: gmail.com, ip: 74.125.82.172, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-386ab9ab619so6449165eec.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 00:08:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795594081; x=1796198881; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZrGs/CezG/m63QLkBT2LpcTcrG8C/cCeay4RD7m92W4=;
        b=DQkcWRWgwwHeOCDiyZp56rWJE7p1AHDfV4SyessT1HkYPySmE/3ZvI6bqCYQPS88QW
         A0xQgm6VXKGnJu9LyXzyxXO+FHLoS55vdg7WOXGc88a6w+59vWmmweG90eh2v9QzSG9y
         AAKLnzOhbtGCj44L/dqzAm898kBGcOYGM6KvS+uoXFjUVR0Qncu7QEGglmYA6A+dFgYd
         rZkHAPutibISqFOr3zgAFaNj1MRb/DQshBsFGZbR3AtN+bNAz0WGvFiG6DNgudviLId7
         5gKETe4s6uWwF+Zvg1Jwp+/g4w4kZj0uZ+pCg8z3+iP+uDghwjEEUqHBW8C8vp+srvra
         FozA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795594081; x=1796198881;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZrGs/CezG/m63QLkBT2LpcTcrG8C/cCeay4RD7m92W4=;
        b=j5Cx4WOAvzwoT8+voZdGH647gaWAaQKoDjkcskG2QHk5fV6S8S8RKNqf7wD3Nngmc6
         ZZlDhDU70DZAi9E50vAzMUWYIBFFq5r+IXonqGMPxpKgZIdJiukQTDMy+a5adqG7qHO6
         ZVdqyPfunLyFbK5vZqYdz68VQaRFxL/0eyKA+R/MbVfUbhsfPGpuyhlh5Ra+3c0tzSyr
         pehHrlhmTz2I419EWcdOZEJNlb03pZoJUAQZPT0awctYEk6cDgCtgGA90TVzERP1aSIn
         kXI9dUZBlabjsuHphmMok0O9/K2tNbI/eZ//7xLBmPWVPQGg+b3XIkm6fczw6vnnrvfw
         h75A==
X-Gm-Message-State: APuU4Z+Gy1Zcl72k7o/1akGP8q6C901HsKqZ5IIN/ZFGcFXRFFU99W+s
	bwEuqSLyVE1Nm9DDXPrp46K5yAp+Hc6rPTz9RDZipj5m7wcog0iFbNZ5au21U3Df
X-Gm-Gg: AZFdTZccSIWXOZEZqIe4shsxaInLQ+vwnnAPD7Cj4jLhdBrVXqPEna58UR5mXrZ527D
	muWyq0vBfZ7tSfQfFq7Mh4NgCuZ8aO6+J5forBH+uFqvVFKN6NZdurEatc5sQ67TU1pZzqZIx5M
	Je1HdJNXoaRf+QS2OMqLn6ydjO8SoteaUgXbJTNIe1i1N85HrOAnhm7+B1OXx3B4Treiz4aBA26
	n2iFYuMImzZrN9s+BsO4khmMMcg75FCvhOPELw66kPJiXozQWogOP5Jhdy2/EZc8qKwpwmcqpjT
	z3tZen4/fgBrB/fz2I8/C5gQVJuTmSzuZOdb7HNYx5S+/qHS1vibOaVbhDWvJBinhLdiibRzrWy
	9DX3vK5R3apFEG2ENB1lppPhuFTmk9D+FY8AuuIzmTdxBu2CUVpVPe7bYUMt8Ibg6a1CGDsT2y2
	Ky+wRz9g9GIhRi1fLunhIv+fliiW9KIKKzsBrXpPkuaf61U8vyMMBYgx62nIhbIVroSqkR0ej9z
	tclxam1JVWalNJL3zqFYBfwtZ4TKK2tVGIIhLXRbDfd2PWa0a3kLfhcUmxHW0OP6xFtJN87B508
	Xg5Wo3BhsrbsltIPD/+4cElFN/kSsoZ1Fc+cq0VXDPjroK7eKyrZbrPXsnehhFHueLsWEaB30x3
	GgBicRy4pYPkAiRCBixiFW+xZ/u6+Vku9Lvtvvy9KABsYsvveneSqWgdZBb2yTyq+XShOuvnHre
	sjjyq5YzMqxrONkDgQoovbAonhjklzlAHUl9b6HgLL5M+SuVRp4DE07gKRN/rOR+cNJxdkHUX3z
	QJvz3g+hiLOYh9Cyq3eVCDY4pRDa98aLXCQz7tHLkZoFHtfm+vaMB5L2vsI4tymopjJ1k8rBVuZ
	m0fq
X-Received: by 2002:a05:7301:78d:b0:385:bc4e:dbbf with SMTP id 5a478bee46e88-385bc4ee6c2mr16307632eec.37.1795594080618;
        Wed, 25 Nov 2026 00:08:00 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm90997971eec.3.2026.11.25.00.07.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:07:59 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 14/55] wxwidgets: upgrade 3.2.11 -> 3.2.12
Date: Wed, 25 Nov 2026 00:06:30 -0800
Message-ID: <20261125080732.2419614-20-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125080732.2419614-1-khem.raj@oss.qualcomm.com>
References: <20261125080732.2419614-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 08:08:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133017
Content-Type: text/plain; charset="utf-8"

- API and ABI compatible bug-fix release in the 3.2 stable branch
- Security: fix buffer overflow with invalid cached help books and
  handling of TGA files with invalid size
- wxGTK: implement wxTaskBarIcon using AppIndicator, use
  wxApp::SetClassName() as the Wayland app-id, fix a possible
  wxWebRequestCURL hang and a wxWebView memory leak
- Several wxHTML fixes (image maps, printing background, file types) and
  updated Unicode mapping tables
- Add wxPATH_RMDIR_PARENTS flag to wxFileName::Rmdir()

Stay on the 3.2 stable series; 3.3 is the development branch. Restrict
the upstream check to the stable (even) minor versions.

License-Update: docs/licence.txt replaces the FSF postal address with a link to gnu.org; terms unchanged
AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../wxwidgets/{wxwidgets_3.2.11.bb => wxwidgets_3.2.12.bb} | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-extended/wxwidgets/{wxwidgets_3.2.11.bb => wxwidgets_3.2.12.bb} (95%)

diff --git a/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.2.11.bb b/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.2.12.bb
similarity index 95%
rename from meta-oe/recipes-extended/wxwidgets/wxwidgets_3.2.11.bb
rename to meta-oe/recipes-extended/wxwidgets/wxwidgets_3.2.12.bb
index 51f3fdb39d..d6a8de6bdb 100644
--- a/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.2.11.bb
+++ b/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.2.12.bb
@@ -7,7 +7,7 @@ BUGTRACKER = "https://trac.wxwidgets.org/"
 # distributing the sources of an application using the library even in the
 # case of static linking.
 LICENSE = "LGPL-2.0-or-later WITH WxWindows-exception-3.1"
-LIC_FILES_CHKSUM = "file://docs/licence.txt;md5=981f50a934828620b08f44d75db557c6"
+LIC_FILES_CHKSUM = "file://docs/licence.txt;md5=7971b9ce85ba3665488582c8e9ec6188"
 
 inherit ${@bb.utils.contains('PACKAGECONFIG', 'qt', 'cmake_qt5', 'cmake', d)}
 inherit lib_package binconfig pkgconfig
@@ -25,9 +25,10 @@ SRC_URI = "gitsm://github.com/wxWidgets/wxWidgets.git;branch=3.2;protocol=https;
            file://0006-Fix-locale-on-musl.patch \
            file://0007-Set-HAVE_LARGEFILE_SUPPORT-to-1-explicitly.patch \
            "
-SRCREV = "749625e0ea4d70d1f75494aa52231d835531a618"
+SRCREV = "3b7c7fc839093ad28146bd17555af2565c792c96"
 
-UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
+# Even minor versions are the stable series
+UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+\.\d*[02468]\.\d+)$"
 
 # These can be either 'builtin' or 'sys' and builtin means cloned soures are
 # build. So these cannot be PACKAGECONFIGs and let's use libs where we can (see
