Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B96BCD13D3
	for <webhook@archiver.kernel.org>; Tue, 11 Nov 2025 09:38:27 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13710.1762853899762866165
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Nov 2025 01:38:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZlWMmi9P;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-298144fb9bcso19435185ad.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 11 Nov 2025 01:38:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762853899; x=1763458699; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3Js6PaZihecWiW/xrDeBe+vl93jmYs3X511zsqYW0tE=;
        b=ZlWMmi9P56Lw8XBvZxqa6bNChzYE31UMDTDCMsEOnMttXIUOejHIjQROMT/d50QMoV
         Q37+L56GsgWUWkj8LoRc9mMnuDuWq3djH/nDj5fwzBXo3gp8+dDF9G8Jb51TaTUkRhZc
         8ZOFkqki38fcoiU98ZJlIOAF+VW3+SDhuteZ81JAba0xxkgr9UzZZzd5/KMUPlI4B3dJ
         eRIfz6oUSfKcrqfwDHHWjKYBAvC46GmXdm9uEozneTvEqca/hC6x+wDrfKFiRPSDH7hw
         MI/oUXOVHaMGhoupjWyXn/p0go6pmxqwCJEedVXqzqGenezJIb0ykMYj+gPYW+c8HbRu
         WfLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762853899; x=1763458699;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3Js6PaZihecWiW/xrDeBe+vl93jmYs3X511zsqYW0tE=;
        b=M086dVQEARpA0Mqt8oFVR3sI4k5QlJwHYgtAJzJ+ayfdGTAKAPrK7JAAROnx1UkkEo
         bgC+Nmm5CreCGyVxU0rsYEgv7XQdX4avqS/n2gwxbSRupLdstABWsqWLYVgYYaj5WtWY
         Wtl3pKi9d8LypwK7G/QbJaUP5CxkSdrYhhc3IMcwSpN7FQP2kII6epSunzKovBGe+wiy
         F+Se7N3M0/YyYzamV6d4JOGtTW2e8+iWcjM6XP2R+nAfK7wZYwElqJKlf4yy6up3eRkH
         FNBwu/K/wbASVqxZTi/Dkuq+fvr/3WXwbQo7TPyHwiEEalMpdgGp9gcZ/iedofntzoyj
         Npag==
X-Gm-Message-State: AOJu0YxpRGhJQxSR7kNQ0ud2PtHyzmWUY84mKmjXsETWlEvOmccZWolO
	K8cUJXK2cy/51Rb0A/QEK4jOe6IYYlW6Gl+bvraAk3KkKKBUUPFSINHrK3ZTQqn4biA=
X-Gm-Gg: ASbGncun3TLEEBZS5icIGQeTK9diDyFjjGU81P7rVPAIw2QixyRVNyenWwq5/aTZanz
	uWl/+TIpbmhPQqkNlOqeBdyYMXpkeaZyjTQDIE9cFNFjyQ1/HSgcN10x5yFYPcKj8DSDdqAobNa
	e161Ne74CcihJ5HQv1yWeqsqkUewXDVIGyhXXuY+lGkUEDebASk0i4/YTXx0KoPVVGd9DZw+w/h
	q35K/XI4iF6X7wCorOuJ6qnCG3MKWh/HQXsrYnfh4G7mwZYR1KJyx4ezcNkkd7l9u1tb0Y7mXRW
	ThcYw6vmFnMcf/8J1XLfu1zwWn6VFLHcM3fOJY/2wnqP34fKft20Z1V8bm86TXIMXa3CvACiTT5
	efTwg4RNncj6/goeWdU4qQ0h12TDdJ9fM0Ifc/DArfajAdispZNh1m4I9Q/hhbPkTtYZwCgpJFf
	a/LZfQciFVqCq0n3eI6GAItqdyh6hPe+XaT7I=
X-Google-Smtp-Source: AGHT+IGmWi5qIJjfU9zTetoN2jX912BwNMg9NqClV7KEwP8qhIHzcCJtqCuv7MZ5OvrkDEohvJuMPA==
X-Received: by 2002:a17:903:2f4c:b0:296:217:33ff with SMTP id d9443c01a7336-297e5712497mr152186025ad.48.1762853898956;
        Tue, 11 Nov 2025 01:38:18 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.248])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2965096b90asm173611505ad.23.2025.11.11.01.38.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 01:38:18 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][scarthgap][PATCH 15/18] iscsi-initiator-utils: upgrade 2.1.8 -> 2.1.9
Date: Tue, 11 Nov 2025 22:37:30 +1300
Message-ID: <20251111093733.1393568-15-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251111093733.1393568-1-ankur.tyagi85@gmail.com>
References: <20251111093733.1393568-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Nov 2025 09:38:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121518

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

This release sees more bug fixes, and no major functional changes.
Several memory issues were addressed in iscsiuio, making it more reliable.

Changelog:
https://github.com/open-iscsi/open-iscsi/blob/2.1.9/Changelog

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...-initiator-utils_2.1.8.bb => iscsi-initiator-utils_2.1.9.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-daemons/iscsi-initiator-utils/{iscsi-initiator-utils_2.1.8.bb => iscsi-initiator-utils_2.1.9.bb} (98%)

diff --git a/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.1.8.bb b/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.1.9.bb
similarity index 98%
rename from meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.1.8.bb
rename to meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.1.9.bb
index 2caddbb54a..18ab16bc20 100644
--- a/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.1.8.bb
+++ b/meta-networking/recipes-daemons/iscsi-initiator-utils/iscsi-initiator-utils_2.1.9.bb
@@ -12,7 +12,7 @@ DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-SRCREV = "543ba0f15d340b97f30782308cec424a6738fec3"
+SRCREV = "678c3e9232b2b7177b7131071910da14f065e037"
 
 SRC_URI = "git://github.com/open-iscsi/open-iscsi;branch=master;protocol=https \
            file://0001-Makefile-Do-not-set-Werror.patch \

