Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58CA2C2A082
	for <webhook@archiver.kernel.org>; Mon,  5 Jan 2026 10:02:49 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.61070.1767607368893233079
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Jan 2026 02:02:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jHjHp1pu;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4779aa4f928so140027295e9.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 05 Jan 2026 02:02:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767607367; x=1768212167; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xSrI72BRfSaOB08H5Q0nj9tPTZ2S9J9n+0biEFRiHok=;
        b=jHjHp1pu3alqfqdDewbVibcNbn3voK6bYAvAkNFDwifpHQjshPHNA8q64ERprBOMm5
         aPOIH/cvPeybba79LTP49SU8MwBLaVyg6cVzmXROwDPvGMKTz9FT+YcnPqadbT2P67nn
         8sSXmmEHOp0yuR1r1/F9Zp/JELtYJ8hWyOTHCkkhfSqMU+Nl1rF9xiYG/50tCkyIP8k9
         0nL+NfFHBhbHZZhNr3/LH92ApODIsh5demvaGgHKmbVjKnjEDJo86CEG2WqH7qTE/W0+
         945c088ox+cb66KRlbD+dGuNG18/xTXRAMpev2CCMhIevIYBnw7boRc5uvQ59WkKcqQ5
         r7XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767607367; x=1768212167;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xSrI72BRfSaOB08H5Q0nj9tPTZ2S9J9n+0biEFRiHok=;
        b=UwJPNZeY6D9I1yzGG/M4xRg2Zl0X4zoLtbEBgGkgUxruEM0tStQoerM+cBuLO0CYq7
         9OY1rigTtjCuekmETYYHp07mXd93ms1wrKh3yv8xUC5tObw/63gPo+/d/3lxsn9e1uBs
         W1Q1vRsLNwqW/Kg4rm9HFC1IB7ZAMibCSVfChyO6ZO4fXTUb8yrg7ce7l+8l3BOsFdKw
         R3GnzvDzdZtc7ExJ7PZ5kubY84QAnwiNwVBWLx+2Y3gg1swPihRtvk3DEh/MRcrQ4Ort
         nWz5xJlaK+KLpXFjWd6Qf3mEQtlp6oGl/vbbv6N0YoOzMDbSu3qX3k9rGCPDbWyZtK5e
         OaiQ==
X-Gm-Message-State: AOJu0YxiQ+19n76MdpvNZBLKLfSYh3QkLnEZ25xTHAvJsO4SinEjWVRp
	haWF+Xbw+4fGjyypCaNOi3qGpvxIK2Sx95Z/PruRKXlA3EPF6helucRU6D8CkQ==
X-Gm-Gg: AY/fxX5Nb6dna1AA17wi5bpOyBYqnJQGrcRM+WPNKOr8h/jDKBoHJlYNtjg9Nkvhi9E
	GfqDCAhCFaSfVLXJ20pzZ+OniWijjxEuY+a6o6VJ4gKMoytVID9corwMJt8+YC5t8EGXEMLoaAu
	irHFNN6pFiYd8fpLx8/cEb2/id0geQqGaG+9rKGYSMLiDHBz3QoFj71/Z2itmVLVHcwGEkIxrMG
	rNlaSdmQ8c3kXBkpiZTTXEeDYHvxo3CyhwZpYhdSVP7Yud4I4ceQaSCXcK12Hqmx4CJJ7BRIiig
	CoEYislkJ5A3vkrVAq6rO9OGlqXFqEg+GHstAc9ChDl7rYiXhM7pvVoD6nwT9DlWNo7tsD5jxRu
	ff5N4RGSdila3X2uVsdgAaM1kF/Q2GVgA3mHtGPOiU6ciciOM3GYdUCYVHwHocwvrLK/NtOvoqJ
	2Y+9owzwme
X-Google-Smtp-Source: AGHT+IGcRYRcVGlIK5lOP4E4G8HstVw2ScAagGgASKinbYmkRa4u2sRQCPLw5qVq4SE0DczHuBD1Gg==
X-Received: by 2002:a05:600c:c05b:b0:45b:7d77:b592 with SMTP id 5b1f17b1804b1-47d1c03867amr517431505e9.12.1767607366998;
        Mon, 05 Jan 2026 02:02:46 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d6d452be4sm144604435e9.10.2026.01.05.02.02.46
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 02:02:46 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][whinlatter][PATCH 12/17] openvpn: upgrade 2.6.16 -> 2.6.17
Date: Mon,  5 Jan 2026 11:02:32 +0100
Message-ID: <20260105100237.3081345-12-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260105100237.3081345-1-skandigraun@gmail.com>
References: <20260105100237.3081345-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 05 Jan 2026 10:02:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123143

Contains fix for CVE-2025-13751

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../openvpn/{openvpn_2.6.16.bb => openvpn_2.6.17.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/openvpn/{openvpn_2.6.16.bb => openvpn_2.6.17.bb} (98%)

diff --git a/meta-networking/recipes-support/openvpn/openvpn_2.6.16.bb b/meta-networking/recipes-support/openvpn/openvpn_2.6.17.bb
similarity index 98%
rename from meta-networking/recipes-support/openvpn/openvpn_2.6.16.bb
rename to meta-networking/recipes-support/openvpn/openvpn_2.6.17.bb
index 88f564313f..c454a93276 100644
--- a/meta-networking/recipes-support/openvpn/openvpn_2.6.16.bb
+++ b/meta-networking/recipes-support/openvpn/openvpn_2.6.17.bb
@@ -15,7 +15,7 @@ SRC_URI = "http://swupdate.openvpn.org/community/releases/${BP}.tar.gz \
 
 UPSTREAM_CHECK_URI = "https://openvpn.net/community-downloads"
 
-SRC_URI[sha256sum] = "05cb5fdf1ea33fcba719580b31a97feaa019c4a3050563e88bc3b34675e6fed4"
+SRC_URI[sha256sum] = "4cc8e63f710d3001493b13d8a32cf22a214d5e4f71dd37d93831e2fd3208b370"
 
 CVE_STATUS[CVE-2020-27569] = "not-applicable-config: Applies only Aviatrix OpenVPN client, not openvpn"
 

