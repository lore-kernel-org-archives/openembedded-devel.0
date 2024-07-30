Return-Path: <dev@g0hl1n.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20580C3DA49
	for <webhook@archiver.kernel.org>; Tue, 30 Jul 2024 14:31:51 +0000 (UTC)
Received: from out-170.mta1.migadu.com (out-170.mta1.migadu.com [95.215.58.170])
 by mx.groups.io with SMTP id smtpd.web10.18692.1722349901684244229
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Jul 2024 07:31:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@g0hl1n.net header.s=key1 header.b=NTWpOYps;
 spf=pass (domain: g0hl1n.net, ip: 95.215.58.170, mailfrom: dev@g0hl1n.net)
Date: Tue, 30 Jul 2024 16:31:36 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=g0hl1n.net; s=key1;
	t=1722349899;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=e1fB5bdLWroPPmGpx0IozDyXgJGBLspvhN5Vwc5mggs=;
	b=NTWpOYpsLowo0YlLYf6J4K5pBTCQnHvAXl0QMaHDNHPhOHPWu6IJzd0vQBwVOGkXUpk5d4
	+Fr11covIfBGGGei6XvH/tgMlSCsJiuTXGjkq6DqIk0SmfTq3no1Qad/Kp9jqONExTYPru
	u0F1JScWYSH+oK4Xg9abPxMMGzgVllI=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Richard Leitner <dev@g0hl1n.net>
To: openembedded-devel@lists.openembedded.org
Cc: akuster808@gmail.com, tim.orling@konsulko.com, debrabander@gmail.com
Subject: Re: [meta-python][scarthgap][PATCH] python3-pydantic-core: upgrade
 2.16.3 -> 2.18.1
Message-ID: <gf7b52p53drjd6yb3ldr7gmki7gzwc7mzkjque6qdp2wrswm7u@akaiwyp6pxqj>
References: <20240706180810.1707296-1-dev@g0hl1n.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240706180810.1707296-1-dev@g0hl1n.net>
X-Migadu-Flow: FLOW_OUT
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Jul 2024 14:31:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111481

Hi Armin, Tim, Frank,

On Sat, Jul 06, 2024 at 08:08:10PM GMT, Richard Leitner wrote:
> The currently available python-3-pydantic v2.7.0 requires
> python3-pydantic-core to be updated to v2.18.1.
> 
> Removed patch: 0001-Bumps-pyo3-https-github.com-pyo3-pyo3-from-0.20.2-to:
>  The pyo3 version bump patch is dropped as the pyo3 version in
>  python3-pydantic-core was updated to a newer one.
> 
> Added patch: 0001-Lower-MSRV-to-1.75-1316:
>  This patch for lowering the MSRV to 1.75 (from 1.76) is backported to
>  fix the build (as scarthgap provides rust 1.75).
> 
> Added patch: 0001-Fix-generate_self_schema-for-Python-3.12-1299:
>  This patch fixes following build error for python 3.12+ (which we have):
>  TypeError: ForwardRef._evaluate() missing 1 required keyword-only argument: 'recursive_guard'
> 
> Updated crate dependencies:
>  ahash: 0.8.7 -> 0.8.10
>  enum_dispatch: 0.3.12 -> 0.3.13
>  indexmap: 2.0.0 -> 2.2.2
>  jiter: 0.0.6 -> 0.2.1
>  pyo3: 0.20.3 -> 0.21.1
>  regex: 1.10.2 -> 1.10.3
>  regex-automata: 0.4.3 -> 0.4.5
>  serde: 1.0.195 -> 1.0.197
>  serde_derive: 1.0.195 -> 1.0.197
>  serde_json: 1.0.109 -> 1.0.114
>  smallvec: 1.11.2 -> 1.13.2
>  speedate: 0.13.0 -> 0.14.0
>  uuid: 1.6.1 -> 1.7.0
> 
> Added new crate dependencies:
>  strum_macros: 0.26.1
> 
> Removed crate dependencies:
>  allocator-api2
>  lexical-core
>  lexical-write-float
>  lexical-write-integer
> 
> Changelog:
>  https://github.com/pydantic/pydantic-core/releases
> 
> Signed-off-by: Richard Leitner <dev@g0hl1n.net>
> ---
>  .../python/python3-pydantic-core-crates.inc   |  78 +++++------
>  ...-github.com-pyo3-pyo3-from-0.20.2-to.patch | 126 ------------------
>  ...ate_self_schema-for-Python-3.12-1299.patch |  32 +++++
>  .../0001-Lower-MSRV-to-1.75-1316.patch        |  25 ++++
>  ...6.3.bb => python3-pydantic-core_2.18.1.bb} |   7 +-
>  5 files changed, 98 insertions(+), 170 deletions(-)
>  delete mode 100644 meta-python/recipes-devtools/python/python3-pydantic-core/0001-Bumps-pyo3-https-github.com-pyo3-pyo3-from-0.20.2-to.patch
>  create mode 100644 meta-python/recipes-devtools/python/python3-pydantic-core/0001-Fix-generate_self_schema-for-Python-3.12-1299.patch
>  create mode 100644 meta-python/recipes-devtools/python/python3-pydantic-core/0001-Lower-MSRV-to-1.75-1316.patch
>  rename meta-python/recipes-devtools/python/{python3-pydantic-core_2.16.3.bb => python3-pydantic-core_2.18.1.bb} (87%)

as bee8b9bbc (python3-pydantic-core: fix incompatible version,
2024-07-26), which updates pydantic-core to 2.18.4. got merged to master
here's a friendly Ping for this patch for scarthgap.

Backporting the commit from master seems not to work as pydantic 2.7.0
requires pydantic-core 2.18.1 [1].
Therefore I want to start the discussion again on how to fix this for
scarthgap:

 a) Revert the pydantic update to 2.7.0
 b) Update pydantic-core to 2.18.4 to match pydantic 2.7.0
 c) Update pydantic-core and pydantic to current master's state
 d) any other ideas?

Please see also the past discussion at [2] and the original patch at
[3].

Thanks and regards; rl

[1] https://github.com/pydantic/pydantic/blob/v2.7.0/pyproject.toml#L51
[2] https://lore.kernel.org/openembedded-devel/20240706180810.1707296-1-dev@g0hl1n.net/
[3] https://lore.kernel.org/openembedded-devel/20240726130135.1250-1-debrabander@gmail.com/

