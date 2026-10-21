Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7564.1792575036955028061
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Oct 2026 02:30:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=J8lUfcJU;
 spf=pass (domain: gmail.com, ip: 74.125.82.49, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-156cbe59524so244701c88.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 02:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792575036; x=1793179836; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OOAX1qtHtE3urSOdXzpda9dKlmJun1VpgJl8QbWETE8=;
        b=J8lUfcJU6NrmK5yyCFGNLgjK+Z1sNSylCkpK9NYRsXoJCyBnjEf9N75nF9Un1STDah
         KALX/LV+64awg/cy57pUYKP3bsXYJh9WVr8pus2W70o6/k7xmDbXsPFiNatutSaZwm4w
         pjwH1PVQGQ/k/JIa6msF9yN6wF6XpSSDqyV/OhEUc5xDLIfb9KsPB5ksEmHwyoqmVYJH
         r7RfiftYQ4DjmNbMxw9egwdRbS/BrCk+t6qxf1IzArndpeI1VR/P/LlLLrLXli+qPXeY
         cBW6VCY715ctfcCeq4nvndeRyOx1Pj+rJYuCIttQmNdXOEt5sKVBzXCYkrWbQilg++WZ
         GsWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792575036; x=1793179836;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OOAX1qtHtE3urSOdXzpda9dKlmJun1VpgJl8QbWETE8=;
        b=vXOp4P+G9kNJMPsp1tn9dRTB5UsrUvHEbgy2DEJbePOJ5huvcnsCSJA/SHH2kfj6bS
         Hh42SjJcxrSqcaTmphwnVuf5xmwHKN42FluKovHGURQE5095BV9ymrt9n7AhlNS2T1oo
         Q8edReItsCXxd1ZpwL/aIDMuPXMZcK1T7Tlku3ApPbM5ZJ+ty3gdXkmBuceh0I6nBbuh
         jnhmbLvfk3TA8rdmKRmVbF7VdA4Q1jeQvC1o1D8EDe52JVRwEdfM7gPRX0S+MOJQEg0L
         +OmVPBwuM6OSDo++LBDfYZiAx1Xw6Fb8VnIXjs1PKNTmth87uenkA1XsoCQMCByITVko
         uHsw==
X-Gm-Message-State: AFq9FYL2RH5PBIVpT25aI4nLpxTendbhUlGc7Aq6LlnLOQg2LTf170aw
	kFueEfddykz9bnDiu3yYkoyqbBvhauCQ2CENcdp7LPWuNZw9aqpPUzn1nfqcaw==
X-Gm-Gg: AYBFou3Oc9pHnmr59q6Iw0M2ZjTHQXREXN+5QXbUfYV4wf7NC6S4l2HE+HlsqzOk/JC
	inE4jfrWuyE9TeyO8BvNPPe3ArLCIA99aCPbIe9wp/eZJeVh+InqjZdaStZn/p9xu2Mr733AyA7
	Pj6OFYmf12NwLCd8o1AFKnge5gbnpAUGxAwFbalPVmme2jH9WcHQrwEpMtGtAVboxxqA/beqzO2
	VV9GyaCzdG/D9f5PITgPV+tjIHJRRPBe+M7utPqTYn3B1e9KcUiqlrZu4Hp7QeXunr8RGZhtK28
	U38/+jgqYJakeF7NTIfM7d1e+OLhbipIho7sOI/H0FXyIom50DH6HXbwAfv4OCF2ls9k4h3s+qq
	hCok5In6IArqkIWmntjGElaetpH5qMS6vDjS8PhBXIm9/oywjUqzc867SeQ7YnXtxUbzQCcnYtq
	rofPts+j/a5TCREzYPq5HvXr4Gfyv4zMRXWwyTrVol+pErPRADvgo3yLMfvRN/t+JOAe8xZSG/L
	oKuHSIYTQR1pJqoTS6kyLaVDEzVNVhFDeWX9mRpD7zkezHzUrEFb461yPetylf1AgInuep08iYS
	IiKp+eVNO/unMSfC3DLwOrbGETyFDKR/4j1mlJxSQkjTRyA6g3JO
X-Received: by 2002:a05:701b:4194:10b0:15b:7f7a:730d with SMTP id a92af1059eb24-190a632f93fmr1889010c88.28.1792575036244;
        Wed, 21 Oct 2026 02:30:36 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-19035c0c9a6sm4716458c88.3.2026.10.21.02.30.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 02:30:35 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][blacksail][PATCH 39/44] ncp: ignore CVE-2025-14577 and CVE-2026-35087
Date: Wed, 21 Oct 2026 22:28:52 +1300
Message-ID: <20261021092857.3585453-39-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021092857.3585453-1-ankur.tyagi85@gmail.com>
References: <20261021092857.3585453-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 09:30:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131226
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2025-14577
https://nvd.nist.gov/vuln/detail/cve-2026-35087

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-networking/recipes-support/ncp/ncp_1.2.4.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-networking/recipes-support/ncp/ncp_1.2.4.bb b/meta-networking/recipes-support/ncp/ncp_1.2.4.bb
index ec6d918744..19fb258aec 100644
--- a/meta-networking/recipes-support/ncp/ncp_1.2.4.bb
+++ b/meta-networking/recipes-support/ncp/ncp_1.2.4.bb
@@ -29,3 +29,6 @@ do_install() {
 }
 
 BBCLASSEXTEND = "native nativesdk"
+
+CVE_STATUS[CVE-2025-14577] = "cpe-incorrect: This vulnerability is for Slican NCP"
+CVE_STATUS[CVE-2026-35087] = "cpe-incorrect: This vulnerability is for Slican NCP"
