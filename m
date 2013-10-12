Return-Path: <david.turgeon@gmail.com>
Received: from mail-ie0-f171.google.com (mail-ie0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id 7EE566CF08
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 12 Oct 2013 14:01:13 +0000 (UTC)
Received: by mail-ie0-f171.google.com with SMTP id at1so10598962iec.2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 12 Oct 2013 07:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=mp/Mttx5RVyrV01UpXniSdNGgUg9sjbIvlfkHlYtmCo=;
	b=KH9P8En/2aofkHy6zDNMXmEiGRq/SA61lU79HS+WSA244ZWgxYO8gegct2pauVl/go
	wXofY1NW8VTticr/Qd8uNN4FO4q3mXZ0aPUqY6xSeUslIn+ZZ164/5G9FRP0c8vIGW0Q
	HKNkMZQ9WZKoSrhu14Yt6gLxiuaNR7Xli6Fgdd7JRz/1Et/lHt2DGCbXKsZl6kKGlCa8
	6oFqpd29GA3vdQ2bWQHmkwD68VBTpvLk+Ur7af8LmXvfu0JirhyHkYQ3YEhzpGoVyiyn
	TtS95nk5hk1dWyozmQI361jtfyVfQz8JC0VFbrTxkdAymFtPLpTb2iytKpzGxBoSqOyc
	mvLw==
X-Received: by 10.50.111.228 with SMTP id il4mr7025998igb.1.1381586474856;
	Sat, 12 Oct 2013 07:01:14 -0700 (PDT)
Received: from calysto.gateway.2wire.net (69-11-30-18.sktn.hsdb.sasknet.sk.ca.
	[69.11.30.18])
	by mx.google.com with ESMTPSA id p7sm8818848iga.3.1969.12.31.16.00.00
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 12 Oct 2013 07:01:14 -0700 (PDT)
From: David Turgeon <david.turgeon@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 12 Oct 2013 10:04:00 -0400
Message-Id: <1381586640-32671-1-git-send-email-david.turgeon@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Cc: David Turgeon <david.turgeon@gmail.com>
Subject: [meta-oe][PATCH] tftpd-hpa: fix premature exit
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
X-List-Received-Date: Sat, 12 Oct 2013 14:01:14 -0000

standalone daemon exits as recipe installs file as tftpd-hpa

* Changed script so it can consult /etc/default, as daemon name may be
 subject to change.
* Changed the default name to match the recipe

Signed-off-by: David Turgeon <david.turgeon@gmail.com>
---
 .../recipes-daemons/tftp-hpa/files/init            |   13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/meta-networking/recipes-daemons/tftp-hpa/files/init b/meta-networking/recipes-daemons/tftp-hpa/files/init
index 5ad8c52..9e18436 100644
--- a/meta-networking/recipes-daemons/tftp-hpa/files/init
+++ b/meta-networking/recipes-daemons/tftp-hpa/files/init
@@ -18,20 +18,21 @@ set -e
 
 PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
 DESC="HPA's tftpd"
-NAME=in.tftpd
-DAEMON=/usr/sbin/$NAME
-PIDFILE=/var/run/$NAME.pid
+NAME=in.tftpd-hpa
 SCRIPTNAME=/etc/init.d/tftpd-hpa
 
-# Gracefully exit if the package has been removed.
-test -x $DAEMON || exit 0
-
 # Read config file if it is present.
 if [ -r /etc/default/tftpd-hpa ]
 then
 	. /etc/default/tftpd-hpa
 fi
 
+DAEMON=/usr/sbin/$NAME
+PIDFILE=/var/run/$NAME.pid
+
+# Gracefully exit if the package has been removed.
+test -x $DAEMON || exit 0
+
 if [ "$RUN_DAEMON" != "yes" ] ; then
          echo "tftpd-hpa disabled in /etc/default/tftpd-hpa"
 	 exit 0
-- 
1.7.9.5


