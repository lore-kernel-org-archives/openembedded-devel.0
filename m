Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57F0BCA5FB8
	for <webhook@archiver.kernel.org>; Tue, 29 Sep 2026 22:58:04 +0000 (UTC)
Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1494.1790722681642525435
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 29 Sep 2026 15:58:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=UXrwYCjW;
 spf=pass (domain: gmail.com, ip: 74.125.229.43, mailfrom: raj.khem@gmail.com)
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-34abf779ac9so1225058eec.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 29 Sep 2026 15:58:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790722681; x=1791327481; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aQFs366jxqxin5BgBrw5BBHKXjoSjvvlkufc7+xvdus=;
        b=UXrwYCjWVL80/+QZJObWCQq1AE6l7GCspr5sMq+7LuSHexWC78ADkUFAuChmAPBvvZ
         NnLo1sNiqmoqj8CD8TeZDI6htqDezmlvVi+BLOR/81meQDiKxk1RLeRSU4EGSs7AuOUq
         gZ/pe6nnWtlLtmILIzKTEhg9Q9zulNz1yz6CSI+YFQx7ZeBWnn/J9wPWj38nnRpeydKJ
         AZ4eT4salE0svNa3WOk3UxxwQcVR7uRBX3Si+XXIo5Xru8WKWsPkzr5kq7xLEdw4axcN
         zXPZAM+yKSX3c5CcgrZZiv7E9unkBtTxN4DjcxdsqHguQv9OXM3ojGAIlBRypsKaFnVb
         tscA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790722681; x=1791327481;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aQFs366jxqxin5BgBrw5BBHKXjoSjvvlkufc7+xvdus=;
        b=Uy1vkkla2tXkaU1ixD7CmHfRbSR/76EyOL5UTHehLKwn0RzgWPXGkFyW6Sbf6uH7GZ
         UXQZ5VhmKcoyiWRnQN7Ig6lm0So0aBEn9HPgXFIHg8Q0tPcdeG6e/5jGJM+4T0Ie7qeW
         YxF13ezG0/cgtiAg+cmNzWTlnZjkRwfDpTlrWDc2qV0lf7CF/xrxlVtE8RsIJ3qf9H7C
         5wd5Ab5+L4lxE4Hu1Aixu96Pa9buYi+W6sM7oqXyEivWvwag6Nt3TPGpyc9EZU/e3AGP
         4yFOf6BhdtiVodnP6mb38IZO41/e1c0ABDVHCsiOjFiMSrUZSt3e1p0UZJdrapijW0bk
         8oaw==
X-Gm-Message-State: AFq9FYKP/HKTdsRiKv2kuprCHQgYR8cINUKd0WNCQRKcFquDU122cJpG
	rdN04ZlZaiX40IiTwt2e76HXEpstB+PKeki1y1z1e7h4GUceQWY8rQobGxH/BJYcbLU=
X-Gm-Gg: AYBFou0gjustJG6iFAOMeq6GnG58ia2KokMxZpMiSXXCqw3Yef4lk//gJfU0rXpK3OQ
	tT+RPz4Zj80Mo7oNPRWcbn5wquUi+nJPr1qElrI9easS8Li5hJ82nC1GdrJXoI++pyZQA4APpw0
	66Mo3qpQITQxHl63e47drBAjrRn1xO6RZ2MT8fbmwqN188P8uexlFvzf/XhbhDkY6BsCTDitXG3
	uTyA3ShOLnNHaxBAsIBcuwCAnLmgJhg9gWbRK5KHU0h7DHZFT9mz1btEGF8TI3PdyRAetdLBtaH
	DMIsTKisCK6oTsOIasn/lKvu6qMlQDXXWBbFqZi3/zyernkz4MnLsUZgsXeRpSrvEvxmLSPBxqJ
	BoANNZctUFH5p0PhO0D3a55wMNx4BET27grFtjuzdkNDGvd9vD9h8CZia97gX6Yw6HFb/swAdQg
	TJIUD267xdTlzlvCI8NTon0dcgX81FtYavrb0nCbc18RpWKJ+1gk7oWn4sC+IZIeo1p2M5ywCdi
	OIFkXE9jBPSUE4RppOkxFK9IKnPpPSGn0xLiKU3vRpg1enMcJGYJCyQN90DJkaqVHmReiKzi6zS
	CTuyZFs46BQF90SZksQno13X6oUXy/S/mOTgPYp3TdHgoopRNwZ/hS88LIMFhpUsJy6CmQy1xlD
	2myjiKlYEwmURi67gcRoQ0r6w0eDHARZhq2o7oI7JeCURWBm/bpTkmgJFQnGGiBnOpZbaX9ruoH
	ODdUCTzSoE7GF95lBY0v3g+azR7wQr0rEWXcNNyA==
X-Received: by 2002:a05:7301:2525:b0:33c:259a:759 with SMTP id 5a478bee46e88-34c68185f7cmr792168eec.36.1790722680934;
        Tue, 29 Sep 2026 15:58:00 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34c38bf0948sm1595527eec.25.2026.09.29.15.58.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 15:58:00 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-webserver][PATCH 23/26] netdata: disable systemd units plugin when systemd is not enabled
Date: Tue, 29 Sep 2026 15:57:20 -0700
Message-ID: <20260929225723.1046705-23-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260929225723.1046705-1-khem.raj@oss.qualcomm.com>
References: <20260929225723.1046705-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 29 Sep 2026 22:58:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130510

netdata's cmake build unconditionally requires systemd for the
'Systemd units' plugin unless explicitly disabled. Tie
ENABLE_PLUGIN_SYSTEMD_UNITS to the same DISTRO_FEATURES systemd check
already used for the journal option, so sysvinit builds configure
cleanly.

AI-Generated: Uses Claude Code

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 meta-webserver/recipes-webadmin/netdata/netdata_2.10.4.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-webserver/recipes-webadmin/netdata/netdata_2.10.4.bb b/meta-webserver/recipes-webadmin/netdata/netdata_2.10.4.bb
index 709538b1d4..ed4c54fbe4 100644
--- a/meta-webserver/recipes-webadmin/netdata/netdata_2.10.4.bb
+++ b/meta-webserver/recipes-webadmin/netdata/netdata_2.10.4.bb
@@ -102,6 +102,7 @@ EXTRA_OECMAKE += "-DENABLE_PLUGIN_EBPF=OFF \
                   -DENABLE_LIBBACKTRACE=OFF \
                   -DProtobuf_PROTOC_EXECUTABLE=${STAGING_BINDIR_NATIVE}/protoc \
                   -DBUILD_FOR_PACKAGING=${@bb.utils.contains('DISTRO_FEATURES','systemd','ON','OFF',d)} \
+                  -DENABLE_PLUGIN_SYSTEMD_UNITS=${@bb.utils.contains('DISTRO_FEATURES','systemd','ON','OFF',d)} \
                   -DENABLE_EXPORTER_PROMETHEUS_REMOTE_WRITE=OFF -DCMAKE_INSTALL_PREFIX='${base_prefix}'"

 do_compile:append() {

