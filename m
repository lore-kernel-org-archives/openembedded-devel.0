Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DFD5C5DF74
	for <webhook@archiver.kernel.org>; Tue, 18 Aug 2026 05:02:29 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2535.1787029340673745765
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Aug 2026 22:02:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=L3Bovxg5;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2ce87c7e3bbso53577215ad.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 17 Aug 2026 22:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787029340; x=1787634140; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XO0edC16Eam6uHRAnz2hX01jrAWyjE3rtM31CqUgcW8=;
        b=L3Bovxg5KieA2FyXJO3PHOQf1CblBlvSuXZ/Zy974bW4ICvvnUyipYLqm/PQXZ+aeB
         Ni4C9SKTfNcJH7VW5V+j3koaHcVbFK9AKLGYwSExRTLkqJWoCmugdV8KF/NYIUBNWfOb
         FmUWmrYwHyJhclQ/07UUf4a3azUBtdDZVzv5E9/5RggILJ/iujvmq3kf6c7/7A3IT+pc
         rXJaFmU4tcpz6b0tWBqHvVSzb6B9v1vwW/Ks4axB113gnbvGIbSBVINsgnpVG0DT0/Ud
         8SlI6uYNDAB6lN0QJR/F/aIFiAMGsbGWkrHWg9Od+f5exNpe0zWVMH96kuSmpIXExCIL
         Pzhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787029340; x=1787634140;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=XO0edC16Eam6uHRAnz2hX01jrAWyjE3rtM31CqUgcW8=;
        b=eg7PGLoJLPEiz9XMjahG/kasO4bszOmoJl4xIQfMdUgdNtGZfRnGZL4pfPDsuvv4VE
         YlAsRGd5+3/2Y0k/sJdniC1uUES/N2xWPL/IY5l5qt2ZO1vWjmF07Axk5GIcoQsddwt4
         xo15fl+rYaOrBNU8h13pSdTV3E4o+Hzg79TP+f6haCv4CxZ6V1H7+NmmkXwCECYP1au2
         RBY/SbDHFPmvBoizpkTb2yoGzKOr8YD2G00Tjz/Q08rkQqNAB01UzXHLv8COXMyxw4nP
         WfM2x5FJqVHiCkmLuWuFAuae2E3t7V8mLW5kRhnRjUTi55Mk/jW+STdPE3BX7KthDlnO
         mLEg==
X-Gm-Message-State: AOJu0Yx74OJmDgyrd+auZySQp285SqhstO8A/ppcMQjwsHfKftA4nztw
	V1sjm54Tp7CgaiujhhU/VaZlfJpxY4DPh0jovlS9sl/3flkNJf8O5KspEURPgAx0
X-Gm-Gg: AR+sD13eWR2wNnae0Cunqj0YFRp2Eya1MHRDpRuVZVHBN+1+HzF7KcsGIDCh4bxFFTY
	GMJbTvhnmBQwqaVW070WF3H/ipGTYyr7wYoGwGRW3+3kyUX6BdPiyXZ+cPINYYRIUFYA9epFew1
	6raZxAgOieVfiBGx7yRRN1Trn4s/eXYBFWCpnBTZy/wBcnE9WsY3KGF0S6H16U+6Nidq0VvoDg+
	8vUchDbrBrc2rS2YzC5ytOAQmoxbFPjw5jUMCyFXDBNlB+NPnB+EUIh7XkjmNfW9Hv4nRp9SG6v
	A7legpTNSOZoUGoECK1ZrGxTaYb9sa75Qd2+7WDXz04qFPCOKOGceC3GfnkPiwpLNxOXu8nypY1
	E5/LygL3M4pvin0HJ2PtyFVSrMSx/eBHmlQKDnO/3Td01zurhTRcDG1Y2+ELfQ4tvxEVS18oAFw
	SxoBM8cyxqzH2XwFTe/8I0sBE4CEcse0gXhduymKVmR1nN/AsgJspLjqQk8oqo1sNlFipsAG0iR
	w==
X-Received: by 2002:a17:90b:5685:b0:38e:4cb:51f with SMTP id 98e67ed59e1d1-3955a799fcdmr7460827a91.11.1787029339938;
        Mon, 17 Aug 2026 22:02:19 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3267be8e5c8sm12840095eec.16.2026.08.17.22.02.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 22:02:19 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][PATCH 16/27] arno-iptables-firewall: add UPSTREAM_CHECK_GITTAGREGEX variable
Date: Tue, 18 Aug 2026 17:01:11 +1200
Message-ID: <20260818050123.2901739-16-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260818050123.2901739-1-ankur.tyagi85@gmail.com>
References: <20260818050123.2901739-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Aug 2026 05:02:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129215

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Fixes:
$ devtool latest-version arno-iptables-firewall
...
INFO: Current version: 2.1.2a
INFO: Latest version: 2.1.2
INFO: Latest version's commit: 4651194df5f985ebfc989da0a20d62b9baecf314

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../arno-iptables-firewall/arno-iptables-firewall_2.1.2a.bb      | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-filter/arno-iptables-firewall/arno-iptables-firewall_2.1.2a.bb b/meta-networking/recipes-filter/arno-iptables-firewall/arno-iptables-firewall_2.1.2a.bb
index e7c25ef266..bd7f7a992e 100644
--- a/meta-networking/recipes-filter/arno-iptables-firewall/arno-iptables-firewall_2.1.2a.bb
+++ b/meta-networking/recipes-filter/arno-iptables-firewall/arno-iptables-firewall_2.1.2a.bb
@@ -7,6 +7,7 @@ LIC_FILES_CHKSUM = "file://gpl_license.txt;md5=11c7b65c4a4acb9d5175f7e9bf99c403"
 SRCREV = "4651194df5f985ebfc989da0a20d62b9baecf314"
 SRC_URI = "git://github.com/arno-iptables-firewall/aif;branch=master;protocol=https;tag=${PV}"
 
+UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+(?:[a-z]))"
 
 inherit systemd
 

