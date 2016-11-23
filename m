Return-Path: <ross.burton@intel.com>
Received: from mail-wj0-f174.google.com (mail-wj0-f174.google.com
	[209.85.210.174])
	by mail.openembedded.org (Postfix) with ESMTP id 7AA6471A8A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Nov 2016 14:13:47 +0000 (UTC)
Received: by mail-wj0-f174.google.com with SMTP id qp4so10214289wjc.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Nov 2016 06:13:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=bXSU8oK58dHMCH4VqMOJ9W2Vqa1B+BechewkYdXzkPs=;
	b=rtjhGyXODYYxKmci1+KRGX4lhS5GGVRyjfrGOKxzAQKC4/3BbxDF3dX5WZzab2Cmtp
	sP7d8uJ0FEl7yL2M7cv+cK5qiH8DLJjbv8hS3CGa0jj1w0vpegWUZldez6gV0xUO9LiM
	wX8Z8YypXc8xD2KXUI3LV3MWEFsPnmRwIdQtDgX8JNvV5iMmfHwUpTSzsr/hGAnCCxh+
	aRcBUTy7HsEFVlHq6wsDmUxn1UJjw1ADw2B6WiUJ2b1CgrO6FT118j382PPWEBK0YmPY
	NSH8geoIdAcAgoTHQws/ETGWAlCBWVAtp7OF9PFkrd+S/qJT+/faFmMXfYn5BQv0LlTm
	jsWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=bXSU8oK58dHMCH4VqMOJ9W2Vqa1B+BechewkYdXzkPs=;
	b=TPTeXFWZO3c3TJKwLNhLQkBkCid1hYA7xcnIYFoAEuoRNLdaNJ8yYr07kmmNhTDTkW
	21aFLoOSdNqcWhQcDNoVKR0LZjEpbPsINzAU5w+ByUPvI/SssDGNI0XmeYvvclOuQeps
	/IWgYRFOWKavShZQJQY5IFnrLUGoEH6jn+DLZASalCkNFHNZsZ5JjOo6nhDDNuXyaYuZ
	aw5CN78RatMwLCF4tz/ttZa9QCGMHnyo9MveVEaXViD2ToTAqAH6XxAY0fFBZt/XcbE8
	OmoAmcKBE6CTIDbxwVR0w0j5mrS1nLxchZqhT6tAKC4J2kgG6IWwsTGiZQb5D63A7yjB
	JQNw==
X-Gm-Message-State: AKaTC03IQzqr6I6wLGrG2FOdiWt1G7baBDTJwegK7NicNE44taz44F7Be5sAikPQkoK5vVyA
X-Received: by 10.194.86.165 with SMTP id q5mr3378599wjz.178.1479910428007;
	Wed, 23 Nov 2016 06:13:48 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	cl10sm36665099wjb.4.2016.11.23.06.13.47
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 23 Nov 2016 06:13:47 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 23 Nov 2016 14:13:38 +0000
Message-Id: <1479910421-28750-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH 1/4] vala-dbus-binding-tool: remove redundant dependency on intltool
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
X-List-Received-Date: Wed, 23 Nov 2016 14:13:48 -0000

This upstream doesn't use intltool so don't depend on it.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../recipes-devtools/vala-dbus-binding-tool/vala-dbus-binding-tool.inc  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/vala-dbus-binding-tool/vala-dbus-binding-tool.inc b/meta-oe/recipes-devtools/vala-dbus-binding-tool/vala-dbus-binding-tool.inc
index 0745130..f7d480f 100644
--- a/meta-oe/recipes-devtools/vala-dbus-binding-tool/vala-dbus-binding-tool.inc
+++ b/meta-oe/recipes-devtools/vala-dbus-binding-tool/vala-dbus-binding-tool.inc
@@ -1,6 +1,6 @@
 DESCRIPTION = "Vala DBus Binding Tool"
 SECTION = "devel"
-DEPENDS = "vala libgee libxml2 intltool-native"
+DEPENDS = "vala libgee libxml2"
 HOMEPAGE = "http://wiki.freesmartphone.org/index.php/Implementations/vala-dbus-binding-tool"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
-- 
2.8.1


