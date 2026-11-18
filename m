Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2571.1794961614279396565
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Nov 2026 16:26:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=GOLIHeef;
 spf=pass (domain: gmail.com, ip: 74.125.82.180, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-372bdb942dbso597816eec.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 17 Nov 2026 16:26:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794961614; x=1795566414; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EtvgfNGLQ7ezq9mVHomPeCtwnSxzfhGebw4SvOifDUs=;
        b=GOLIHeefcCygzY/35UyYczSZNLl+ADWiKhxKNg/m0XVdTK+Z7yalfhsq6MfeEgweIL
         3NXWAqkoQhjCNFCFNr6tgkUGEMq7bVzKDVlWnx6KQDdDOjt2t6qwY93h8yJUtTKCM49v
         3KnQ6Msu99LVsbQv/op+yq0q7DV4PSxc7Fu2Y9e5noAa8ycF8TJJ7H6qN7tizk4UmDGH
         Jl1J5n+AknvFBE44eK1FrWhHyoyBuo/01sWSkpe8DhiUK0AwiCdouKz/yxNcEh8y6iK/
         zyj99BlUY5YVUAKoO/h0z5TI5jG86hqxVjZwKYWYG2oC19JbQv0OaikoDPGEMrkRroXE
         Yt2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794961614; x=1795566414;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EtvgfNGLQ7ezq9mVHomPeCtwnSxzfhGebw4SvOifDUs=;
        b=RVx90qlR17FuyrLE8zUH9AtzwhHzcVDLt7fbYsFw/OXhND4l7hBskZK5H173e8v+SQ
         HsEb07Zng60bPvAekLcmqVdUCB/O0RW+1cUydeNpjJdV75XIi6WxJy2qjoeAOqe/O9f5
         8qKQq+DxSdFme/F3pWP9n7SQiw+08cXdCaFu0Zyqz26a+wM3YpD6MyC4wMb0FESFpyAK
         H5vUh9C2boJvGgs2gPPg46EWsI+QT59D+VmruaceYiAmMYtimSZ1BWdP7avjou6hpPlt
         Inm9WRswu2lDBHMtsjTqyn/ZWdA5iSOZqbh5xox8DcgLgAs5VUgQVQDLqfs4RoZMMqWW
         1ArQ==
X-Gm-Message-State: APuU4Z9QgEmB+12HC3Yjwx/3BHE3EcXqA3aH6VZ/Tln6Tb1+o4gZwVdv
	PZecxroGFm9WD3Qt+Je9GVWdHaD5F9XhGwH81af/ujeaHO7XoVguYvP+UYMKTYFI
X-Gm-Gg: AZFdTZd5ZA1sV7SfFaWoL+uuYerTjTCi+ferMtGq0ypUheQCKYJM3LeF7juze0yCmww
	yZhFm/mf3B8LIJu0F50Sic/cynGMKEw/v9HF0jhaSTYfMO2Q9xhipHFhPm+X935XuwMQaKJeGgg
	i7A8wLVMWBIQw5Rs0PxIjaO/4W9UnnWkN/28Th028/OlbN4wcyLLAep/iIgTqkvKbmv/jWBL+Yn
	0DyBOspZpgvtPjhylvRPLSkEPT0gnt7aP9har6VrAdhW9jnsSaUphMAFbMohUHN7oZzCd5Jzicr
	UL0xXGASCBv1kbEy8IM9dkb1+jQu+CFpWWz2TPru8NvuiqVFSWaQjycSP0q7ZRXXzoKUMGT8xvK
	8AE9uP0PUaIuRzyK6PHXNyMBBu2GRJrh1NJQQ4Tot6Nen6F8LU73u/VLXfmGr4MWvN5x+eDhq/E
	iWZ5H3xxzdlYLcsdvs0JRuvt0wNpSPvXAsZRxHZppRdi5FwuNga+WAGD6UEpvEPYUZCueFrFoFn
	j7Qr6oxQ5fdYStjHURzE5pJ5RdYbX/hpFtoRmR801QgMy30g4kElYvEjODmGLvU4Rs+PS/eRj+y
	swydLgW+tAgdH40DPbG4EhW73U6bSboAVhkftbHXPbRAPxvqzQSN/szR/MfhWOTHpPk618YVTGx
	LDCNbk5q5OZBHMYgtoS7S6n6h88SLZ9Runj+0WeT+t1K68BXxtM7U5pU3alneb9jmzvl1+ZvIdw
	sUnhgxJrDcJvqFpx3BnagSqc+TYda9WFYMte+8MCkz8HzAnK8Vm3Iyf1mxqlJlQtvw2K+JovDCw
	Bs0OmoZkfoVjoaSGBxSUZug/GqyFw9X/UYqkOr8qlMb57xwa3lL3FtVToUyjAyoS4Hbc6ZH/Naw
	70vByuGkjyufYwGQFD64P0Hf+g==
X-Received: by 2002:a05:7301:7d14:b0:36a:4a08:f0f0 with SMTP id 5a478bee46e88-382820de366mr922439eec.27.1794961613498;
        Tue, 17 Nov 2026 16:26:53 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a7fbceffsm1697015eec.28.2026.11.17.16.26.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 16:26:53 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 07/14] fuse3: Fix LICENSE to GPL-2.0-only AND LGPL-2.1-only
Date: Tue, 17 Nov 2026 16:26:35 -0800
Message-ID: <20261118002643.29829-7-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261118002643.29829-1-khem.raj@oss.qualcomm.com>
References: <20261118002643.29829-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 18 Nov 2026 00:27:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132608
Content-Type: text/plain; charset="utf-8"

Upstream LICENSE states that lib/ and include/ are LGPL version 2.1
(LGPL2.txt is the LGPL-2.1 text) and everything else is GPL version 2.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-support/fuse/fuse3_3.18.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/fuse/fuse3_3.18.3.bb b/meta-oe/recipes-support/fuse/fuse3_3.18.3.bb
index 172dd9e69d..d20c9021d8 100644
--- a/meta-oe/recipes-support/fuse/fuse3_3.18.3.bb
+++ b/meta-oe/recipes-support/fuse/fuse3_3.18.3.bb
@@ -6,7 +6,7 @@ DESCRIPTION = "FUSE (Filesystem in Userspace) is a simple interface for userspac
               "
 HOMEPAGE = "https://github.com/libfuse/libfuse"
 SECTION = "libs"
-LICENSE = "GPL-2.0-only AND LGPL-2.0-only"
+LICENSE = "GPL-2.0-only AND LGPL-2.1-only"
 LIC_FILES_CHKSUM = " \
     file://GPL2.txt;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
     file://LGPL2.txt;md5=4fbd65380cdd255951079008b364516c \
