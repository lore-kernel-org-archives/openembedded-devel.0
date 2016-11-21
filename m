Return-Path: <Mark.Asselstine@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3C1F66FF0E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Nov 2016 18:42:36 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id uALIgbm9020382
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Mon, 21 Nov 2016 10:42:37 -0800
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 21 Nov 2016 10:42:36 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <openembedded-devel@lists.openembedded.org>, <joe_macdonald@mentor.com>
Date: Mon, 21 Nov 2016 13:42:35 -0500
Message-ID: <1479753755-30913-2-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1479753755-30913-1-git-send-email-mark.asselstine@windriver.com>
References: <1479753755-30913-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Subject: [meta-networking][PATCH 2/2] dnsmasq: allow for dnsmasq instances to reuse default dnsmasq.conf
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
X-List-Received-Date: Mon, 21 Nov 2016 18:42:37 -0000
Content-Type: text/plain

By defining 'listen-address' in the global dnsmasq.conf file we
prevent other instances of dnsmasq from using the global config as we
will get an error that the address is already in use. Instead we pass
'local-service' when we start the main dnsmasq instance which will
listen on the loopback address as well as any other local
subnets. This will allow the main dnsmasq instance to play nice with
other instances we might start for network-manager, libvirt, lxc...

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 .../recipes-support/dnsmasq/files/dnsmasq-noresolvconf.service          | 2 +-
 .../recipes-support/dnsmasq/files/dnsmasq-resolvconf.service            | 2 +-
 meta-networking/recipes-support/dnsmasq/files/dnsmasq.conf              | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-networking/recipes-support/dnsmasq/files/dnsmasq-noresolvconf.service b/meta-networking/recipes-support/dnsmasq/files/dnsmasq-noresolvconf.service
index 32f8e59..0c64fab 100644
--- a/meta-networking/recipes-support/dnsmasq/files/dnsmasq-noresolvconf.service
+++ b/meta-networking/recipes-support/dnsmasq/files/dnsmasq-noresolvconf.service
@@ -6,7 +6,7 @@ After=network.target
 Type=forking
 PIDFile=/run/dnsmasq.pid
 ExecStartPre=/usr/bin/dnsmasq --test
-ExecStart=/usr/bin/dnsmasq -x /run/dnsmasq.pid -7 /etc/dnsmasq.d
+ExecStart=/usr/bin/dnsmasq -x /run/dnsmasq.pid -7 /etc/dnsmasq.d --local-service
 ExecStop=/bin/kill $MAINPID
 ExecReload=/bin/kill -HUP $MAINPID
 
diff --git a/meta-networking/recipes-support/dnsmasq/files/dnsmasq-resolvconf.service b/meta-networking/recipes-support/dnsmasq/files/dnsmasq-resolvconf.service
index 07b4817..2980f7d 100644
--- a/meta-networking/recipes-support/dnsmasq/files/dnsmasq-resolvconf.service
+++ b/meta-networking/recipes-support/dnsmasq/files/dnsmasq-resolvconf.service
@@ -6,7 +6,7 @@ After=network.target
 Type=forking
 PIDFile=/run/dnsmasq.pid
 ExecStartPre=/usr/bin/dnsmasq --test
-ExecStart=/usr/bin/dnsmasq -x /run/dnsmasq.pid -7 /etc/dnsmasq.d
+ExecStart=/usr/bin/dnsmasq -x /run/dnsmasq.pid -7 /etc/dnsmasq.d --local-service
 ExecStartPost=/usr/bin/dnsmasq-resolvconf-helper start
 ExecStopPre=/usr/bin/dnsmasq-resolvconf-helper stop
 ExecStop=/bin/kill $MAINPID
diff --git a/meta-networking/recipes-support/dnsmasq/files/dnsmasq.conf b/meta-networking/recipes-support/dnsmasq/files/dnsmasq.conf
index bd0ee00..34d5135 100755
--- a/meta-networking/recipes-support/dnsmasq/files/dnsmasq.conf
+++ b/meta-networking/recipes-support/dnsmasq/files/dnsmasq.conf
@@ -77,7 +77,7 @@ bogus-priv
 #except-interface=
 # Or which to listen on by address (remember to include 127.0.0.1 if
 # you use this.)
-listen-address=127.0.0.1
+#listen-address=127.0.0.1
 
 # On systems which support it, dnsmasq binds the wildcard address,
 # even when it is listening on only some interfaces. It then discards
-- 
2.7.4


