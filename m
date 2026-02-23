Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26609EC113C
	for <webhook@archiver.kernel.org>; Mon, 23 Feb 2026 19:19:04 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2757.1771874338541330576
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Feb 2026 11:18:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HGvv+6Zi;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-436317c80f7so3834179f8f.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 23 Feb 2026 11:18:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771874337; x=1772479137; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l/6T5uniw3bI3X7Kj5v8aom9DZcSOlSPAxKdpB6lJko=;
        b=HGvv+6ZiG8hE24isbDSCDBG6BIShafFY2/9vuHygy8YTob8vCwZLC1UnZg7ZpbhhrH
         2LcvuVU8bQX4c+a9mUToG4jPCTfLpUxRAe+54ykNEs5RzIIzrr4CfNhShYcTPOLDW0Vq
         XaESZ7qUeDvn5LYOZLWmdKbv5OBukpFGJTWuAQN5jvSXico61te8fhkrlv8k8zVKZnt3
         9eAhY0bRCYceIOttnHqxmGgH5ICsHIHHq6T4+ZYw0T7PBVpgZrGjlpVPASNLfHGcdEbL
         fmXgFNn9W7jARJ/k27gXW5DCnJsgPOpHrAZiBxbVqVpnbgZe7ubzDCVk5acAFlWPvdDj
         pUoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771874337; x=1772479137;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=l/6T5uniw3bI3X7Kj5v8aom9DZcSOlSPAxKdpB6lJko=;
        b=lYJS/q9vLHb8l0M4f4KM1vItWKZRdcnnvZJ3ytFvHxjgnKZe7TmUkyHVQkoSC1HrJP
         5t1Pezbfnpzq4aXohSw9zdS2S769JUUEO+9NzAk8Dp0XoZqmSAuMcx98GB7JTyX3I4N0
         jZX0WC6nwcG0i874HZq+QEe/pb99kk+qzXdFhWMjm1pCK5SA8737m8UsdICk2+KGitQD
         rmam0D+4IUA1zIV7tulp9iXom1y63t04wIxI85SQnl96o3rZyDX1rEsZ2opyt8J4Y7Z7
         2F/ANcb0ZeqyrUjVxTswKcINgi5Q+4DqipQodBqG6tV0eKdjjTbGPD1X3FcxrQNHTQx4
         noeQ==
X-Gm-Message-State: AOJu0YzsvDtftc9PuBozDMXS4daj2rdI1/OmdifXF46f+qm2Kv5HIeD9
	s7XmwMND4OXNnkmAYtBNIJMdN4G9ibpG8d11PQDzk5Kbc5LLmFbQNBGd3kj7RA==
X-Gm-Gg: ATEYQzxMJxuzcow2wzbttdl4aYOHP/36lxfLqqB22o3Yr41hnp8gZlkeqOx393KLKYS
	ImmJTwwnnlgBNWPwTSv8bcAm5Lax9PiGgQY+XVc6HdhXWhaf193dQKb6W67Y13ufSGvBiGqHXpw
	ti2A+T/CF8urbhNbkbuac0NSAWZcb/fqtzKURLR2vamJxULSzBSlg0AegrPzBDX/2YqGDU3IBOh
	b4SGGsLue/URJaS4MH56OCjcj+4enNFyoN8C/+0MlTTG0PED+qJ4IsP7ZaUKUYgPxji6yZ5xKhv
	HI9b4hTi7g43OyEL5JrN1W0vTUG03XFAttTaZ3RfalrQdmsePxyOVyq7xj0W4DZYl4X9qhvcZ9f
	DxmCtUF+RW+en211bw4JD8/mBWeo4iXMPc06VINFRJdVE7A7WzJ14NqvVwzXCBOvLH5Q6ZLNxgX
	f5OPzsjbkI6qrsJqY18cm/
X-Received: by 2002:a05:6000:1a8a:b0:436:4ba:59a8 with SMTP id ffacd0b85a97d-439625c9b6fmr29282272f8f.3.1771874336743;
        Mon, 23 Feb 2026 11:18:56 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d54760sm21308781f8f.35.2026.02.23.11.18.56
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 11:18:56 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 08/13] polkit: add info about CVE-2016-2568
Date: Mon, 23 Feb 2026 20:18:45 +0100
Message-ID: <20260223191850.1049304-8-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260223191850.1049304-1-skandigraun@gmail.com>
References: <20260223191850.1049304-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Feb 2026 19:19:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124562

Details: https://nvd.nist.gov/vuln/detail/CVE-2016-2568

This commit mostly just tries to add some info to this issue, in the
hope that it will save some time for others who try to investigate it.

This CVE most probably will stay open in meta-oe in the foreseeable future,
although it can be mitigated reasonably easily by the users of the layer.

The description of the vulnerability is short enough that it can be
reproduced here: "pkexec, when used with --user nonpriv, allows local
users to escape to the parent session via a crafted TIOCSTI ioctl call,
which pushes characters to the terminal's input buffer."

The general consensus amongst developers/major distros[1][2][3] seems to be that
it should be mitigated on the kernel side, to not allow non-privileged
users to fake input.

To this end, the kernel has introduced a new config in v6.2, called
CONFIG_LEGACY_TIOCSTI - when it is enabled, non-privileged used can
also fake input. It is however by default enabled (and it is also enabled
in the kernels shipped in oe-core, at least at the time of writing this).

Disabling this kernel config is considered to be the mitigation, to allow
input-faking only by privileged users.

[1]: https://security-tracker.debian.org/tracker/CVE-2016-2568
[2]: https://bugzilla.suse.com/show_bug.cgi?id=968674
[3]: https://marc.info/?t=145694748900001&r=1&w=2 / https://marc.info/?l=util-linux-ng&m=145702209921574&w=2

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 meta-oe/recipes-extended/polkit/polkit_127.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-extended/polkit/polkit_127.bb b/meta-oe/recipes-extended/polkit/polkit_127.bb
index 40eca9f9ee..f97c6efbf7 100644
--- a/meta-oe/recipes-extended/polkit/polkit_127.bb
+++ b/meta-oe/recipes-extended/polkit/polkit_127.bb
@@ -65,3 +65,5 @@ FILES:${PN} += " \
 	${systemd_unitdir}/system/polkit-agent-helper.socket \
 	${systemd_unitdir}/system/polkit-agent-helper@.service \
 "
+
+CVE_STATUS[CVE-2016-2568] = "unpatched: the fix is a kernel compiled without CONFIG_LEGACY_TIOCSTI"

