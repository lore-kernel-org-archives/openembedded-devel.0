Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12438D358CE
	for <webhook@archiver.kernel.org>; Thu, 29 Jan 2026 06:31:35 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9718.1769668294424913246
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 28 Jan 2026 22:31:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=F3bf6ssI;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-47ee3a63300so6015025e9.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 28 Jan 2026 22:31:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769668293; x=1770273093; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g/6If6+il8ZFL9oh1Ewjp/CwzJqGaEN4xldkTs/im7Q=;
        b=F3bf6ssIStrZ/UqZVqzYprBOhqo2ZlMinRzImLp1PbPc4B9SU22flWhZDrk3OwbIEM
         l+h+yCY32fKCuB+sHync1Etv3VIEvy8niCa7Jy9ve1trrZ24P22D3NllPa1mi6zmoIsZ
         9xmmF6axtiliidU3UTnV9bGQP4wfWhrUcvWhsAfVdbYlTosLLV0/C07VPJTdgalR180q
         A2u8ax9EkCCwBCe7MmVQZSSSVqmjqUJEeB4pBO+UC3itfNgxYb9LvI2I/Br1XZacL0/s
         WKVNfnjg2rYOl0gN5Ds2Usa5KQhWvkMNjIVmfqJBBMMRjmCdsjfHvSQNe8mHxmKoRfak
         ijew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769668293; x=1770273093;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=g/6If6+il8ZFL9oh1Ewjp/CwzJqGaEN4xldkTs/im7Q=;
        b=tT5iwZzUWWj9ihopMhUpebCbQmcTJ9xEisGwCMY27+Xg5iROEvboHT1v7185uy1q7+
         rvlG2RRrZb3pjj85OeqkhkxDD0RpXwtynUb4NcFkQmxrkhyMRIjRc2WZ7fWMawPEiQg+
         fqRwqGkSRLfMCofjgLNhdm4ogtDJxIzYarYQWKTPLNWCHLbuZa59U2XlNKrczFkBgzw4
         lH5pBAyqHxbBiOLSfngwOapYcZh49tJXF32sDy0kTrChOeTMVCRfrtzpBH6Lis5ZuJnd
         kVHYsUC3dRm3ReS4ycVlainG79BO/sNrvcL6FAe/bRyYyfCdoUzPhGXXIJfjgZm3tgNY
         TW3A==
X-Gm-Message-State: AOJu0YxpGYbZxa3YtAhVaNRDt0tC35EIQwpMEMAq0KKxhShxW6izGFpw
	XJ0piTABd4P9IRU6dNnpWij9XvKpwPYAffkawMOhDlFx4FGPKKMU1CaL6E5/mw==
X-Gm-Gg: AZuq6aK+D92O0IE7TvS+vIVzuqJ0B/mWZ9AoNsaHJppHgiC8xhhjftdoy3rt9UGIqNR
	eH2R4xP2g3/PtyXngs1B9ClZRtTjKQGOc/BEQrskwPJiIt3iNSE225ze+UcCKwGoeXTj/q0igvA
	IwzCtGegZ2qZrsyzUqFlcVoxPztGOCHB36+EA4vhDL5GZoeIUrzByf74pXlbbvezPPnZ6rCkcji
	oWK7HmlkmXqRjVarahxDgZ/nu9Dwl2q0RuLMu0oyaA+zvWLG4QmAVsmsdhNbHFYxVcTGBAp6ELG
	qfUhAUHXN85PboLCXmcTnYYw3c04t0T60jCMkk0IDmp6EqbBZuquAwNTp2e6ZtAzjQm/GUZTeGC
	qIltnGtmdotVX17Wd8xEPODIgu/3alIvB3WCcnmOZmFP14OA460Ye3ygIpCTtXYX3a8lz1rJJ3S
	l9U2pXw2veG6nRqIXcgIQ=
X-Received: by 2002:a05:600c:a30c:b0:477:a36f:1a57 with SMTP id 5b1f17b1804b1-4806beeb827mr66990035e9.3.1769668292743;
        Wed, 28 Jan 2026 22:31:32 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4806ce4c3d1sm110750835e9.9.2026.01.28.22.31.32
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 22:31:32 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][kirkstone][PATCH 4/5] frr: ignore CVE-2023-3748, CVE-2023-41359..61
Date: Thu, 29 Jan 2026 07:31:28 +0100
Message-ID: <20260129063129.223926-4-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260129063129.223926-1-skandigraun@gmail.com>
References: <20260129063129.223926-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 29 Jan 2026 06:31:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123981

Details: https://nvd.nist.gov/vuln/detail/CVE-2023-3748
https://nvd.nist.gov/vuln/detail/CVE-2023-41359
https://nvd.nist.gov/vuln/detail/CVE-2023-41360
https://nvd.nist.gov/vuln/detail/CVE-2023-41361

Regarding CVE-2023-3748:
Based on Debian's investigation, the vulnerability was solved by [1].
However that vulnerable code that was fixed was introduced after the
recipe version, only in version 8.4.0[2].

Since the recipe version isn't affected by this CVE, ignore it.

Regarding CVE-2023-41359:
The pull request[3] referenced by the NVD report references another pull
request[4] which was opened to backport the fix. The conversion on this
PR confirms that the vulnerable feature was introduced in 8.5.

Due to this, ignore this CVE.

Regarding CVE-2023-41360:
The vulnerable code was introduced[5] in version 8.4.0, and the
recipe version is not vulnerable.

Due to this ignore this CVE.

Regarding CVE-2023-41361:
The vulnerable code was introduced[6] in version 9.0 and the recipe
version is not vulnerable.

Due to this ignore this CVE.

[1]: https://github.com/FRRouting/frr/commit/0a95d121ca8e1f43d41d952d6c82d111ca850085
[2]: https://github.com/FRRouting/frr/commit/54a3e60b3ebd3621c4dd90b0b49e8e36e4e100d8
[3]: https://github.com/FRRouting/frr/pull/14232
[4]: https://github.com/FRRouting/frr/pull/15927
[5]: https://github.com/FRRouting/frr/commit/f1aa49293a4a8302b70989aaa9ceb715385c3a7e
[6]: https://github.com/FRRouting/frr/commit/234f6fd4f4804bb17bd8cbb1dd91994a914f38d2

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-networking/recipes-protocols/frr/frr_8.2.2.bb | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta-networking/recipes-protocols/frr/frr_8.2.2.bb b/meta-networking/recipes-protocols/frr/frr_8.2.2.bb
index f8a3404e9b..a30c05b563 100644
--- a/meta-networking/recipes-protocols/frr/frr_8.2.2.bb
+++ b/meta-networking/recipes-protocols/frr/frr_8.2.2.bb
@@ -42,6 +42,15 @@ SRCREV = "79188bf710e92acf42fb5b9b0a2e9593a5ee9b05"
 
 CVE_PRODUCT = "frrouting"
 
+# the vulnerability was introduced in v8.4.0
+CVE_CHECK_IGNORE += "CVE-2023-3748 CVE-2023-41360"
+
+# the vulnerability did not exist until 8.5
+CVE_CHECK_IGNORE += "CVE-2023-41359"
+
+# the vulnerability was introduced in 9.0
+CVE_CHECK_IGNORE += "CVE-2023-41361"
+
 S = "${WORKDIR}/git"
 
 # Due to libyang not supported on these arches:

