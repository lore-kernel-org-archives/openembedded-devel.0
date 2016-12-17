Return-Path: <joe@deserted.net>
Received: from mail-io0-f194.google.com (mail-io0-f194.google.com
	[209.85.223.194])
	by mail.openembedded.org (Postfix) with ESMTP id EBA166025E
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Dec 2016 16:04:46 +0000 (UTC)
Received: by mail-io0-f194.google.com with SMTP id p13so14995219ioi.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Dec 2016 08:04:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=deserted-net.20150623.gappssmtp.com; s=20150623;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=fxSZhUUcYL5NjmHZuY9yIWkTe0QK/e/41CBABL4IY44=;
	b=BlKOjfkBkYPWEJZ+933b2//240kprFupNgnQzrKikMoSrv8yYev5E+Pi9vTsgsYy16
	KKA7vNPGhTD6FdWCpZefKgeNWEHcCerQbLaOUxgEYzV+CPhklDslLzbct4NLnSN9GOgA
	Mhj/zS1o+q6GhF+Hj8rK0Hm+MpVioOlUncBSdPw3O5Y3FNWfmcu/mxNCwGYKso06khX8
	QSspjgDYP2Z86Kl2tWzpDPT6Q0YuHdsusVjgqtWNuM92Ie5yNbYUx0499Lw66hf3+q1/
	0nOkveh6jBslwVVpB933Vyc33U5eAjfwZLnBCTUk48I4m0wkk1rmdQZGTT5vMQNNxfj/
	zEBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=fxSZhUUcYL5NjmHZuY9yIWkTe0QK/e/41CBABL4IY44=;
	b=QJQfdWwFu/yil0XAVIa8aVZ1XikGAEvGUIuZ0A15b+j0FnZd3KuG+05FaavA3NX0zd
	2RhycCBhQAcL2UfJ/Qg7zMOf69THWpKJ6sKv47Ds5dyzbOHHSD/qE9hsFT/XVCFCw1RR
	2JaDkrefZrbebTZ+b6T14tF0wVSrtCLbKLUXz54SWADE/rxN/fGTKD7cF+nbK9/Rhziv
	ZUTuzt+ebdZoCoozFVh1c2Ea2wvYYWDepXZA+nchNbpSoj2TrC0LZaeXw5wAulyBPf3d
	ShVXzJezWHsUj2xBFs9lfhTxv4KU9x4RG0keVyTzEMzk3eDGwGkUmAsShV55gbFpNh51
	35YQ==
X-Gm-Message-State: AIkVDXKnWnAWfYCdnMQWiDoY1T4Qp537A6DbaI6bHeZO0X9caTuNTsG7964nGsdFKXJ6TA==
X-Received: by 10.107.132.74 with SMTP id g71mr8395942iod.19.1481990688142;
	Sat, 17 Dec 2016 08:04:48 -0800 (PST)
Received: from mir.deserted.net (23-233-31-74.cpe.pppoe.ca. [23.233.31.74])
	by smtp.gmail.com with ESMTPSA id
	c36sm3371303itd.18.2016.12.17.08.04.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 17 Dec 2016 08:04:47 -0800 (PST)
Sender: Joe MacDonald <joe@deserted.net>
From: Joe MacDonald <joe_macdonald@mentor.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 17 Dec 2016 11:04:49 -0500
Message-Id: <1481990698-15962-2-git-send-email-joe_macdonald@mentor.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1481990698-15962-1-git-send-email-joe_macdonald@mentor.com>
References: <1481940923-12914-1-git-send-email-joe_macdonald@mentor.com>
	<1481990698-15962-1-git-send-email-joe_macdonald@mentor.com>
Subject: [meta-networking][PATCH 01/10] samba: rename initscript from 'samba.sh' to more common 'samba'
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
X-List-Received-Date: Sat, 17 Dec 2016 16:04:47 -0000

From: Andreas Oberritter <obi@opendreambox.org>

This gets masked automatically by samba.service if systemd is running.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
Signed-off-by: Joe MacDonald <joe_macdonald@mentor.com>
---
 meta-networking/recipes-connectivity/samba/samba_4.4.5.bb | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb b/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
index 6d62481..783a7cd 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
@@ -41,7 +41,7 @@ LDFLAGS_append_libc-musl = " -ltirpc"
 SYSVINITTYPE_linuxstdbase = "lsb"
 SYSVINITTYPE = "sysv"
 
-INITSCRIPT_NAME = "samba.sh"
+INITSCRIPT_NAME = "samba"
 INITSCRIPT_PARAMS = "start 20 3 5 . stop 20 0 1 6 ."
 
 PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', '${SYSVINITTYPE}', '', d)} \
@@ -109,16 +109,16 @@ do_install_append() {
             >> ${D}${sysconfdir}/tmpfiles.d/samba.conf
     elif ${@bb.utils.contains('PACKAGECONFIG', 'lsb', 'true', 'false', d)}; then
         install -d ${D}${sysconfdir}/init.d
-        install -m 0755 packaging/LSB/samba.sh ${D}${sysconfdir}/init.d
+        install -m 0755 packaging/LSB/samba.sh ${D}${sysconfdir}/init.d/samba
     elif ${@bb.utils.contains('PACKAGECONFIG', 'sysv', 'true', 'false', d)}; then
         install -d ${D}${sysconfdir}/init.d
-        install -m 0755 packaging/sysv/samba.init ${D}${sysconfdir}/init.d/samba.sh
+        install -m 0755 packaging/sysv/samba.init ${D}${sysconfdir}/init.d/samba
         sed -e 's,/opt/samba/bin,${sbindir},g' \
             -e 's,/opt/samba/smb.conf,${sysconfdir}/samba/smb.conf,g' \
             -e 's,/opt/samba/log,${localstatedir}/log/samba,g' \
-            -e 's,/etc/init.d/samba.server,${sysconfdir}/init.d/samba.sh,g' \
+            -e 's,/etc/init.d/samba.server,${sysconfdir}/init.d/samba,g' \
             -e 's,/usr/bin,${base_bindir},g' \
-            -i ${D}${sysconfdir}/init.d/samba.sh
+            -i ${D}${sysconfdir}/init.d/samba
     fi
 
     install -d ${D}${sysconfdir}/samba
-- 
1.9.1


