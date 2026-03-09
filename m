Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FFF3EFCD8B
	for <webhook@archiver.kernel.org>; Mon,  9 Mar 2026 10:32:34 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11126.1773052350927821373
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Mar 2026 03:32:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lXPgKmfy;
 spf=pass (domain: gmail.com, ip: 209.85.210.173, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8297c035d28so1602057b3a.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 09 Mar 2026 03:32:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773052350; x=1773657150; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XJMFE7uLnCyL8L8XmeRY1bugh7uQmeKOG+r/+6Tcfkc=;
        b=lXPgKmfyXSeYj99AOUKXM+oUZKOpDijXYMqoeAZ/9BIoUqM0tMUQxmSbzYkI0sYb4v
         RqsTxZEAcicty5A7khuuqvtwBV0nA1cONnr/wIJ4+EBoIlgiuC+KRVtolQ1G8VftRYd+
         XUYirfKMImXjh0lQIe0tct9TVjKJtFcEsQ3MgG6T+/yBAjlhWdy+OTMYS5TbcUJq34Ap
         VagO8K2M2zJbP1Tr2Ig8LdykanA5TqljlM6t80+pG6LPwjSXXcdZsktBCiHJYHRyMzyL
         7ZC6+27TDVEMvmyNV4L+1aiuOmLilrZzWj1X8rHseTjDuuvBBJsVqAVf9JNAE9Z0c3ul
         OHBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773052350; x=1773657150;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XJMFE7uLnCyL8L8XmeRY1bugh7uQmeKOG+r/+6Tcfkc=;
        b=ImPRxNchiiRe9Q3W13lrASZvRTHPychsQITnWqG/njy3kNrphe7irslPoNHH7MU39J
         2pf/eNRSYsdrYYj+NSgzGOMfyltUQOoBDzVb3ZDqeeQv5N/iKKOIRA9Lp9SbjIK0Sfsf
         r6+xkrUTI8LaM42wsqLBdfaqMngn42dJ6WhhiSYwh/F1+qqsFBCmWD4AqPXcafppGnJK
         G8RNUsjeio0GXkt0w3ZOl2v7exU9qyKkYZJlwhG89KWsyrUbnP6kaJRQSSwXyGAeH4ge
         gB7HoCZINQDYory4Vx7xxlefuiyBNYhn1y3dj1+ZPWFpds+Pw3m8tm4M3bQce0ID2ahr
         ZnaQ==
X-Gm-Message-State: AOJu0YzjU7JV6PTqOBexMIDPRZOe/n+Uu1T42kK0gdvnzuctu9MlXngF
	2l+jFGDbC1SNdAnAKe3UVOdsyLG/zsnKARJCUn6b2nYyeBOJqjytoIscVvY8pw==
X-Gm-Gg: ATEYQzyCOnjHZFhvHJwmas3LKbk4BO3L3G+ZGQMfAh+PT3SugdVfecK+ASHAt7Flp+k
	g86dgUdPBux0uro/kBldkPMhvFmNVp1Qs7wlzcqUkMzMG8qAYFSUnWVA7eyFExylP1+pGJtscAF
	DAD7To2flavVYgVpv1piPEXqvnhGSkLVTjOPlTdNlqprQNNHAQOpzw4xeFtjDjRR5vwteEa9Bz0
	8W1bVls+RqwY4UnSrEMtM3ASkDf/QRI8lJELBFVBEU5L0Et9Ons2BVfT/lu4Du0C2fMRobQvX1J
	vEWH/XV0sSgZuBveURYPDqnfxqJRs6jWZH3vIN7hjcrrXHgONx6t2FHwfsx0Wq+pmtPI36shDNZ
	bXxUVwcNDN3+aVVEVGhl8tN5rBNgafyZWnkpaY8TLZnNWStkcE9IFkRYbIumunAg4n2WScZDwii
	5sJqeyaaeghIoIwU2Lu2RD2XikBsCQTGc+2vo=
X-Received: by 2002:a05:6a00:9506:b0:829:8942:2ca1 with SMTP id d2e1a72fcca58-829a2f93b8emr10046297b3a.44.1773052350141;
        Mon, 09 Mar 2026 03:32:30 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([167.103.127.26])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829a463a1adsm9877083b3a.11.2026.03.09.03.32.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 03:32:29 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Liu Yiding <liuyd.fnst@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][whinlatter][PATCH 5/8] networkmanager-openvpn: upgrade 1.12.3 -> 1.12.5
Date: Mon,  9 Mar 2026 23:31:50 +1300
Message-ID: <20260309103153.536284-5-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260309103153.536284-1-ankur.tyagi85@gmail.com>
References: <20260309103153.536284-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 09 Mar 2026 10:32:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124991

From: Liu Yiding <liuyd.fnst@fujitsu.com>

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit fcebca61e5cec25f4e34aefa8967cf71a07704ec)

Release Notes:
https://github.com/NetworkManager/NetworkManager-openvpn/blob/1.12.5/NEWS

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...ger-openvpn_1.12.3.bb => networkmanager-openvpn_1.12.5.bb} | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/networkmanager/{networkmanager-openvpn_1.12.3.bb => networkmanager-openvpn_1.12.5.bb} (91%)

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager-openvpn_1.12.3.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager-openvpn_1.12.5.bb
similarity index 91%
rename from meta-networking/recipes-connectivity/networkmanager/networkmanager-openvpn_1.12.3.bb
rename to meta-networking/recipes-connectivity/networkmanager/networkmanager-openvpn_1.12.5.bb
index 159c3f7100..d21810a98c 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager-openvpn_1.12.3.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager-openvpn_1.12.5.bb
@@ -13,7 +13,7 @@ SRC_URI = "${GNOME_MIRROR}/NetworkManager-openvpn/${@gnome_verdir("${PV}")}/Netw
 
 SRC_URI:append:libc-musl = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-lld', ' file://0001-linker-scripts-Do-not-export-_IO_stdin_used.patch', '', d)}"
 
-SRC_URI[sha256sum] = "4bda1c8559bb8c35f6f131c09edae90cdfccd0314e8b8cb98ac55e09b6005adc"
+SRC_URI[sha256sum] = "ce32e38b0500eddf2fc8072ca17679817fc2d35eb91f6ff7b9904209c14b5afd"
 
 S = "${UNPACKDIR}/NetworkManager-openvpn-${PV}"
 
@@ -43,6 +43,8 @@ FILES:${PN} += " \
     ${datadir}/metainfo \
     ${libdir}/NetworkManager/*.so \
     ${nonarch_libdir}/NetworkManager/VPN/nm-openvpn-service.name \
+    ${nonarch_libdir}/sysusers.d \
+    ${nonarch_libdir}/tmpfiles.d \
 "
 
 FILES:${PN}-staticdev += " \

