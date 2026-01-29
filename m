Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06108D358CB
	for <webhook@archiver.kernel.org>; Thu, 29 Jan 2026 06:31:35 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9717.1769668293856137345
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 28 Jan 2026 22:31:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NHyEpXl8;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4805ef35864so4365695e9.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 28 Jan 2026 22:31:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769668292; x=1770273092; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q8L+UUeE08Tqrfmd30T8g0e1PtfTUYey/nC+f41WlVE=;
        b=NHyEpXl89lEHT6QHiA+GWUcZpCItiOHgF1j0JquOQINg1GxC5biKUpRonfXqdLvTnt
         cQ6Gtx0XT/gYKERECbfGFp3CVUmyYAwHxJ9m6e5+fDHNZRcDbrydeH9HsOIMwAxUCdFl
         30ga2rn3/x01UzDCYAQAzUoTmNC0qTiIdGONDvC2+XRW5CvznhdE8UjjeaBUeXkqK0LS
         aiw6BBKGMWj8iTs8oH37GUjo9RPtQEYeO+BIuIY2Mf8DK04xKIWRBt/SjeG36hv93zLd
         zLf5ggIN+7VoCbDkeyK7/210RDKGowYjB3mZv0y3GhOtVO/D8xtRu/X8qdqQ29ZuVNEK
         1Rvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769668292; x=1770273092;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=q8L+UUeE08Tqrfmd30T8g0e1PtfTUYey/nC+f41WlVE=;
        b=lKvoT9o7bq65hc0avnLBYpewKGSmT/u8Pz4wL+YVBI7Ha5UZC7RDU2+vFPZur/O3aQ
         utxwOIBndeePh2E6tyqRfKAFiMw8HHdHNWoMs4hPSGRXs5NzZJih5rsgP5UA6l07j9qc
         kFvkaXr+ANlNq3Otxc0nUTP7xZ9jcUWCGBmUYREOM13yFurc8nyh3kPTpjvDi8zznADP
         7QJLsZdTKpH1LKBj5nkxm+cMdLK/PhV1l7dr6dC5w2IGAyESLR1w8cCFHYCMbvuQ1zPk
         nMUQxq58pVU3SpXfkeSr5UZLMwNV9OwioaDFIEjGN5mcjIlTHzK+nTrcCWizfGZLQRzZ
         5i8A==
X-Gm-Message-State: AOJu0Yy3EZV46W7lRMNq1WOeRRra3la3URC5VLZbabSl6PAXuIFmc8r6
	AXrZV+alZkqCb0hz3pyVqxWDrLNTxb8Pcza+cWQCIwo4px4Ow+kTVJw6UrcYHw==
X-Gm-Gg: AZuq6aK1PyJqiP0B+muSMTbP4GRFWPiBkE/6YVO2CSGLPmDBi2ejnqSHiVrn0s81y7N
	TzP8ObPV2bGEk8NK9lM9vW2TYom+SQ8sZP1RWnbbKZHXXE5Od8UJY+tFqzCejlnnlSCmLBhElqa
	UtUAaUS6OzYPmBFWuBUiu6ygogyE4N/D30Sqz4dc2qfdcOAr07taF3uP0NRIipfly+4HumLxA/3
	3AYJSylXy5oahXemzex/o6tKaSdHU7uovGBQC4uxjoSC3WqCIbOkt3qncSzcwaJ/uSI/W4Ci9sN
	99ndr+E3XOk0g24n1rcnxzQXwruvMNhOnABoACTvryiVHM7xToDwQ0l4CBI+xQWA8pknx1DTMBx
	6WQLaljEkqndumAyiYSs52ZkdLYtGteXBwXxDNktK1/rMDXooCmoTvNKTqwaTbUhMhjcUpvAXcA
	x1QIv2hyc6
X-Received: by 2002:a05:600c:450b:b0:477:a1a2:d829 with SMTP id 5b1f17b1804b1-48069c0e6bcmr88790745e9.13.1769668292143;
        Wed, 28 Jan 2026 22:31:32 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4806ce4c3d1sm110750835e9.9.2026.01.28.22.31.31
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 22:31:31 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][kirkstone][PATCH 3/5] gnome-settings-daemon: ignore CVE-2024-38394
Date: Thu, 29 Jan 2026 07:31:27 +0100
Message-ID: <20260129063129.223926-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260129063129.223926-1-skandigraun@gmail.com>
References: <20260129063129.223926-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 29 Jan 2026 06:31:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123980

Details: https://nvd.nist.gov/vuln/detail/CVE-2024-38394

The CVE has the disputed flag. The project maintainers claim that the issue
is not in gnome-setttings-daemon. If the vulnerability needs to be handled
in gnome-settings-daemon, than it is a new feature rather than a vulnerability fix.

Due to this, ignore this CVE.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../gnome-settings-daemon/gnome-settings-daemon_42.2.bb        | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_42.2.bb b/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_42.2.bb
index 45622490f0..4617340b06 100644
--- a/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_42.2.bb
+++ b/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_42.2.bb
@@ -44,3 +44,6 @@ FILES:${PN} += " \
     ${systemd_user_unitdir} \
     ${libdir}/gnome-settings-daemon-42/libgsd.so \
 "
+
+# mitigation would be a new feature, not a CVE
+CVE_CHECK_IGNORE += "CVE-2024-38394"

