Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by mx.groups.io with SMTP id smtpd.web08.665.1605908049686549684
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 20 Nov 2020 13:34:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=default header.b=KxVi0/Ap;
 spf=pass (domain: kernel.org, ip: 198.145.29.99, mailfrom: okaya@kernel.org)
Received: from sinanubuntu.ckuic5o5zete5ommc4uz5anrqg.bx.internal.cloudapp.net (unknown [23.96.20.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id ADEC02237B;
	Fri, 20 Nov 2020 21:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1605908049;
	bh=fNw1fN2BeMoBrGVFiSZjvWB/6jN/GSceVtd1Khu2kks=;
	h=From:To:Cc:Subject:Date:From;
	b=KxVi0/ApyTZRKNGgPTzpr4CRjXgLj1sk8UAj4JOKAW3j1Hl9Ek9WT4px1AbgCHI8p
	 i6ktwT9WZSIL4Ar52Z9f247ZIQJDIn4iORH9O+C1Tdkizl2g2tMZBkKRR93Je4uacD
	 leRY2Gf7fMycSnkAUNJP3B5wyAXma172QuCm/6Bc=
From: "Sinan Kaya" <okaya@kernel.org>
To: openembedded-devel@lists.openembedded.org
Cc: Sinan Kaya <okaya@kernel.org>
Subject: [meta-oe][PATCH] collectd: fix the test condition for dash compatibility
Date: Fri, 20 Nov 2020 21:33:54 +0000
Message-Id: <20201120213354.15372-1-okaya@kernel.org>
X-Mailer: git-send-email 2.17.1

dash doesn't like double equal sign for test. Replace with
single equal sign.

Signed-off-by: Sinan Kaya <okaya@kernel.org>
---
 meta-oe/recipes-extended/collectd/collectd/collectd.init | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-extended/collectd/collectd/collectd.init b/meta-oe/recipes-extended/collectd/collectd/collectd.init
index 95f5f73c67..83413463d8 100644
--- a/meta-oe/recipes-extended/collectd/collectd/collectd.init
+++ b/meta-oe/recipes-extended/collectd/collectd/collectd.init
@@ -47,11 +47,11 @@ if [ -r /etc/default/$NAME ]; then
 	. /etc/default/$NAME
 fi
 
-if test "$ENABLE_COREFILES" == 1; then
+if test "$ENABLE_COREFILES" = 1; then
 	ulimit -c unlimited
 fi
 
-if test "$USE_COLLECTDMON" == 1; then
+if test "$USE_COLLECTDMON" = 1; then
 	_PIDFILE="$COLLECTDMON_PIDFILE"
 else
 	_PIDFILE="$PIDFILE"
@@ -96,7 +96,7 @@ d_start() {
 		return 2
 	fi
 
-	if test "$USE_COLLECTDMON" == 1; then
+	if test "$USE_COLLECTDMON" = 1; then
 		start-stop-daemon --start --quiet --oknodo --pidfile "$_PIDFILE" \
 			--exec $COLLECTDMON_DAEMON -- -P "$_PIDFILE" -- -C "$CONFIGFILE" \
 			|| return 2
@@ -150,7 +150,7 @@ d_stop() {
 #   0 if the daemon is running
 #   3 if the daemon is stopped
 d_status(){
-	if test "$USE_COLLECTDMON" == 1; then
+	if test "$USE_COLLECTDMON" = 1; then
 		status $COLLECTDMON_DAEMON
 	else
 		status $DAEMON
-- 
2.17.1

