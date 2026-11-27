Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10354.1795753054284888452
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 20:17:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=rGKGZbe9;
 spf=pass (domain: gmail.com, ip: 74.125.82.54, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1ae58d17cd9so8650226c88.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 20:17:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795753054; x=1796357854; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PzGSrrhynf31qSQ0Bs3BDz3APne1BLDCKe7nWS/nWWM=;
        b=rGKGZbe9P3IiUbrkUFWjgW8wYne/A03NxEC7aVVnKYuYwSfcRusjRsqmGgemf/bUu/
         JpZoqbpsYc93MbJrLji+hnlp5HkL2yJKgOIipnpfPAc0B6TjAalhy0G2/sA6MX5iGYbM
         QGYiD3wNGq3DrHFHbdkEz/DA+yVPV0uYjR04j48o9lfSCUTcw6PrYw5j2Cw7ojuf3Gxc
         1Xp0vpIvNeN9YY+BSni1pT/LAqp9GAP/NvpRaSvOiZQpNQH8tbd0fSjaLSceU6IBDkiM
         JGXnei+hvpIRuSg1MMSllj8YH9eWEyrGSR/XicHW0QDY+WoSsBWoBlDKTBXbxaViRPBH
         Tefw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795753054; x=1796357854;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PzGSrrhynf31qSQ0Bs3BDz3APne1BLDCKe7nWS/nWWM=;
        b=UAf4MhROFM6aFFKc8Rf/xDy89zDoiT2X56L1T1lZytl5nncVH4YHrBUQm7ddfdJ0df
         yN+uD348/SN/4yiDNR4pOhpQCyLhBKiEWyOLFw8oSELgJuO9j58jnN8vwknBlPRJm3I9
         6tc5ntLCGYOtwmVqOVTs31sAbQ12QuOEhNSi7rh/hE1VSDN5ReNFvW+1oE6sz3qeH9eJ
         k9KUay+UA8P63r+aQ3YKL+p3pdVpIhdu+TZH2LtpgOVLC2LnsYJz61WrRx2jLlL0533Z
         IWfvnzRDkjPPaw4YiNPOyeaPsVl8exLuJRILN73g5UpDMu007vyXap6qXvP6XGUNIUvN
         QnTA==
X-Gm-Message-State: APuU4Z/5ryyHVF9XpXOAvYG9mF8ZNK2xaq1RCbbxw5SL43E9oWDYS52d
	gKkb4CKwbsk5O6XSAojIzbotAZx/7bmlvxJZGoNUtEHhQTn7zuPYcBNZ9WJZLPrl
X-Gm-Gg: AZFdTZe1uxX6L8yfnzrzTApIzA4G/dVuO4SJlPwRL+JhLoVfDzJ8+tv9Pp0izuJIheK
	cQ1fZ2IiBSYHA3xfhA7lpROEdEogEQIVpH9L4ZE5zRC7h7Y6ZwFKKIaHGxAjh4uxK6GM/vCFP42
	6Q5AimBAVYUonFIfbJL9Ge8as9Tlj79mOET7Rr8+MdRo52X8nz8U3xa5N1z+Os/hf5KT2u4bo44
	9+VoEopfmGDe6b/VegmkNTh0s8xnhUcKycyIn3eD1adRx+k6Wix2rfe1zw82wkNFkjbMXZhx+GK
	i5qDzAGl3BQcSIM5qaMaaYe7uvMJ1YVlNss6MVg8bpJCDrq6ZM9inH1HG7eMW4JEdaBe9ldMxvW
	F/Qqo+Tpvby09bBfjCKBGS9osm6uGKu3BIk5tcHbRa9S1hsH6dDZkUYZq8o7YzNTvnuDkdvOCTK
	Tnm8CSwaBuPbbxnW9kqYFbftseqo1/E3Fd0XMdZnG5XvT2ZY8wAoCCUNNlMP0o4HqIaeSw8bt8h
	5F0kQlgYyfSl1NnfhzkYc1Ymc2vm2j96LXxJpm++nOp+K+wNqBrYmVsJ5pmt/IhcD30hHfskVwb
	M4NOZgbimgGGqbqO/1d/iGNfZ4dTAQ34ga8zAJkJOkoir/GQs/en2Ws8k18Ml2lx35WaiNxb5HD
	kXCRP44UKKGkm3Pfd65uG/rcCUxmLgM49KI+C/eB7CCd3F7FywonB0AAS83GWQY9xixTr24Nlqx
	xEqe8l6NCNdcRLIewoz+zdPHqhoGikViAz+kfKsYy+Ep68vMzzPK8dNTWc7qNXPU4qnTRlJuHOb
	HY3MSttmqqrgYBK9E1CsbZ2zqyy7ZRpvG1Hal4qK8oZPltGmHYoUVwUa2RpmcRSPlG2sfQALFby
	7hsImg==
X-Received: by 2002:a05:7022:f101:b0:1b5:4d40:e9ff with SMTP id a92af1059eb24-1b5568d7b42mr18776335c88.35.1795753053596;
        Thu, 26 Nov 2026 20:17:33 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556840494sm53880225c88.12.2026.11.26.20.17.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 20:17:33 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH 14/35] openhpi: Fix upstream version check
Date: Thu, 26 Nov 2026 20:16:54 -0800
Message-ID: <20261127041715.1776485-15-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127041715.1776485-1-khem.raj@oss.qualcomm.com>
References: <20261127041715.1776485-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 04:17:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133266
Content-Type: text/plain; charset="utf-8"

The downloads.sourceforge.net directory is not a listing, so nothing was
found. Check the openhpi-stable folder on SourceForge.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-networking/recipes-daemons/openhpi/openhpi_3.8.0.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-networking/recipes-daemons/openhpi/openhpi_3.8.0.bb b/meta-networking/recipes-daemons/openhpi/openhpi_3.8.0.bb
index 95994c0467..24e48db541 100644
--- a/meta-networking/recipes-daemons/openhpi/openhpi_3.8.0.bb
+++ b/meta-networking/recipes-daemons/openhpi/openhpi_3.8.0.bb
@@ -51,6 +51,9 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.gz \
 SRC_URI[md5sum] = "fffda3deea8a0d3671a72eea9d13a4df"
 SRC_URI[sha256sum] = "c94332a29160dd75cb799c027e614690c00263b0fabed87417707bec04c38723"
 
+UPSTREAM_CHECK_URI = "https://sourceforge.net/projects/openhpi/files/openhpi-stable/"
+UPSTREAM_CHECK_REGEX = "/openhpi-stable/(?P<pver>\d+(\.\d+)+)/"
+
 inherit autotools pkgconfig ptest update-rc.d systemd
 
 PACKAGES =+ "${PN}-libs"
