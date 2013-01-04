Received: from mail-pa0-f45.google.com ([209.85.220.45])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Tqygm-0001z4-Hp
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Jan 2013 05:15:26 +0100
Received: by mail-pa0-f45.google.com with SMTP id bg2so9004797pad.18
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 03 Jan 2013 20:00:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=/fSWB9LmYHmVC4gzOG4GD7/t0ah9ynsOJ2qCtffg48s=;
	b=SShLBwiWTBtkvWvx9NWqRuwDWuI/6vORovAoCxchhQnWrqJfvibk8EWxmPk7mE7iMf
	s+ODp1DOvRb5iyhkjKRNlPCpianUu7my7A2K4aRs1AqZGN2eSo7jj7X3FRwjj79zyLRu
	aK36aar4yme+B9JGS/oMLI/ZM1LtodVdJ6yPm+iw7zGuMjMTqEOPvTl42tNBNk7j0e4X
	UB2qZDBlP9I8tPp21bo2XqLR1enUjIpvcnkcyVWz8wx+l14pKhYJL4rlJpKEsEuhmwa5
	vM+tAh3KsxqecY6PvZXyZoH/R8qtMuThxYAYWWI0m9oHG2CPaLV6RV8vPgp0/ZftAsBP
	NTVg==
X-Received: by 10.68.132.34 with SMTP id or2mr159963791pbb.133.1357272019347; 
	Thu, 03 Jan 2013 20:00:19 -0800 (PST)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id oi2sm31436970pbb.62.2013.01.03.20.00.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 03 Jan 2013 20:00:18 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  3 Jan 2013 19:59:28 -0800
Message-Id: <1357271974-3317-6-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1357271974-3317-1-git-send-email-raj.khem@gmail.com>
References: <1357271974-3317-1-git-send-email-raj.khem@gmail.com>
Subject: [meta-systemd][PATCH 07/13] dhclient.service: Rearrange the cmdline for dhclient
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
X-List-Received-Date: Fri, 04 Jan 2013 04:15:54 -0000

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



