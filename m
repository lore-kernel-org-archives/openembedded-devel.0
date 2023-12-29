Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1AAFC47079
	for <webhook@archiver.kernel.org>; Fri, 29 Dec 2023 19:02:39 +0000 (UTC)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
 by mx.groups.io with SMTP id smtpd.web11.155464.1703876558220359823
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Dec 2023 11:02:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KKNx3d5G;
 spf=pass (domain: gmail.com, ip: 209.85.128.180, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-5efb0e180f0so11095897b3.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 29 Dec 2023 11:02:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703876557; x=1704481357; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7tYi2ffLJK3YoYraBgH53Q6LejtNSLNaR0E/L7pTqLM=;
        b=KKNx3d5G3JjxqzKQ8kgNqLo8bhf2qkmuO2bDYZU000KHhCpHJY9Z+xUY1fwTG09EKe
         dIfKfVBBA0IQYeAUe5IFycMioYm72I4SaOvdQlAFdYvn/tLUJ+Ol0mKPpNk0+5lVVd65
         1ykse6EizTaADrOLabgnXIXbY50quC9JRE0cMSbP6PgMDMFnaAY/nwfJ9iRkwt4nZVfE
         E108W+dkikHUA77PWrqa6hl11sYlB9aygyGy/xXjLGUB4zOz2/0KVYnf42OrFF9vGZyI
         Pb/fECMXUAnDLDQ2hd/4DtI2HCJ+9mO6c7AsS4tzzjcKXzBxknk2yJQFBPS7SeLzS/zu
         h4gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703876557; x=1704481357;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7tYi2ffLJK3YoYraBgH53Q6LejtNSLNaR0E/L7pTqLM=;
        b=DSsOY/UWJRGKU6YqQHFhszx6HVM7/PrY8OXGe9t4vw23fmsaWmQJcoXu7siO1uiIHV
         YYWHrgm/aJf7sI8/NnZoGo7EU8lj5UZ7DoJ1xAPz23fy9BgMnOitoO2VXI6EQG5H2XPL
         QKMIDf4gEtG9C2EnBUK7cr6BERCh9P4jFO4uZleTOzrB83odBb41UZqZeGac3GImq90W
         L+uoAiugtcNAoSdhfgSb6yezVwpHDgWdkJ8+EzWAbskWNg0DbAJatGAtRw/TLLh4DDOA
         FD+5qmTfIsXi6ozZTqKV42idI1I58oJkCzrpjCYcg3fLJykwBLWeBpYzuGBxQklxOfk5
         6ufA==
X-Gm-Message-State: AOJu0YydmY5zU8088gNq8/D7eFA5kCCqdBj4ouri93CBHugzl+xcmHkD
	fohyltsNK4MW1t2dWhwWDwp0nWPiPyt+vQ==
X-Google-Smtp-Source: AGHT+IFE+UN+FJ1MxWQxMnscMtfMIrsfufVrwN+CNoF03gc4ZSDSBRcddigATWLGbik2lBsms554Fw==
X-Received: by 2002:a0d:eb88:0:b0:5d7:1940:dd65 with SMTP id u130-20020a0deb88000000b005d71940dd65mr8273463ywe.59.1703876557200;
        Fri, 29 Dec 2023 11:02:37 -0800 (PST)
Received: from keaua.caveonetworks.com ([2600:1700:9190:ba10:2080:c728:4a66:97cc])
        by smtp.gmail.com with ESMTPSA id d13-20020a81ab4d000000b005e71fbbc661sm8570683ywk.143.2023.12.29.11.02.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Dec 2023 11:02:36 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][nanbield][PATCH 05/17] openvpn: upgrade 2.6.3 -> 2.6.6
Date: Fri, 29 Dec 2023 14:02:18 -0500
Message-Id: <20231229190230.135480-6-akuster808@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231229190230.135480-1-akuster808@gmail.com>
References: <20231229190230.135480-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 29 Dec 2023 19:02:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107887

From: Khem Raj <raj.khem@gmail.com>

License-Update: Added Apache2 linking exception

Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 45ad525348569f8f5f694a88bb311dbf83998304)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../openvpn/{openvpn_2.6.3.bb => openvpn_2.6.6.bb}            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/openvpn/{openvpn_2.6.3.bb => openvpn_2.6.6.bb} (95%)

diff --git a/meta-networking/recipes-support/openvpn/openvpn_2.6.3.bb b/meta-networking/recipes-support/openvpn/openvpn_2.6.6.bb
similarity index 95%
rename from meta-networking/recipes-support/openvpn/openvpn_2.6.3.bb
rename to meta-networking/recipes-support/openvpn/openvpn_2.6.6.bb
index a5fc158749..3688ce4091 100644
--- a/meta-networking/recipes-support/openvpn/openvpn_2.6.3.bb
+++ b/meta-networking/recipes-support/openvpn/openvpn_2.6.6.bb
@@ -2,7 +2,7 @@ SUMMARY = "A full-featured SSL VPN solution via tun device."
 HOMEPAGE = "https://openvpn.net/"
 SECTION = "net"
 LICENSE = "GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=3170e982baae61dbb8de963317d1ac94"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d8d34ce6390552676e4ce8279f13c48a"
 DEPENDS = "lzo lz4 openssl iproute2 libcap-ng ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 
 inherit autotools systemd update-rc.d pkgconfig
@@ -14,7 +14,7 @@ SRC_URI = "http://swupdate.openvpn.org/community/releases/${BP}.tar.gz \
 
 UPSTREAM_CHECK_URI = "https://openvpn.net/community-downloads"
 
-SRC_URI[sha256sum] = "13b207a376d8880507c74ff78aabc3778a9da47c89f1e247dcee3c7237138ff6"
+SRC_URI[sha256sum] = "3b074f392818b31aa529b84f76e8b5e4ad03fca764924f46d906bceaaf421034"
 
 CVE_STATUS[CVE-2020-27569] = "not-applicable-config: Applies only Aviatrix OpenVPN client, not openvpn"
 
-- 
2.34.1


