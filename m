Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TdObL-0005KC-QY
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Nov 2012 18:05:39 +0100
Received: by mail-ea0-f175.google.com with SMTP id h11so4828389eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Nov 2012 08:51:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=2J3et3DZXDiN+Pgx2sG3cE0ub4E244eDTFwc4ZC8Dgs=;
	b=0dNO8r+SPWg3tlR/s0I71wpdTMKTHupc6p1COGQITpewBfwnpovAM+9UfNV+75sTLF
	WvE1rEV4OriaWbfDeBlqsibTCjhIHpSnWtyZ13vFNIE0+dqxTNje7H6RyVQ7DlkCc0ci
	QVMPXc0FK347AtdEdQx+65ucbsFX4mpkCkhc+fLOEMbRtZBBnUt1HgNbaINFL1qw2Q0s
	6LWwPZUXZe7UmTWkV//tkRLCRMtj6tKJv0zWMhaGU7GmxIUUrgRjNWuzgQcAvCjAiqDS
	xy7zK6CzkTLukoEhIIbuDvjDmHtu1PTF9hufeViIUXAifX05plOMEvwdNsFhgmv9qFTW
	fIWw==
Received: by 10.14.175.133 with SMTP id z5mr59949314eel.15.1354035088880;
	Tue, 27 Nov 2012 08:51:28 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id d44sm41679393eeo.10.2012.11.27.08.51.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 27 Nov 2012 08:51:28 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 27 Nov 2012 17:51:11 +0100
Message-Id: <b6748d5281db1d42e37cf006b2ed84158f8f273b.1354034673.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <cover.1354034673.git.Martin.Jansa@gmail.com>
References: <cover.1354034673.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1354034673.git.Martin.Jansa@gmail.com>
References: <cover.1354034673.git.Martin.Jansa@gmail.com>
Subject: [PATCH 1/5] dhcp: rename bbappend to match new version from oe-core and move to oe-core prefix
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
X-List-Received-Date: Tue, 27 Nov 2012 17:05:39 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../{meta-oe => oe-core}/recipes-connectivity/dhcp/dhcp/dhcpd.service     | 0
 .../{meta-oe => oe-core}/recipes-connectivity/dhcp/dhcp/dhcrelay.service  | 0
 .../recipes-connectivity/dhcp/dhcp_4.2.4-P2.bbappend}                     | 0
 3 files changed, 0 insertions(+), 0 deletions(-)
 rename meta-systemd/{meta-oe => oe-core}/recipes-connectivity/dhcp/dhcp/dhcpd.service (100%)
 rename meta-systemd/{meta-oe => oe-core}/recipes-connectivity/dhcp/dhcp/dhcrelay.service (100%)
 rename meta-systemd/{meta-oe/recipes-connectivity/dhcp/dhcp_4.2.4-P1.bbappend => oe-core/recipes-connectivity/dhcp/dhcp_4.2.4-P2.bbappend} (100%)

diff --git a/meta-systemd/meta-oe/recipes-connectivity/dhcp/dhcp/dhcpd.service b/meta-systemd/oe-core/recipes-connectivity/dhcp/dhcp/dhcpd.service
similarity index 100%
rename from meta-systemd/meta-oe/recipes-connectivity/dhcp/dhcp/dhcpd.service
rename to meta-systemd/oe-core/recipes-connectivity/dhcp/dhcp/dhcpd.service
diff --git a/meta-systemd/meta-oe/recipes-connectivity/dhcp/dhcp/dhcrelay.service b/meta-systemd/oe-core/recipes-connectivity/dhcp/dhcp/dhcrelay.service
similarity index 100%
rename from meta-systemd/meta-oe/recipes-connectivity/dhcp/dhcp/dhcrelay.service
rename to meta-systemd/oe-core/recipes-connectivity/dhcp/dhcp/dhcrelay.service
diff --git a/meta-systemd/meta-oe/recipes-connectivity/dhcp/dhcp_4.2.4-P1.bbappend b/meta-systemd/oe-core/recipes-connectivity/dhcp/dhcp_4.2.4-P2.bbappend
similarity index 100%
rename from meta-systemd/meta-oe/recipes-connectivity/dhcp/dhcp_4.2.4-P1.bbappend
rename to meta-systemd/oe-core/recipes-connectivity/dhcp/dhcp_4.2.4-P2.bbappend
-- 
1.8.0



