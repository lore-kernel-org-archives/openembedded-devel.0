Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f169.google.com (mail-pf0-f169.google.com
	[209.85.192.169])
	by mail.openembedded.org (Postfix) with ESMTP id 65B576FFD3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Dec 2015 15:34:22 +0000 (UTC)
Received: by pfbo64 with SMTP id o64so28452571pfb.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Dec 2015 07:34:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=zJ1FdNNV/qoGZDJ++ydYku0CHaSQFwdoPQ1ylmCh138=;
	b=G8+H2gLGI+EASjOqEMuBkx3lZeTTlaUePYOnTryQijrnSXdp9z1He0Wiot2Ul2sjQF
	1dDfMmOe9CWaueUcWhcX/nnOs20zW6bx3J+PftfQuZLEJR1KaIp9WbiWdzaMqp2Ky+mo
	UcdaXwyhk63Wnu5bGCSuv2bHtOho8Qmm/FqYLOHQcwHqSb2yQBTf7J7ZFRaM/RQXJHOF
	uAUjSlmO7V1t7Mr4RyxjATcpVsZ8LIiqozSSTVQ35pa92rBuKBXFKNqpRykysX93XjGS
	zFM8Xn/VptOazgyerY0ivSqLfsx2huq96KW036UbUHQV3WNcx3uF8v6qrTeyPATZYns7
	JyRA==
X-Received: by 10.98.10.197 with SMTP id 66mr36398448pfk.37.1450107263879;
	Mon, 14 Dec 2015 07:34:23 -0800 (PST)
Received: from bigIsland.kama-aina.net (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	p65sm15424460pfi.13.2015.12.14.07.34.20
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 14 Dec 2015 07:34:20 -0800 (PST)
Received: by bigIsland.kama-aina.net (Postfix, from userid 1000)
	id 60A81FCC83A; Mon, 14 Dec 2015 07:34:18 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 14 Dec 2015 07:33:56 -0800
Message-Id: <c9afe506129a8e9e65ae511f9da4f87ef1b2acd4.1450027640.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1450027640.git.akuster808@gmail.com>
References: <cover.1450027640.git.akuster808@gmail.com>
In-Reply-To: <cover.1450027640.git.akuster808@gmail.com>
References: <cover.1450027640.git.akuster808@gmail.com>
Subject: [PATCH 03/14] net-snmp: Modify snmpd.service
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
X-List-Received-Date: Mon, 14 Dec 2015 15:34:23 -0000

From: Li Xin <lixin.fnst@cn.fujitsu.com>

Add "-a" parameter in snmpd.service,it is needed to address logs.

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-networking/recipes-protocols/net-snmp/net-snmp/snmpd.service | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/snmpd.service b/meta-networking/recipes-protocols/net-snmp/net-snmp/snmpd.service
index 3b336a0..447683f 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp/snmpd.service
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/snmpd.service
@@ -6,7 +6,7 @@ After=syslog.target network.target
 Type=notify
 Environment=OPTIONS="-Ls0-6d"
 EnvironmentFile=-/etc/default/snmpd
-ExecStart=/usr/sbin/snmpd $OPTIONS -f
+ExecStart=/usr/sbin/snmpd $OPTIONS -a -f
 ExecReload=/bin/kill -HUP $MAINPID
 
 [Install]
-- 
1.9.1


