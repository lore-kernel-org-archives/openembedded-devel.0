Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10288.1795753073592666138
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 20:17:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=YpvUiKod;
 spf=pass (domain: gmail.com, ip: 74.125.82.47, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1b546061d58so17752651c88.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 20:17:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795753073; x=1796357873; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TgXdb9A8CgE9bMOlJskCjCc38NjNMHwDZ7Rb47FTMHQ=;
        b=YpvUiKodFcTeEqvOXo1YxfDlaRf9iLS9RpDV1VgeTljQ6Rc2w1TR2qC490NTFGSLf6
         npdSC8WkhkqrcCJZidonTFJK9CpBL6vM2Amdiki5LOIxguZk0pc2d8mnreu290LFd8fq
         B392mEg/hF6VAZVmh8sd8Z0Za/dUfq9P+GhEVQwlhmSiUayOokdXqRqCfMZOn0dHGdZF
         dOXJJAWoDBtsiBe3ifkvb/cv1KBAJW9HZKXsMMQMN1Gkg2yS/2cu+ojJj1Tw+sE054om
         bVq8Fhjqsa+eZL54vb/qZm2HmEymZojGy2PJogkeBUnEOnZC47wR0CqUZBs/P0UaDcWq
         THMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795753073; x=1796357873;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TgXdb9A8CgE9bMOlJskCjCc38NjNMHwDZ7Rb47FTMHQ=;
        b=A4ya1t/LCx3vzIbZJuD76m9f+aWKjhKN2bPX96/sanLPqhvBvmURpAEG5o3YVc63vP
         dthhG30rWi5myphzmPcSQ1ApZWwgaUoT2yBwVMbgikHjwCairSSEt5MjyukfuiJ+zBYX
         WpHIvR1SzSy3M+9iqw/9K54jasKqYLizT9oj2pIK5JUIpgWohkGgUlNNEusudHMrB1Y1
         w8TeZMtwOhVDw07UEcO8h3gMTeobG9/cE7r6G+5WIwrh6EM/glj8g4JLRDIISjNAs/fq
         QNbpOAlhXlok8jhUXJj0w6HJcCuB0v/dKxUMIJmB0wQJ6dH1kleUfUkOXLO/Oe9+6gto
         dosg==
X-Gm-Message-State: APuU4Z/IAVxv5wARiahzozup5c1gZiRPvN29t2U7uIWRTAPEkYtU7z4s
	M4qYV0wOGb5w+BqVT663N/wikmVNJHrnSOhhEpvfSGHISLItRSRgAp5WD34QVS0j
X-Gm-Gg: AZFdTZe82vc44kMQ1EduJpO/9JKJU/sUL9zZeLga59RphgNN1URgQ+TlDTkqpX7oHCx
	iwKXOBZXZ/6ToCJYuSZgQCIiWE2PzZf5kGk++i0VYVTHle8DJPj6oHm+qCbbEEq2B7LXTE/A3Qv
	5porOGqPcf2hqWvYh3YWFhPqb1909dx0zg2TBZIqKVTO8C+YiDg5zNf4kTh1hez7WyAEiEyEmK2
	H5ebDWnY78tKFtVsWfshO1v7VBN//xIBB/hePCk3vkjEg9kl+jXV8iUVrFZnDTQN95rn0G4e8oj
	8BZLAh2usDp8jfn7luUJAF7yWTmBE3VxIbzqnteVKRjo09NgJbT7bq8ndIBv1iRqkq038KgN46u
	dhwz2qSFeSrAAuya/E0KjIl4/YxhBN8BZbgHK0jNEwmq5MnlNKe0DNIM0nBD1x0MOk57Epx4h09
	3SJv0DbnKBBooJYuZRhED+bwr8CGbaXgpwepeCv+IZMsl+BHeJ/8+L9pw4crtSuQEbJ9uGpqJgQ
	XP1l3vAIRmyM/OpkSAM83yUJAoGVV59r9SURtGn7eXXjCgCvaBhFlWoNKVnCOPq1VB9YpReF9g+
	BDdI5379lb2GTWabx2dKzDGkMHh/ZmSjEDcRlOnzonSOfmdHDiW5W7LyfvkJ6qUq5wtnkQJOi/g
	4bo/rx/x/HGB4NcxOZm4few1Qb/oPW6ks7XwpVtJPkvu9rSLfnC2Si0IxAbtGnftzQf/9hp90TF
	ARPGnBAyxO9bo9sVAk7j93VHKGQGWDEU/Tq6YGJO2CuVSe9CbALueNGrzWwg8Qnquj22TjUjZzh
	E1df3SgHqelJDZOC7S6j91RY/YU6HK5e9/D8UELXd4FmaZMTtalujIt4YolrSzTjaspH8OMCoAw
	Tqlv
X-Received: by 2002:a05:701b:204a:10b0:16d:1e24:5cc3 with SMTP id a92af1059eb24-1b5568c0e83mr25442160c88.19.1795753072803;
        Thu, 26 Nov 2026 20:17:52 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556840494sm53880225c88.12.2026.11.26.20.17.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 20:17:52 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH 31/35] nuttcp: Fix upstream version check
Date: Thu, 26 Nov 2026 20:17:11 -0800
Message-ID: <20261127041715.1776485-32-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127041715.1776485-1-khem.raj@oss.qualcomm.com>
References: <20261127041715.1776485-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 04:18:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133283
Content-Type: text/plain; charset="utf-8"

The https site has an expired certificate, and the default regex does
not handle the plain .c source file. Check the beta directory over http
(as SRC_URI does) and match nuttcp-X.Y.Z.c.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-networking/recipes-support/nuttcp/nuttcp_8.2.4.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/nuttcp/nuttcp_8.2.4.bb b/meta-networking/recipes-support/nuttcp/nuttcp_8.2.4.bb
index 815e937c39..38df1f9041 100644
--- a/meta-networking/recipes-support/nuttcp/nuttcp_8.2.4.bb
+++ b/meta-networking/recipes-support/nuttcp/nuttcp_8.2.4.bb
@@ -10,7 +10,8 @@ LICENSE = "GPL-2.0-only"
 SECTION = "net"
 LIC_FILES_CHKSUM = "file://${BP}.c;beginline=4;endline=30;md5=496a7c0bb83c07ff528d226bf85e05c5"
 
-UPSTREAM_CHECK_URI = "https://www.nuttcp.net/nuttcp/beta/"
+UPSTREAM_CHECK_URI = "http://nuttcp.net/nuttcp/beta/"
+UPSTREAM_CHECK_REGEX = "nuttcp-(?P<pver>\d+(\.\d+)+)\.c"
 
 SRC_URI = "http://nuttcp.net/${BPN}/beta/${BP}.c \
            file://nuttcp@.service \
