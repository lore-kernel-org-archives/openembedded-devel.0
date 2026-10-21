Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7510.1792574987909914370
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Oct 2026 02:29:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=W5HAGtgJ;
 spf=pass (domain: gmail.com, ip: 74.125.82.174, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-3514b90bb89so1370706eec.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 02:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792574987; x=1793179787; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wWghLus5FIsI1p2bO0m9DN1k5gCt8m3ix9byWCCur2o=;
        b=W5HAGtgJmxKYQtfQnk0ooAyu0/Mf5Q4u9XSxshrF9vfbODQYpHnFFHsCP5NMp7MlYx
         KHDLjZSI1DA0t8584D15Jb/4KnsH8OxqECSQ3d3edW5CLRZdEsIYIy3taKwfEdVRtPcq
         nzU3/aErkstDSehh3N1IrTNobqR+5VP79R7Sa2O+lCjxZfSMq9qG8TpfBY5ysiKk9P+T
         8wcfR7WMUfnpHfLxK/g3OrFrM6zI0qDVin3upsXklPMPGZ9dK9LvVu6vyu+oLFNghwNc
         Tovh4yz5481iDuE47PXk+yIGIZWDU5aFhsM4Qb5/4qY65qeTH7/dEAzfVtCQpUZCw9W+
         F+Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792574987; x=1793179787;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wWghLus5FIsI1p2bO0m9DN1k5gCt8m3ix9byWCCur2o=;
        b=dSxRdiuKd0XNiWCEeDVRNXCFArJRFYCKV5GOYCb8aJbRgGelcH2Mfkf8DBhsJRwINS
         kasgaPptsr3kAHthwkpNUJUQKRyK/J+4PX3Wfv2wvrJqK+XDTDrPnycXAHsyJn2MqNzx
         1qxvZJz3Mlt2Fr4uL5r/BMicfamgFFh6fMj26/RpL8zeZf9JJ0NsMxDijGzMQp5FgSKx
         Y6DGQnJuulvNVXq9bTXR/KuNV/PyX5OKYlUlPg2F1Zlgm2yk1215Sqb/amDzeyWgskMh
         hu4xh4iOWnnTNlrQxbpPQZGuneNQUdr1nDPDDgpfUpGzg1eCk9/sxEPOE/UrM70OLWpF
         AU+Q==
X-Gm-Message-State: AFq9FYIQk3qSe2wIG079KId1JeVOEWyEobEmlhxfXo1jXtiRMltudQ42
	dFK5bS7X9RluGPBejlP22GrlqLGCpAwtcqFXm38FFDdqkyyeZZdcrQHl5e4gGg==
X-Gm-Gg: AYBFou1nuE/cd42A5flYBKrotP90hCFDvjlBwFOpj0oLPuiYK698TNcr1x0lBn3dGDz
	GalhNpXXPRQ3k1FvkXvBdD43q5bKkcaoA7L7oT9DVfmbHNSCWIyBJKh7K5bmgf76Bm6KwqNtN7l
	nE3i9KyDsORYLDvzLZbrJPP5RCT8Wn/7y6YRP/rJTi3PMPBXDKwJdT8uhOq4xDxQ1JJOdJFijA+
	K9tn/S6XzqIsnOhsFq4ZLFDdBvenqVwCSMYzZFS8xRw6LARGhastuiMYz1CxPfV17BJxkabgOOW
	A77SSxjGk4CvSQ15DaLMKxRuLpxQYgoKZSBtTfUXmh4uf33hfXfBQ8ZbhIdLUQ+gLS0uFhCTH3T
	deHP+FFoL0tbckqUGnwz0MKsbSZCU89DpWBG0mGkGnk3X8fO30jlKPJ+sJmUNgkPmXD/clLD0wO
	u+j9W5n+zMgc9o7RzKqtMyLUJTtpKCAGaOhuB4O7FED6O7+xSwCl1R3pUPCoR5DohL9D48ZDYs5
	VBgU7850CjGklnIijhC302B9Q4+zeriCJK0svlcyUyWmpCPoRL6EelFdg5bHproOrYAKTeYy/a3
	LeeYvVALaRJcBllM7xlYfTzNJ3fFnMc=
X-Received: by 2002:a05:701b:260d:b0:14a:8df8:56c5 with SMTP id a92af1059eb24-190a599a5admr1553256c88.26.1792574987092;
        Wed, 21 Oct 2026 02:29:47 -0700 (PDT)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.brunswick.com ([203.211.105.219])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-19035c0c9a6sm4716458c88.3.2026.10.21.02.29.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 02:29:46 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][blacksail][PATCH 19/44] postfix: ignore CVE-2023-32182
Date: Wed, 21 Oct 2026 22:28:32 +1300
Message-ID: <20261021092857.3585453-19-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021092857.3585453-1-ankur.tyagi85@gmail.com>
References: <20261021092857.3585453-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 09:29:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131206
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2023-32182

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-networking/recipes-daemons/postfix/postfix_3.11.7.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-networking/recipes-daemons/postfix/postfix_3.11.7.bb b/meta-networking/recipes-daemons/postfix/postfix_3.11.7.bb
index 99a77dd6c3..fe0dd95994 100644
--- a/meta-networking/recipes-daemons/postfix/postfix_3.11.7.bb
+++ b/meta-networking/recipes-daemons/postfix/postfix_3.11.7.bb
@@ -249,3 +249,5 @@ FILES:${PN}-bin += "${localstatedir} ${bindir}/* ${sbindir}/* \
 FILES:${PN}-cfg = "${sysconfdir}"
 FILES:${PN}-dbg += "${libexecdir}/postfix/.debug"
 ALLOW_EMPTY:${PN} = "1"
+
+CVE_STATUS[CVE-2023-32182] = "not-applicable-platform: this vulnerability is Suse specific"
