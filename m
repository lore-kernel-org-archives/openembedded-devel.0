Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
	[209.85.214.182])
	by mail.openembedded.org (Postfix) with ESMTP id C9C277F4B9
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 31 Aug 2019 21:31:55 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id f19so4900440plr.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 31 Aug 2019 14:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=1/bZ7UytMLpCMLqMMkMdB5gprfAmFHia1iSqZu+xTL0=;
	b=CjgtynEsjqZw+g6nSxLNIXZ91ZniWpP1SFx3sEfoUYyvV3h9SyKOlmyG7CVi2q6fsq
	hvxBBatAIBWZX20CSWHwS6FYthnhJZvg1b5mL1BhXprMYxGTtYA/Zhtjsl6GHaSCmeb+
	OhjGY8t9H9KGPIgZvtQQ85N3o78dHPeetJ/Cpsp0lxfUOZA8/6+Ckc6rhKnqv54Em+k7
	YO1cDISDMq8oEC2sjOQBFk64bO2C09g+2/W6Zp6wNAClTayWf3hddNp7TJ39wMhK0pqW
	vw3zUG4LpYC4CGacW1P+DnHDrqGaJWCCS6XdNzulMpfzK5INdal9mWYC3vQmrEraahOV
	lTbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=1/bZ7UytMLpCMLqMMkMdB5gprfAmFHia1iSqZu+xTL0=;
	b=f7ydRZMT+kP4KgsG/gCYRp8CkfoV/+fbV5t1spWlOBrlOXlSEq1NzQDT1K368oS7Cl
	33u3WlGk7jNDCbXTUA7LQHQ1cUqmn3mvb7roqtCyaXlGNDxGy05rZuZJyfB6l5osp/BJ
	Pdcgi+BGHP4V2Mf3+yXaqvNzQKLrl8iOKqzswZkH599Tut1g4e9czWBaVRJXKQDSzcJk
	C7gptTFWuS/BABjeI9ECh9F4TkGm7tNP/BbH0XzjcU/IStMPNqQDMmDbiyBpmlN1LDzd
	/3tNkDcFcU3OHII1hw59/ah3MVU7AzhFQCdS9Wogj+8AZSI2JOM8hNV7Yt/f4wcym811
	0b+Q==
X-Gm-Message-State: APjAAAVTGE+H73od6XEmBa568/oHrU03kSYHi9rfCn1ogjHb6QtOwHNr
	JIjdM5SLg7Wv6mQMpzvHhtQUx13b
X-Google-Smtp-Source: APXvYqzJLBIs4RGFTp/1SEB4HTK+cA6nsUuHsqTQPtZIAcYtT/3Ujm019fygLUzTPB1C0vRUMQhe1w==
X-Received: by 2002:a17:902:d907:: with SMTP id
	c7mr13332053plz.126.1567287116653; 
	Sat, 31 Aug 2019 14:31:56 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:8107:6109:754a:f033])
	by smtp.gmail.com with ESMTPSA id
	a18sm8060827pgl.44.2019.08.31.14.31.56
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 31 Aug 2019 14:31:56 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 31 Aug 2019 14:31:31 -0700
Message-Id: <3b2b488a57993779d2798220be5b9292b5a28b16.1567286967.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1567286967.git.akuster808@gmail.com>
References: <cover.1567286967.git.akuster808@gmail.com>
Subject: [warrior 10/23] openvpn: respect pid file in init.d service start
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
X-List-Received-Date: Sat, 31 Aug 2019 21:31:56 -0000

From: Fabian Klemp <fabian.klemp@axino-group.com>

openvpn only provides options to update a pid file but not to check it
for running processes. Consecutive issued start commands therefore lead
to multiple running processes with the same configurations, which is the
origin of all kinds of problems of which unnecessary resource usage is the least.

Using start-stop-daemon the pid file is inspected for running processes
before start.

Signed-off-by: Fabian Klemp <fabian.klemp@axino-group.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-networking/recipes-support/openvpn/openvpn/openvpn | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-support/openvpn/openvpn/openvpn b/meta-networking/recipes-support/openvpn/openvpn/openvpn
index a3cd6a2..e5af4b2 100755
--- a/meta-networking/recipes-support/openvpn/openvpn/openvpn
+++ b/meta-networking/recipes-support/openvpn/openvpn/openvpn
@@ -4,6 +4,7 @@
 # <rob@mars.org>, edited by iwj and cs
 # Modified for openvpn by Alberto Gonzalez Iniesta <agi@agi.as>
 # Modified for restarting / starting / stopping single tunnels by Richard Mueller <mueller@teamix.net>
+# Modified for respecting pid file on service start by Fabian Klemp <fabian.klemp@axino-group.com>
 
 test $DEBIAN_SCRIPT_DEBUG && set -v -x
 
@@ -14,10 +15,17 @@ test -d $CONFIG_DIR || exit 0
 
 start_vpn () {
     modprobe tun >/dev/null 2>&1 || true
-    $DAEMON --daemon --writepid /var/run/openvpn.$NAME.pid \
-            --config $CONFIG_DIR/$NAME.conf --cd $CONFIG_DIR || echo -n " FAILED->"
+    start-stop-daemon --start --quiet --pidfile /var/run/openvpn.$NAME.pid \
+            --exec $DAEMON -- \
+            --daemon --writepid /var/run/openvpn.$NAME.pid \
+            --config $CONFIG_DIR/$NAME.conf --cd $CONFIG_DIR || rc="$?"
+    case $rc in
+        1) echo -n " ALREADY STARTED->";;
+        3) echo -n " FAILED->";;
+    esac
     echo -n " $NAME"
 }
+
 stop_vpn () {
    kill `cat $PIDFILE` || true
   rm $PIDFILE
-- 
2.7.4


