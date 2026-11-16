Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33666.1794851711083884007
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Nov 2026 09:55:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=jrlZaTRJ;
 spf=pass (domain: gmail.com, ip: 74.125.82.52, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1a2761c69fbso5335861c88.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 09:55:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794851710; x=1795456510; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wl4IFuOdWQH+30dLq442vRAaEkZlV7ovW2lsOVF36hM=;
        b=jrlZaTRJyY0j2yardVWa8VebgIlEKNdJFvemom60T1VVrlB7FIsqCZEP7qE+LVsszp
         XWWB+ok9x7TIErlgyVYdUhfZmOLNvSbCNucA6HFvwyofzW2HGEcp5zjfTbxXE0DXQkD6
         CcstZXQNWSqSI0JOfv4wjG8O5RySsygGGEyR+voAcVmIa2wzV/XDV3l584ebm8OlB6oh
         sXqyrGLD7BXQBLikMUeb7/Lsj3Lx0uQugt4cIk9N2H0xSt/yK6jZ8oYwnzW32BaczzJP
         qd11OGmtrIgNJzhyj2SHoRdGhFAfEQHRuMBK+0PevMnNX8I3ifwWpdSn6M2vj/KSF2NC
         F6Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794851710; x=1795456510;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wl4IFuOdWQH+30dLq442vRAaEkZlV7ovW2lsOVF36hM=;
        b=Yr6lo5Ec8s6+GfiqxdWp2qZYg4CWJSqfvwxh9JSO9/42gbibeupfVSXlVvJEO2ldWy
         W2c5oab9h4dwW1//8vFLc8cxvzYEte5FqdOqWo57KbxH3DakGR3eym+WjbWqT1rkPpEg
         Y/6bGJ9xkNcrz8xr7D7LILG+rkma71GfTnZN580cDzchqbBCwMJxSAPsyNsUndLkG0vK
         /Hl9xi5Z5niTMsEyZPDe90TP7sTh5B6aMz+Hj/k35DSLRNHn/49j/+NmR7vFz58aESOu
         us0M2AOxAYkN/woWadzy4nMgc1nNVPy0EPOTy9tXMpiczKQv9CHOpCZuuTqghlaMDaSu
         XWVA==
X-Gm-Message-State: APuU4Z9O85v1/F57251WUA5yHEiwxXHoz3Erm7BA+Hx52XKkwoNCA7Qp
	xSGYUlhKpy271Jb3IW6P+bjjB/d36rLSYxrr7qsd0FxRA/HVzDdmFRzdkyAWvTNF
X-Gm-Gg: AYBFou310XyyjDe85tvcr2hFcUJUlSX6szfTk1TmdE9Zpd4l2bsqRPxI7FdntEr+RAu
	Qi5MnTzpnNVw9jrgEPjPkVcV6feXral+d4wPE95RauOuZ8GkVHyNTNlg4MMhEO1nlIrnv6GEzzn
	z4Jmig1KyB2cWA7o8KpCwTAqdK10HWXSSHaeRPzL7WJW4/g8IEMUD/amMISp7Q+OJ+slCXrRbWA
	w1uphGB2TLvRtbs0npswTqfr1k+cJL39CBhrnSXNKs+kP9QcevtRnRf/zetxQ9BR1k2uKCDgo4M
	BcJ69o4LUPXaOlLxu/4Adq5AMXBS1DZrUpwHaidcxnK+UJjY0Ii/KwQV9leVsBilLR2AZiqlQRW
	f8D8p2cXqzBLf/7YY17donXDIiDJhdShoWNUMJJWczzozDy3wxnFRbAy7uYp3JQbtwXe4yV1fKx
	Ug09ct0qZGPnr37Dh7Jy1XRaTHJLm3fCMRyBU5TgwSkwd8dfu692V2yPBw290Uvk4FSr9W8W0yU
	9wccyq7aQ0s57+KtyxzmDdK2ZOC/QKvs8EZqFpeO5jqTkFoRRcvrBm0fWkBKChNlABZfHacceN6
	JKriReF1/Dng2TyZxqFvR+RFDISZ5XuBhTQsMXRtMryNBtVXglc4bdOL5JY/duhtDyDwluU66jr
	dvMTaMNypRUcsdbe6GrjkO0WDs+hgU15KmV8dDQg/Rvzw51DMOnp58DkW0xGzm/Mq2MAtpnqO4i
	MLlA7aPpcbeVuPJ09XMliD/KP+EzWWsF+88Mjz1S/gE6dbHCSqKC/GaqLqw6mkcoFsbKFTwkMZq
	Irs7NxHMuHHWhHuQK+xuSbZWsFfwk0hNbl78VPDhickwhAf86FJQlqpJusVhp+1kOZ2r/9sdp60
	Bqw=
X-Received: by 2002:a05:701b:208d:b0:151:d6e5:596b with SMTP id a92af1059eb24-1b50314cae9mr9380963c88.9.1794851709738;
        Mon, 16 Nov 2026 09:55:09 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379560f5e06sm48391884eec.19.2026.11.16.09.55.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:55:08 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-python][PATCH 047/105] python3-jsonrpcclient: upgrade 4.0.3 -> 4.2.1
Date: Mon, 16 Nov 2026 09:52:59 -0800
Message-ID: <20261116175359.342679-47-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
References: <20261116175359.342679-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 16 Nov 2026 17:55:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132503
Content-Type: text/plain; charset="utf-8"

4.2.1 is tagged on the release/4.x branch.

Changes:
- 4.1.0 behavior changes: parse()/parse_json() raise InvalidResponse
  on an empty batch; a response with both result and a non-null error
  now returns Error (was Ok); a malformed error member raises
  InvalidResponse; bytes input to parse() raises; notification()
  sends tuple params as a list. InvalidResponse messages are specific.
- 4.2.0/4.2.1: FutureWarnings announcing 5.0 changes (5.0 will need
  Python 3.11+, raise TypeError on bad method/params types).
- 4.0.4: PyPI project links fixed (old domain was hijacked).
- Build backend is flit_core (>=3.12,<5); no runtime dependencies.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...-jsonrpcclient_4.0.3.bb => python3-jsonrpcclient_4.2.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-jsonrpcclient_4.0.3.bb => python3-jsonrpcclient_4.2.1.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-jsonrpcclient_4.0.3.bb b/meta-python/recipes-devtools/python/python3-jsonrpcclient_4.2.1.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-jsonrpcclient_4.0.3.bb
rename to meta-python/recipes-devtools/python/python3-jsonrpcclient_4.2.1.bb
index 99f583e717..aac74c403d 100644
--- a/meta-python/recipes-devtools/python/python3-jsonrpcclient_4.0.3.bb
+++ b/meta-python/recipes-devtools/python/python3-jsonrpcclient_4.2.1.bb
@@ -3,8 +3,8 @@ HOMEPAGE = "https://github.com/explodinglabs/jsonrpcclient"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=10f3d7679914df805c98fb351172e677"
 
-SRCREV = "e5dd11736925a9a8e463fc9420eab95235f181e3"
-SRC_URI = "git://github.com/explodinglabs/jsonrpcclient.git;branch=main;protocol=https"
+SRCREV = "0de0775557275f93b660f05d9946f10f3ca66726"
+SRC_URI = "git://github.com/explodinglabs/jsonrpcclient.git;branch=release/4.x;protocol=https"
 
 inherit python_setuptools_build_meta
 
