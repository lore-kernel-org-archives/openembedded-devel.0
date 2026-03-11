Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62F2DFD88F4
	for <webhook@archiver.kernel.org>; Wed, 11 Mar 2026 03:59:05 +0000 (UTC)
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13398.1773201535717271866
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Mar 2026 20:58:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=DFIVzjGU;
 spf=pass (domain: mvista.com, ip: 74.125.82.43, mailfrom: hprajapati@mvista.com)
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-128e4d0cc48so1111993c88.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 10 Mar 2026 20:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1773201535; x=1773806335; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SVuij5IPWKX3FOrpzGbKmUFTFyO3Hr6+oQrlZnXPwhU=;
        b=DFIVzjGUNmT1+cUSe5c5bpqS1QoOmCixB957Cl0KvitnkeUkd49ZBtQTodRLG3sn/N
         7hCPXld+kp/ipLrzjCzUYuxhEL2r4N3dSl2dH9nsFge6PK9G1hdsp0wgyMdPxspCOSq3
         iJHaVSXubSUk+J6aNeZR+jfK+aTSj5oDUJttI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773201535; x=1773806335;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SVuij5IPWKX3FOrpzGbKmUFTFyO3Hr6+oQrlZnXPwhU=;
        b=aP/hO+Tyq0JafOCTwI9aah94XiNAQKdxyZZRYji+l+ZGLGWwH2pbhVj0Z1d8umm997
         zHTEU/ZWe6O4a0UulKT1vD4yZ/PMKd17W0LsNVTVbo0MN8HzUu9oO7kNgqFxFudfjGHK
         AbYGi/phtdzpsNsT2YWE8ZorPOpfMHTR+3CqKjknFeGyLJ2vRilYba2LKcT9H0kbGLwI
         DQfhpw2UoSzjIAjezZwt8qm3UtPMrF5h23LmZ+PcuXM8nUgD/NdzcBvfg7FUw0EPgVy4
         inv+bkvtCOFYCuD1MqnOJsolWCBuqTHqUoIb4sBXVU5aVfr2pSVD5uFcl5lAwQUAslDs
         QxLg==
X-Gm-Message-State: AOJu0YyJbY58Dtl8dUpz8RrOl7FZEXDPmR+xRCdP2f64AjzAJlLOGdBU
	IxY0MBm02UEZM2PFT76vCYWe84Mgj/WgPftpS0JBk5dM8pFuLsFpV+98E50eIzmm2rjI8SpXbwc
	buU0owdo=
X-Gm-Gg: ATEYQzzIr4qSFDC9pfPM5nLeMqxlKlVGtAPqvfELlMAGvmIT5pTKOnm7+punGdcTIU5
	x5v5xkJWwKWDkTKcoATlQCkTYKOo05VtDxZ6pTpRrxL1ZRr48KfGtRgPkI61RVhoJQg/aSn3e8b
	BCQ/BjO9WtGXuboWYRmaT4N33aB5vrKk4b29P7oJbYm81olEtdxa3TirOe7mCEpYVtV6ElwwP1T
	wQN01qFWqjR96t54t2b8B+B+rcypiYaBHKdIzcgmKnFdjW3LIDgh10H+FRIG1dlbyXRpA2rWzrN
	IXJLPsBpFsRvjTr3CwC5Fq0kxOSummy7O8s0e4uNsKkOSAI0XiZiMndB1G5kf5v3T/I4YN1GGlA
	375S89m7iEVlYtl72ZZjmFG5I5WoD0hbGAeWY33yHasKvkDKTg/Nkmp7Rreoil5JPvhZjsmQZt8
	eahW9zciKpfse2dA+SsXenLzwG/jJBn7t3OwAbsNUJKEh0MhJ8y/mYjR4R8wJis5lyhjuVufg=
X-Received: by 2002:a05:7022:2509:b0:11b:923d:7753 with SMTP id a92af1059eb24-128e77cc3d3mr501388c88.3.1773201534851;
        Tue, 10 Mar 2026 20:58:54 -0700 (PDT)
Received: from MVIN00013.mvista.com (103-216-234-24.swc13.starlings.in. [103.216.234.24])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-128e7ce6135sm1128347c88.16.2026.03.10.20.58.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 20:58:53 -0700 (PDT)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [meta-networkin][scarthgap][PATCH] wireshark: Fix CVE-2026-0960
Date: Wed, 11 Mar 2026 09:28:42 +0530
Message-ID: <20260311035842.6610-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 11 Mar 2026 03:59:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125049

Pick patch from [1] also mentioned in [2]

[1] https://gitlab.com/wireshark/wireshark/-/issues/20944
[2] https://security-tracker.debian.org/tracker/CVE-2026-0960

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../wireshark/files/CVE-2026-0960.patch       | 43 +++++++++++++++++++
 .../wireshark/wireshark_4.2.14.bb             |  1 +
 2 files changed, 44 insertions(+)
 create mode 100644 meta-networking/recipes-support/wireshark/files/CVE-2026-0960.patch

diff --git a/meta-networking/recipes-support/wireshark/files/CVE-2026-0960.patch b/meta-networking/recipes-support/wireshark/files/CVE-2026-0960.patch
new file mode 100644
index 0000000000..6e577dac64
--- /dev/null
+++ b/meta-networking/recipes-support/wireshark/files/CVE-2026-0960.patch
@@ -0,0 +1,43 @@
+From: John Thacker <johnthacker@gmail.com>
+Date: Mon, 12 Jan 2026 15:28:22 +0000
+Subject: QUIC: Update reassembly ID for a new MSP
+
+When a QUIC frame has more than one MSP, the reassembly id for the
+second MSP has to be used when adding or looking it up, instead of
+the original reassembly id of the first MSP.
+
+Fixes reassembly of the file in #20944 in most cases, outside of issues
+with out of order UDP packets / QUIC packets.
+
+(cherry picked from commit 562c3c070c6f58d01904d42338489b1a64ad7655)
+
+Co-authored-by: John Thacker <johnthacker@gmail.com>
+origin: https://gitlab.com/wireshark/wireshark/-/merge_requests/23175
+
+CVE: CVE-2026-0960
+Upstream-Status: Backport [https://gitlab.com/wireshark/wireshark/-/commit/f31123dcdbac37272046b58b2f7941bc7fb42934]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ epan/dissectors/packet-quic.c | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/epan/dissectors/packet-quic.c b/epan/dissectors/packet-quic.c
+index cabc2c5..7614b7f 100644
+--- a/epan/dissectors/packet-quic.c
++++ b/epan/dissectors/packet-quic.c
+@@ -1781,9 +1781,10 @@ again:
+                         deseg_seq, nxtseq+pinfo->desegment_len, stream->multisegment_pdus);
+                 }
+ 
+-                /* add this segment as the first one for this new pdu */
++		/* add this segment as the first one for this new pdu
++		 * Use the the new MSP's reassembly ID (its first frame). */
+                 fragment_add(&quic_reassembly_table, tvb, deseg_offset,
+-                             pinfo, reassembly_id, NULL,
++                             pinfo, msp->first_frame, stream_info,
+                              0, nxtseq - deseg_seq,
+                              nxtseq < msp->nxtpdu);
+             }
+-- 
+2.50.1
+
diff --git a/meta-networking/recipes-support/wireshark/wireshark_4.2.14.bb b/meta-networking/recipes-support/wireshark/wireshark_4.2.14.bb
index dbf7017514..559dd75fe0 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_4.2.14.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_4.2.14.bb
@@ -18,6 +18,7 @@ SRC_URI = "https://1.eu.dl.wireshark.org/src/all-versions/wireshark-${PV}.tar.xz
            file://CVE-2026-0959.patch \
            file://CVE-2026-0962.patch \
            file://CVE-2026-3201.patch \
+           file://CVE-2026-0960.patch \
            "
 
 UPSTREAM_CHECK_URI = "https://1.as.dl.wireshark.org/src/all-versions"
-- 
2.50.1


