Received: from mail-pa0-f54.google.com ([209.85.220.54])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Trmdu-0004qr-Qj
	for openembedded-devel@lists.openembedded.org;
	Sun, 06 Jan 2013 10:35:48 +0100
Received: by mail-pa0-f54.google.com with SMTP id bi5so10188252pad.41
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 06 Jan 2013 01:20:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=/fSWB9LmYHmVC4gzOG4GD7/t0ah9ynsOJ2qCtffg48s=;
	b=OAE+bGL0oQ9js4G4Fcnt2+28p4vk/xvTVfOYm7Rzz++dpmI9FhZHJCmzhuSUPojZbJ
	JstFm+EPZBh7zSN/w2xyd2ZznCXycvgSq3956vUE8i062Rt/sCSVvCLtzTqXMCZQuwwq
	GLpJI5qZceHRRC+R3CPmvoEjtqNyik33B3nuTWC3gXi6K6aZn7Imn4TIxUKfC0m/I7wR
	SRjN7tZ5QCmFhXE2L1W4Nb1DVd5Bw/UU8aamNkb7r9Q8U07GWU9ZcthYs3ZM0oerwcsJ
	OJ3D5afjPkOu/EDA/G2ntabLjJlbp4QZlImWbZcCShivR+2Bd0oRvUEFUh89hUZGLX9c
	/ANA==
X-Received: by 10.68.132.34 with SMTP id or2mr178039813pbb.133.1357463636971; 
	Sun, 06 Jan 2013 01:13:56 -0800 (PST)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id qw8sm5137145pbc.39.2013.01.06.01.13.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 06 Jan 2013 01:13:56 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  6 Jan 2013 01:12:47 -0800
Message-Id: <1357463568-26241-24-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1357463568-26241-1-git-send-email-raj.khem@gmail.com>
References: <1357463568-26241-1-git-send-email-raj.khem@gmail.com>
Subject: [meta-systemd][PATCH V2 24/25] dhclient.service: Rearrange the cmdline for dhclient
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 06 Jan 2013 09:35:49 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../dhcp/dhcp/dhclient.service                     |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-systemd/oe-core/recipes-connectivity/dhcp/dhcp/dhclient.service b/meta-systemd/oe-core/recipes-connectivity/dhcp/dhcp/dhclient.service
index 76d64d5..c9620cf 100644
--- a/meta-systemd/oe-core/recipes-connectivity/dhcp/dhcp/dhclient.service
+++ b/meta-systemd/oe-core/recipes-connectivity/dhcp/dhcp/dhclient.service
@@ -6,7 +6,7 @@ After=syslog.target network.target
 Type=forking
 PIDFile=/var/run/dhclient.pid
 EnvironmentFile=-/etc/default/dhcp-client
-ExecStart=/sbin/dhclient -cf /etc/dhcp/dhclient.conf -q $INTERFACES -lf /var/lib/dhcp/dhclient.leases
+ExecStart=/sbin/dhclient -cf /etc/dhcp/dhclient.conf -q -lf /var/lib/dhcp/dhclient.leases $INTERFACES
 
 [Install]
 WantedBy=multi-user.target
-- 
1.7.9.5



