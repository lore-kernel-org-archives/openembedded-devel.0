Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.48029.1795411845271818603
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 Nov 2026 21:30:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=pWgpZjS8;
 spf=pass (domain: gmail.com, ip: 74.125.82.169, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-38587f3de36so3516027eec.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 22 Nov 2026 21:30:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795411845; x=1796016645; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KNJvvy8ai6ligxJF37SzvIaQVkvAFI24qzskJlYQ2KE=;
        b=pWgpZjS8+ANF8oeRpq+Ng2ZKIPKqhKaM9o6hh50fRkNaYpTGs1WzMLq92dL/XDQHKy
         pV8EEEw/8gyzC7eSvjxOgfgnH4/lfXkVaoR505oNhEE86dagwiYW39xXQrpI4Hq1CBFQ
         s5l82QBH8NJnounJ2lbRBwhLWpy85/kZGES8nxFpJPoDaUQd227iPocUEyUIDAfw87ZL
         /mGwa8d6QiVwZb9BmZADdh01/jq8/jBvh075owQD8PeSezekxsRjbNO0DldVIVR3zeyw
         +o8Fy5qO+MUegz3DFRUnDMSHBUTvQGnUDtKcyHbuVcifNBDmj6pSJd5K9Y29e9ntrn27
         Dlmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795411845; x=1796016645;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KNJvvy8ai6ligxJF37SzvIaQVkvAFI24qzskJlYQ2KE=;
        b=DdIlbtTzj7XvLEOSWICHcxDpdZurU7QZ0/uLlC3jgtLmcEdFuNrGA1UO0IqQFnk7ZX
         GL5hZt03Yelg6fQAdojRSqJa8StnIPpE2B73/DpVcg12nztdc5272EeV+e4VvUYkcOh+
         TY6EK/PUhsZ/N6QVZHkso4rlV9p3eI+Jxt/9Gm25KrNf7OlToJLPCIUGj1ufNppE6Z7D
         vUiWbdT0QdGh0jsPRHoqv3xwsfHJtrjjAZ3zLsFLbdElvc0FOd6Ft8TWCfCRpWi4puHH
         xypdGvrgyBMGr36VHOZa6jHUa4zjknVlmrOf1vd5+IdYRvPTVNaz2TKwzhEXosI9nTFN
         vUHg==
X-Gm-Message-State: APuU4Z9kL45CVpEltp49fbJw5yMi5YnoSiK1WQQ5+Z937LpY9l1Opbqj
	VoIP3EQH9+p1os+SKpUiATpYoznhqkdapd2QB2v/20ccUvDdVpgfKbNAcpoFXlHKbzM=
X-Gm-Gg: AZFdTZfbrXP8eogDYSovwDQGpZJOMzOAIalDF8EkfmzbQsO1kRE+vIbicWz5IDbhA6l
	bwGkHRNlrBDrpZHIQd+o4mVFsW7s4XSBRvly29tiljFDxC3s7xGwM5Dq2dZEe4M26e94Pp42QpJ
	p0sxQGZ/stqi/oA2rJT5S45k4Tr3HuQxKIJyhP67cOm+poy8pgScAeEJe5IST9zbnzCxXAwrQrR
	dOd7F3Uu9hMN0j5J06kO4oGjlpSe325yn8pM8KQZxfesM8FBSGEdusVrPP5vFpjlwNy7fo6MVx7
	jwE35MJ+IiUxcTt4qf+7nJtBNxBKI/mjnY5vV0OFBi/ZAH0KfRXdfLE++lul0n0XF63a6ouWz/g
	Ht4KJ0P3eNLooqUH2+OEHYn85ERlmqXFE9RNFvAZE3H7rQN0pozTQeTMyKJgGcfmWNRO4Lv0W2P
	3znofMzLHGPa74OY2KuELzHzZ0V7BMGaiftsAf2p4ekhHe1hHTwUtwAC0aepa9Vnf9KwGD5KSoX
	6fpyKcfGWZc6cmq/pWDdTZaEhn6e9E2oKa1o4hxgLQIDcQt1Dk6kP/bHMzp4Z2TBleOa1LsxNTS
	6s4CSXQTNWvdFE38kESrhxQ/6aJrfeBBy0V3b3fthrXpmVdRQMf280mVxQjVRLklJhq27hRIlFV
	h8b5rHJuN+MUEC5bWgI4rMSySD1mtvWpkGtnQ6hBcTgDTJAawhfON6NgkCNDq0Vk9nLVckwU/dZ
	lm8AEmEuz7GoPVYpuin7X5Wkr9yeglcHeF9/KWVn/8EtZFZ1loTCNom0kj3+p30Q9+KeSFXTXxs
	SfjV9eGOtI0N9gGUjg6hlBh7RWMZjUh/RZI9q9FxvfCtRrtWv0iP5BOIWtayRmKpY4AL0ou+YsY
	ncWf
X-Received: by 2002:a05:693c:60cd:b0:386:98d9:d5cd with SMTP id 5a478bee46e88-38698d9d928mr8776505eec.39.1795411844596;
        Sun, 22 Nov 2026 21:30:44 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm36573136eec.26.2026.11.22.21.30.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 21:30:43 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 11/42] fwupd: upgrade 2.1.7 -> 2.1.10
Date: Sun, 22 Nov 2026 21:28:55 -0800
Message-ID: <20261123052953.3658549-39-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
References: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 23 Nov 2026 05:30:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132826
Content-Type: text/plain; charset="utf-8"

- New plugin to notify bootupd when the ESP changes (2.1.8)
- RSA-3072 signature verification for Lenovo accessories (2.1.8)
- Report data includes whether the host is a container or hypervisor;
  the daemon now requires libusb 1.0.27 (2.1.9)
- Security hardening: do not let modified XML files spoof metadata
  trust, verify jcat item IDs before use as filenames, limit LZMA
  decompression to 2GiB, fix buffer overwrites in several parsers
- Many plugin fixes (dbx, Redfish, Jabra, Intel GSC, TPM, DFU, ...)
- New hardware support incl. FocalTech MOC fingerprint sensors,
  Lenovo TB4 Dock Gen 2, MaxLinear MxL862xx and Synaptics 96F1

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-oe/recipes-bsp/fwupd/{fwupd_2.1.7.bb => fwupd_2.1.10.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-bsp/fwupd/{fwupd_2.1.7.bb => fwupd_2.1.10.bb} (97%)

diff --git a/meta-oe/recipes-bsp/fwupd/fwupd_2.1.7.bb b/meta-oe/recipes-bsp/fwupd/fwupd_2.1.10.bb
similarity index 97%
rename from meta-oe/recipes-bsp/fwupd/fwupd_2.1.7.bb
rename to meta-oe/recipes-bsp/fwupd/fwupd_2.1.10.bb
index 9d1ac8de7d..31b1121c83 100644
--- a/meta-oe/recipes-bsp/fwupd/fwupd_2.1.7.bb
+++ b/meta-oe/recipes-bsp/fwupd/fwupd_2.1.10.bb
@@ -18,7 +18,7 @@ SRC_URI = "\
     https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BP}.tar.xz \
     file://run-ptest \
 "
-SRC_URI[sha256sum] = "472e9426f7a1b18fa9d199666c15482d4ee51ea35e916ca53bb3ca25919edb10"
+SRC_URI[sha256sum] = "cb23ab505cabaf616dacfc199f710f883329e8782ca3aa67548bdb7181d62fab"
 
 UPSTREAM_CHECK_URI = "https://github.com/${BPN}/${BPN}/releases"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
