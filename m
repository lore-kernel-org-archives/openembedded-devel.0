Return-Path: <nitin.wankhade333@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A4B4CD8CAC
	for <webhook@archiver.kernel.org>; Tue,  9 Jun 2026 08:32:33 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.74753.1780993944928707030
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Jun 2026 01:32:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=pW0pmdUu;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: nitin.wankhade333@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-36b7b802299so485790a91.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 09 Jun 2026 01:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780993944; x=1781598744; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5k6MCwMfbW+lMyUO0F4aU4Fy1VrU3D/zoyuWbt1VFTY=;
        b=pW0pmdUuMwIDp0ADdVApkPhiV9Vxld5ZsZXEEGYEDs3x9Xau1V/T7rZjAjQJ0n0amy
         K1ad3nJVOKVSLgFbh8kuM0TkVy7Fdt5oTzTnuK9woHklAQybMNRpi1OTRqHavRGBtHxf
         mbRcd0RO/lIfokARaRQDl5l2tu/ok9MkDwZykPgcASHFdBhTyW2+nDf522+j6fRXPYHJ
         +3eZMC18zgKz8VqyHlWw8Nw8SXB9wgRGaeOAnorskftp+MUHHZZ4zdp8+m08JYnlKsXA
         LFpKz0ENgAiYuuTEEqAjiIH7RFFBizzzNbEyZaiyR9TkOJMqEovJfClh+QIfwQdHPsWL
         C8Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780993944; x=1781598744;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5k6MCwMfbW+lMyUO0F4aU4Fy1VrU3D/zoyuWbt1VFTY=;
        b=STTpg3amih625C+L8qbtPvmd8q/0BceiJyXgNtmuW11GtySVrPqb0X+rjqGEUN0j6A
         ilksrI8nQmnoq97jbYH/HqLQRWkcSQWVTEz9szcbtxIAxEtzNaJdpnc1L3Z0nv4tKmHZ
         EbwUi0EA0T/svV/i0ZES/QvkFlKfeKWULn8pBxPF3/NL2BXKkAjYeuPmYd6oQjdr9tkF
         itdcKxL+pn2LcJacJOJTv7433eEdOZtDWyaHqUlbijdfxvpCGhLMS+YmbNNpj8/SdlXk
         nFgZMFI4V/vJWk/3IRDJnWllwZrsuaKZQM7JXDVnXwYnb+HITqqB2ivPcPNtuO1w6hKo
         qdbA==
X-Gm-Message-State: AOJu0YwmhoT/pHmJjYlixlH6Wo87ircaoVsFTYI2bL5pcKVm3MXXPBZJ
	QJ6Ca7LHNFGUCN2xgcuiRPrfs3iKfxCgNyC/07UuceWh6E6LLauFxglfqsqJu72q50sv0Q==
X-Gm-Gg: Acq92OEK4mGNppVzpBnY34QMYw5MdN9+vRMRAgcBJvTodWzIq6pSaxkk1MNtXaCpeZ4
	nT4DuS4sMllBLOw/s99ukoIA8D7TQja5NfzMdWbRW6dGUIbLTp0YiCCeACUBa+oV2NXdmeFYOfa
	ZOkv+9F45LJ0loUlmwT7xoQ3P8eM0kzY5Kn4d8s8mRDWRLK0O3BSloLkKcbCaGz3nbxigzUk3xA
	D5Eu4XtyxOUPIZamJLOWR45YPvlVjZzdltOQxkreocjDojJGsN5iz+qExRhs1U78ozUKznRFMYy
	lHpPdtQLJzfD8VbA53tbwqmw8yZ/WDM9WGen1DX0i+B+cJrfoDltwI8vgqv1dpHQuBbSB7xvFko
	NLHI01oeRubRHS4CHpgy8tMyTUEnZI45zJAj0N8xg6+Hey5JmBayLbfc3R4HSQzVFwmgSaZ80pD
	VWpicNkuaxAiGeilcpz3S7dJjhFkD2CqIB2fyRETAi2m2l8mHK/eIROJUIXGflGQ==
X-Received: by 2002:a17:90b:2702:b0:368:f0a:1c49 with SMTP id 98e67ed59e1d1-3751d10e793mr1128333a91.0.1780993944141;
        Tue, 09 Jun 2026 01:32:24 -0700 (PDT)
Received: from L-15597L.www.tendawifi.com ([36.255.86.178])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36f6bf903fasm18196212a91.2.2026.06.09.01.32.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 01:32:23 -0700 (PDT)
From: Nitin Wankhade <nitin.wankhade333@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Nitin.Wankhade@kpit.com
Subject: [OE-core][scarthgap][PATCH 1/6] strongswan: Fix CVE-2026-35328
Date: Tue,  9 Jun 2026 14:00:59 +0530
Message-Id: <20260609083104.869512-1-nitin.wankhade333@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Jun 2026 08:32:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127438

Upstream-Status: Backport [https://snapshot.debian.org/archive/debian-security-debug/20260422T125423Z/pool/updates/main/s/strongswan/strongswan_6.0.1-6%2Bdeb13u5.debian.tar.xz]

Signed-off-by: Nitin Wankhade <nitin.wankhade333@gmail.com>
---
 ...nt-infinite-loop-if-supported-versio.patch | 42 +++++++++++++++++++
 .../strongswan/strongswan_5.9.14.bb           |  1 +
 2 files changed, 43 insertions(+)
 create mode 100644 meta-networking/recipes-support/strongswan/strongswan/tls-server-Prevent-infinite-loop-if-supported-versio.patch

diff --git a/meta-networking/recipes-support/strongswan/strongswan/tls-server-Prevent-infinite-loop-if-supported-versio.patch b/meta-networking/recipes-support/strongswan/strongswan/tls-server-Prevent-infinite-loop-if-supported-versio.patch
new file mode 100644
index 0000000000..32a23b3be1
--- /dev/null
+++ b/meta-networking/recipes-support/strongswan/strongswan/tls-server-Prevent-infinite-loop-if-supported-versio.patch
@@ -0,0 +1,42 @@
+From: Tobias Brunner <tobias@strongswan.org>
+Date: Wed, 25 Mar 2026 10:17:46 +0100
+Subject: tls-server: Prevent infinite loop if supported versions are too
+ short
+
+If the extension doesn't contain a multiple of two bytes, the previous
+code would get stuck in an infinite loop as `remaining()` continued to
+return TRUE while `read_uint16()` failed to parse a value. Initiating
+several connections with such an extension allows a DoS attack as no
+threads would eventually be available to handle packets/events.
+
+Fixes: 7fbe2e27ecf6 ("tls-server: TLS 1.3 support for TLS server implementation")
+Fixes: CVE-2026-35328
+
+CVE: CVE-2026-35328
+Upstream-Status: Backport [https://snapshot.debian.org/archive/debian-security-debug/20260422T125423Z/pool/updates/main/s/strongswan/strongswan_6.0.1-6%2Bdeb13u5.debian.tar.xz]
+Signed-off-by: Nitin Wankhade <nitin.wankhade333@gmail.com>
+===
+diff --git a/src/libtls/tls_server.c b/src/libtls/tls_server.c
+index 3ad9fd2..7b2238e 100644
+--- a/src/libtls/tls_server.c
++++ b/src/libtls/tls_server.c
+@@ -471,15 +471,12 @@ static status_t process_client_hello(private_tls_server_t *this,
+ 		bio_reader_t *client_versions;
+ 
+ 		client_versions = bio_reader_create(versions);
+-		while (client_versions->remaining(client_versions))
++		while (client_versions->read_uint16(client_versions, &version))
+ 		{
+-			if (client_versions->read_uint16(client_versions, &version))
++			if (this->tls->set_version(this->tls, version, version))
+ 			{
+-				if (this->tls->set_version(this->tls, version, version))
+-				{
+-					this->client_version = version;
+-					break;
+-				}
++				this->client_version = version;
++				break;
+ 			}
+ 		}
+ 		client_versions->destroy(client_versions);
diff --git a/meta-networking/recipes-support/strongswan/strongswan_5.9.14.bb b/meta-networking/recipes-support/strongswan/strongswan_5.9.14.bb
index 7cc67e4d92..6fbc345923 100644
--- a/meta-networking/recipes-support/strongswan/strongswan_5.9.14.bb
+++ b/meta-networking/recipes-support/strongswan/strongswan_5.9.14.bb
@@ -12,6 +12,7 @@ SRC_URI = "https://download.strongswan.org/strongswan-${PV}.tar.bz2 \
            file://CVE-2025-62291.patch \
            file://CVE-2026-25075.patch \
            file://CVE-2026-35334.patch \
+           file://tls-server-Prevent-infinite-loop-if-supported-versio.patch \
            "
 
 SRC_URI[sha256sum] = "728027ddda4cb34c67c4cec97d3ddb8c274edfbabdaeecf7e74693b54fc33678"
-- 
2.34.1


