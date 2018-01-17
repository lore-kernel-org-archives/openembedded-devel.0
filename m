Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id D50E278695
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Jan 2018 08:34:56 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id 81so20712343wmb.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Jan 2018 00:34:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=qbKmrhOOSxkMTrdPrnLXVfstGqif3keu9HWfZ9dn7jI=;
	b=DhedJllwA9L6HLn1vTy7IUfFPIay8iMC9Oqsriwea75hYk5lpZnjyZ+1LIZD2sBMgF
	IKtVIh8q+rWpCOjapzBdwXKw8UchUlxrvT/CY+wbQ0foYWuxvz1kauHy0/wLKhmurBg9
	yztj8vq+t1bUvTU50h/XyM9ea6eU183iF4J6Jfb63VjUoz+gS8Yia4nmfOuW/DP05dhr
	hbdJNi7egmOcYIqtCnDr8BXh3jn2sq7SBSxQ7fG4KZIurMdLIPjdlx7RxY4Y9S0pk5TM
	qGF12NpwhGGmDDQU5AiDtecf9eR5y9xzNtqGGnPWjK4KWDT2VRp7i8/uf0qZV6p+zv3Z
	x6NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=qbKmrhOOSxkMTrdPrnLXVfstGqif3keu9HWfZ9dn7jI=;
	b=uAhv9Mg95DUfXAsrgtrmK6C7AJ1y2Dn2lmNAtVyYYLLkWG+XFxQCIGmKfojGIGGRCA
	qnufxN3az0J070hOUhFDogoGQ9NMBZg8iHeqB75YzIg8Ae2hoy7TwnQo/kMQlf4jaA/z
	SbQ96eElt3Tv76hGFcBdUetrVORBaxfGdgDW6I8lq8yU3sjo2NmRPbeoIZFdkkrfUaa/
	mppCNwngQZ0zDgxJ5ubk6v1afJoH+TXbUv8LC4JLQNsrp9iEBAF4mX7BsCfPRXXOSxr6
	9s4A5hQ+qXH4W2jjtICE/cGpC3gGwGkCXW8/wVzm1pTYQTrfWWANh5tQdfrCrh3PoTN2
	BC/g==
X-Gm-Message-State: AKwxytdEBiwTuXQeKhHrcJ2oFCgnvW18OB2MX980gNBOOHROtoxDbXvz
	G+qEz+/573yfn0yLOr98ISoF8Q==
X-Google-Smtp-Source: ACJfBouRSsACCZKLyATCUW4syqpcpFOYADJdf2MUdsP7qFkzLsdYMiMT4AUkFZS+pw4m0skBDTButg==
X-Received: by 10.28.111.90 with SMTP id k87mr1290854wmc.108.1516178097275;
	Wed, 17 Jan 2018 00:34:57 -0800 (PST)
Received: from localhost.localdomain
	(ip-88-152-110-191.hsi03.unitymediagroup.de. [88.152.110.191])
	by smtp.gmail.com with ESMTPSA id
	c54sm4230832wrg.68.2018.01.17.00.34.56
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 17 Jan 2018 00:34:56 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 17 Jan 2018 09:34:14 +0100
Message-Id: <20180117083421.30233-8-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180117083421.30233-1-schnitzeltony@gmail.com>
References: <20180117083421.30233-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 07/14] remove gnome system-tools leftovers
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
X-List-Received-Date: Wed, 17 Jan 2018 08:34:57 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../system-tools-backends                          | 74 ----------------------
 1 file changed, 74 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/system-tools/system-tools-backends-2.10.2/system-tools-backends

diff --git a/meta-gnome/recipes-gnome/system-tools/system-tools-backends-2.10.2/system-tools-backends b/meta-gnome/recipes-gnome/system-tools/system-tools-backends-2.10.2/system-tools-backends
deleted file mode 100644
index 704c36dbf..000000000
--- a/meta-gnome/recipes-gnome/system-tools/system-tools-backends-2.10.2/system-tools-backends
+++ /dev/null
@@ -1,74 +0,0 @@
-#! /bin/sh
-### BEGIN INIT INFO
-# Provides:          system-tools-backends
-# Required-Start:    $local_fs dbus
-# Required-Stop:     $local_fs dbus
-# Should-Start:	     $syslog
-# Should-Stop:       $syslog
-# Default-Start:     2 3 4 5
-# Default-Stop:      1
-# Short-Description: Gnome System Tools Backends
-# Description:       The Gnome System Tools Backends daemon handles root-needed
-#                    operations to configure your machine with the Gnome System
-#		     Tools.
-### END INIT INFO
-
-PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
-DAEMON=/usr/bin/system-tools-backends
-PIDDIR=/var/run
-PIDFILE=$PIDDIR/system-tools-backends.pid
-NAME=system-tools-backends
-DESC="System Tools Backends"
-
-test -x $DAEMON || exit 0
-
-set -e
-
-do_start() {
-    echo "Starting $DESC"
-    start-stop-daemon --start --startas $DAEMON --quiet --pidfile $PIDFILE
-}
-
-do_stop() {
-    echo "Stopping $DESC"
-    start-stop-daemon --stop --oknodo --quiet --pidfile $PIDFILE --startas $DAEMON
-}
-
-case "$1" in
-  start)
-    do_start
-    ;;
-  stop)
-    do_stop
-    ;;
-  #reload)
-    #
-    # If the daemon can reload its config files on the fly
-    # for example by sending it SIGHUP, do it here.
-    #
-    # If the daemon responds to changes in its config file
-    # directly anyway, make this a do-nothing entry.
-    #
-    # echo "Reloading $DESC configuration files."
-    # start-stop-daemon --stop --signal 1 --quiet --pidfile \
-    #   /var/run/$NAME.pid --exec $DAEMON
-  #;;
-  restart|force-reload)
-    #
-    #   If the "reload" option is implemented, move the "force-reload"
-    #   option to the "reload" entry above. If not, "force-reload" is
-    #   just the same as "restart".
-    #
-    do_stop
-    sleep 5
-    do_start
-    ;;
-  *)
-    N=/etc/init.d/$NAME
-    echo "Usage: $N {start|stop|restart|reload|force-reload|status}" >&2
-    exit 1
-    ;;
-esac
-
-exit 0
-
-- 
2.14.3


