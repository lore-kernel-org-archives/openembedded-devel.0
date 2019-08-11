Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	by mail.openembedded.org (Postfix) with ESMTP id E41557F285
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Aug 2019 07:40:58 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id r21so74913370qke.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Aug 2019 00:41:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=D72Nfe8YVHm9lPLFeXQPysSP5Weqkx76zfVq+BCLniA=;
	b=JdupfgHhLK0jZT+y9adpLFAKbAFexotdZlNJ9mGYTd+OSEyvTQKvSYU1aoNYMRUB2H
	THUXjzNIpx27Mke2hrNPUaAQZsCT8Nhv7U18++aQoWiIvxCdoos0yLKZEnp7akmjKS/n
	xmZrUEEKthF8UGLcrT056WYcNnVLERWxnKkJcdNdru/35fim5taixD5JpU8HszDlTg73
	6JoJnEWVz+qJxrCjjOibfZf9mK0xTSmnwHzVgC9qgN2dg+U5oDmkmZiUWtnWvwP1Xlha
	rU/6oaU6gv7sbBIUQsEs27FlNuIG1jzzd4SX/+QRGR/IQCzHwLdIUOhFWy6AB3n9tntz
	kGSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=D72Nfe8YVHm9lPLFeXQPysSP5Weqkx76zfVq+BCLniA=;
	b=ddpnyZd2RWyaGXk9bPliZ/tRt65SLJNa8ltC/hm4Q8gak2lkAeFf5A7Zodeh/Ttulv
	4qBOL2XDxMPk+fjUM1UohjSZiwV1lFL6vTgdHvJL0Gj2ZceBFeDhHunde4ossOxBnvRd
	ijrHPfaoKhYxt1s0yspt+tbJqpRHA7CmFLizE5wxtmLFITLvMTCoOXBnwKQGMUMDf5qp
	Jbn3qN1VNZ7pqXZXGHPE0ITp1pNTnI6Zb2+L65cGbAOh4FJSFI7jdigzVAu/XPuafM1E
	KlvrpVKAdweCtA2bAfAH75417AGixe76k++dMlx9VdbQWVnyr/UdMzMOryHaJQHtRc9a
	h87g==
X-Gm-Message-State: APjAAAXxIxOvMstaLh3WrY+gcjODI9ok/cTJS429yuU8Z1cBO1thiiuP
	sGf5qQ4MSp5OojRSxHl+X9bY148tI9IDiQTxJvgnmtiojRs=
X-Google-Smtp-Source: APXvYqwv8uNdbqJMjkf/0PmiLWBThOUKOMXwIh8MfD8DdVvMBSTBSwNW+4vK/qNIBL3QU+x9VKt4NHb7EYWR0r+tqoI=
X-Received: by 2002:a37:7083:: with SMTP id l125mr24799738qkc.71.1565509259461;
	Sun, 11 Aug 2019 00:40:59 -0700 (PDT)
MIME-Version: 1.0
References: <20190810212014.23197-1-maciej.pijanowski@3mdeb.com>
	<20190810212014.23197-4-maciej.pijanowski@3mdeb.com>
In-Reply-To: <20190810212014.23197-4-maciej.pijanowski@3mdeb.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 11 Aug 2019 00:40:44 -0700
Message-ID: <CAMKF1sprE4RX4gAcnQB3owwB9XXLQCgniH8JJCE-UTQOMEQKZw@mail.gmail.com>
To: Maciej Pijanowski <maciej.pijanowski@3mdeb.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	piotr.krol@3mdeb.com
Subject: Re: [meta-python][PATCH 4/7] python-socketio: upgrade to 4.3.1
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 11 Aug 2019 07:40:59 -0000
Content-Type: text/plain; charset="UTF-8"

fetch fails
https://errors.yoctoproject.org/Errors/Details/260613/

On Sat, Aug 10, 2019 at 3:00 PM Maciej Pijanowski
<maciej.pijanowski@3mdeb.com> wrote:
>
> Signed-off-by: Maciej Pijanowski <maciej.pijanowski@3mdeb.com>
> ---
>  .../python/{python-socketio_4.0.0.bb => python-socketio_4.3.1.bb} | 0
>  .../{python3-socketio_4.0.0.bb => python3-socketio_4.3.1.bb}      | 0
>  2 files changed, 0 insertions(+), 0 deletions(-)
>  rename meta-python/recipes-devtools/python/{python-socketio_4.0.0.bb => python-socketio_4.3.1.bb} (100%)
>  rename meta-python/recipes-devtools/python/{python3-socketio_4.0.0.bb => python3-socketio_4.3.1.bb} (100%)
>
> diff --git a/meta-python/recipes-devtools/python/python-socketio_4.0.0.bb b/meta-python/recipes-devtools/python/python-socketio_4.3.1.bb
> similarity index 100%
> rename from meta-python/recipes-devtools/python/python-socketio_4.0.0.bb
> rename to meta-python/recipes-devtools/python/python-socketio_4.3.1.bb
> diff --git a/meta-python/recipes-devtools/python/python3-socketio_4.0.0.bb b/meta-python/recipes-devtools/python/python3-socketio_4.3.1.bb
> similarity index 100%
> rename from meta-python/recipes-devtools/python/python3-socketio_4.0.0.bb
> rename to meta-python/recipes-devtools/python/python3-socketio_4.3.1.bb
> --
> 2.20.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

