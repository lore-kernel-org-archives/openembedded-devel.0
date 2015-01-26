Return-Path: <Chong.Lu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4FA54718E9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Jan 2015 06:44:41 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t0Q6iftM027665
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Jan 2015 22:44:42 -0800 (PST)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Sun, 25 Jan 2015 22:44:41 -0800
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 26 Jan 2015 14:39:40 +0800
Message-ID: <1422254380-30419-2-git-send-email-Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1422254380-30419-1-git-send-email-Chong.Lu@windriver.com>
References: <1422254380-30419-1-git-send-email-Chong.Lu@windriver.com>
MIME-Version: 1.0
Subject: [meta-webserver][PATCH 2/2] cherokee: Add a PACKAGECONFIG for cherokee
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 26 Jan 2015 06:44:45 -0000
Content-Type: text/plain

This solves the following warning:
WARNING: QA Issue: cherokee rdepends on geoip, but it isn't a build dependency?
[build-deps]

Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
---
 meta-webserver/recipes-httpd/cherokee/cherokee_1.2.98.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-webserver/recipes-httpd/cherokee/cherokee_1.2.98.bb b/meta-webserver/recipes-httpd/cherokee/cherokee_1.2.98.bb
index 054858e..451e97c 100644
--- a/meta-webserver/recipes-httpd/cherokee/cherokee_1.2.98.bb
+++ b/meta-webserver/recipes-httpd/cherokee/cherokee_1.2.98.bb
@@ -22,6 +22,7 @@ inherit autotools pkgconfig binconfig update-rc.d systemd
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[ffmpeg] = "--with-ffmpeg,--without-ffmpeg,libav"
 PACKAGECONFIG[ldap] = "--with-ldap,--without-ldap,openldap"
+PACKAGECONFIG[geoip] = "--with-geoip,--without-geoip,geoip"
 
 EXTRA_OECONF = "--disable-static \
                 --disable-nls \
-- 
1.9.1


