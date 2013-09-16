Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ee0-f49.google.com (mail-ee0-f49.google.com [74.125.83.49])
	by mail.openembedded.org (Postfix) with ESMTP id 4176761590
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Sep 2013 07:06:49 +0000 (UTC)
Received: by mail-ee0-f49.google.com with SMTP id d41so1778494eek.22
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Sep 2013 00:06:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=KIstXGYwPHierxqxi+OqI4InXoROoEEMa3bSwB9EBZ4=;
	b=IB9/uvT/d7QWbfSJy6al/4ivwR84z4hzkOA9kylTJ7funwlXSuLukso+c2hJcKDqk7
	b+NInyr0nZfvNiADax/po+/5RA3s09bQn6Jz3eKZTN18VomJLA9ppLhptMqyf/XvqrWI
	EKRCG0b6odfwujcMJ6AASa5g9FIU8A9+nJywsVmfBgzvRGFUt0JzxyZP1Iptmuqmd4ur
	qrqziJ9zJYouacTWT67osJ3q+y27UIIkGU8lB70fMb41pLIQVvToyKXDklETVcnDo6O/
	nzmYLWydbxu0hznqsJcRCl4f5wc0FQlrbk7Q60r3zWFj2lb77ENWrM4kUtDeeflTYQpz
	+lDg==
X-Received: by 10.15.43.13 with SMTP id w13mr40946239eev.37.1379315210631;
	Mon, 16 Sep 2013 00:06:50 -0700 (PDT)
Received: from localhost.localdomain (ip-178-200-247-59.unitymediagroup.de.
	[178.200.247.59])
	by mx.google.com with ESMTPSA id a6sm39320484eei.10.1969.12.31.16.00.00
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 16 Sep 2013 00:06:49 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 Sep 2013 09:06:35 +0200
Message-Id: <1379315195-18861-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
MIME-Version: 1.0
Subject: [meta-networking] ntp: disable automatic panic shutdown for ntpd
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
X-List-Received-Date: Mon, 16 Sep 2013 07:06:50 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Taken from [1]:

"However, if the difference between the client time and server time is greater
than the panic threshold, which defaults to 1000 s, the daemon will send a
message to the system log and shut down without setting the clock."

On RTC-less or 'fresh' systems with unpredicatble inital date ntpd will stop
with work undone (note: I did NOT find the message mentioned above - so it
took long way to fix). This is a wide use case for using NTP in production:
No need for initial datetime setup by some operator.

[1] http://doc.ntp.org/4.1.1/debug.htm

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../recipes-support/ntp/ntp/ntpd.service           |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-networking/recipes-support/ntp/ntp/ntpd.service b/meta-networking/recipes-support/ntp/ntp/ntpd.service
index bd87b1e..eb9c030 100644
--- a/meta-networking/recipes-support/ntp/ntp/ntpd.service
+++ b/meta-networking/recipes-support/ntp/ntp/ntpd.service
@@ -5,7 +5,7 @@ After=network.target
 [Service]
 Type=forking
 PIDFile=/run/ntpd.pid
-ExecStart=/usr/bin/ntpd -p /run/ntpd.pid
+ExecStart=/usr/bin/ntpd -p /run/ntpd.pid -g
 
 [Install]
 WantedBy=multi-user.target
-- 
1.7.6.5


