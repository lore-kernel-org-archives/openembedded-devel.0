Return-Path: <koen@dominion.thruhere.net>
Received: from mail-we0-f174.google.com (mail-we0-f174.google.com
	[74.125.82.174])
	by mail.openembedded.org (Postfix) with ESMTP id B8A956C9B4
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Jan 2014 15:28:30 +0000 (UTC)
Received: by mail-we0-f174.google.com with SMTP id q58so287181wes.33
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Jan 2014 07:28:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=gGHi5UQO8IPtE2VZibtrhJlcNfzgYRzfo048ENEgpsI=;
	b=diTJbm8MvBSWv7UbhG8ep4G9OskXbcFx06ZFu44YXn1Lqm2NOrdFdA4KR9LrBxb8r1
	oguAgZillb8uA7LaVyUQFf2VIYy8woWWY7bvNTChW+o2T3ZDZHgP5B551/+Kbbn7h6iN
	oUWcwIjP8/aOqAzU7IHCKMbKnB3uLtsLqNkn2hJc6cKbriLpaQ1CZcXx5nJDhQpk8EY8
	fhWsysXnruBCVCl6Q8Ty3pZ6rk4fUfbhvL5UeKozhaddk/HPUTWOo/EHfYru42DB/y8x
	+bybGEZPp5l7hn4HgXc7RgkegemFa7vJlpNzBIo6XEkuJ8gm5vK/xsL01dOFx4JO7sCY
	goxw==
X-Gm-Message-State: ALoCoQlFr6Hq7TKLKVf6ien/itqEChdCMj7BAodmwLs4NQ7mz5izh8B2wAfF7KKQ8OruwIHuWip/
X-Received: by 10.195.13.164 with SMTP id ez4mr76908792wjd.11.1389108511112;
	Tue, 07 Jan 2014 07:28:31 -0800 (PST)
Received: from localhost ([2001:610:612:0:21c:42ff:fef0:7f75])
	by mx.google.com with ESMTPSA id
	bj3sm45671049wjb.14.2014.01.07.07.28.29 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 07 Jan 2014 07:28:30 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  7 Jan 2014 16:28:28 +0100
Message-Id: <1389108508-7299-1-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.8.4.2
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCHv5] irssi: add 0.8.16-rc1
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
X-List-Received-Date: Tue, 07 Jan 2014 15:28:31 -0000

From: Krzysztof Sywula <krzysztof.m.sywula@intel.com>

irssi is a text mode IRC client.

Signed-off-by: Krzysztof Sywula <krzysztof.m.sywula@intel.com>
Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 .../recipes-connectivity/irssi/irssi_0.8.16-rc1.bb  | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/irssi/irssi_0.8.16-rc1.bb

diff --git a/meta-oe/recipes-connectivity/irssi/irssi_0.8.16-rc1.bb b/meta-oe/recipes-connectivity/irssi/irssi_0.8.16-rc1.bb
new file mode 100644
index 0000000..7880a06
--- /dev/null
+++ b/meta-oe/recipes-connectivity/irssi/irssi_0.8.16-rc1.bb
@@ -0,0 +1,21 @@
+SUMMARY = "ncurses IRC client"
+DESCRIPTION = "Irssi is an ncurses IRC client"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=55fdc1113306167d6ea2561404ce02f8"
+
+DEPENDS = "glib-2.0 ncurses openssl"
+
+REALPV = "0.8.16-rc1"
+PV = "0.8.15+${REALPV}"
+
+SRC_URI = "http://irssi.org/files/irssi-${REALPV}.tar.gz"
+
+SRC_URI[md5sum] = "769fec4df8e633c583c411ccd2cd563a"
+SRC_URI[sha256sum] = "bb6c0125db30b697f80837941c17372b7484c64d57a6920b8bfa7ee3def92de3"
+
+S = "${WORKDIR}/irssi-${REALPV}"
+
+inherit autotools
+
+EXTRA_OECONF = "--enable-ssl"
+
-- 
1.8.4.2


