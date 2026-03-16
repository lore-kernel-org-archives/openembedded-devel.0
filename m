Return-Path: <danismostlikely@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA334FB5E80
	for <webhook@archiver.kernel.org>; Mon, 16 Mar 2026 22:30:32 +0000 (UTC)
Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.63473.1773700227174451183
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Mar 2026 15:30:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TPmBILlZ;
 spf=pass (domain: gmail.com, ip: 74.125.224.41, mailfrom: danismostlikely@gmail.com)
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-64acd19e1dfso4819034d50.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Mar 2026 15:30:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773700226; x=1774305026; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SXOCiFPopqiosbqF9eIu4YIsG+lzMrEslRjLMukHJqo=;
        b=TPmBILlZ1UOv6RQDOkw6YwjdtXK3u6i2eG4DgAGV49cbwvibnolGXJnh3ftgrxkkso
         i+MAuprXfyRJN1fdmd3/tbF3e6PJVwaEM07nP3tbCmnf0CovrzvP+NiOQjBPK+Gixqh+
         TZpVcuBMK/kCvrapovmvjSiS/4VmtF/BcXykThDzuVfD0bp5dkKFM7wCocbAZH5lneIL
         KfhVZS5xvj2rvSqU8Yir9L1x1Mfo7E2AYCmY5vayo+pyxLZmpTOZ8q4EgXWTm9wY+0TM
         BvQRaX10SxCTdgT8mXyibaV6ItTEY78OppRuJE5CMFK84Tj53KBdTiaptK5fynz2OU+i
         Iixg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773700226; x=1774305026;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SXOCiFPopqiosbqF9eIu4YIsG+lzMrEslRjLMukHJqo=;
        b=rvqh0Qz53yr0gbmSDcTRoLFAATVq1Jdtj8IWJ00bpdYnutd5HBr5RybmkEXBqOwpQp
         geHwTESCApjpuLG7k/c4heNzDQKoYMt9wSglkH6gC9RBuaA4O/wz+QoVB5BX5aOrX3rC
         +SVkaRAE9E6D3xyXpTWAvc33wLj45pQG0YLF5IFEhNEEf7RNWjiMaIqQ3KWIDYkw4CP4
         PysgQlymwpSgiOYoUGTgo6tLfo8vfUvnQHg28wzvrInkXdeEaLJbnwlWEoVxvBVCvfS+
         j0m11EM7xPwbKmTgvPiCtLOYxk4MC/78e1iHk8ZdhD06rDnnSLWkeh1GVVnH5Bmhegra
         lO4Q==
X-Gm-Message-State: AOJu0YxiRQAh6zDb6VaxuXp+DO+S7VECPJb2uoolTTSVEjCNtDFEGzgQ
	+K59d9HjSttAruO4EsNsQpM+gZBr0716ZXVZxmVkDr1Jokf9UDgrdXePo0Gx9A==
X-Gm-Gg: ATEYQzzfHWgwwPzxsQSiVv6ZEhqpZViLLnDR2dj1NbPz35fU2kc1mmDJoUJ4crqdrCy
	fFygj85Lx2U6YGXBlgHt5RVMCJ4Vt4mpsdG7ne9Nsu1sFTZ6a32OoEbq/98I9S4TvE/UQjtId+Q
	mKX745Uex5ZXlGCJK/jSyeYqK3L/A+5d5nkI809Obf9dZVdaUkZxiITScQU5KMzsOoctiq+sZ2A
	lF/5lBXtPz1vvg8N0P6/ilQZ2f9Z3BbYmIGSXbLWkdByaeEIIoBLs3ugKQ1f2Vm2CKjjK27NRUU
	/zkNDDvsP9u4lJyUrrl2K0E9y/6qwscOMBqCqmSinX322Q9VetjSfascwZNLvFlmP9Np5BbZRMw
	gsU4vVavuaPVB79EEbJg+3V4QfGgVQzbF9/vm4pp4t7eUCVvucpARopIqOLCviHDMZf75YRSnOH
	xMiPSA9AhN209w1T36KlFcert3ZTn5accPUmBYiYCJD4Jp/03Zo2K1mMU=
X-Received: by 2002:a05:690e:2488:b0:64d:6098:3be0 with SMTP id 956f58d0204a3-64e63087d6fmr11907211d50.73.1773700225870;
        Mon, 16 Mar 2026 15:30:25 -0700 (PDT)
Received: from nebuchadnezzar.home.dankm.pro ([204.83.204.143])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-64e65b636d3sm6353140d50.17.2026.03.16.15.30.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 15:30:25 -0700 (PDT)
From: Dan McGregor <danismostlikely@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Daniel McGregor <daniel.mcgregor@vecima.com>
Subject: [meta-oe][PATCH v2 2/2] redis 8: Update licence
Date: Mon, 16 Mar 2026 16:30:14 -0600
Message-ID: <20260316223014.56293-2-danismostlikely@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260316223014.56293-1-danismostlikely@gmail.com>
References: <20260316223014.56293-1-danismostlikely@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 16 Mar 2026 22:30:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125294

From: Daniel McGregor <daniel.mcgregor@vecima.com>

Redis 8.0 and later are tri-licensed, the licence options are:
* Redis Source Available License v2
* Server Side Public License v1.0
* GNU Affero GPL v3.0

Signed-off-by: Daniel McGregor <daniel.mcgregor@vecima.com>
---
 meta-oe/licenses/RSAL-2                       | 163 ++++++++++++++++++
 meta-oe/recipes-extended/redis/redis_8.0.6.bb |   2 +-
 2 files changed, 164 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/licenses/RSAL-2

diff --git a/meta-oe/licenses/RSAL-2 b/meta-oe/licenses/RSAL-2
new file mode 100644
index 00000000000..4a37cf41364
--- /dev/null
+++ b/meta-oe/licenses/RSAL-2
@@ -0,0 +1,163 @@
+1. Redis Source Available License 2.0 (RSALv2) Agreement
+========================================================
+
+Last Update: December 30, 2023
+
+Acceptance
+----------
+
+This Agreement sets forth the terms and conditions on which the Licensor
+makes available the Software. By installing, downloading, accessing,
+Using, or distributing any of the Software, You agree to all of the
+terms and conditions of this Agreement.
+
+If You are receiving the Software on behalf of Your Company, You
+represent and warrant that You have the authority to agree to this
+Agreement on behalf of such entity.
+
+The Licensor reserves the right to update this Agreement from time to
+time.
+
+The terms below have the meanings set forth below for purposes of this
+Agreement:
+
+Definitions
+-----------
+
+Agreement: this Redis Source Available License 2.0 Agreement.
+
+Control: ownership, directly or indirectly, of substantially all the
+assets of an entity, or the power to direct its management and policies
+by vote, contract, or otherwise.
+
+License: the License as described in the License paragraph below.
+
+Licensor: the entity offering these terms, which includes Redis Ltd. on
+behalf of itself and its subsidiaries and affiliates worldwide.
+
+Modify, Modified, or Modification: copy from or adapt all or part of the
+work in a fashion requiring copyright permission other than making an
+exact copy. The resulting work is called a Modified version of the
+earlier work.
+
+Redis: the Redis software as described in redis.com redis.io.
+
+Software: certain Software components designed to work with Redis and
+provided to You under this Agreement.
+
+Trademark: the trademarks, service marks, and any other similar rights.
+
+Use: anything You do with the Software requiring one of Your Licenses.
+
+You: the recipient of the Software, the individual or entity on whose
+behalf You are agreeing to this Agreement.
+
+Your Company: any legal entity, sole proprietorship, or other kind of
+organization that You work for, plus all organizations that have control
+over, are under the control of, or are under common control with that
+organization.
+
+Your Licenses: means all the Licenses granted to You for the Software
+under this Agreement.
+
+License
+-------
+
+The Licensor grants You a non-exclusive, royalty-free, worldwide,
+non-sublicensable, non-transferable license to use, copy, distribute,
+make available, and prepare derivative works of the Software, in each
+case subject to the limitations and conditions below.
+
+Limitations
+-----------
+
+You may not make the functionality of the Software or a Modified version
+available to third parties as a service or distribute the Software or a
+Modified version in a manner that makes the functionality of the
+Software available to third parties.
+
+Making the functionality of the Software or Modified version available
+to third parties includes, without limitation, enabling third parties to
+interact with the functionality of the Software or Modified version in
+distributed form or remotely through a computer network, offering a
+product or service, the value of which entirely or primarily derives
+from the value of the Software or Modified version, or offering a
+product or service that accomplishes for users the primary purpose of
+the Software or Modified version.
+
+You may not alter, remove, or obscure any licensing, copyright, or other
+notices of the Licensor in the Software. Any use of the Licensor's
+Trademarks is subject to applicable law.
+
+Patents
+-------
+
+The Licensor grants You a License, under any patent claims the Licensor
+can License, or becomes able to License, to make, have made, use, sell,
+offer for sale, import and have imported the Software, in each case
+subject to the limitations and conditions in this License. This License
+does not cover any patent claims that You cause to be infringed by
+Modifications or additions to the Software. If You or Your Company make
+any written claim that the Software infringes or contributes to
+infringement of any patent, your patent License for the Software granted
+under this Agreement ends immediately. If Your Company makes such a
+claim, your patent License ends immediately for work on behalf of Your
+Company.
+
+Notices
+-------
+
+You must ensure that anyone who gets a copy of any part of the Software
+from You also gets a copy of the terms and conditions in this Agreement.
+
+If You modify the Software, You must include in any Modified copies of
+the Software prominent notices stating that You have Modified the
+Software.
+
+No Other Rights
+---------------
+
+The terms and conditions of this Agreement do not imply any Licenses
+other than those expressly granted in this Agreement.
+
+Termination
+-----------
+
+If You Use the Software in violation of this Agreement, such Use is not
+Licensed, and Your Licenses will automatically terminate. If the
+Licensor provides You with a notice of your violation, and You cease all
+violations of this License no later than 30 days after You receive that
+notice, Your Licenses will be reinstated retroactively. However, if You
+violate this Agreement after such reinstatement, any additional
+violation of this Agreement will cause your Licenses to terminate
+automatically and permanently.
+
+No Liability
+------------
+
+As far as the law allows, the Software comes as is, without any
+warranty or condition, and the Licensor will not be liable to You for
+any damages arising out of this Agreement or the Use or nature of the
+Software, under any kind of legal claim.
+
+Governing Law and Jurisdiction
+------------------------------
+
+If You are located in Asia, Pacific, Americas, or other jurisdictions
+not listed below, the Agreement will be construed and enforced in all
+respects in accordance with the laws of the State of California, U.S.A.,
+without reference to its choice of law rules. The courts located in the
+County of Santa Clara, California, have exclusive jurisdiction for all
+purposes relating to this Agreement.
+
+If You are located in Israel, the Agreement will be construed and
+enforced in all respects in accordance with the laws of the State of
+Israel without reference to its choice of law rules. The courts located
+in the Central District of the State of Israel have exclusive
+jurisdiction for all purposes relating to this Agreement.
+
+If You are located in Europe, United Kingdom, Middle East or Africa, the
+Agreement will be construed and enforced in all respects in accordance
+with the laws of England and Wales without reference to its choice of
+law rules. The competent courts located in London, England, have
+exclusive jurisdiction for all purposes relating to this Agreement.
diff --git a/meta-oe/recipes-extended/redis/redis_8.0.6.bb b/meta-oe/recipes-extended/redis/redis_8.0.6.bb
index 9a947c075d3..f6866747ebd 100644
--- a/meta-oe/recipes-extended/redis/redis_8.0.6.bb
+++ b/meta-oe/recipes-extended/redis/redis_8.0.6.bb
@@ -2,7 +2,7 @@ SUMMARY = "Redis key-value store"
 DESCRIPTION = "Redis is an open source, advanced key-value store."
 HOMEPAGE = "http://redis.io"
 SECTION = "libs"
-LICENSE = "AGPL-3.0-only | SSPL-1.0"
+LICENSE = "RSAL-2 | AGPL-3.0-only | SSPL-1"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=9f1da87999fb281d8a9e3e3b2d0403b4"
 DEPENDS = "readline lua ncurses"
 

