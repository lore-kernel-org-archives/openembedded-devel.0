Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7614CC5CFC1
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 22:46:07 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24348.1786747558449107191
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Aug 2026 15:45:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=kncEa5jf;
 spf=pass (domain: gmail.com, ip: 209.85.215.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cbedbaba5fdso1004055a12.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 15:45:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786747558; x=1787352358; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C+awc3/II4iLPOAXUgbkd6EuBqZ8blSo0k4ReYIBBtU=;
        b=kncEa5jfNh6ji7/xfIJAD5R0twx94kKhB5o3NQOUv7A8jezwMS2zLiDbclRHalgBhL
         ekzlMx/BZT8E5MYm0ExzckVdzK9MgbV4M0TcpqnFoeCkqlhCNjDtsWZ8Z6fzagv9eNf2
         GoEBGel1Yw+0hET3J+D97NF8FhBucUEHN2VNjLy5IBeLM3MsdAiAzUMPnzffRmAvihYz
         X4xBtucaJv2/8PUXeVvsO+mRXLnTuc0gc4rO47+t5Cps6ZiYaFn9L8PGU1CLVV98Z9md
         9Oy++lErnFdRBwGBK+W6krgDl7jure822lvLIzvOidDqorvZMiwrgdjfxRFEqDtlsXag
         DUEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786747558; x=1787352358;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=C+awc3/II4iLPOAXUgbkd6EuBqZ8blSo0k4ReYIBBtU=;
        b=GP2NGrCxJ092j9f+f0QbDVfCyO4gexoW4zSar8fq+dQlXIDAI+V0DdOtEkpC4MFHzu
         xmoETUOkzyO/0Ye+/gXYvReZNboNUywgNN2Gie2JU101ZDbf/MxDMohU1jwvIplYuz/I
         LGr0BNadNz9XrUxq0QdmrRp3ZqcWzGv4vsKrenoMIVt6GpUfts2sPIQo9nK8EdKcc13n
         3p3GZmqjgPDPFNqurzL/PCHfqG3dSGG2KcKGtbiHnXHeeKsN4j6aSpKkYn93Lon56KBO
         8nqEDKiBr1+QzMtqKdfgCECJOFq8Ob1Fd5FKS1v/tKDi5ZjWQiXFLDEA7b7aiH6iPXvy
         Octg==
X-Gm-Message-State: AOJu0YzZ/LsIZsdYWihsO5v2tZu5bbNk68hezsAsnZBEVSXTaILGnv1U
	lmjsA/fm7Ng06BH072CBV/bvglWI07tQPLMbNl1r0QGtc2O+AaPIXB2t+yYFBdJU
X-Gm-Gg: AR+sD10KqTDPLCDHNabwzPL84BXcJjOA0A7Py+dumRuYVL5ZVGdWgfO8kQzrc6esYyE
	Y5FxiXAfJFaACdJzpBvdZdAbILWBJtrsRJAfyMLtMZXA7ZPoymxAcIdRPGWAKy+xPwOkf8WocPJ
	JVBqmdzxBd/jjo3vWGIkN6ebX8/V6+8Qs/ti8qy0KVgCf33bt7maW+Lxz7pmpoS79QQ45lZKrZI
	g5MMlm1LsMZVNEf8OfeEen8+XENdW61rYTr/2Nc/ZFFLtzhZhieIn9SqpBW3FfV7uIeHasyAIUb
	mhKagubI39y0wI802uNi503giLqiIqHE7ZYXDJ71N5YsyrWbzBmNvH3wp+Hl0dCP6HXnZJFzQrs
	3pMRQ6DsNOi56FgsdPvjnoyGfjsCWo5JigEK70FXlSs4D7s1Xj/micTrI4orV7A0gDfjfAzMyGU
	byCcakmK8cfFs2fRjiX4kh0SF8z3Pw9oOAvqag1MOkJUNn935dqQNL3ZdlYMreuKc/rVsb5Rlpf
	S1HYq2nQb2WibKoQ2Bt4qAiVv2O3tmaX/OLkysG4NQjI1lHEQ4q0VXOTaY/b1oOrWXcWm+WwdMW
	qqXb1wnsVmislTaOxGv1D35eghLVmIZgdXDBHeeEy4xSsYieG7Dy+5rERuIEtWscLgqWI/E1h98
	RmOtNnxNkyycFIk76BUEexW3y3HiKMRx0kfEQwyZXhIcF5wr75gk=
X-Received: by 2002:a05:6a20:94c8:b0:3cc:4d86:389c with SMTP id adf61e73a8af0-3cc71a68040mr10039715637.13.1786747557635;
        Fri, 14 Aug 2026 15:45:57 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141387ac9b1sm14541588c88.2.2026.08.14.15.45.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 15:45:57 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 013/109] capnproto: upgrade 1.4.0 -> 1.5.0
Date: Fri, 14 Aug 2026 15:43:59 -0700
Message-ID: <20260814224539.1523174-13-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
References: <20260814224539.1523174-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Aug 2026 22:46:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129077

Cap'n Proto 1.5.0 is primarily a KJ-HTTP security release.  It hardens
the plain-HTTP serialization path against request smuggling / HTTP
desync: serializeRequest/serializeConnectRequest now reject request
targets containing whitespace or control characters and serializeResponse
rejects status text containing CR, LF or NUL (GHSL-2026-146, reported by
Kevin Stubbings), and the header parser no longer accepts whitespace
between a field name and the colon.  It also picks up compatibility
fixes: builds against OpenSSL 4.0 while remaining compatible with older
OpenSSL, Bazel 9 support, boringssl Bzlmod repo_name, an MSVC build fix,
tolerating ERROR_INVALID_FUNCTION from GetFileInformationByHandleEx under
Wine, replacing the c++/LICENSE.txt symlink with a real file, and
scoping CTest to the project.  LICENSE is unchanged and
0001-Export-binaries-only-for-native-build.patch still applies cleanly.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../capnproto/{capnproto_1.4.0.bb => capnproto_1.5.0.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/capnproto/{capnproto_1.4.0.bb => capnproto_1.5.0.bb} (95%)

diff --git a/meta-oe/recipes-devtools/capnproto/capnproto_1.4.0.bb b/meta-oe/recipes-devtools/capnproto/capnproto_1.5.0.bb
similarity index 95%
rename from meta-oe/recipes-devtools/capnproto/capnproto_1.4.0.bb
rename to meta-oe/recipes-devtools/capnproto/capnproto_1.5.0.bb
index 948ff80345..b867c72e36 100644
--- a/meta-oe/recipes-devtools/capnproto/capnproto_1.4.0.bb
+++ b/meta-oe/recipes-devtools/capnproto/capnproto_1.5.0.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://../LICENSE;md5=a05663ae6cca874123bf667a60dca8c9"
 
 SRC_URI = "git://github.com/sandstorm-io/capnproto.git;branch=release-${PV};protocol=https;tag=v${PV} \
            file://0001-Export-binaries-only-for-native-build.patch"
-SRCREV = "8b892a8a11a632f5d52b877a49728808a142379a"
+SRCREV = "373e61ec89e2359f1c362e9b2eadc552f4779306"
 
 S = "${UNPACKDIR}/${BP}/c++"
 

