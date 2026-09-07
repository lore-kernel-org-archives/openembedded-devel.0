Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF22DC79F9F
	for <webhook@archiver.kernel.org>; Mon,  7 Sep 2026 10:23:48 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.31909.1788776619220630044
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Sep 2026 03:23:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=adnjHDqW;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-39266382df6so2561489a91.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 07 Sep 2026 03:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788776619; x=1789381419; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BpGzoX4/8upCLpKsa5PYJYSs24+tyeyDiBTlLnY9Bec=;
        b=adnjHDqW47qQtSYpvoEMPXFQnP5zxRA2ItabEHaPAoCdxxcAai/+BHD3pg9/sCRSQ0
         QE2hbE/2Fw9TIXINgyDDXzAVAQ7MGPsf3m1JGEY0dgZPbz8MFCTXv8EHu7h+LonDDJyw
         JdGaIht1/ro3QLH9GXelMgitZDcobx8NAvocgv9qNkw3lg4lZQlwEReuW4gOghkJokjX
         cQjmG+F40EaQ4OQjOyoWX59YUXOKjstaw5vK2DRBfe2JT7dBFxC9i5vfEJEuIoGdmjDr
         Y9MpdY5RBJoV5VS6ZG9D+Tslgx9wla9cUPP5K/sH4qJvREnWvQ7qghAAvPFb9KWFW0Lj
         feQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788776619; x=1789381419;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BpGzoX4/8upCLpKsa5PYJYSs24+tyeyDiBTlLnY9Bec=;
        b=g3VPa2PyVsvvSiKlDh1yVgIeYjBXsDOKKEbzm9WNwNWAL60frw2lPPJxnBkW4UXHF7
         4yeRm35tXgMgfppOPNmj+Lw33IkNIPj7sfWT2/S57FZU2QGnh2MsgotdExuH+s0C8oFw
         LCODCwh3905HEVFMNeucIshH7MeSyoRBhjffykd3KO5B+SwhvWAGnvdcf+RY3+o9sMdh
         EYwOnGM5Gf1GNrPfAiNUkQC8S4U/X4BUUcDJz27VTHth7VcPH1hfb2sCk9Gm82E4MFx8
         8d6n/asyGGq57sJC/v6ZYppUs3MngRq5yUab3J+iGek+14n/nGg5QFV+Qqn0lcoBxbMb
         d3qQ==
X-Gm-Message-State: AFuF++m2zm9vYCi4IA1xYREAFBEAsqDikKrX2YXOVIaQbS2p9wggbOaN
	Ipzapd9J0y4pROlCkox+JwLPcKiIuyhP6ucABTqfFR9SwExv0jZRqYJMXD00y+sT
X-Gm-Gg: AYBFou2DwVsMvfOUXS5KhMBQzhw2Yxf6AA2b62MNzRAEXcx3XefbpA5mF60NrZKtVT1
	frPCdZVNh5hQ1Er6xCG7GpUyLXkEBcO7tt8Bj1l9vMVDfv+hXSQh/0vFDSvy7vHhATE+yMcDEQG
	SQLEONYILoH/n7ooieVPOgDpP7zcHWJ4vu3HQqJdExBkkN1ffANA04znKKV7gaF9/SlPpyQgsPe
	PopYwsbquFjNbEyV0ppUdG5ne0bG8te7svzh+ObjhQXhW/XzNVTggCJ5uDQVNnyWFIbiFLMFcRX
	DmSxvLnRH6xq4R18T/+gmxGQpx+UCvYkRGjyFSyT3eN14bX1Zgts6NjigIzCBLyWqMrk3wreIeq
	cV/MpM59eajde0DSTxHyhH4Si8UcDdYINv82CRFq9eSc5ooeF1cFXrLb3K6Ih0V/nTz4+5pPTB6
	/kav5ctyQeC65H0EOSQIUZSzU7JKIW25OUTGZnPzAH7iAPJ0AvXVL0A7hl+UlqKslmn/LMomTbi
	/k87CFL7n8=
X-Received: by 2002:a17:90b:56cf:b0:398:dcf6:d40e with SMTP id 98e67ed59e1d1-39b262aa580mr34248677a91.17.1788776618575;
        Mon, 07 Sep 2026 03:23:38 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432441f5f2sm30215104c88.15.2026.09.07.03.23.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 03:23:38 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][wrynose][PATCH 5/33] libssh: ignore CVE-2025-59842
Date: Mon,  7 Sep 2026 22:22:49 +1200
Message-ID: <20260907102318.2459883-5-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260907102318.2459883-1-ankur.tyagi85@gmail.com>
References: <20260907102318.2459883-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Sep 2026 10:23:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129817

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

The vulnerability exists in GSSAPI key exchange introduced in v0.12.0[1]
Also confirmed by libssh security advisory[2]

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-59842

[1]https://gitlab.com/libssh/libssh-mirror/-/commit/88c2ea6752fab7b3da9cc4c51eaf632361a44080
[2]https://www.libssh.org/security/advisories/CVE-2026-59842.txt

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-oe/recipes-support/libssh/libssh_0.11.5.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/libssh/libssh_0.11.5.bb b/meta-oe/recipes-support/libssh/libssh_0.11.5.bb
index 752bded528..5cc270477e 100644
--- a/meta-oe/recipes-support/libssh/libssh_0.11.5.bb
+++ b/meta-oe/recipes-support/libssh/libssh_0.11.5.bb
@@ -58,3 +58,4 @@ CVE_STATUS[CVE-2026-59847] = "fixed-version: fixed in v0.11.5"
 CVE_STATUS[CVE-2026-59848] = "fixed-version: fixed in v0.11.5"
 CVE_STATUS[CVE-2026-59849] = "fixed-version: fixed in v0.11.5"
 CVE_STATUS[CVE-2026-59850] = "fixed-version: fixed in v0.11.5"
+CVE_STATUS[CVE-2025-59842] = "cpe-incorrect: the current version (0.11.5) is not affected"

