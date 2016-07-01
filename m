Return-Path: <kergoth@gmail.com>
Received: from mail-io0-f178.google.com (mail-io0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id 988FA60111
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Jul 2016 05:13:46 +0000 (UTC)
Received: by mail-io0-f178.google.com with SMTP id t74so91588972ioi.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Jun 2016 22:13:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=yQUcHlD8UeeeW4F/t1nrbCVVsT+h5DWuLZSvwuM8POc=;
	b=tqEz9ZwM8+BElVVg81Zduv0ypVQg+TwAmQX6CF8mSMDzFNh4VfwA2GSNQ5HXtnROK7
	KFNvlv4kx77CUMqqQ7aFLL8kk44eyjz8OWqbjhqivvOb4n3ii1CWsvF6cAsNaz2MudYm
	JaoeJw1lMU5G1P5e21ZDhwjlgwnRH0cMchWWgo4pw5+y+VmBTK4Iix+T9jDqIhPU3AxP
	4B95LBK1ibI1n/Za+MUtV9XKAecf4w0TaJU7byhu5fCwsV/qiBkJn+nb4ECuCq8g9cK/
	AWlYvMlUG+mbc92PaN8Vw/ZDQ4RgtW0lWtAOPYFpXnEgiXmAPynoah1NuIPmytiX0uNZ
	D92Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=yQUcHlD8UeeeW4F/t1nrbCVVsT+h5DWuLZSvwuM8POc=;
	b=BEFx4xW8zN6uBZVS8AIhPUcOZstAKVDnssFlcYFvMdw+Kd2y+C3+D9jpKMM36FbKav
	bwc/OU6c5u22gIsCqppY0/qdoIkNURfPZ68N0WoKtS3+CR5y4/4dtk44VmZvdJi5UZ4X
	nziuFhmwBre2vtB2jAXnD5Q4zuA3vvIj6tzmT137yKumCsgojbIXZHZFBtH78jfBxhvw
	22zs/qkC5p1L732uOLL2rdMih0NuxE94UMb+DMpKIkpDMkFhp/mJdDG3TH+o39WJGnme
	q5T2KD7T2qRvNWhHvkqiDuOoNFmMXY/CPedEEvqri7NwVNTNyra4RayLme/5qxqoDZ4B
	6IEw==
X-Gm-Message-State: ALyK8tI4LqqUgngi65oqxzYP/gOi1XQtuOlXal7pN3xPQDxzyXAO8MgAyg+3HhBxabbh6OeKYeYWo4ktw0MxHw==
X-Received: by 10.107.175.83 with SMTP id y80mr18652066ioe.70.1467350026757;
	Thu, 30 Jun 2016 22:13:46 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.79.19.70 with HTTP; Thu, 30 Jun 2016 22:13:27 -0700 (PDT)
In-Reply-To: <1467316002-12489-1-git-send-email-jslater@windriver.com>
References: <1467316002-12489-1-git-send-email-jslater@windriver.com>
From: Christopher Larson <clarson@kergoth.com>
Date: Thu, 30 Jun 2016 22:13:27 -0700
X-Google-Sender-Auth: eQFPUUL_zHKq7v7QqbiQScESe98
Message-ID: <CABcZANnH_85yL9=_VBfwsuFTivqK+VbW5zyz=aoXvTA5a3k1Lw@mail.gmail.com>
To: Openembedded Discussion <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-networking][PATCH 1/1] openconnect: PACKAGECONFIG certain dependencies
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
X-List-Received-Date: Fri, 01 Jul 2016 05:13:46 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Jun 30, 2016 at 12:46 PM, Joe Slater <jslater@windriver.com> wrote:

> +PACKAGECONFIG ??= "gnutls lz4 libproxy"
> +
> +# config defaults
> +PACKAGECONFIG[gnutls] = ",--without-gnutls,gnutls,"
> +PACKAGECONFIG[lz4] = ",--without-lz4,lz4,"
> +PACKAGECONFIG[libproxy] = ",--without-libproxy,libproxy,"
> +
> +# not config defaults
> +PACKAGECONFIG[pcsc-lite] = ",--without-libpcsclite,pcsc-lite,"
>

Why are the options not being passed for the enabled case, here? We prefer
to be explicit, rather than relying on defaults.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

