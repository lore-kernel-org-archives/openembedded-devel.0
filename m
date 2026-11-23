Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.57682.1795451465177291333
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Nov 2026 08:31:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=k20260515 header.b=WFxHe30x;
 spf=pass (domain: kernel.org, ip: 172.234.252.31, mailfrom: devnull+patrick.vogelaar.belden.com@kernel.org)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id F3B0D44797;
	Mon, 23 Nov 2026 16:31:04 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795451464;
	b=fzZuIVykiqtySuPkQZ8TbVGfYkGcnv8E0anTYbHyYhKbvvAjHJ3DFBO1eKbqUJE9IMkr
	 1ckhxk0qH3zplx92pub29Asvle6pJZugzcUwUqXpdTgjZ5XQJE0XMssomuxhoGb/QNea8
	 xCcuxswKArso9f/8ClWencsX/l5ApaO93zEwxNcCJNV1d6pW1MhtbUcABt4VRUTu402wm
	 Zl6SYw47ugQbY8rN4R010iG2CREtO8M+a0nNxW6X0xZnGj2tT3aesPjiJlka9+oYVwjLw
	 1UCWszRFClGnqBgHWeCg+RjGoRMeMheV6lxNcbTM3Zye7NC692RmU16p+sYt5pTnNNA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795451464;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=RHQ8ogka/FI1UMEzHI2mNSONYPNt+lam+sTe3Eoo2mM=;
	b=mv0CbvEDYVas2N1r+VMNcx0UQdAwO+nPgRcOk39M2raHog6Jx5YRS9hNZNVumjF2vOJj
	 90ZjCKo1gYmBNZZTu2MhpITbOgj2rlRSkf7W2pPdSi3BCDpz55nsaIQp4ypBtrJGRlkzH
	 H7jTXB/FBEPR+2hEz61jAxe4om3oalELKJoywloO2UAwV19bX5E3U+z3CP9R6OORtI7tJ
	 aJM1KIshzR0pR6XJlWHmu20TBvlwRbZYiRxzgn3An5U98YBBa995COX7bpUjewC+jX+9z
	 4+UetxZ8kZ84+znAj1XNzmntJWN8KBeHm8oXHeMIE5MS2URa+Y2ASGNsmbS3Gj3bN0Q==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A17A31F000C4;
	Mon, 23 Nov 2026 16:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795451464;
	bh=RHQ8ogka/FI1UMEzHI2mNSONYPNt+lam+sTe3Eoo2mM=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=WFxHe30xCr0SLycjXIkspYCRA5hYiLASu1hDDiM6qIQwuoVu6HcGtrIaK1cEsQRte
	 oogGH6VSdlMScBOEk53KsDMc4DR+GuyDJgWz/9aKoWx+bqJWkJnsX9Fs7EcKmI/BHH
	 QbHYXt6ok8+o9/kQ8szYh8G9jDeUyzvfK0e+HXvHhPiljjvOhltEGZ9pAUZIeCiUZc
	 WpzHEhn9WKd1BGw5ZQoNb0p9/bLHRjPkEZMoJitXL+J+CQZErl58UgqBY4VxzN0L75
	 hHxFIhlFxX8BJKiW5XuLjjzZWYS52GWhIiRK83L6xYdU/qEwBkZxFPpvgJSduiD+yA
	 0wSiipfFxwzxQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 048014C55C;
	Mon, 23 Nov 2026 16:30:54 +0000 (UTC)
From: Patrick Vogelaar via B4 Relay <devnull+patrick.vogelaar.belden.com@kernel.org>
Subject: [meta-webserver][scarthgap][PATCH 0/5] nginx: fix nginx2root
 related CVEs
Date: Mon, 23 Nov 2026 17:30:39 +0100
Message-Id: <20261123-fix_nginx2root-v1-0-1b30332ed757@belden.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAC9qBGsC/yWNUQrCMBAFr1L224CJYK1XCUGSdZuuYFI2sRZK7
 27Uz4F58zYoJEwFrt0GQgsXzqmBPnSAk0+RFN8bgzmas9bmpEZebylyWo3kXJXBix4C9j0OI7T
 RLNSMX9C6P5dXeBDWb8U+qXr1ptBeFxJnC3qpU/Szg33/AD5kpNKNAAAA
X-Change-ID: 20261123-fix_nginx2root-2c819bc77c9f
To: openembedded-devel@lists.openembedded.org
Cc: Patrick Vogelaar <patrick.vogelaar@belden.com>, 
 patrick.vogelaar.dev@mailbox.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795451453; l=1510;
 i=patrick.vogelaar@belden.com; s=20240201; h=from:subject:message-id;
 bh=6C3ddo+b1bXvNkK7NeARuVeOMpj9+uTzLCz9sssX298=;
 b=3WTiZaRpfyDzudNhGxLb1fxysYaZcGIsA2fnCEuFixnrKuKIQxTjTj1w+C+HLe/KP8ZstSzTs
 T+/eSau+o1PBEzfhnI6WApA95sykbb/P+nwWw09TFbegv1GGXU0O53g
X-Developer-Key: i=patrick.vogelaar@belden.com; a=ed25519;
 pk=w0QU8RmOR3hQv1DxMcz6KmySeE8yqbvO0xC1ZSSUNqY=
X-Endpoint-Received: by B4 Relay for patrick.vogelaar@belden.com/20240201
 with auth_id=125
X-Original-From: Patrick Vogelaar <patrick.vogelaar@belden.com>
Reply-To: patrick.vogelaar@belden.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 23 Nov 2026 16:31:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132904

this patch set fixes the 5 CVEs listed in nginx2root [0] fox nginx 1.26:

* CVE-2026-123007
* CVE-2026-123634
* CVE-2026-123633
* CVE-2026-121810
* CVE-2026-113425

[0] https://nginx2root.com/

Signed-off-by: Patrick Vogelaar <patrick.vogelaar@belden.com>
---
Patrick Vogelaar (5):
      nginx: fix for CVE-2026-123007
      nginx: fix for CVE-2026-123634
      nginx: fix for CVE-2026-123633
      nginx: fix for CVE-2026-121810
      nginx: fix for CVE-2026-113425

 .../nginx/nginx-1.26.3/CVE-2026-113425-01.patch    |  94 ++++++++++++++
 .../nginx/nginx-1.26.3/CVE-2026-113425-02.patch    |  44 +++++++
 .../nginx/nginx-1.26.3/CVE-2026-113425-03.patch    |  87 +++++++++++++
 .../nginx/nginx-1.26.3/CVE-2026-113425-04.patch    |  72 +++++++++++
 .../nginx/nginx-1.26.3/CVE-2026-113425-05.patch    | 116 +++++++++++++++++
 .../nginx/nginx-1.26.3/CVE-2026-121810.patch       |  70 +++++++++++
 .../nginx/nginx-1.26.3/CVE-2026-123007.patch       |  95 ++++++++++++++
 .../nginx/nginx-1.26.3/CVE-2026-123633.patch       |  52 ++++++++
 .../nginx/nginx-1.26.3/CVE-2026-123634-01.patch    |  75 +++++++++++
 .../nginx/nginx-1.26.3/CVE-2026-123634-02.patch    | 139 +++++++++++++++++++++
 meta-webserver/recipes-httpd/nginx/nginx_1.26.3.bb |  14 ++-
 11 files changed, 857 insertions(+), 1 deletion(-)
---
base-commit: 2db6aece32c7f8ebf6015b468e1b4e21de072e3b
change-id: 20261123-fix_nginx2root-2c819bc77c9f

Best regards,
--  
Patrick Vogelaar <patrick.vogelaar@belden.com>


