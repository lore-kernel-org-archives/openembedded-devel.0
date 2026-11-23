Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.48042.1795411872879098634
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 Nov 2026 21:31:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=htzbVrMH;
 spf=pass (domain: gmail.com, ip: 74.125.82.169, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-38190551625so6115747eec.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 22 Nov 2026 21:31:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795411872; x=1796016672; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f/0BI+Q1ZfVHz7rPk+jqMsZXIR5jeo4nhdjO0XYcsoo=;
        b=htzbVrMHzfsyALEvHrNmnTtFd5yXYl56yaJJa8mHBrFJXZCjNBdJLal81cZ5MCYvEl
         wC+sUR+yMu7YHmVeBcINophmhYKREbkp3NO5WCj9ms/xfqWdMyFu/uRxN9IG11o4y+Km
         H3bvORdNArYj3EKyZ1kTnRG7AHW74PJWpMz3QResra6IWVuJq3Nbkxyh8bBnaV1wIGDF
         oc+hnz60P684rd8AJe0tC1jFaXaodnWbHAait0YeLz1t0wwRKw9O3K/RWVshGlyCr/f0
         rPJ6vPq+l3RqNytbL4ushuwX6MhSP8GrTtgOz9xyUphEi/oEgCf6KS1WWZGRIMAPPNFE
         VdaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795411872; x=1796016672;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=f/0BI+Q1ZfVHz7rPk+jqMsZXIR5jeo4nhdjO0XYcsoo=;
        b=pJeGfDdGDrWuTP8D1bIGIt7BMwFFYLJlBqfU6/KRscGtfUqomGkmFEuA3E3m1mT4g3
         Ugi8P6B4ULDBGmXvWIJ13jGP3T5jqydcktHKt7r10plPPpwNfHFG08KpLm/jOJMiPmxp
         L9mcDIa68HBmwrsnqB6d/dKIgA5kQCnUj583kTU1CuaJAkV661Jo5DYoFo19RPscqTwk
         iSQG9xsZNtfpNzANyD35/g5sxZV2r993ur+2d2dLD2FzFzJn6JP6V4KWnBK48Q8cq7gP
         WYuCG7dBctnWFKCtGbuIAWAhz1VOt52KWQ0xdCsflKNvoRhNFZr9O9hOS8uSN0le357v
         vwnA==
X-Gm-Message-State: APuU4Z8g7Q8fiA5ML/ItMiNlMYjzRiUece/elI+PnP9LTIEWod8WdRZS
	712hQNC6aNYwMkofzSjdmBUuIZ89U6QeiY7rRsYBdbYYMPmjCTdP8ZMMLYD26p8RSi0=
X-Gm-Gg: AZFdTZcRZBymo0AFn9kHgQb0Ls+Y1EGXqPxu/T9I0Hs6aPr/K6jZWLlLr/dtH4Kfnqp
	rAfJ6kRDt6eMkBnUQUsjqS2z4lpj+gTmncG66O+ztXcRSQ3GZZKG6gPezmq62bS9o16zPrn3ZR4
	41FhpsqO2kMy8QgZsmdOmuDztQ+vX5C3yBofKUUnpQttLI1Nrdf7wgciBAOFYSmPKGUFPGOD4wR
	mRi/ijBpE0KqqPkotkyK29pzxvtRKqYiRMM9FMd1FejQoP+MLfSD0mOh977ygWj11vGavFQJY+q
	7rTRVHbG5u8NxY20ejqzqm/aj2DJEYlJZa4TQGY7FU0P65EpLDYLAHlcTDkQIRZeMFIYTPe40j7
	MZu42d6MVby3cM/TLLQ/6L3Mt9lSMUiiNIwiKc0RtkIgP1zaTOSs1PpdfjMhF9tTWg21pHHIgdB
	oH6T5tq84lB4SRbydn0h4WeYbdqyrFoZ4zB1HLbQ1jtj7njPZP/t3h303IfsmkTSw4wYSSdfoQ2
	cAnCQwb91lKxTP4QZJpf71Wh5HC3jM2GQkB1fF8Cxu3mIh+bEUlypYwJVMc5Axuu3uZi3Hw8Y8f
	KzInvMmamr2sG31Ty9tDdKCyCPS1HCuBCL8b+OWjlU6x4NsBNY8gxwo6yDWUpVHvXMzfoDyDnQo
	/3VLWKuJRcaJQAU2sjvnIRMqCVEjJV5j1TVo/sXCmDBZd5hjPTCAjxHzKer/Hg+baCygLnXjyw+
	2KegWN9Xaoyvj283N3z8/oWZIt9aO7qIaRYjDctzHCVYq1k0k3zyROgQu/l8VsqhsWdl/D64giK
	/DimBpmfZvWkbZbo5MoF85iJp8jf4YAlnJprSKMVU9XcASm3rSvBMrvDJSUE4GlogdweIElQHsh
	YUfW
X-Received: by 2002:a05:7301:7187:b0:386:bd8:7ab3 with SMTP id 5a478bee46e88-3860bd88965mr10405251eec.29.1795411872038;
        Sun, 22 Nov 2026 21:31:12 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm36573136eec.26.2026.11.22.21.31.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 21:31:11 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 34/42] syslog-ng: upgrade 4.12.0 -> 4.13.0
Date: Sun, 22 Nov 2026 21:29:18 -0800
Message-ID: <20261123052953.3658549-62-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
References: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 23 Nov 2026 05:31:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132849
Content-Type: text/plain; charset="utf-8"

- New $(format-json) --order option, CloudWatch Logs HLC destination,
  and certificate-based Azure/OAuth2 authentication in cloud-auth
- Security fixes: unbounded dynamic name-value registration
  (GHSA-ch7v-cjmh-j4g2), crash with encoding() and large log-msg-size
  (GHSA-v8gx-qpvj-wqr7), TLS hostname check accepting embedded NUL
  (GHSA-gx8q-j4c3-prc2)
- New options: http response-body-action(), disk-buffer
  remove-if-empty(), reconnect backoff, password-protected PKCS#12
- java module disabled; many crash, leak and parser fixes

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../syslog-ng/{syslog-ng_4.12.0.bb => syslog-ng_4.13.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/syslog-ng/{syslog-ng_4.12.0.bb => syslog-ng_4.13.0.bb} (98%)

diff --git a/meta-oe/recipes-support/syslog-ng/syslog-ng_4.12.0.bb b/meta-oe/recipes-support/syslog-ng/syslog-ng_4.13.0.bb
similarity index 98%
rename from meta-oe/recipes-support/syslog-ng/syslog-ng_4.12.0.bb
rename to meta-oe/recipes-support/syslog-ng/syslog-ng_4.13.0.bb
index 32ec456f50..73ce344ca9 100644
--- a/meta-oe/recipes-support/syslog-ng/syslog-ng_4.12.0.bb
+++ b/meta-oe/recipes-support/syslog-ng/syslog-ng_4.13.0.bb
@@ -27,7 +27,7 @@ SRC_URI = "https://github.com/balabit/syslog-ng/releases/download/${BP}/${BP}.ta
            "
 SRC_URI:append:powerpc64le = " file://0001-plugin.c-workaround-powerpc64le-segfaults-error.patch"
 
-SRC_URI[sha256sum] = "03a03d19ac203dca53c7ec79a7005c8a850665a95ff4cd0f1e7bb4c497c64d46"
+SRC_URI[sha256sum] = "e82daa3139d1cd790f2d8f2699c70b56a521d8e5218f7e52633dfad1b1f63297"
 
 UPSTREAM_CHECK_URI = "https://github.com/balabit/syslog-ng/releases"
 UPSTREAM_CHECK_REGEX = "releases/tag/syslog-ng-(?P<pver>\d+(\.\d+)+)"
