Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2A58EB28F5
	for <webhook@archiver.kernel.org>; Fri,  6 Feb 2026 08:21:00 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7172.1770366054700061849
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 06 Feb 2026 00:20:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NZqf4BMl;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-435f177a8f7so422794f8f.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 06 Feb 2026 00:20:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770366053; x=1770970853; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=paKCNaaCo/8EvZk3KCyvxh1zHh7SIcG/6dB8TaNopzM=;
        b=NZqf4BMlrTeI3fqHWScaKo7lI4NC6qHM0GBZYNlRELERpONXnjZq2C8qSrtgAlKqJD
         D6okPNOon7LDiUj2nHS4iZI3ILsLTXPQP3Ib1v6eRpfMsbJF7+DjAEvJKK18ag56AL0d
         HF09oe5moRMbgKdol01BEfg6A4es3CNE4VhKunvUdYupnc2P25vLwe+sgZC4hhcO7XNP
         A7ao+y+LPgUp4WBhqqElW79ZceMtiQaRhkzyCJd9tly1uTCh2ip3dVsDjak3/0H9Jtd2
         lAuBes8gU80IJGebHSbB4iGsDPiDq88bqSf6kY4i+MF1C2bMRDKWb//xdQRtvKeA5ryV
         YZ0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770366053; x=1770970853;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=paKCNaaCo/8EvZk3KCyvxh1zHh7SIcG/6dB8TaNopzM=;
        b=RKwWtDlxQncb6/PDPgTPrkzdgmw9K5fVuc8OSitVuWlBQBeW0iqV5U2b8ojtp2ceWC
         P4T/zVm+EIUMwyo5VgzxzT3SOhm5GhVMdmySmV4dYFa6NQAsXOe/6dr1o9TLSjacTj6d
         MZLO9OasLbRnkZ0c8LRMnsh2KckJKQ2Qf/kQ173uoAavDFMWFW2fdrz/RiCNw9uzDw/y
         7CaytU1VNgP0STrmjBxFpx+ayWCB2eyA6ZopDbR2Pke+7TYfzmvo1tHnAMRH/sKvQeTf
         pghw2BH5p0qr+Vja9ySnK0KoiPTyAU1vkmo0Cu9Ogz0gpAdTc4H73m6La1hAbz+V8jJl
         x17Q==
X-Gm-Message-State: AOJu0YzJDM+U+iiR+6nFmx2/ktpfos7I8W3tH6Q0GUd+Q9nCTjUn08RE
	IFzorOtxb5Upj1yMOwKVTj2CqFNhcSp5N83wsB0Ws6XTwogFjPGQo47DfIW4Zw==
X-Gm-Gg: AZuq6aIjsGy1n6hvDurfebnhl17m/Xf41tOmsK/URysB3mTW3LNi9sBsyiozepoevAV
	mr5KEEjJQ5H1lonymdiOXlNdlzcjf6m/Z3kZhK3wH/C0MAdcu7eY13nxx1yxiI9bre0jmlpxkWw
	i5E+dk5VzGDUDkbVodD4XfvXZ0MQxSp+2r8dKE5IOuvYWXM0YphojC1ARzPO/R+S/mgMXa9TyOU
	dXEcnd2fG+0lg/Eq9pLcmm8gy9lyOmdAzwGYZzVHIeF+QxNnak/AL1/f3UbRNsJhB64YRNL54tS
	f/dEYBIHxsygkjAwEUQ4WRUy2PvZV1fyaRNZD5IsqB8Fv4VXjp0Z37dWXHRac4KSui3kPXxGFtk
	FCIl1+fdIrdcuFkCBn17/4DtFEv7ORSUmYB7lLYTA9R2KL+CBvdkxGFexLCOAA7/w+aqGHn3llT
	4cCtmsG7GD
X-Received: by 2002:a5d:64c7:0:b0:435:db95:c2d3 with SMTP id ffacd0b85a97d-43629386506mr2884429f8f.36.1770366052999;
        Fri, 06 Feb 2026 00:20:52 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4362975ac28sm4332200f8f.42.2026.02.06.00.20.52
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 00:20:52 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH 7/8] gimp: ignore CVE-2025-14423
Date: Fri,  6 Feb 2026 09:20:47 +0100
Message-ID: <20260206082048.1442403-7-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260206082048.1442403-1-skandigraun@gmail.com>
References: <20260206082048.1442403-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 06 Feb 2026 08:21:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124236

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-14423

The vulnerability is about parsing LBM files, however this feature
was introduced in verison 3.0[1], and the current recipe version
is not vulnerable.

[1]: https://gitlab.gnome.org/GNOME/gimp/-/commit/222bef78c71ed8562a610f6863d56c0b3e2bef68

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb b/meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb
index 36b0712976..8aa5ee09cb 100644
--- a/meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb
+++ b/meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb
@@ -76,4 +76,5 @@ FILES:${PN}  += "${datadir}/metainfo"
 RDEPENDS:${PN} += "mypaint-brushes-1.0"
 
 CVE_STATUS[CVE-2007-3741] = "not-applicable-platform: This only applies for Mandriva Linux"
-CVE_STATUS[CVE-2025-48796] = "cpe-incorrect: The current version (2.10.38) is not affected."
\ No newline at end of file
+CVE_STATUS[CVE-2025-48796] = "cpe-incorrect: The current version (2.10.38) is not affected."
+CVE_STATUS[CVE-2025-14423] = "cpe-incorrect: The vulnerability was introduced in v3.0"

