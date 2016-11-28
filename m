Return-Path: <meerkoetter@googlemail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id C8A8771B56
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Nov 2016 16:59:53 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id g23so20090867wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Nov 2016 08:59:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=lBUPmmb2ubVGn8EMJpS/xJyk1RP6xsCSRhFK8sHcanE=;
	b=p2bP7+s3oC4hHdelokFMxsM7RwShcPziqzocOvv5UyBRnKgAqB9t5qLDHdl4QcUEi2
	dthgZm/kUNoX3uGi5WP4FVrB0soSA2tdpbH07A36h4bxubDPmJ+6jSIjsn+qrYZESjQ/
	rZ/HQzaAtjFzdNRYwYxGdBv+dLeYzS5zmMuXAXCGh5nTqrAzKJuIEoNSD6DhlCx6miGT
	I+mNHbinryZU7zRLCu81szsIA51lxRuMJ6xwg8XPqxGE/5p6daNayQBjNTCPcl+e5JD8
	8aH7nnXls0futkhxmOSIlJAHy++6MrLKcJ3wBd7L92Q87SKQfIYaHS11Fz7dpcOoPqyt
	ICLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=lBUPmmb2ubVGn8EMJpS/xJyk1RP6xsCSRhFK8sHcanE=;
	b=NfoAN3VjyulZe0doR+cFGMCv9HOxcrA9wU9bbZQoUQ+kOnRGD4b++vw9ADUB4GIr8k
	aXmL/vEtVoM529FaQgdliEbrixLWx06vjlFfYJ2FT8Ig4gZ+lVw7WRK3/RtoTTJWIzL1
	xFRmOl2K3eshhYbNSbPAzD8oL0JViPIvoMhGEe2pSeHlIk7OEHiKyNzMjYCwN9EDe/IV
	pbfXwBeyOtwy0JRiGfsUcCwOMrH98pZmmmgvmS108AVs4cIRIkIE4n9CBukD34jwW9T1
	5l/5yL61yDoaMJf0qCJ+tgQbaPGGgk4/DjVmyB44hraKyB1S6feftW/ErGxXdzNfeZb5
	A+NA==
X-Gm-Message-State: AKaTC015QwwAOPdFI6o4hBeO5cuQchQk6ud5Z2H6v2bdkEXA9R9KAPrRlhKKnZUBJZj8rQ==
X-Received: by 10.28.130.137 with SMTP id e131mr19750146wmd.21.1480352394579; 
	Mon, 28 Nov 2016 08:59:54 -0800 (PST)
Received: from naos.fritz.box
	(p20030071EF27C90038C08788B208AAEC.dip0.t-ipconnect.de.
	[2003:71:ef27:c900:38c0:8788:b208:aaec])
	by smtp.gmail.com with ESMTPSA id
	k11sm29756805wmb.18.2016.11.28.08.59.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 28 Nov 2016 08:59:53 -0800 (PST)
From: Frank Meerkoetter <meerkoetter@googlemail.com>
X-Google-Original-From: Frank Meerkoetter <frank@meerkoetter.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 28 Nov 2016 17:59:46 +0100
Message-Id: <1480352388-7733-4-git-send-email-frank@meerkoetter.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1480352388-7733-1-git-send-email-frank@meerkoetter.org>
References: <1480352388-7733-1-git-send-email-frank@meerkoetter.org>
Cc: Frank Meerkoetter <frank@meerkoetter.org>
Subject: [meta-oe][PATCH 3/5] Log to syslog
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
X-List-Received-Date: Mon, 28 Nov 2016 16:59:55 -0000

Creating /var/log/redis.log requires root permissions to
create the file. Use syslog instead so redis does not
require root.

This affects both sysv and systemd based systems.

Signed-off-by: Frank Meerkoetter <frank@meerkoetter.org>
---
 meta-oe/recipes-extended/redis/redis/redis.conf | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-extended/redis/redis/redis.conf b/meta-oe/recipes-extended/redis/redis/redis.conf
index b932089..ab024ad 100644
--- a/meta-oe/recipes-extended/redis/redis/redis.conf
+++ b/meta-oe/recipes-extended/redis/redis/redis.conf
@@ -53,14 +53,14 @@ loglevel notice
 # Specify the log file name. Also 'stdout' can be used to force
 # Redis to log on the standard output. Note that if you use standard
 # output for logging but daemonize, logs will be sent to /dev/null
-logfile /var/log/redis.log
+# logfile /var/log/redis.log
 
 # To enable logging to the system logger, just set 'syslog-enabled' to yes,
 # and optionally update the other syslog parameters to suit your needs.
-# syslog-enabled no
+syslog-enabled yes
 
 # Specify the syslog identity.
-# syslog-ident redis
+syslog-ident redis
 
 # Specify the syslog facility.  Must be USER or between LOCAL0-LOCAL7.
 # syslog-facility local0
-- 
2.7.4


