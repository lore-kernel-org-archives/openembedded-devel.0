Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C12C9C44515
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 23:38:51 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11395.1784590729601050850
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Jul 2026 16:38:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=nEEr0Ml6;
 spf=pass (domain: gmail.com, ip: 209.85.215.169, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cb5a6aa8760so1615037a12.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 20 Jul 2026 16:38:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784590729; x=1785195529; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jfF5UZbX+jkGfszQa8LvyDvKqXukHxWNbQjm9yOX9wE=;
        b=nEEr0Ml6iBmYr54voYBP/xN4a1Us3OsHcxnzRMSY5OXIGB7tVkfeEZ/XDpqP4tc1qD
         8MSYDTENs9y+IGCDz4HwFL7viBU9e4nRB9dRkkXgYutKIIZP73UTHJhZXYm3oUZ6bOs8
         3Mf3JAI7xdRf1UJrPym9sVKIXS+O9OWcAlU2/VAQlpAC+d1xd5NEGkOM0DQsJeHXDm2l
         HzSTQAVMZud4SMBl0LNUx+iHlwthe5lHnfeSxtoAm4m2oUS0sch4om04Rn58zZxh+4n+
         16kGCdjU6pFTE/qHhq82mF4E4Sljg5vK1BmfJdTZI1yDhvJ3+IrZnoLJcKR6wbbXAAbM
         QbPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784590729; x=1785195529;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jfF5UZbX+jkGfszQa8LvyDvKqXukHxWNbQjm9yOX9wE=;
        b=qRlCp3VqJ5+w9CmtzIDluqksL9sZBSa+vJ5A7mkySOjFT6fbmNijEa+AaCtFEaDdGr
         VK7u11BBIQ0H4UbQxWimSQqjVyJ5YnRVnEipOqpJz9UEVzKN85wuvFQWIWdOPdk3dRbn
         SGtqeZvFzIn5SuJguMkIQHLH3bGTwF6I3OcoE9fvEXaUFssGPG28rzmMwbuFGHTqUhc1
         Mp3maxHeb8jy+Ha27F7GwJsalcHE7HcSV8HEiFEXJuqSlXSXbQrwsfsyihOKXwWUlvgH
         TUVRH80bnqeI+3GFu5uNWHpTYIhUOSAehdca+yhMFQpXFQzdV/W6PHDabBw+iL4zg8pZ
         QgGA==
X-Gm-Message-State: AOJu0YxgEEwFgS6Fh//t9iNRzOyzLJQ68qyeP/jlZtcIZVhqVeJ3noqT
	d18636raNYjute2O6Tb3E0b1HFu/41nq0UdU3PaIxfIbtCcu7cqYi3kQ08275A==
X-Gm-Gg: AfdE7cnFLMeEsIoz8izkF2bR2mmbSj0KCxkrYLla6s1oWumy2eTRUvUyHbRoxvjkAZI
	hGJ1p7/NEUT8+X88KFHJGfIHvrIXSEHjan0rhQMsA3drbc5jyOuws2BrL/HVwVx971ikwWNydwQ
	z0gaUCT3ihKgHrfsWh3T+TlJJdvZgi+tW6ZtV0o0ILVj0x9zsqMJioYquMozExPEuHvDvRoNEcI
	ufOCZOBbMDkU5YEoIi94wCqnFNFKTgynZeUvTgphzlxW8O6XNu+TCyMM6qVSET86vGjTPnIC8C4
	0IUymTGYJUVjdZlyZFBOSr0ejfTg+wtOZ+B/X+R0hllLGhxsak4ixl/Yw/W6CN6b76eow8WY5Ti
	ibRwBpU980/fsBILDrT+t2Yk73vdXmwTG+XYCOtlZoin802epx3q2IQ1D/9Lui+JQKU1NTFTPfl
	QjmHB6h0/9RlyjEng=
X-Received: by 2002:a05:6a21:48f:b0:3c3:9746:1fcb with SMTP id adf61e73a8af0-3c3ada1e7f6mr17845834637.35.1784590728924;
        Mon, 20 Jul 2026 16:38:48 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31429fe4677sm36926061eec.11.2026.07.20.16.38.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 16:38:48 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>,
	Khem Raj <khem.raj@oss.qualcomm.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-multimedia][wrynose][PATCH 10/30] pipewire: update 1.6.7 -> 1.6.8
Date: Tue, 21 Jul 2026 11:37:51 +1200
Message-ID: <20260720233811.2324493-10-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260720233811.2324493-1-ankur.tyagi85@gmail.com>
References: <20260720233811.2324493-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Jul 2026 23:38:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128311

From: Markus Volk <f_l_k@t-online.de>

PipeWire 1.6.8 (2026-07-09)

This is a bugfix release that is API and ABI compatible with the previous
1.6.x releases.

Highlights
  - Fix a data race in JACK that could cause lost MIDI events in ardour.
  - Fix some unbounded memory allocations.
  - Various small fixes.

PipeWire
  - Avoid some graph recalcs, which fixes a bug when suspending a node
    while it is active.

Modules
  - Do Content-Length and allocation check in RAOP to avoid OOM errors.
  - Fix a potential memory leak in the error path of client-node. (#5348)

SPA
  - Fix filter-graph dynamic graph updates.
  - Avoid 100% when unplugging a card.
  - Fix filter-graph volumes when the filter is loaded inside a node with
    hardware volume. (#5344)
  - Add normalize and latency options to the SOFA filter. (#5322)

Bluetooth
  - Fix a potential leak when transport fails to start.

Pulse-server
  - Avoid stack exhaustion via unbounded alloca.

JACK
  - Fix a data race in jack_port_get_buffer() when called from concurrent
    threads, like in ardour. (#5324)

GStreamer
  - Skip invalid crop metadata.
  - Avoid crash because metadata listener was registered twice.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
(cherry picked from commit 6dbf71845427a0d8f353f324b8c319905271815e)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../pipewire/{pipewire_1.6.7.bb => pipewire_1.6.8.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-multimedia/pipewire/{pipewire_1.6.7.bb => pipewire_1.6.8.bb} (99%)

diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.6.7.bb b/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.6.8.bb
similarity index 99%
rename from meta-multimedia/recipes-multimedia/pipewire/pipewire_1.6.7.bb
rename to meta-multimedia/recipes-multimedia/pipewire/pipewire_1.6.8.bb
index 50feeaf843..d46b3cb1af 100644
--- a/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.6.7.bb
+++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire_1.6.8.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = " \
 
 DEPENDS = "dbus"
 
-SRCREV = "3b2cb4fb037bf6033b87d3c87ee917b2f686d309"
+SRCREV = "b741e0c74f5436f0c925f7741140db0efd32cf4e"
 BRANCH = "${@oe.utils.trim_version('${PV}', 2)}"
 SRC_URI = "git://gitlab.freedesktop.org/pipewire/pipewire.git;branch=${BRANCH};protocol=https;tag=${PV}"
 SRC_URI += "file://0002-spa-plugins-alsa-acp-compat.h-p-is-already-const-do-.patch"

