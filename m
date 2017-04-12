Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wr0-f195.google.com (mail-wr0-f195.google.com
	[209.85.128.195])
	by mail.openembedded.org (Postfix) with ESMTP id D541A77D58
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Apr 2017 19:57:05 +0000 (UTC)
Received: by mail-wr0-f195.google.com with SMTP id l28so5817982wre.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Apr 2017 12:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=fCTubpGmI+Yfn4OuPDBl7N0nz/UpQwf+vPE835FU38k=;
	b=q1ZTI3H4cRS9ZvYe6RnEeWroUPokkAa5+WIdgzv5Gn1tTalMPQpSvNJsXoQGEi86Pc
	8K+tXNDCahC3gYVv15b3c0Fy31j6c0iTVbuGangXSgDgMga8AarhgNM+KSTe15zT1V7Y
	8h5LVXStz2GXgqvjIioWIyPqf2YGWdng1T/8RicSqwP9jPrCCeOZpYqWVsIfap5x4jUC
	ijn7T8HtXPjhxrUVt4Syoje/Oz7kNqKllrSMCc9aFrzFxDS/SxiV0OG0wUrBJ1UnFt78
	ta9O3NNPzQtQM8mwOJVG2w7EnORHjMLRmug+WInaM6lVtOjVzQnBL3G/LKE9b8Ca2TdW
	Xxgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=fCTubpGmI+Yfn4OuPDBl7N0nz/UpQwf+vPE835FU38k=;
	b=FLPtlce24YbcXVoJDnlKrZy7zJBxJWBSdLkswtsz2RMxZArXITf06ccRnommNy2I82
	npMApIp6fArTRBHcfAgZ0jQ8je2zXR6aQlnUk3acsW9HJeltNcgcS0gfF3hrTbEQVBba
	fRfd02qbpxpYqaANqHYgJZac91AlwHmf161HCq3+uB4XlswxKuXQROLxdQEkGztEV1gK
	nH5Zslite1BgyCb1pBBiYlb0gNl+HJS3MKjWURfvMUtiFt3VetPbJ3rdmuPzOxMUaQt3
	qGsF4AGJzM/miqD0ydLw2IsPcAbY3uGZWx4fQDN/56VLMBqqSPmoJYk5nbyKZ+AjNyxp
	4x5w==
X-Gm-Message-State: AN3rC/5HHW27t7wWGsTNhEHtU4zzaJ+nh3eLbktgoD335igHwask0NHMjqdVcIXz117keQ==
X-Received: by 10.223.157.23 with SMTP id k23mr4552567wre.28.1492027026897;
	Wed, 12 Apr 2017 12:57:06 -0700 (PDT)
Received: from PC192-168-2-116.speedport.ip
	(p20030046E911F1781E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:46:e911:f178:1e6f:65ff:fe3e:7f61])
	by smtp.googlemail.com with ESMTPSA id
	t100sm3522637wrc.24.2017.04.12.12.57.05
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 12 Apr 2017 12:57:06 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 12 Apr 2017 21:56:26 +0200
Message-Id: <20170412195638.3243-18-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20170412195638.3243-1-schnitzeltony@googlemail.com>
References: <20170412195638.3243-1-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 17/29] networkmanager: update 1.4.2 -> 1.4.4
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
X-List-Received-Date: Wed, 12 Apr 2017 19:57:06 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Have no idea what made license checksum change but it is still GPLv2+.

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../{networkmanager_1.4.2.bb => networkmanager_1.4.4.bb}            | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-connectivity/networkmanager/{networkmanager_1.4.2.bb => networkmanager_1.4.4.bb} (94%)

diff --git a/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.4.2.bb b/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.4.4.bb
similarity index 94%
rename from meta-oe/recipes-connectivity/networkmanager/networkmanager_1.4.2.bb
rename to meta-oe/recipes-connectivity/networkmanager/networkmanager_1.4.4.bb
index 90499a6..85098fe 100644
--- a/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.4.2.bb
+++ b/meta-oe/recipes-connectivity/networkmanager/networkmanager_1.4.4.bb
@@ -4,7 +4,7 @@ SECTION = "net/misc"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=cbbffd568227ada506640fe950a4823b \
                     file://libnm-util/COPYING;md5=1c4fa765d6eb3cd2fbd84344a1b816cd \
-                    file://docs/api/html/license.html;md5=6baf214193dfc5d10b297b41fc2d22c9 \
+                    file://docs/api/html/license.html;md5=8eb8e72bab097b9d11763002cb003697 \
 "
 
 DEPENDS = " \
@@ -33,8 +33,8 @@ SRC_URI = "${GNOME_MIRROR}/NetworkManager/${@gnome_verdir("${PV}")}/NetworkManag
            file://0005-sd-lldp.h-Remove-net-ethernet.h-seems-to-be-over-spe.patch \
            file://0001-check-for-strndupa-before-using-it.patch \
            "
-SRC_URI[md5sum] = "59b5b5585467756787c6cb535cbd306e"
-SRC_URI[sha256sum] = "a864e347ddf6da8dabd40e0185b8c10a655d4a94b45cbaa2b3bb4b5e8360d204"
+SRC_URI[md5sum] = "63f1e0d6d7e9099499d062c84c927a75"
+SRC_URI[sha256sum] = "829378f318cc008d138a23ca6a9191928ce75344e7e47a2f2c35f4ac82133309"
 
 S = "${WORKDIR}/NetworkManager-${PV}"
 
-- 
2.9.3


