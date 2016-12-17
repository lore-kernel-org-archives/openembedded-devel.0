Return-Path: <joe@deserted.net>
Received: from mail-it0-f65.google.com (mail-it0-f65.google.com
	[209.85.214.65])
	by mail.openembedded.org (Postfix) with ESMTP id 9595D773F0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Dec 2016 02:15:24 +0000 (UTC)
Received: by mail-it0-f65.google.com with SMTP id b123so4557863itb.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Dec 2016 18:15:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=deserted-net.20150623.gappssmtp.com; s=20150623;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=xtk4PtZI4OQluCtm0TaSG6yGS1OHOcQFDD+qx4AZRBs=;
	b=vskbyKHKb2fg3fyVfkt1a0J2MFs4MOXmenmK1xUgpGrfl7NZe3panhBixxc2XARR9p
	TrVEatYAV55OukfZ7fzOM778/FY2tHv03mP63HHYZJl55TQDRPc6d/8OVvTCdTOADGNV
	SHyET7ayR4nCq/MGfYX2oUsM+ZTVDB9u0tPlXSQc+QYkQj1Erh/7a3R7WVFYkCYincQD
	KAvFbe08vBGn1G54uC/GBm3OlgP9yw75mL+HlxHPUta4yvVHUOPH41jLoThQmksqS9ra
	1YcEMeonvuUl9KbJerywMWcDp9VEfb2OPEStpHzkCAdQ/IB22e5hysGLAZqZiYev5538
	hbag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=xtk4PtZI4OQluCtm0TaSG6yGS1OHOcQFDD+qx4AZRBs=;
	b=l4011WDNkAi2ooLGQLitHtOBrRzJj0o/y8RpOOuBRNduysk48JOBzRe0/vc6CrOIL9
	r8MWNxb/aXLpiOsT8rh1gFk2pufeJVkSJhPhnZ3lZZofR/4fYG3G4vYU6O6O0YOwBJUE
	Y0kxv+tKez70S2d5B0q8T/L6T/hsFAtJqxYcNGVTxNVp12EntprM3N2QI4Dq0xalX3aM
	BKMLj/J/ehX+J1DKAD38Vj+wyh18+XhTGMk3772/GVTzs7tJWeAyaC07r9yonqlNMQkt
	ITCyV3J6HXBIlR+56ZLynhyrKX5ZqSw8ZNLxeFMjA81X8g6btKfYz0SaeJ3pfUiVbpBP
	F6yg==
X-Gm-Message-State: AKaTC03d828TBWuXSPMQSbFtOuJiRPcgHV3bnLL3SNlLGQ1UYBprbajJ2NqU4TUQ+dy4zQ==
X-Received: by 10.36.196.135 with SMTP id v129mr6952388itf.100.1481940925797; 
	Fri, 16 Dec 2016 18:15:25 -0800 (PST)
Received: from mir.deserted.net (23-233-31-74.cpe.pppoe.ca. [23.233.31.74])
	by smtp.gmail.com with ESMTPSA id l73sm3804122ioe.1.2016.12.16.18.15.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 16 Dec 2016 18:15:25 -0800 (PST)
Sender: Joe MacDonald <joe@deserted.net>
From: Joe MacDonald <joe_macdonald@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 16 Dec 2016 21:15:22 -0500
Message-Id: <1481940923-12914-11-git-send-email-joe_macdonald@mentor.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1481940923-12914-1-git-send-email-joe_macdonald@mentor.com>
References: <1481940923-12914-1-git-send-email-joe_macdonald@mentor.com>
Subject: [meta-networking][PATCH 10/11] samba: start on boot with systemd
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
X-List-Received-Date: Sat, 17 Dec 2016 02:15:24 -0000

From: Andreas Oberritter <obi@opendreambox.org>

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
---
 meta-networking/recipes-connectivity/samba/samba_4.4.5.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb b/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
index 1caf8af..eb3038d 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
@@ -44,6 +44,10 @@ SYSVINITTYPE = "sysv"
 INITSCRIPT_NAME = "samba"
 INITSCRIPT_PARAMS = "start 20 3 5 . stop 20 0 1 6 ."
 
+SYSTEMD_PACKAGES = "${PN}-base winbind"
+SYSTEMD_SERVICE_${PN}-base = "nmb.service smb.service"
+SYSTEMD_SERVICE_winbind = "winbind.service"
+
 PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', '${SYSVINITTYPE}', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'zeroconf', 'zeroconf', '', d)} \
-- 
1.9.1


