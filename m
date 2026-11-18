Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5741.1794975201622788259
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Nov 2026 20:13:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=NWQ0WhI1;
 spf=pass (domain: gmail.com, ip: 74.125.82.50, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1ae58d17cd9so527509c88.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 17 Nov 2026 20:13:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794975201; x=1795580001; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PpjDWM3QL+FuoYfUzxW0a+e8iEYVQp6xPfUPVpi3qu8=;
        b=NWQ0WhI15/oCJqi6HmQyTR2W1Swv2JGiMjYp3w+O29/j6N0S8J2bq4dUyWb3O6fhyN
         DRAzuq3FtM3hqdlVpfmaP/3NH+p9Zf4f0ioO2jACj96JKJkyTbidY5ehXeLoo09W0ABv
         rvRgHSJc4dyYti2xYjKRYbz39QykFlbGrvrxjx5lF7L9/9XNw17VrBihWt4Cd/O4ORrl
         E7x/K/MhJYK1WcIpkAeYEjlMO/AFiPR4MaK1EKaJoUqrlM3JQk223FNnhsqyny/wl2UH
         l5robGxx3Di+Zulw/w9aBZvY8sSV1ydoHYbK8eYNRI62r20sYmj4YbX3ND6IETzOM6Oa
         +4Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794975201; x=1795580001;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PpjDWM3QL+FuoYfUzxW0a+e8iEYVQp6xPfUPVpi3qu8=;
        b=M5Ghz3BcexrperaDxr4sRtqyLXFZlQX5jY2JgnPeBoGEQHTIvq1JQ8/5TfLEOMLDX6
         zEprrGI7vyPZqOrQAytpMEzQWjO8PAozF52v0w7rJDX5Xnm8ExElJw/PPSMVIJvu5DSI
         ZIxTXEgmrcfe+pPc+2aH/9D+fwLYEfUUQFGhfjp/84f0vOk80LCSS/5KMhXUZKDhmZF8
         0Govwd6QQhqDW01vKnU0hT+xztDvAAVmry8XKhUdJd76QM6ShcTjlLvTXOVxoweTql6I
         h/yUpQGg58tGdkqB94sPapOpuPmoEL4hOdaFcYBsQH8t1F0sSbpLuRe+yWNf72FJTy/g
         JJlQ==
X-Gm-Message-State: APuU4Z+WxAw88v+pjK+kNA/gzKID8NbVEA2nHuTJyasIjIjLc8VEuBu6
	lHcaJbrYNS1eftK6bBfYm+Ueh6m/RmpCFnUQiPARS6pgpA923X7qzwQRd1vQDVhh
X-Gm-Gg: AYBFou36fF5pEcZEBNi6rFtKrNjF7YUD1v1ZNwVWLmkpF6qGWwbICGrNN147UMmIuRG
	ZrWlmrRN22XR+8QGqJioQgjc+e3as/vE+cqwOl/+nYkDe55lnJ/BsaSzI2lZbEomAJDk1Xfn1vx
	8E1VDtBYA7epn0s38v891IJcO7kcyF+xdmLkihuRoiPvPcprV+O7H8kdwbB/5bsuBoSIAmv5KCB
	xhdFRmUXIuOeYRxqWP/Xf8YmMWOuGTTna9J5ayr+ETwmd9r/icsAXJ8MhM+g+uvB4bRNq0i+Qoa
	agO6ifu6kRv4hApzx6uPg6NM5Gdyx8B1xQZbUR8eUwy8/qDj2gWndQvaw25y+dpj5PkF4inNYZF
	JRln7znYLZX95WfHAkr+Cg30xGO2PK17WiBlzpo+CC/xQRZ+H3VgMYb6dkLSCbqEM89IH1JqWB4
	KVfbw2ftwN4gS47TvUQd9oWu2AslUoQ7aQxQye0m5HvTRYTmQsubuEru4Xtk4HDCgIytl1aL3X9
	4vSpG5vR10w+V5l45yUMPvTItHE/ACDd4Z/QMF+GR9jlHJBOiAHEpaaEjDGkWCzl+1SM2lYfaoq
	qddlhu5d7tVx13XmmG76I6TldKN9h6/wSeBMuY4TWig8JVGjWvcXv0aqa9hFCC7K+zhMR6wNqkG
	Zy1e/7IBsPz08q9KTRo17ACMQILMLQc4ns92nX2utn2UTIgOON2uRO2pyDEUTagg/xwuSFfdCAX
	Th4wSP6KFIRsk5NdTmyu7MytNW3eZHlDNmMN8CK2MrKyE8ii92Xu7iJh2X6mf9Oyub3GiNxQ45+
	BOCk6D+r4Ks66L+F8wo/rRtMC3IpA19xQx07H77VdD/wUyp9tkD97VvI/kAkyBrmKln9a9U/gwg
	bDoG
X-Received: by 2002:a05:7023:888:b0:144:c123:4036 with SMTP id a92af1059eb24-1b543d0696emr1570077c88.35.1794975200559;
        Tue, 17 Nov 2026 20:13:20 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5447f4eafsm2655742c88.14.2026.11.17.20.13.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 20:13:20 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-filesystems][PATCH 01/12] fuse: Fix LICENSE to GPL-2.0-only AND LGPL-2.1-only
Date: Tue, 17 Nov 2026 20:13:06 -0800
Message-ID: <20261118041317.2287415-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 18 Nov 2026 04:13:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132624
Content-Type: text/plain; charset="utf-8"

The library sources say 'distributed under the terms of the GNU LGPLv2.
See the file COPYING.LIB', and COPYING.LIB is the LGPL-2.1 text.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-filesystems/recipes-support/fuse/fuse_2.9.9.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-filesystems/recipes-support/fuse/fuse_2.9.9.bb b/meta-filesystems/recipes-support/fuse/fuse_2.9.9.bb
index 1057204d0f..f127514f68 100644
--- a/meta-filesystems/recipes-support/fuse/fuse_2.9.9.bb
+++ b/meta-filesystems/recipes-support/fuse/fuse_2.9.9.bb
@@ -6,7 +6,7 @@ DESCRIPTION = "FUSE (Filesystem in Userspace) is a simple interface for userspac
               "
 HOMEPAGE = "https://github.com/libfuse/libfuse"
 SECTION = "libs"
-LICENSE = "GPL-2.0-only AND LGPL-2.0-only"
+LICENSE = "GPL-2.0-only AND LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c"

