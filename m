Return-Path: <raj.khem@gmail.com>
Received: from mail-vk0-f68.google.com (mail-vk0-f68.google.com
	[209.85.213.68])
	by mail.openembedded.org (Postfix) with ESMTP id E745A60119
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Nov 2016 10:42:20 +0000 (UTC)
Received: by mail-vk0-f68.google.com with SMTP id p9so1724486vkd.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Nov 2016 02:42:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=8W9+CsHwl2SibVXfEpcYmjR+S3BG4+e3V8eCuBfviQ4=;
	b=GZIeu8d8taGeg9Q/RLLa7NTaLIMVzlqG3za8KPa6UMcU8EsT4O01pb17vQQmTqjYEj
	0nrLlFRxwr75MAqtGq9rRQiNdWSTmAkkJzBO2UHWk+NPKe4eFT6YluZglgluuXkjDXQm
	rGViRR3U/abwaKk4Lx+DGO6ydAOUu+oVp0rvNn0O6lK2rClfgEvrp2TRXPV7LyC9YqMt
	ur22slZtVmbI8mdCUUQWkTjoQVFQqiJyb9Xp9ygqEHqSPvmI/CH1rASK8pPVLbfykWGm
	XqSre0k/nrYWd+Qcpdz/LpBSkqvAc7ZeRv4wAwOBY+TnZjPKC5nC1xcJ7cxfPyGnIe40
	6iYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=8W9+CsHwl2SibVXfEpcYmjR+S3BG4+e3V8eCuBfviQ4=;
	b=haXCOg9nkH3cZm2piRk1aPqPcy4oba0hnJ9WR9nfw3SBdPKXb9/TNTeVPAETtw6cbc
	plk32Lj+D07E3YcofO6svnnn1bk3XwaJqna+lWpTBxDm5ZruTMFRllGqRJ8ph8MYwpsJ
	BUsRCuJHFeJ7mIiP0dSUw3BRBHIK+mnmOjgaS51f7A5XxzAc4GIBF0Zvd6Xs7kTeEYR7
	YQlALlNYZg7e766MQgKW6TuvMdJbPYtCqPvJgn2bKdKqzS6XlH7ACCeSDsTHof0mLst7
	xAOu/PgnnACdReciu0MG0rEWo8GJDIZLuWe6xNE1/ly+Sg6Y1MMthdMV68VdRiM82SlB
	+xmg==
X-Gm-Message-State: AKaTC0299+GeEOCg2ShqurozzSFMTC+2JpIU6YliMMzFjdYAmO7IwvysqzLKXUUKT4/7Z7SBtoZWlcNTHKrllg==
X-Received: by 10.31.197.195 with SMTP id v186mr2571284vkf.84.1480070541656;
	Fri, 25 Nov 2016 02:42:21 -0800 (PST)
MIME-Version: 1.0
Received: by 10.176.5.136 with HTTP; Fri, 25 Nov 2016 02:41:51 -0800 (PST)
In-Reply-To: <CA+chaQc5s+S10LOwREDv45PcTZthZp0DfjQjfCbUF9ORN+OGug@mail.gmail.com>
References: <20161123092209.23699-1-raj.khem@gmail.com>
	<20161123092209.23699-19-raj.khem@gmail.com>
	<CA+chaQc5s+S10LOwREDv45PcTZthZp0DfjQjfCbUF9ORN+OGug@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 25 Nov 2016 02:41:51 -0800
Message-ID: <CAMKF1srELpN5ePbj_YyKztXUP4mJG4ku4W4CSZ7hZwS9JfPZcw@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-filesystems][PATCH 19/49] xfsprogs: Upgrade 3.2.3 -> 4.8.0
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
X-List-Received-Date: Fri, 25 Nov 2016 10:42:21 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Nov 24, 2016 at 4:31 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> Failed to build in bitbake world:
>
> | ../include/xfs/linux.h:20:23: fatal error: uuid/uuid.h: No such file
> or directory
> |  #include <uuid/uuid.h>
> |                        ^
> | compilation terminated.
> | make[2]: *** [crc32selftest] Error 1
>

There were more problems following this one. Fixed them too and sent a V2

