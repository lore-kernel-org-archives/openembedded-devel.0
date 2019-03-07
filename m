Return-Path: <damien.riegel@gmail.com>
Received: from mail-it1-f195.google.com (mail-it1-f195.google.com
	[209.85.166.195])
	by mail.openembedded.org (Postfix) with ESMTP id 17EFE7C7D6
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Mar 2019 21:11:21 +0000 (UTC)
Received: by mail-it1-f195.google.com with SMTP id 188so18189247itb.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Mar 2019 13:11:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=h9K4NUjCZi+oYKmVZhvYgBe/nkfSlg7eZmiGE+WGWvw=;
	b=D5NLDNWpjj+WvW01gIhUfsD5BVwNJvyy+uQ7w29VFk3Pcl/wQP3bawJFV6hbWDDUGG
	HIw/ET0qqQS5FORWdnwcLhfYFGVNctwBUKJYHa7WzeqqoSYxubZfOvOzfnox1uc3Mo1G
	IsgWA3hBZkUr0TTpvNGk1xNB7x3Ly+B6eGSlzD5cImNQCHdJjFLKh2zl2lV1r5CIKCF/
	hf0G9NUEJFRLxa/5ZSDrItD0/CdppenWOUbA/b1Ly5XUn3ZJZYgjqFir1g2Y4eDYofMa
	yWGiGdRHLhu0XO48lBQgOiYwyF+RJ6o71vmJ2v5psGETYGNTF1fle4OAum3zdTsvQoUy
	yPCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=h9K4NUjCZi+oYKmVZhvYgBe/nkfSlg7eZmiGE+WGWvw=;
	b=IWeGwLRmzOMdekl73P+84f7dv2x83rpiqCoxUCKDkYqOUfbkDCHAIQTd2KRWjSUCwL
	FiAvyR6OsUdVCVFegIj85R1u4I6S2M0P3QNy6UggtWQJmrkZy9uAp1o9zwqBWQNXgJJT
	5uKeP2664/g7c4awuMSbEZioByjAvFy8jhn/taJOmOb7THjNfoM2SSogGHpNxJYfAbpo
	Wp6IUHaMb0mwCssqpkBscMirn5SKefcwUES0oml8tM81hsJP0Bcs+r/T3brKrRSv1hIW
	wpb7CakoRxcQknvI4lrNJPlAiv3GtZa7KVvFvV7s5vtzhOvERY5eHt4o/isLA992Cpfq
	Wpjw==
X-Gm-Message-State: APjAAAXa444s3wl5CPuX0oi+hwXWKpvDoIJLYfpZdSzngSWAK8w8QeR9
	2QNpAd8qp3GGIHuwvLbTnzwy1AB5BGY=
X-Google-Smtp-Source: APXvYqzxldARd8rZcWfgg+Gk2lwxArQPrqc0FCgP7kh+oztdK4flEYTtmDIzTte3DBu3hnnh+rq6Xw==
X-Received: by 2002:a24:2203:: with SMTP id o3mr6196174ito.148.1551993082683; 
	Thu, 07 Mar 2019 13:11:22 -0800 (PST)
Received: from workotop.localdomain ([67.218.223.154])
	by smtp.gmail.com with ESMTPSA id
	p141sm3036343itb.39.2019.03.07.13.11.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 07 Mar 2019 13:11:22 -0800 (PST)
From: Damien Riegel <damien.riegel@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  7 Mar 2019 16:11:11 -0500
Message-Id: <20190307211112.30386-1-damien.riegel@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Cc: =?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@jci.com>
Subject: [meta-networking][thud][PATCH 1/2] mosquitto: fix build in systemd environments
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
X-List-Received-Date: Thu, 07 Mar 2019 21:11:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <andre.draszik@jci.com>

The mosquitto systemd service file instructs systemd to wait
for mosquitto to notify systemd that mosquitto has started
correctly. This isn't working as mosquitto is not *compiled*
with systemd support enabled. As such, systemd restarts
mosquitto every few seconds.

For reference, this was introduced in commit a483d344d9fb
("mosquitto: Make enabling systemd also enable build dep on systemd")

Because we build mosquitto using the provided Makefile
infrastructure, the solution is to add PACKAGECONFIG_CONFARGS
to EXTRA_OEMAKE, so that the required make flags are added
to the make command line.

Signed-off-by: André Draszik <andre.draszik@jci.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Damien Riegel <damien.riegel@gmail.com>
[Damien Riegel: backport from master]
---

This is a backport from master. Patch has been modified to apply cleanly
on the mosquitto_1.5.1.bb recipe.

 .../recipes-connectivity/mosquitto/mosquitto_1.5.1.bb            | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-connectivity/mosquitto/mosquitto_1.5.1.bb b/meta-networking/recipes-connectivity/mosquitto/mosquitto_1.5.1.bb
index b4adfdada..52252787d 100644
--- a/meta-networking/recipes-connectivity/mosquitto/mosquitto_1.5.1.bb
+++ b/meta-networking/recipes-connectivity/mosquitto/mosquitto_1.5.1.bb
@@ -38,6 +38,7 @@ EXTRA_OEMAKE = " \
     ${@bb.utils.contains('PACKAGECONFIG', 'ssl', 'WITH_TLS=yes WITH_TLS_PSK=yes', 'WITH_TLS=no WITH_TLS_PSK=no', d)} \
     ${@bb.utils.contains('PACKAGECONFIG', 'uuid', 'WITH_UUID=yes', 'WITH_UUID=no', d)} \
     ${@bb.utils.contains('PACKAGECONFIG', 'websockets', 'WITH_WEBSOCKETS=yes', 'WITH_WEBSOCKETS=no', d)} \
+    ${PACKAGECONFIG_CONFARGS} \
     STRIP=/bin/true \
     WITH_DOCS=no \
 "
-- 
2.21.0


