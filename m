Return-Path: <meerkoetter@googlemail.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id 4BC5C71B45
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Dec 2016 18:45:44 +0000 (UTC)
Received: by mail-wm0-f54.google.com with SMTP id a197so307931412wmd.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Dec 2016 10:45:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=lBUPmmb2ubVGn8EMJpS/xJyk1RP6xsCSRhFK8sHcanE=;
	b=U9Or6WVnck/QfTdkXmK3RxsK2nECeKffD2TLUF4CIu/3m/Siz0Z7m8o5xziOXrkR4Q
	h3+jlafVDrDb+QXyd/Os0ViM2/KnUy1zp03jqA9qrM8U20aY6ZkGGJHWdnAzBGqefTTn
	4C01RjBwjYXiW4dyusDzdicBhe3NZFX8p4NBf3HM37LLTHS+9c/3DRBO+NqvTPzCln6T
	lFWuVLUIpOKgKa/K9fOE79oCBWY3j/l6X6auGA4ZdcHDSG7d71S8Ufsg7Gln2RQjvr6e
	ef0FktHxw3szg6brwLpYX6nRZnNLPcDUAdCm5NVu6fUTIxC/pZvV6lUtbecCsEJbdwvU
	X74w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=lBUPmmb2ubVGn8EMJpS/xJyk1RP6xsCSRhFK8sHcanE=;
	b=AA1WMBZ5kBaEdJ/pFbShtzDwgtdyKWyHoMI+MhUpiUnnNn90xxYKJiekqNN0bfgyiY
	CHzI/TN0a/7rtPjCaeoaEPCz292/N+bRQHP1wOZRaCvjKSpRfOmoNruOwjGU2XNipr6D
	QIy3W8DizuhH2DC1VkzuSf5zpzCW0ZHUd18SdiPArZa01i+lrTBsytZz/6shCsze5Mw2
	wWZF7N79aoaHkJmHdZdFU4vwc35icIDl7s5QawP6ZMeXPc5uWTGM7LXHzn4rLrr1V2dQ
	xeSmDlcdLu2cuzQy8r6Ogmrzx80Se8YRXJl8ap7IAzg5Q9kR8Hjfw/ehUw+DMMVrOl2H
	o1TQ==
X-Gm-Message-State: AKaTC00GPO3ONvhtboUraaT4AKjx2zXt9ok1upraT0uSsq3971B9uzflVRSIy+CK/IS5Pw==
X-Received: by 10.28.161.129 with SMTP id k123mr37001833wme.66.1480617945475; 
	Thu, 01 Dec 2016 10:45:45 -0800 (PST)
Received: from naos.fritz.box
	(p20030071EF34510078AFC66E4F3A2DFD.dip0.t-ipconnect.de.
	[2003:71:ef34:5100:78af:c66e:4f3a:2dfd])
	by smtp.gmail.com with ESMTPSA id w79sm2284746wmw.0.2016.12.01.10.45.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 01 Dec 2016 10:45:44 -0800 (PST)
From: Frank Meerkoetter <meerkoetter@googlemail.com>
X-Google-Original-From: Frank Meerkoetter <frank@meerkoetter.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  1 Dec 2016 19:45:25 +0100
Message-Id: <1480617927-26478-4-git-send-email-frank@meerkoetter.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1480617927-26478-1-git-send-email-frank@meerkoetter.org>
References: <1480617927-26478-1-git-send-email-frank@meerkoetter.org>
Cc: Frank Meerkoetter <frank@meerkoetter.org>
Subject: [meta-oe][PATCHv3 3/5] redis: log to syslog
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
X-List-Received-Date: Thu, 01 Dec 2016 18:45:46 -0000

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


