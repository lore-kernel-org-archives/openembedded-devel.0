Return-Path: <danismostlikely@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 181A9F53D8F
	for <webhook@archiver.kernel.org>; Mon, 16 Mar 2026 19:23:41 +0000 (UTC)
Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.59268.1773689011257234414
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Mar 2026 12:23:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lraBCjOm;
 spf=pass (domain: gmail.com, ip: 74.125.224.49, mailfrom: danismostlikely@gmail.com)
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-64c9cabfe5dso85227d50.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Mar 2026 12:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773689010; x=1774293810; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3n74CxiYVk5X74osmGXlYXsaKthHkCIsx2D9FP7rhHI=;
        b=lraBCjOmQYg1b5f732nKsSvQXe+xT1FgvYQge8rgqguuL7RmZKwkOE9fC/cE0uZGlg
         hfTy8AMCC80wn2DyuLzhQ0X2K5wzvWLcNnO+kfXOaXp9q7L12Qm4FtQWSON1zrEJuQik
         70H5yjjdMAURYT8fu9Q/y5jj0pGjRXl9WVQv28KH6e7Anl7UNmbNqESpY6o4mj4pye54
         1xCHYiNu9n8Oim0v5BayJFVJDfFqn2oPvGSHtKssriMWbJNbBK5hWTCmhGI3QpoQhV7P
         +KOHIQthfayj4Y0M/ok77WOxjkLitd3+TP8hgjf2Uuz7fKqlmHhjhqxSg4+AryNpZFFT
         iUOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773689010; x=1774293810;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3n74CxiYVk5X74osmGXlYXsaKthHkCIsx2D9FP7rhHI=;
        b=aMGqlJrRITN1/QeDIkFXMan8LJZ+5eCi0T7n4K9kpcTgQ0ezHzeU8pvEnYBltT9qy7
         VbHhMqo7WlUeFWxY8FmVHWrG/EgqEXkA3CN5KABx+PMvxgYgOqLbIImcz1r0s4Sme3cI
         yuT47VTuwxeFbIO0+668Iwu7eP9tMtoG0y0SkqI1IaLUAraZZd0Y470DRPKjM76VW4Iw
         8LuYGjwIyGlGtocwD1c00otlnGSIgh/GfPER3kCqLSW8rJJySTeeQkAavPy12darReWG
         YonOOr3Ddh5FxmTPb1fnygMmtlJSa0TL+EeEzrXBGmsuyJw0TxiDY74Oi8ijIccr8Z2W
         dInA==
X-Gm-Message-State: AOJu0YxRFmby1qphyFfJSPZiHlwnEkRSmroTUw5HfvpRZWaDR31ZXcly
	bmZ9gV1p6DgVwPkFYiiEYTyXMmtyxCvpNayOji1Czyw6dDEvGrxoQxaqgs00/g==
X-Gm-Gg: ATEYQzx1JWrj6XpbDieeki+Euv/FgdRWiWZB2aNlCNheb9bdoJNwRLl/cTLMzXBc5KV
	l1G6ZVPr/DupJlNTd+sY/H7cbmh/adaNrnAqUxWFtnm0TEstPS8qy7xzPSW+j9BM3he3XV0gZGz
	IOAXA65IwR7odUTYNmmUsNnsj3PwHYSP8KbXpdRBPgjfbaNHP+f6FgkocU4P61QiVjXHf4AoDgI
	3o4Spky1aXzTNBJPP8XTt0HhOfhcP2VJ4401xX8XU9bCuwsDZgL211vuf3gYOFTxf/6cxG4HeB1
	m6KizCQLGqeYhTSBhi1DR4nNuFQMkH1DgjtS/zT5VQfvoaYQxjeZ7Il9IfMfRcvkL6vC2l9peBU
	87w58dHxRjPgB488ulmoI9RSwXy4oNHtYTMmyAQO04CWXpthjy157LLaaMRVKSGQYKTTYvrs7Cv
	+/V02LwDEPkcxiK/pViUiwgQVdYrGl7TqfoZCQ0IbrAjhePEie9FH2g4g=
X-Received: by 2002:a05:690e:e12:b0:64a:ce57:cac4 with SMTP id 956f58d0204a3-64e88af7282mr536285d50.24.1773689009935;
        Mon, 16 Mar 2026 12:23:29 -0700 (PDT)
Received: from nebuchadnezzar.home.dankm.pro ([204.83.204.143])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-64e65a51580sm6046840d50.8.2026.03.16.12.23.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 12:23:29 -0700 (PDT)
From: Dan McGregor <danismostlikely@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Daniel McGregor <daniel.mcgregor@vecima.com>
Subject: [meta-oe][PATCH 2/2] redis 8: Update licence
Date: Mon, 16 Mar 2026 13:22:49 -0600
Message-ID: <20260316192249.3950474-2-danismostlikely@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260316192249.3950474-1-danismostlikely@gmail.com>
References: <20260316192249.3950474-1-danismostlikely@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 16 Mar 2026 19:23:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125286

From: Daniel McGregor <daniel.mcgregor@vecima.com>

Redis 8.0 and later are tri-licensed, the licence options are:
* Redis Source Available License v2
* Server Side Public License v1.0
* GNU Affero GPL v3.0

Signed-off-by: Daniel McGregor <daniel.mcgregor@vecima.com>
---
 meta-oe/licenses/RSAL-2                       | 163 ++++++++++++++++++
 meta-oe/recipes-extended/redis/redis_8.0.0.bb |   2 +-
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
diff --git a/meta-oe/recipes-extended/redis/redis_8.0.0.bb b/meta-oe/recipes-extended/redis/redis_8.0.0.bb
index afad578dbab..d4d868d983a 100644
--- a/meta-oe/recipes-extended/redis/redis_8.0.0.bb
+++ b/meta-oe/recipes-extended/redis/redis_8.0.0.bb
@@ -2,7 +2,7 @@ SUMMARY = "Redis key-value store"
 DESCRIPTION = "Redis is an open source, advanced key-value store."
 HOMEPAGE = "http://redis.io"
 SECTION = "libs"
-LICENSE = "BSD-3-Clause"
+LICENSE = "RSAL-2 | SSPL-1 | AGPL-3.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=4feb9943a139a170b9d6ed6ec3342d0c"
 DEPENDS = "readline lua ncurses"
 

