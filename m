Return-Path: <joe@deserted.net>
Received: from mail-ie0-f179.google.com (mail-ie0-f179.google.com
	[209.85.223.179])
	by mail.openembedded.org (Postfix) with ESMTP id 1ECB36CC79
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Nov 2013 16:02:28 +0000 (UTC)
Received: by mail-ie0-f179.google.com with SMTP id x13so15955673ief.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Nov 2013 08:02:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=xNTxSLdTp5y5QywTa/jRP4mnJGJumLj6c5KJdXmVY0U=;
	b=hhbEoeCzXHELIqoqa7U8QY7kmVfANsTjxRjBWlmimkHASmSr/iY/Gc3NUWbpJBkNj/
	L1QDoWePnelJeLL/DaX+I6tO1Pi7X72d8zMGLGIsJwa5FQtjOfpF7eeCOwYh8u1sNe0Y
	Y+1sV6ypwDcN0GPQdnsbjlyqkQqo5RYP/S18CiOU7fX/cUWAW/PTOyPUYA3NTqJXqdau
	s8N6MzDAWjCKJb3FCMcXA8eh/PCwFLv2kS+sKLFmRf8OcBg4Lz/YLXpBQ06YJUtkQEc4
	MGhcoMspdTaDWc2V+I1Rt5/an++YODV4LNbikG3vyQpjFy2HDV2N5zbQ8YMog9QTgP2U
	zv5g==
X-Gm-Message-State: ALoCoQn3jVHRCdpwggDXMpGBQOAaZ/wE8SeSaLj9dmx4aCy1joAipzzY4TPYOgZMPEgChIsHrIIv
X-Received: by 10.43.16.2 with SMTP id pw2mr2312779icb.56.1385740947340;
	Fri, 29 Nov 2013 08:02:27 -0800 (PST)
Received: from burninator.deserted.net (198-84-238-35.cpe.teksavvy.com.
	[198.84.238.35])
	by mx.google.com with ESMTPSA id w4sm50883516igb.5.2013.11.29.08.02.26
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 29 Nov 2013 08:02:26 -0800 (PST)
From: Joe MacDonald <joe@deserted.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 29 Nov 2013 11:02:24 -0500
Message-Id: <1385740944-6138-1-git-send-email-joe@deserted.net>
X-Mailer: git-send-email 1.7.10.4
Subject: [meta-networking][PATCH] ntpd: update config file comments
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
X-List-Received-Date: Fri, 29 Nov 2013 16:02:28 -0000

The default ntp.conf file does the right thing but one of the comments is
a bit misleading based on the active parts of the file changing a few
times.  Update the comment to accurately describe what is happening in the
configuration file and what a user should do next.

Signed-off-by: Joe MacDonald <joe@deserted.net>
---
 meta-networking/recipes-support/ntp/files/ntp.conf |    7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta-networking/recipes-support/ntp/files/ntp.conf b/meta-networking/recipes-support/ntp/files/ntp.conf
index e80b661..875b7eb 100644
--- a/meta-networking/recipes-support/ntp/files/ntp.conf
+++ b/meta-networking/recipes-support/ntp/files/ntp.conf
@@ -2,9 +2,10 @@
 # The driftfile must remain in a place specific to this
 # machine - it records the machine specific clock error
 driftfile /etc/ntp.drift
-# This obtains a random server which will be close
-# (in IP terms) to the machine.  Add other servers
-# as required, or change this.
+# This should be a server that is close (in IP terms)
+# to the machine.  Add other servers as required.
+# Unless you un-comment the line below ntpd will sync
+# only against the local system clock.
 #
 # server time.server.example.com
 #
-- 
1.7.10.4


