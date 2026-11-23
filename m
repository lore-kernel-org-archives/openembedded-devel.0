Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.48010.1795411814843793219
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 Nov 2026 21:30:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=EJLlJfgG;
 spf=pass (domain: gmail.com, ip: 74.125.82.176, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-3282db206d3so8805408eec.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 22 Nov 2026 21:30:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795411814; x=1796016614; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tkrKu1p2HiIrL68Zepr4svoBrt/dpJr+BFbZZg7ZJQs=;
        b=EJLlJfgGmV7sUixDxHOpS6SisWnz+LPy5uy8LKX+bKoGKKWi+V/fQtumaUMN2OBD8A
         I+sph7/ELTR6ssaMWl9iVuv4SZvs/Pud+stHoHPnoN/vcmDjXlcVh0x898cHJ4ihtrFa
         vx+PuhEMsskL2jvLaHYqnM48iXQ8S7wD3c1sce+iYbVSIYqYtKyCNsdP7yZDWHWvQ749
         343kvslAu0td+y9db4Ng/kqfmQL/hxrwU5U0wwtzwt7yWvxMfPbXaf2RZjXoukNDbB9U
         hKJXHeiGuGVf2Gc2/SJUkHNOT2HnvC8Min1AZzCRf/ZFY+vfEyliHCGe3v8vcafW9HB1
         5hoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795411814; x=1796016614;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tkrKu1p2HiIrL68Zepr4svoBrt/dpJr+BFbZZg7ZJQs=;
        b=Z2onOMRsP1IIj9HHmNVdm/2MxEZJKwLZhQvK9oYOirTLKLqe82pSRODl8UNBXcwzOB
         Sk3gpxfuWXZtEQOf8BPWdUN3LtG119ZC8GaeCzBWLmX2296RawX9HgQ2DAuh/IO1aM5Y
         j/r8BiHGBbZa/4PTPORwJvP998s+pmiU/Fkzy5nxqNxzHcddjVDbH4Ooj6APw+DV6QQu
         4AMA1pZ9hRZTdWslEnE3KtXSi2fNHOf7ctgjyak5ValSajYcHModbpWUd4SuQw5YGB/t
         6mm//z2297/W3Gz7q9ZjVi3MYhV8w8UUVBbbR6AJEaz3EQDzvtvnUvbutkweLxmhxANC
         R75A==
X-Gm-Message-State: APuU4Z+BJHuOS+IwkAwOiz2sfJv5ASjMjqEjpLmA8j750SI2xogreTmf
	I9Gskl46x37zmy1Afxz2Hs8+jfotsW9H/ni7VNhf2n/2bA7rQatt6n6UtwF5uIfTwfY=
X-Gm-Gg: AZFdTZfW0QPLdfU/NOS5vsNAbHpcfHp1sidI/qDM/fB8oea+JUjq/NHxttTTIyJyv0F
	U7Q9KkyhqpSYJ5LGyoARqowAMxOB6/+lyMwI85Pnz78XMTdCvk4IuP91IsIombRJkNdeZwG8Y0Y
	g1bKYQxGN3k8ToTNuQuSRChl17ZAzWb7z1IdLAAyGn+DI9ys0siS9xOjpUR0sARxuHEsey8hDDv
	vbnsobDSxmmECFQsrKOGPme+BnKaTQb9yPBeqLnVesWH5dgqMozkQtJ56jIeDWwtvmaOgjtFvnK
	iMsjzgFHhSQthOLOK8ykfE4hVCYstfrywb3vJ22w5CUo3XkP2CnQWOFwMHezPZWNpEPPhoerf3T
	tFKiwoLFOnIkFSZG4MdeZhpRldNJLOtgmgnPqtW/F8ibu5jlthuX5ff38vwLL4hTGhTsa7MrcW1
	JiVaEGelV32LLQKCZLHcL1GlMiJ8k1XAugshSAGW0hdHYh6UOltxj479Y6BsZPFMBw6ebnXddM7
	Nym080gTtzdTh/qJHdF0zuPWIkKPRFh+71H0lplZvlmtghY/OynpAKu0phzj/Ev9xwNAMP6sdZ6
	sD8ctFCgXcfK/581KtB6YnpnV/tHpQtJWPOUW76VDMq6mATAY7d5xtqJyuBlFqg0k0AScqgWx+d
	durHlRJ/g9vqX9XaiT5V4Oq7MQqbZXgNgWZ80bjfWM7pOG2bROjnTnfD08Qeg+M7kaQio8CRm38
	5DlZU45xJWbrvEH6ji34DW+OGWsZCySXX2Jn6O5lC4Gs3HOKfMyiuuu6ttnnCsW8FuGRARuaaJW
	+9szfeZSRNJIv5yWtkHilOkLD6E3krlP5ANSCG5yuKtutA+Owe8CSUsvRwMG9bbPGUUPiL8nsHp
	6ZvZ
X-Received: by 2002:a05:7301:f10:b0:386:3817:354e with SMTP id 5a478bee46e88-386381738e6mr8939339eec.9.1795411814156;
        Sun, 22 Nov 2026 21:30:14 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm36573136eec.26.2026.11.22.21.30.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 21:30:13 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-multimedia][PATCH 3/6] libupnp: upgrade 22.2.2 -> 22.2.4
Date: Sun, 22 Nov 2026 21:28:30 -0800
Message-ID: <20261123052953.3658549-14-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
References: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 23 Nov 2026 05:30:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132801
Content-Type: text/plain; charset="utf-8"

Bug and security fix releases (22.2.3, 22.2.4):
- Fix heap-use-after-free sending a QueryStateVariable error (#684)
- Drop chunked trailer fields that could make the app read freed
  memory (#682)
- Lock web server settings against concurrent request reads (#679)
- UpnpUnRegisterClient() now waits for running GENA/search callbacks
  and suppresses pending async completions (#678, #681)
- Fix buffer overflow in the TV sample control point (#683)

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../libupnp/{libupnp_22.2.2.bb => libupnp_22.2.4.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-connectivity/libupnp/{libupnp_22.2.2.bb => libupnp_22.2.4.bb} (98%)

diff --git a/meta-multimedia/recipes-connectivity/libupnp/libupnp_22.2.2.bb b/meta-multimedia/recipes-connectivity/libupnp/libupnp_22.2.4.bb
similarity index 98%
rename from meta-multimedia/recipes-connectivity/libupnp/libupnp_22.2.2.bb
rename to meta-multimedia/recipes-connectivity/libupnp/libupnp_22.2.4.bb
index 9d81805d90..2b3fb1cea2 100644
--- a/meta-multimedia/recipes-connectivity/libupnp/libupnp_22.2.2.bb
+++ b/meta-multimedia/recipes-connectivity/libupnp/libupnp_22.2.4.bb
@@ -8,7 +8,7 @@ HOMEPAGE = "http://pupnp.sourceforge.net/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=394a0f17b97f33426275571e15920434"
 
-SRCREV = "fac0494691434c35243131f66a0b27ea0c29f700"
+SRCREV = "6c41983894f343ebaae78dc5f2a1f28581a4f88e"
 SRC_URI = "git://github.com/pupnp/pupnp.git;protocol=https;branch=main;tag=release-${PV} \
            file://run-ptest \
           "
