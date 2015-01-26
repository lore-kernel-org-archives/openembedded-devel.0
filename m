Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id CCFAD7261A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Jan 2015 01:45:11 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t0Q1jCYs025603
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Jan 2015 17:45:12 -0800 (PST)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Sun, 25 Jan 2015 17:45:12 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Sun, 25 Jan 2015 17:45:09 -0800
Message-ID: <28a7fa6d132cd32b6ebf08e1dc6e77f4c0fd1a54.1422236615.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1422236615.git.liezhi.yang@windriver.com>
References: <cover.1422236615.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [meta-webserver] [PATCH 5/5] cherokee: add PACKAGECONFIG for geoip
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
X-List-Received-Date: Mon, 26 Jan 2015 01:45:11 -0000
Content-Type: text/plain

Fixed:
cherokee/rule_geoip.h:34:19: fatal error: GeoIP.h: No such file or directory

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../recipes-httpd/cherokee/cherokee_1.2.98.bb      |    1 +
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
1.7.9.5


