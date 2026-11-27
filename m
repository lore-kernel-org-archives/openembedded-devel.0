Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11811.1795762992529093001
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 23:03:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=axAQ3QMn;
 spf=pass (domain: gmail.com, ip: 74.125.82.182, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-385d8a00598so11386889eec.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 23:03:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795762992; x=1796367792; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FIpIZkJeuIW6qvhfJZ9+rU18TRe9V/1pd85wbV6OvMA=;
        b=axAQ3QMnYRYzEQu7kPKDbFbKOGfKETKmJXx4a0+Svuvfq3zkgZBuclF2WTyT0bLjbp
         +SllvvW7Rs5VwalAV0hvPjgT0e1dBSEki33H77ceBZjeitdQb8nCi2170GIIrxXmp/ix
         Rw2ELSGi6yUZ2CpyAnr3nMntxldkXxBG+lw4ZSa5eFi8vWaysPwTna9OfPFmbo4hqEv+
         BxcDdfNsiyGlMuRTnr9kPbtrZ59rU5KvL5tFW4gJlnxyZF7FyuvvlE/ySkKO3xOPzTA7
         UDvTkqnlfUTLNIn8rNYsnCq/UF38f4qYURyaXwgL7u9SYMDVVwFOVem6u4zC6evOwvgv
         yEyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795762992; x=1796367792;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FIpIZkJeuIW6qvhfJZ9+rU18TRe9V/1pd85wbV6OvMA=;
        b=HHo7B5W0iArWd7r+HwZoNfmPKRAyJroRAHhPyYSGkvMVetV1f5eaF/3IpqZzqkc1IM
         s9Sqp81/jCblrU+0waF0do9OFkxmV5+vV/t15vSSlawRfjSSDrxped+d4tj1ZAS52u2d
         pEsEoXoRI9sY2UzC/Zswh/QD3aY7aZP29/+JESQV6eApuqg56QltZAo2Ypcr5bq1ybpF
         EhsTHSYUTVAULmgr7wLLt6zjrqGWfaNovFUyOhi0GpUmnlpdB4RzG7wk83N/mDm8fqZp
         k+3nSQ5x90tIQYtIlJToQJCLja+941WpIIInbE4UvADBvyzss6qP7mpGjmA2wlL6Hv3r
         dNlA==
X-Gm-Message-State: APuU4Z/iYbC4uuSmCQichX8CVFig1V47I18uSNrOsK2S77hR5RCxpdR7
	5qCqwTNhuX+UAZp/dUF7DDW6nCkOlG+biByC52bnms8+eammhqC9mo2Xe/xg+0Bz
X-Gm-Gg: AZFdTZcgj9Ph00pUl0PXEg1tKmicdtPMNT8J8Q7NcMYSyRSC40tKkzJYE3lBEucd506
	R3LUvulxLZxxcsT5x/NJUXCTcb9ui6ENobtoKEmmcJQe+lrXgVKWriT2L0r2iD7B12MEnfGx8YB
	8pGL8gC6aaK82FpS+nOQWt4FDuyqzRfc0fznXJJUgbr+QJzNs1YUyhWo3N1CjQXw5Z54jwTjEsp
	CehXFiiUU18WH72OsaBt8AEcW4W4WIEmg0KtGdc898NtpNV2NTqDzMcq2GZruXEN8EKA5WJ6aXv
	qZ6qjHHoUxeeTreo0zeiC9BtUb2oOV7pFtRpgpwuuDkYHqRFlwqlVWn19C+uXH7MLe/nAeuuy1v
	lfUFK/A5n+BhnecjfOpPtEw48VD8KVuICFbL5jla6Efl2yw5apKvT9Pe7nq/vpPxK3v3P2gvMBb
	e07et/dcNfnj4KwR2Vr3uZ/ppxEmtrzFCN0DPqIJra6c5q4oc6+pKc4VddAx9UJQC9NFvV7oUc2
	sk9B4i6/fnNBzt1TWclFHF55ArdvXoMOAP8pnyosyxQKENVxlkAMhCPlnsxUmqqCUysxaPe5Idl
	g+cE/lnYZERO9Cq+zx1fcrSDhz6wZTMUWOOvDcFNaQyE+q2XtAlvgx/VmGjoS8+oKW033C5jqVZ
	CRsI3kNeUKrugTqA4SIGx6Th0/Uf1iey0nN0nd5rYcFjpvzHF1QkfoMuqm0UqD51mZlRVZCY6cV
	R0OjK5WJO5M4oTHDMoZ/J9qijF9dli+MorE0MNsJBvzl+sMJJWiaUAKqNN2vAtrjqGMqv8TC8SN
	dSL13pvhLnsPt5quxvtHuC1MlAh9x4wtQiSNCywfkqCsZsyqjalfZfVAZDM3d9gKeYXO4X0um+f
	B+Zc
X-Received: by 2002:a05:701b:291c:b0:1b5:8967:b255 with SMTP id a92af1059eb24-1b58967d724mr7294656c88.28.1795762991639;
        Thu, 26 Nov 2026 23:03:11 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567e2bd1sm52671117c88.3.2026.11.26.23.03.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 23:03:11 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-perl][PATCH 0/4] Upstream version check fixes
Date: Thu, 26 Nov 2026 23:03:04 -0800
Message-ID: <20261127070308.2377122-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 07:03:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133355
Content-Type: text/plain; charset="utf-8"

Fix the upstream version checks of four perl recipes.

Khem Raj (4):
  libmime-charset-perl: Fix upstream version check
  libmodule-pluggable-perl: Fix upstream version check
  libterm-readkey-perl: Fix upstream version check
  libxml-libxml-perl: Fix upstream version check

 meta-perl/recipes-perl/libmime/libmime-charset-perl_1.013.1.bb | 2 ++
 .../recipes-perl/libmodule/libmodule-pluggable-perl_6.4.bb     | 3 +--
 meta-perl/recipes-perl/libterm/libterm-readkey-perl_2.38.bb    | 1 -
 meta-perl/recipes-perl/libxml/libxml-libxml-perl_2.0213.bb     | 2 ++
 4 files changed, 5 insertions(+), 3 deletions(-)

