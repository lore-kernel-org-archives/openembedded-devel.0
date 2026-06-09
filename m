Return-Path: <nitin.wankhade333@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FA98CD8CBD
	for <webhook@archiver.kernel.org>; Tue,  9 Jun 2026 08:32:53 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.74587.1780993964917257903
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Jun 2026 01:32:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=GoqwkN89;
 spf=pass (domain: gmail.com, ip: 209.85.216.52, mailfrom: nitin.wankhade333@gmail.com)
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-36ba9f46338so491453a91.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 09 Jun 2026 01:32:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780993964; x=1781598764; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E94OcaG/txVMDuAaz5vPQQotLthU8TmGgxe1PkypQXI=;
        b=GoqwkN89AxfpVaTlmiqwdOw/1XeB8kKo952u97EG8P3N2SLamJ6ie0HFVBZ6kdPzEk
         xiaDIanpBQLtq2b9B1NkfBgSm/8WXNZVMatDUF7SRzaV/5v2NW0pnHC8tI93e/CwQnxQ
         eWvSW3djsiexyjz8hYeKk4s5RnRpMkpSvi2M0UfmIOumvdyC9Cf/voj8eTxs+pR9kTZ/
         yLt0quW4LPEm35nuTO/8MHwYqnzWUXXtX7RmYdHJDbAfOJYNhtZYAF3juYU7F1zhJlvJ
         1GhFIA1nVTzv3EjML3CnV8LzeQ8cL0nKkPkGy+Eg361Y6EMZpoOPpgR2bDRmclks9Fnb
         kL7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780993964; x=1781598764;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=E94OcaG/txVMDuAaz5vPQQotLthU8TmGgxe1PkypQXI=;
        b=Y8QyLy5udzpOYDqzMYz3FOcyX/i2Wab0hEDRVW7H/lEcPZWa6sx9NGkrvTm0zJjNZf
         3UMx4Y18Wn8cTEGhlxra6uBpVp/8UO3LvQ629f6k9igKDabVYMazldUAOTXMOx8NlV+r
         Y/9JteeSl5Vv13PYsAjZFcKNUma9uA6wvEuVN8SgElwB0PVXSmc7stqz/MC4Sx09lMgN
         YXdgQCNHkObHbh02CCHx1R+TW6Vk+UL3VhKE4i16v55V42s9IpxOYXx85rBafeTcSpJ6
         qEU/BGbCNfgDlzmIwEJK3x1Gsif0M3FMxeaXbGFmA0wF6rloeXVIl+vwHIeI13mccz9l
         gDUA==
X-Gm-Message-State: AOJu0Yxt0XafVYXk+aBrOiYMhiPAgaKLVWL/cYS/CbOPHuwn6JfhbVmX
	lZTP7JBEXYkeo+c0dw65RlHJhQuLA9cjMnAwA72QtbLiaOJhQYprDZwG/12u6LXici4ctA==
X-Gm-Gg: Acq92OGAlcoIBJOrfzFmzUKCrDDS0ztlWvZ1j2nO9W2hxZPDi4XwPOxgcEFHeiI0GFT
	VRNHOIVrzQTepYsaFZz18np1iCcKizga/PW3S4Ke8EXKc3NCajafLpwBrFCC27rkotHKHmxn/1h
	VIYWj0913Ml26MYK82zWdPXbbs69Qpcb2iknl77g2EGnP3N7lUviKIQlfiG2e71TfMoo0pCgcC8
	Ndp+6QS9qg81+6y1U6S7demRIN2W7OtY5uYtrawUWIDb5uAhUYzf+3GrAMIU6Eb5NJHs+m3TSkN
	+NFFjYyMhEm5YcPTKpr5HQjCzaXWJf94pprE47JWIY2tAx5VxKLb46kwt8qJxLu6wEv6rgina44
	Q75q269ny8aWUQlhHm/qNFnrfDhGpATBtU1ACoGfhp2mSn+hDnsh5c2IvJz9ilkx980DCGx+myC
	n47vKoxnzborQeC260Rjqvj8sX+JlcTmJO7FH4PXIWpALivYAkLoaCLnTOZGIBQA==
X-Received: by 2002:a17:90b:538b:b0:36d:f28a:c5e2 with SMTP id 98e67ed59e1d1-370f1eec20amr10451336a91.8.1780993964298;
        Tue, 09 Jun 2026 01:32:44 -0700 (PDT)
Received: from L-15597L.www.tendawifi.com ([36.255.86.178])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36f6bf903fasm18196212a91.2.2026.06.09.01.32.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 01:32:43 -0700 (PDT)
From: Nitin Wankhade <nitin.wankhade333@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Nitin.Wankhade@kpit.com
Subject: [OE-core][scarthgap][PATCH 6/6] strongswan: Fix CVE-2026-35333
Date: Tue,  9 Jun 2026 14:01:04 +0530
Message-Id: <20260609083104.869512-6-nitin.wankhade333@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260609083104.869512-1-nitin.wankhade333@gmail.com>
References: <20260609083104.869512-1-nitin.wankhade333@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Jun 2026 08:32:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127443

Upstream-Status: Backport [https://snapshot.debian.org/archive/debian-security-debug/20260422T125423Z/pool/updates/main/s/strongswan/strongswan_6.0.1-6%2Bdeb13u5.debian.tar.xz]

Signed-off-by: Nitin Wankhade <nitin.wankhade333@gmail.com>
---
 ...-undersized-attributes-in-enumerator.patch | 41 +++++++++++++++++++
 .../strongswan/strongswan_5.9.14.bb           |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta-networking/recipes-support/strongswan/strongswan/libradius-Reject-undersized-attributes-in-enumerator.patch

diff --git a/meta-networking/recipes-support/strongswan/strongswan/libradius-Reject-undersized-attributes-in-enumerator.patch b/meta-networking/recipes-support/strongswan/strongswan/libradius-Reject-undersized-attributes-in-enumerator.patch
new file mode 100644
index 0000000000..0233ebf6aa
--- /dev/null
+++ b/meta-networking/recipes-support/strongswan/strongswan/libradius-Reject-undersized-attributes-in-enumerator.patch
@@ -0,0 +1,41 @@
+From: =?utf-8?q?Lukas_Johannes_M=C3=B6ller?= <research@johannes-moeller.dev>
+Date: Thu, 12 Mar 2026 10:24:45 +0000
+Subject: libradius: Reject undersized attributes in enumerator
+MIME-Version: 1.0
+Content-Type: text/plain; charset="utf-8"
+Content-Transfer-Encoding: 8bit
+
+attribute_enumerate() accepts RADIUS attributes whose length byte is
+smaller than sizeof(rattr_t) (2).  For length == 0, the iterator never
+advances and traps callers — including verify() — in a non-advancing
+loop.  For length == 1, misaligned packed-struct reads occur.
+
+Add a separate check for this->next->length < sizeof(rattr_t) after
+the existing truncation guard.  This mirrors radius_message_parse(),
+which already distinguishes invalid length from truncation.
+
+Signed-off-by: Lukas Johannes Möller <research@johannes-moeller.dev>
+
+Fixes: 4a6b84a93461 ("reintegrated eap-radius branch into trunk")
+Fixes: CVE-2026-35333
+
+CVE: CVE-2026-35333
+Upstream-Status: Backport [https://snapshot.debian.org/archive/debian-security-debug/20260422T125423Z/pool/updates/main/s/strongswan/strongswan_6.0.1-6%2Bdeb13u5.debian.tar.xz]
+Signed-off-by: Nitin Wankhade <nitin.wankhade333@gmail.com>
+===
+diff --git a/src/libradius/radius_message.c b/src/libradius/radius_message.c
+index 8e2db0c..2bbbb48 100644
+--- a/src/libradius/radius_message.c
++++ b/src/libradius/radius_message.c
+@@ -261,6 +261,11 @@ METHOD(enumerator_t, attribute_enumerate, bool,
+ 		DBG1(DBG_IKE, "RADIUS message truncated");
+ 		return FALSE;
+ 	}
++	if (this->next->length < sizeof(rattr_t))
++	{
++                DBG1(DBG_IKE, "RADIUS attribute has invalid length");
++                return FALSE;
++       }
+ 	*type = this->next->type;
+ 	data->ptr = this->next->value;
+ 	data->len = this->next->length - sizeof(rattr_t);
diff --git a/meta-networking/recipes-support/strongswan/strongswan_5.9.14.bb b/meta-networking/recipes-support/strongswan/strongswan_5.9.14.bb
index f65a94dd73..661727e501 100644
--- a/meta-networking/recipes-support/strongswan/strongswan_5.9.14.bb
+++ b/meta-networking/recipes-support/strongswan/strongswan_5.9.14.bb
@@ -17,6 +17,7 @@ SRC_URI = "https://download.strongswan.org/strongswan-${PV}.tar.bz2 \
            file://libsimaka-Reject-zero-length-EAP-SIM-AKA-attributes.patch \
            file://constraints-Case-insensitive-matching-and-reject-exc.patch \
            file://tls-server-Only-accept-non-empty-ECDH-public-keys-wi.patch \
+           file://libradius-Reject-undersized-attributes-in-enumerator.patch \
            "
 
 SRC_URI[sha256sum] = "728027ddda4cb34c67c4cec97d3ddb8c274edfbabdaeecf7e74693b54fc33678"
-- 
2.34.1


