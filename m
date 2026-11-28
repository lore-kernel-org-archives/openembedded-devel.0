Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.920.1795831323018429524
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Nov 2026 18:02:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=k20260515 header.b=baoL47pX;
 spf=pass (domain: kernel.org, ip: 172.105.4.254, mailfrom: devnull+dickson.wu.certik.com@kernel.org)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1D1E560D17;
	Sat, 28 Nov 2026 01:52:24 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795830743;
	b=bUlFXv5FxUUCueIObUxjjQJXrxSKaVPVMKof3uSLpIOI83BsmZSwmqqcnote82CHLRQu
	 IwNL/Q52St1kcwHYImhFfJ99KpSI6xp7rjr71KOKiehDz/BzBTfqyhqeZo9jNn/b5Ajpp
	 Qfk4L7/INxsOjeYcZfdhiH6do3wUlaEjh6ZdLL7jIqFu9se8NZMqQ0s2YT6kSyfVdPCEY
	 w5Xw4yITQxkpouwGuWNjuK7AKiBrXiHBXiqm9QdDJmKcu8BgKZq7cKWPQei59uEmKoXj1
	 s1c3qByT5F9f0ZNvSxDjtRgkJEi8pP9upV21wDGFT1kdrHqhr0MBENEdLPmBUNhdhkA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795830743;
	h=DKIM-Signature:Received:From:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:
	 Subject:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=4IUcLkbZqXKbC9Bk+BopzMO5erOC+c0OtT4K8OH1TFM=;
	b=NI3SW633jOJUxtA5VL6yKgyL6FDfTqwgR2aMYmNjrQ1ZcS0FHpenoLGG53kCJ6B4TN3X
	 O7OZU8MKwKN3RnRfdvrIHn0gl07hcRpuMsHG/8uGWU/TRmDCvFMQWNg67X2YAZ8lmfRQ5
	 k0z5z7w0e5hHKCbttaMT4Q3Qs9JrF8ok1I2FbT7/ymtSPlsQiet+3MZ2PG5ra7YmtolOa
	 C+3PyKtGGV8OOI9a5azZXCE5J3FlHowjH0/PrdeTQ7G4Uu0aENoldQn8vFVwTCoa5DmWk
	 E5ccQs+SH+I+I/W92rci0BwkK2sWaIP+YjTspFu6kT0Xt/sEJcXq2f0Sfsait8NmPJQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 58E1F1F00893;
	Sat, 28 Nov 2026 01:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795830743;
	bh=4IUcLkbZqXKbC9Bk+BopzMO5erOC+c0OtT4K8OH1TFM=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=baoL47pXqHg1VZvLl7cHCV+7zxTzyjBInz5GkBB87NsCDKiP4Ld9jd6EUvwZhnGZZ
	 IZYvkH1EJnyyauSp9LcOo7sDJhbFfJsyWDMWkF0MHt5WL6J4Vgj+BS/O4xS1WUrEAr
	 xH4RoJEccPhIj3jAd1OW/5pxLOwLz9WIBjEdsZwmqWRBMMb+sYDD5UkeP6wzJMq1qt
	 AE/TIvCf2qLX/yuAt5CzygWU4qxeoSFnwaX7rfzX1h4/K793O9AoC+JwsjQZFLDGzr
	 KB9YuNYgtWJqwX5md0xsrMVmG3PNlPA/in8t36bLoeKvaDQtL3LEmKq7UfGGn8trrr
	 FGZpB/NYgp4gQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id DD9CA4DF0A;
	Sat, 28 Nov 2026 01:52:22 +0000 (UTC)
From: Dickson Wu via B4 Relay <devnull+dickson.wu.certik.com@kernel.org>
Date: Sat, 28 Nov 2026 01:50:19 +0000
Message-Id: <20261128-pillow-sg-v1-0-cbcff72e5e81@certik.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAFszCmsC/yWMywrCMBAAf6Xs2YUklSr+injIpmu7EpKSrQ8o/
 XcTPc4wzAbKRVjh0m1Q+CUqOVWwhw7C7NPEKGNlcMYN1rozLhJjfqNO2Dt/NGSG/uQIar8Uvsv
 n97re/qxPenBY26AV5JWRik9hbko5jWvOEZuHff8CUbkWNI0AAAA=
X-Change-ID: 20261128-pillow-sg-32a40b06372b
Subject: [meta-python][scarthgap][PATCH 0/4] python3-pillow: fix five CVEs
To: openembedded-devel@lists.openembedded.org
Cc: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795830619; l=1817;
 i=dickson.wu@certik.com; s=dickson-b4; h=from:subject:message-id;
 bh=DNL803HfhAIVmjheMtdPPsWZpyHFC7PpR1ece7HiYdU=;
 b=hDNVhuGqJEkSlQ29Uhr04PZdcBuUKvcUvik8fJqIkQ6Bdi1qAADP5uTqXcz0/rYYfFS81Bu5/
 WVW899agn/QB7yP/SdTgjyiJIbSii441iz7CUaut1Uy+yuDDC1+qzil
X-Developer-Key: i=dickson.wu@certik.com; a=ed25519;
 pk=fxH7FS4FdojeJSGLJzgKdfO51Rvr4EW30yinj2mc1vg=
X-Endpoint-Received: by B4 Relay for dickson.wu@certik.com/dickson-b4 with
 auth_id=1647
X-Original-From: Dickson Wu <dickson.wu@certik.com>
Reply-To: dickson.wu@certik.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sat, 28 Nov 2026 03:31:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133393

CVE-2026-112398: Reject oversized JPEG scanlines. Upstream commit 242a059aedc1935097d9aa1dc3f099750467ba75.
CVE-2026-112403: Reject JPEG scanlines with too many components. Upstream commit 242a059aedc1935097d9aa1dc3f099750467ba75.
CVE-2026-112900: Pass an absolute EPS path to Ghostscript. Upstream commit a2c363141da31a265dd536c945677db4b64f3ec9.
CVE-2026-112400: Discard GIF dimensions when the decompression bomb check fails. Upstream commit 6faed707cfb760a4cbd726ddc8406f576cf35bf7.
CVE-2026-112406: Prevent an infinite loop when rewriting PDF pages. Upstream commit b3ebf20c694f2f12537a629c30229a1d5a53f777.

Tested with git am on current scarthgap and zero-fuzz do_patch.
The baseline and patched native builds passed the same Pillow tests (290 passed with 5 skipped).

Hitendra Prajapati's pending scarthgap Pillow series (CVE-2026-54059/54060/55379/55380, Patchwork 2026-11-26) touches the same SRC_URI lines, and I'll rebase on top if it lands first.

The backports and test runs were prepared with AI coding tools (OpenAI Codex agents, with review by Claude). I went over the result before signing off.

---
Dickson Wu (4):
      python3-pillow: patch CVE-2026-112398 and CVE-2026-112403
      python3-pillow: patch CVE-2026-112900
      python3-pillow: patch CVE-2026-112400
      python3-pillow: patch CVE-2026-112406

 .../CVE-2026-112398_CVE-2026-112403.patch          | 37 ++++++++++++++++++++++
 .../python/python3-pillow/CVE-2026-112400.patch    | 30 ++++++++++++++++++
 .../python/python3-pillow/CVE-2026-112406.patch    | 26 +++++++++++++++
 .../python/python3-pillow/CVE-2026-112900.patch    | 28 ++++++++++++++++
 .../python/python3-pillow_10.3.0.bb                |  4 +++
 5 files changed, 125 insertions(+)
---
base-commit: 96c2c78e13ff1b954715ff3c6d26bddd50a02509

