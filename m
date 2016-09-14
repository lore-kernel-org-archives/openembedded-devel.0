Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vk0-f68.google.com (mail-vk0-f68.google.com
	[209.85.213.68])
	by mail.openembedded.org (Postfix) with ESMTP id 7EA17770CB
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Sep 2016 22:25:18 +0000 (UTC)
Received: by mail-vk0-f68.google.com with SMTP id m62so119525vkd.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Sep 2016 15:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=1plK79JR4OcCpCc3GStGEJEW5162mB6gYoBI0fJeUqU=;
	b=MbFJSVs9lXmpZ+Ts/PoCtruz/6pQq/bPRp+WZ4I5nYrh3OPNR1UuzZs58sYmEvmL26
	shXL2bSf/ZZRaPABHTr2h2mklKxv84sdG3GilJOoEKcusgk4IEC8QfwO2wUZDPhRWUFM
	omrTMw4jyQ89BXXeH0s+J8IdlYQdr2wHN1cIjOABpXCX3tntUlNiXcLlDxDyLYVi9JjW
	s8+8IIqQcygmUjBqaoSRgQv8xfS0AQtZf8FNKo353mwxCTT/QPWiV7EVQql6a3oBHjQN
	ZFugG283DTTVTG6u1PZwCDMTKhCXmBErH7YNceNSMugAokgZbL9z2t1zhQppYJ0zGQ7I
	yZhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=1plK79JR4OcCpCc3GStGEJEW5162mB6gYoBI0fJeUqU=;
	b=E+fdqitH5c0OUWpt53WdisPdyJv9l5QZHGCjp2858qN1yh0AjiIAh6r6JngeBYmM9t
	O9X0Ie+nrNPj4hWZHGXITS0Y7J/NNSqgnLtlvF681Hft+6fnmGhMZQD8ljg9w07EPyb/
	2KyWIv3F+OQHdZsBEWyTDLaxYyCxH/v9rbRvnRVMwNS5XcJkrfDbsfGSaQ8WdqUtQtS6
	jng8wtE6f8icjflj6QTgGbVQ7UAJIPyYBbvmrwM27iqnpsZ6wNoP4r8xnFJ9Gw8npUak
	1UoVzqFgG+MvBFgv6p+ccoPv7uRdTGel32JOe8bwhrOiH1LSb/wU28cPwUN/5J/rMMuW
	q5Xw==
X-Gm-Message-State: AE9vXwNhC6FqGK8rf507efkKHppsGXHqSgmfVf9f1iVY98m5mDS+u6YgBP84O+h/tDtZpSqiRDoOn+WBHwjXyw==
X-Received: by 10.31.205.132 with SMTP id d126mr114938vkg.30.1473891620026;
	Wed, 14 Sep 2016 15:20:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.65.130 with HTTP; Wed, 14 Sep 2016 15:20:19 -0700 (PDT)
In-Reply-To: <CA+chaQdQZLYvVssqqR0-0JPBPHzWSYPTZb1ROro+QKqx3vKMRg@mail.gmail.com>
References: <1473884049-27152-1-git-send-email-schnitzeltony@googlemail.com>
	<1473884049-27152-2-git-send-email-schnitzeltony@googlemail.com>
	<CA+chaQdQZLYvVssqqR0-0JPBPHzWSYPTZb1ROro+QKqx3vKMRg@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Thu, 15 Sep 2016 00:20:19 +0200
Message-ID: <CALbNGRTg=j3JGSN4CZm9uSEGXy1-1OWX9i3sP9UHefdiiZQOwA@mail.gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] samba: unblacklist and link with bfd on arm only
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
X-List-Received-Date: Wed, 14 Sep 2016 22:25:19 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Sep 14, 2016 at 11:21 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> What about the other 2 issues mentioned in the comment?
>
I am sure I am missing something. I did

* pull meta-oe
* built samba with this patch attached in a 'crowded' sysroot (good
for floating dependencies) for arm (raspi2)

-> No warnings/errors

Andreas

