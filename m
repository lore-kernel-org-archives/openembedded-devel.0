Return-Path: <bill.randle@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id 1EF0977E0E
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Sep 2017 17:31:40 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id m30so3650325pgn.5
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Sep 2017 10:31:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=GoNlnyxxeLW97KuW1N2jx926kTfRe+nv9bOaABA9W/8=;
	b=buJyW4+mpHBkq1q3KWWD1LUP8e7ycn5F1pQm++oPAWDjPRCkaTAFJvSsrBi9hLGhNX
	pWH2Hoz3MOL2sAivx8hvyLDEYoBGage5BXPA0W86GATq4SXYH9zZhWzUNEmuyL28/3vS
	wxuAb8LfX0QvJ+Hwt05SBoGWYM5YCrfsJkDKjpwRgEbixZ9hzdgrPhBhEZjgm492JJ1Z
	DweayL33HOBgjLNbqfYgT2EAmeaRn1h82j5uu2IncGYU1RLRa0EQ9cAAF+3eab8AMN2W
	WWS6wFP6jZ70PKq6Q+SikM6DwQ2KCGuj6URr7lFaGCIIbI6N/ch9hgXblF1m0Rx3d2rW
	1dng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=GoNlnyxxeLW97KuW1N2jx926kTfRe+nv9bOaABA9W/8=;
	b=BYr35xR6+R1XOLbW424wBa00hwCtwItGVtlKl2VJROmJhfoX2Ov62dJ4rw6N/KtZVE
	IIAnVNYQgZtdzRxPGAAwc35DSSoMfxSVmmn0qumIrNIzESjNqCMFivzaDhEqT/1niixB
	1YhYbBnipTFhw4BZ3FK9/3XDCEErLiy0eeC1up20nNYdVZqv7UXun98gnkYZv1Me5/HM
	K8DPt4dv2+W/xsY9972d2jve1wz03owsAqVLtsVDqrzTAYLTXWsjDZFnGMt/r34UUhzf
	AN/Jyj+q1cnRdYX+DGX3ayNVoY+NzL/NvccEuMA7pD9Y4SnF50fNzUiV5ZnW2q66ocFQ
	uLGg==
X-Gm-Message-State: AHPjjUjU23BnFgOJpuofnAe9GWptHtqe32A6QjOIMQL0ryfof4+Z+CpZ
	OGhwdjTOk/wwOXW+yTOno9ZY7A==
X-Google-Smtp-Source: AOwi7QDPjmUK+G3KqQbH4wJSN+69QNz21HHs6yoZ6o9Ydeih0mq0PlFcZkeh/9a9o3/aKPPzdtT8RA==
X-Received: by 10.99.55.92 with SMTP id g28mr5215723pgn.59.1506274301648;
	Sun, 24 Sep 2017 10:31:41 -0700 (PDT)
Received: from neosoft.neocat.org (67-5-150-243.ptld.qwest.net. [67.5.150.243])
	by smtp.gmail.com with ESMTPSA id
	e66sm7743431pfb.48.2017.09.24.10.31.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 24 Sep 2017 10:31:41 -0700 (PDT)
From: Bill Randle <bill.randle@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 24 Sep 2017 10:31:31 -0700
Message-Id: <1506274291-11120-1-git-send-email-bill.randle@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-networking][PATCH] net-snmp: check that executable is used before testing for existance
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
X-List-Received-Date: Sun, 24 Sep 2017 17:31:41 -0000

The recipe for net-snmp has snmpd and snmptrapd in seperate packages, so one or the other
or both could be installed. In a common case where only snmpd is installed, the startup
script will fail to run because the snmptrapd executable does not exist.

This patch simply qualifies the test by first checking to see if the executable is to
be used.

    -Bill

Signed-off-by: Bill Randle <bill.randle@gmail.com>
---
 meta-networking/recipes-protocols/net-snmp/files/init | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-networking/recipes-protocols/net-snmp/files/init b/meta-networking/recipes-protocols/net-snmp/files/init
index 2b8fe18..4799546 100755
--- a/meta-networking/recipes-protocols/net-snmp/files/init
+++ b/meta-networking/recipes-protocols/net-snmp/files/init
@@ -3,9 +3,6 @@
 
 . /etc/init.d/functions
 
-test -x /usr/sbin/snmpd || exit 0
-test -x /usr/sbin/snmptrapd || exit 0
-
 # Defaults
 export MIBDIRS=/usr/share/snmp/mibs
 SNMPDRUN=yes
@@ -18,6 +15,9 @@ SPIDFILE=/var/run/snmptrapd.pid
 # Reads config file if exists (will override defaults above)
 [ -r /etc/default/snmpd ] && . /etc/default/snmpd
 
+[ "$SNMPDRUN" = "yes" ] && { test -x /usr/sbin/snmpd || exit 0; }
+[ "$TRAPDRUN" = "yes" ] && { test -x /usr/sbin/snmptrapd || exit 0; }
+
 case "$1" in
   start)
     echo -n "Starting network management services:"
-- 
2.7.4


