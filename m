Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f170.google.com (mail-ea0-f170.google.com
	[209.85.215.170])
	by mail.openembedded.org (Postfix) with ESMTP id 560CF6BDBE
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 15:51:21 +0000 (UTC)
Received: by mail-ea0-f170.google.com with SMTP id h14so349912eak.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 08:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=MIKKxxNQVG5OaT1oTJg8yjaJZK4h3DHh6Gi5WIIeXkY=;
	b=rDnrb/EoYzgzhdsfO6+J3Y1WGE+G7zHdV2q0T3fmaZMhf6JIxSE8HH81q9hMmmQvBQ
	Qq0CRfg8UWyqlTEkklovy5HJzMdnWd5+xLby8Obrsat/siWs8Jades3opUmWvryHXxRo
	fafAbb9Zzdk4tf2v5oeq5GT+xWQTvjrDFDHtKEMmP07VIkUptBFRpJEc/NHB5p/cf8L5
	JqtWqXGD98vR0Sf/2aL++CgvqHkFAjcWEelg6Igs+vk3YZ6tf4uZfoRx2vIDw2UyPT+T
	EbBM7ZBgULeJQ5LuNc8DrDYRvB2c9mH2ijteJp6xZUmtsivr6iDC+5IqDwQD9UpRPZRN
	q82A==
X-Received: by 10.14.107.68 with SMTP id n44mr5432476eeg.26.1377791481785;
	Thu, 29 Aug 2013 08:51:21 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	t6sm47163385eel.12.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 29 Aug 2013 08:51:21 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 29 Aug 2013 17:51:17 +0200
Message-Id: <afb3d86cd598c9cbf08e20e3baca86495ab56a35.1377791377.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1377791377.git.Martin.Jansa@gmail.com>
References: <cover.1377791377.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1377791377.git.Martin.Jansa@gmail.com>
References: <cover.1377791377.git.Martin.Jansa@gmail.com>
Subject: [WIP][PATCH 24/66] cherokee: Add PACKAGECONFIG for ffmpeg and ldap
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
X-List-Received-Date: Thu, 29 Aug 2013 15:51:22 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-webserver/recipes-httpd/cherokee/cherokee_1.2.98.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-webserver/recipes-httpd/cherokee/cherokee_1.2.98.bb b/meta-webserver/recipes-httpd/cherokee/cherokee_1.2.98.bb
index 265e24e..0cc0104 100644
--- a/meta-webserver/recipes-httpd/cherokee/cherokee_1.2.98.bb
+++ b/meta-webserver/recipes-httpd/cherokee/cherokee_1.2.98.bb
@@ -18,6 +18,10 @@ SRC_URI[sha256sum] = "042b5687b1a3db3ca818167548ce5d32c35e227c6640732dcb622a6f4a
 
 inherit autotools pkgconfig binconfig update-rc.d systemd
 
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[ffmpeg] = "--with-ffmpeg,--without-ffmpeg,libav"
+PACKAGECONFIG[ldap] = "--with-ldap,--without-ldap,openldap"
+
 EXTRA_OECONF = "--disable-static \
                 --disable-nls \
                ${@base_contains('DISTRO_FEATURES', 'pam', '--enable-pam', '--disable-pam', d)} \
-- 
1.8.3.2


