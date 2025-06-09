Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EDB2C5B552
	for <webhook@archiver.kernel.org>; Mon,  9 Jun 2025 06:44:54 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web11.52977.1749451481128358826
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 08 Jun 2025 23:44:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=gnsVPaIn;
 spf=pass (domain: mvista.com, ip: 209.85.216.51, mailfrom: vanusuri@mvista.com)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-311d5fdf1f0so3206152a91.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 08 Jun 2025 23:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1749451480; x=1750056280; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KqZ6ns+cQRU7Hz+LCXniP2yizCuQkBelUpajsDd4SQY=;
        b=gnsVPaInJQfLIHK3RehU8EbUK4PFpVwgbe2Wx/vhy+EKDHVLUAyhOgge25l449Dofm
         QJKGRtbFiPdNb88kT5g+LhTsXOHp7SLrnRWUDAsFSf6ZXmQjyiOSTnbyggd1PPw2dESS
         pnqe1ew9lPDw2PxqD0N6JYjBjWsIp+WutRiqU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749451480; x=1750056280;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KqZ6ns+cQRU7Hz+LCXniP2yizCuQkBelUpajsDd4SQY=;
        b=ExtPXZkwwEcYWAT8SLDK3AVVzqGsZu/kTW28KiN65111UDl/6tsoLNw5RPSzBUzkie
         2NpIKuQx8Nx52AUAJKEneuN5OpTKKpwv1x8BzLrXiPRwoEmdQD1ljZIKBhexFdgabCnj
         0aQji5ElNBZy+YZzv7sSngq2+fybEz+38k5I4dBKKEc51LeCH1yRT+SSp5gHthqSOr4k
         L0d5II3iXE8XtAkXTZuZUfyUrhUREuel01rXJwx/4bSBU9rr1iGj64+glk3UzgFBrKLn
         UmKkQAmpzkQ9MqBY++Lh5hGPHo4bG8MAgbZiEymIonx7o28xJeCNZjQkDIKsoNiCmcHH
         MHzw==
X-Gm-Message-State: AOJu0YzGknfn/2erIymaslvoUrzwd0cBIKhI6ntAAynYH44B1wvpXQfz
	4PF036mP4AWlxJEhe6xCN5WtLzQZieyzsjt2jHckL8tFFPfg7jtYQsZQkeTd/nqEGdSRN0/e5IS
	dD141
X-Gm-Gg: ASbGncu66YnWaRpRPbMbP+IQTg+xsSaUH1l+Fioe4yxebn070HCACTlNtUSlARCPklY
	IoaG/3Mf4LLjNDa9NNB/UveYcNGoo5oA6nnA9Dmvr8chq8qb0lR5wSiJihMrZO/+t7xXT5tnhIj
	b28S402ADbE3ZtwLl+njMzo78s4gsSH0UUWm+6Q+ItBwrMALSAiBRBa4g98m0w16YK1pxMaoDNh
	oEEj3tgUG250wCIYegw+A8EvNwA7QJbBiJJDIhoLa9F/gqFnub16TzDXbKrfIOG1HoCuj9JvrLe
	BYeiR+Dyxxk+tTUFjcMiJG91Whu+0n9PUWhLSMSVwHs1AT5qyrzKSC9cpgRb9cw=
X-Google-Smtp-Source: AGHT+IEeui3Cb7TFKbctdIlTkm+oElbh3iF3rplaj+R+Ip8pnf8EcpL11mmcCvz0QyvDfa07y3O7yw==
X-Received: by 2002:a17:90b:5289:b0:313:31ca:a69 with SMTP id 98e67ed59e1d1-31346b4d319mr20559872a91.18.1749451480033;
        Sun, 08 Jun 2025 23:44:40 -0700 (PDT)
Received: from MVIN00020.mvista.com ([49.207.204.233])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-236032fcff9sm47884865ad.117.2025.06.08.23.44.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jun 2025 23:44:39 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-devel@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [oe][meta-networking][scarthgap][PATCH] wireshark: upgrade 4.2.9 -> 4.2.12
Date: Mon,  9 Jun 2025 12:14:26 +0530
Message-Id: <20250609064426.55977-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 09 Jun 2025 06:44:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117780

From: Vijay Anusuri <vanusuri@mvista.com>

releasenote:
https://www.wireshark.org/docs/relnotes/wireshark-4.2.12.html
https://www.wireshark.org/docs/relnotes/wireshark-4.2.11.html
https://www.wireshark.org/docs/relnotes/wireshark-4.2.10.html

Includes security fix CVE-2025-5601

License-Update: Update GPL copies for FSF no longer having an address
Link: https://github.com/wireshark/wireshark/commit/18e4db97c424c11cb26fa7fef97b95dd3d001bb1

The 4.2.9 was not longer available at the original SRC_URI.
At the new SRC_URI all version of the wireshark releases are available.

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../wireshark/{wireshark_4.2.9.bb => wireshark_4.2.12.bb} | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta-networking/recipes-support/wireshark/{wireshark_4.2.9.bb => wireshark_4.2.12.bb} (92%)

diff --git a/meta-networking/recipes-support/wireshark/wireshark_4.2.9.bb b/meta-networking/recipes-support/wireshark/wireshark_4.2.12.bb
similarity index 92%
rename from meta-networking/recipes-support/wireshark/wireshark_4.2.9.bb
rename to meta-networking/recipes-support/wireshark/wireshark_4.2.12.bb
index c561179c68..ab6160b767 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_4.2.9.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_4.2.12.bb
@@ -2,22 +2,22 @@ DESCRIPTION = "wireshark - a popular network protocol analyzer"
 HOMEPAGE = "http://www.wireshark.org"
 SECTION = "net"
 LICENSE = "GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+LIC_FILES_CHKSUM = "file://COPYING;md5=570a9b3749dd0463a1778803b12a6dce"
 
 DEPENDS = "pcre2 expat glib-2.0 glib-2.0-native libgcrypt libgpg-error libxml2 bison-native c-ares speexdsp"
 
 DEPENDS:append:class-target = " wireshark-native chrpath-replacement-native "
 
-SRC_URI = "https://1.eu.dl.wireshark.org/src/wireshark-${PV}.tar.xz \
+SRC_URI = "https://1.eu.dl.wireshark.org/src/all-versions/wireshark-${PV}.tar.xz \
            file://0001-wireshark-src-improve-reproducibility.patch \
            file://0002-flex-Remove-line-directives.patch \
            file://0004-lemon-Remove-line-directives.patch \
            file://0001-UseLemon.cmake-do-not-use-lemon-data-from-the-host.patch \
            "
 
-UPSTREAM_CHECK_URI = "https://1.as.dl.wireshark.org/src"
+UPSTREAM_CHECK_URI = "https://1.as.dl.wireshark.org/src/all-versions"
 
-SRC_URI[sha256sum] = "62c2b6652d7f9a50668867bd57b21609c9a9b6950f26e7f30a24b2de0e72ded3"
+SRC_URI[sha256sum] = "6ed51da5f6638aba609be8d1d64a7a85312749a49261146c391fea391a3e5f06"
 
 PE = "1"
 
-- 
2.25.1


