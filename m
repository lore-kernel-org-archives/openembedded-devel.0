Return-Path: <straka.derek@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id 9B718774FD
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Feb 2017 22:06:02 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id r45so3254753qte.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Feb 2017 14:06:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=KLudkPGINCt9lt+lQkZLTWiG8L7OI0YZzrKA/GpSQCI=;
	b=uMZSgU3T5KLjw1Ze02ALow3RTIQoVO+jd+7uPX6IuyOEb5DRlKIz7LOBNfExS9SECz
	Yb0qFz8c0DFvHFUwjT19/7aYd2Qx7xT48ORRGAvFtWUWpKeq9XHnk0nZt1HtWjSet1zY
	T3vjL8NhaVEXmPgSt+NgLAy8B9tW/e0OqbUOkNqrdQfXSOwi952hc9Hj2itgGG7TcEwS
	bAbIir1s/ev8YUxkHkhONAbVsMTkvU/1xHVvKqhpNWwhcYC6D74wSB7pWXt/NzrWiVfv
	OSw6m7u8r+hJLdQ6uzLmoBBgcvv7BROj6o/EQxgH+wLOECnxAqbKhxKadFKO/mpCc7je
	Eu5g==
X-Gm-Message-State: AMke39lSELkxU87yt9EKtsekO6uIeegHqXeiGJWfvbf3L4DbS1WiDNGQeKuNUkQOJ16X7Q==
X-Received: by 10.200.47.46 with SMTP id j43mr5020503qta.178.1487973964142;
	Fri, 24 Feb 2017 14:06:04 -0800 (PST)
Received: from sparta.ny.asterius.io (ool-435561e0.dyn.optonline.net.
	[67.85.97.224]) by smtp.gmail.com with ESMTPSA id
	c19sm5622748qtc.29.2017.02.24.14.06.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 24 Feb 2017 14:06:03 -0800 (PST)
From: Derek Straka <derek@asterius.io>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 24 Feb 2017 17:05:56 -0500
Message-Id: <1487973956-9430-1-git-send-email-derek@asterius.io>
X-Mailer: git-send-email 2.7.4
Subject: [meta-filesystems][PATCH] xfsprogs: update depends to work correctly with RSS
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
X-List-Received-Date: Fri, 24 Feb 2017 22:06:04 -0000

Resolves build issue exposed by RSS
See http://errors.yoctoproject.org/Errors/Details/130663/

Signed-off-by: Derek Straka <derek@asterius.io>
---
 meta-filesystems/recipes-utils/xfsprogs/xfsprogs_4.8.0.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_4.8.0.bb b/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_4.8.0.bb
index b4c50a2..f527237 100644
--- a/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_4.8.0.bb
+++ b/meta-filesystems/recipes-utils/xfsprogs/xfsprogs_4.8.0.bb
@@ -15,6 +15,7 @@ inherit autotools-brokensep
 
 PACKAGES =+ "${PN}-fsck ${PN}-mkfs ${PN}-repair libhandle"
 
+DEPENDS += "util-linux"
 
 RDEPENDS_${PN} = "${PN}-fsck ${PN}-mkfs ${PN}-repair"
 
@@ -54,5 +55,3 @@ do_configure_prepend () {
 do_install_append() {
         oe_runmake 'DESTDIR=${D}' install install-dev
 }
-
-PNBLACKLIST[xfsprogs] ?= "Fails to build with RSS http://errors.yoctoproject.org/Errors/Details/130663/"
-- 
2.7.4


