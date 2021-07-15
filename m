Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web09.1028.1626368449551230426
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Jul 2021 10:00:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=rK6U0hOK;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id my10so4475477pjb.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 15 Jul 2021 10:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=ERww4J+EqjLja1pJmtjrf9R1BCZHCckrJjPdxVdp1co=;
        b=rK6U0hOKPR4G7KJSkHxTnwmUpI3XzoFH43dyqbZO1899oFz2t4pXejb8xVw+ZsGNa+
         bwOq1ZOwsnf9bF8zbLAcCw3kQmOw/pfZcfc5Q445GMXx/A03CFPed5+stF5jbp1LJoOg
         BBJdpgOYhNKFVivL3oMCDzmzdhnAthhHAGnJrDbHCFWxQxxj9zuPT8kF6EaSEsWO7+FB
         HKDKMI0bpGvYeqxm1KrrqhR86LhCszRCcoYrOaIXkgyx2AbybWWMqnRWnRpGzpIglFLa
         TI9VvaHyde9/BCZ7DbVbnte2LvjQcxXur5eZNw16kG3sLtSYTFNRMdQ6m1+kGuWlN0eA
         3Ugg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ERww4J+EqjLja1pJmtjrf9R1BCZHCckrJjPdxVdp1co=;
        b=EbZaoP3hYDpn6bgD8iM+Yjlw86f6vYtySe4e0iC65aGDWttigrFlqhWd+8u5MREPEN
         612UvLWfpWqvAe8i3VZAMC4u02eV7k0c3XiiLNvnb0WMIaf+rovanq4JN6Luob7G49/S
         nFIC+apa8QPr5Fak3oPpocaSe5i0202YNujHcKKy81COsKB6nbIgMCezIQ2HXDWIhw0I
         ZosxMgqNi8LhLxYZ9y2AqwOV6eU7WOElelQ9dyGl4KRiF0N8kGA/Q9Yp9beYLp9MPUrr
         +qTMOKX2wMBQa5Mcb3JbSaSAm9JAm1ATinbvFb+675cVVlpLvc8Fpnvr01cKNCHd+ZVe
         BqVA==
X-Gm-Message-State: AOAM5313M5nvj9BcLnJ3RrDyGFAd5MBFx8JTBU8uE1QZhcFkTPGa/855
	va1G6Fw5oLlXVYjMOmGHi57Bpy2IFw4=
X-Google-Smtp-Source: ABdhPJzPjhxjYM8SzeG8DQ8G7TmSr08LeqaWtlQGLo0qUsTGRtsIgt18tgcs03iOlfu1tOIrajRzjg==
X-Received: by 2002:a17:90a:5892:: with SMTP id j18mr5434980pji.18.1626368448923;
        Thu, 15 Jul 2021 10:00:48 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from keaua.caveonetworks.com ([2601:202:4180:a5c0:bd64:b325:a706:6ef2])
        by smtp.gmail.com with ESMTPSA id d23sm5805563pjd.25.2021.07.15.10.00.48
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jul 2021 10:00:48 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 3/7] openvpn: add CVE-2020-7224 and CVE-2020-27569 to allowlist
Date: Thu, 15 Jul 2021 10:00:38 -0700
Message-Id: <da4ed302c4afefb16453dcdfe0deb51e9a648826.1626359076.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1626359076.git.akuster808@gmail.com>
References: <cover.1626359076.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Akifumi Chikazawa <chikazawa.akifu@fujitsu.com>

CVE-2020-7224 and CVE-2020-27569 are for Aviatrix OpenVPN client,
not for openvpn.

Signed-off-by: Akifumi Chikazawa <chikazawa.akifu@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit d49e96aac4616c439a2d778b95a793037dac884e)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-networking/recipes-support/openvpn/openvpn_2.5.2.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-networking/recipes-support/openvpn/openvpn_2.5.2.bb b/meta-networking/recipes-support/openvpn/openvpn_2.5.2.bb
index f82107dbee..646f0387ad 100644
--- a/meta-networking/recipes-support/openvpn/openvpn_2.5.2.bb
+++ b/meta-networking/recipes-support/openvpn/openvpn_2.5.2.bb
@@ -17,6 +17,9 @@ UPSTREAM_CHECK_URI = "https://openvpn.net/community-downloads"
 SRC_URI[md5sum] = "7643f135b49aee49df7d83c1f434dc4e"
 SRC_URI[sha256sum] = "b9d295988b34e39964ac475b619c3585d667b36c350cf1adec19e5e3c843ba11"
 
+# CVE-2020-7224 and CVE-2020-27569 are for Aviatrix OpenVPN client, not for openvpn.
+CVE_CHECK_WHITELIST += "CVE-2020-7224 CVE-2020-27569"
+
 SYSTEMD_SERVICE_${PN} += "openvpn@loopback-server.service openvpn@loopback-client.service"
 SYSTEMD_AUTO_ENABLE = "disable"
 
-- 
2.25.1

