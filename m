Return-Path: <chgans@gmail.com>
Received: from mail-qt0-f176.google.com (mail-qt0-f176.google.com
	[209.85.216.176])
	by mail.openembedded.org (Postfix) with ESMTP id 63E4E78207
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Sep 2017 10:00:18 +0000 (UTC)
Received: by mail-qt0-f176.google.com with SMTP id f15so5361275qtf.7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Sep 2017 03:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=iOTsMb0V2jiMZ4lBoywk0b6RbLPEd4/odqoQNh1NLc4=;
	b=ItGA8B9bZbmfnp9fBd5I5etgfXPsutcqA4588uwc82dA6inI/aqZg5WqI76rjVDx+x
	QtSfkxaaKEBP6707317d8cqSXMBssdwhpl3YnuKyw/lxYyBNdLC2s8HNxFAfJpYZB9h3
	hmXwqQJv4xPYHlTwMLmktdjL4hFu39SWWGKUZQDQcY3AEXRUuieA5x7PQdGFFKoleYLm
	vG3hVa7E/KGsu2s3ouPKej0x5KR1VHpil5SJbYuM2Hh8e37geE0og5hyFbtB5+sU8N+q
	Ix9dqoiJKcSbkEMSSqyVG68LCzwkAtyVY7G4zxGb8/SsvAcH4JOWvqLDA3UEbzxl3IpW
	3PnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=iOTsMb0V2jiMZ4lBoywk0b6RbLPEd4/odqoQNh1NLc4=;
	b=cwTLjoGc9x68mpXOXgR98nu0NWEttTQugP7NMQCV7c6LEZzyaXpmzIS3mbjPEVb147
	BphqrLIAb+UvauHg5cARFHJH9rbhq8Hnbqw70yyzSp9T7IB6gw1dqRB3h+1M3qckGje4
	vSO1Ir6/JURVORvZjh0nASO7BAXtyQnEienu7eGRJKfz8UsJkZ9LsbL5XeQayaJOE3Si
	Mm3QkzrF+CxVbeS5x5y2u/6AnE+5p9p3kiCqSekHnJwuxWF2iK21oXyGMEod/E0gt56/
	GEyStrutCcIoH8mKvMWGK6nHKIOey31heJHIj8G/g7wExEUd3TouOYy3ZBFZ9YPuUQUW
	r5Eg==
X-Gm-Message-State: AHPjjUgeoPIbNvmCZiXRHBqMTuMQ/ru0OcDBydEEAsoLjE1/Pwd6zRyg
	TBGc7vuzPnXKSg10T7nJ0XqoQeSWzuZruwf8JcM=
X-Google-Smtp-Source: AOwi7QCVw+sjy8lW9pOaEwQO07AO85fflXD/WZGsbTfPGJzQpRqRR2JhsekPnz9j61L91c6t0N0AaWLjS299LiPgqEA=
X-Received: by 10.200.41.148 with SMTP id 20mr2221914qts.69.1505988019484;
	Thu, 21 Sep 2017 03:00:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.89.169 with HTTP; Thu, 21 Sep 2017 03:00:19 -0700 (PDT)
In-Reply-To: <1505961647-21967-1-git-send-email-kwangsub.kim@qt.io>
References: <1505961647-21967-1-git-send-email-kwangsub.kim@qt.io>
From: Christian Gagneraud <chgans@gmail.com>
Date: Thu, 21 Sep 2017 22:00:19 +1200
Message-ID: <CABxGUTixb-TtB0ZQh4k4oi1SCPzXsse9fhwroMh+3MujCqurmA@mail.gmail.com>
To: Kwangsub Kim <kwangsub.kim@qt.io>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-qt5][PATCH] qt5: add missing commercial license
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
X-List-Received-Date: Thu, 21 Sep 2017 10:00:18 -0000
Content-Type: text/plain; charset="UTF-8"

On 21 September 2017 at 14:40, Kwangsub Kim <kwangsub.kim@qt.io> wrote:
[...]
> diff --git a/recipes-qt/qt5/qtserialport_git.bb b/recipes-qt/qt5/qtserialport_git.bb
> index 056e237..23f03ce 100644
> --- a/recipes-qt/qt5/qtserialport_git.bb
> +++ b/recipes-qt/qt5/qtserialport_git.bb
> @@ -3,7 +3,7 @@ require qt5-git.inc
>
>  # text of LGPL_EXCEPTION.txt and LICENSE.FDL is slightly different than what
>  # other qt* components use :/
> -LICENSE = "GFDL-1.3 & BSD & (LGPL-2.1 & The-Qt-Company-Qt-LGPL-Exception-1.1 | LGPL-3.0)"
> +LICENSE = "GFDL-1.3 & BSD & (LGPL-2.1 & The-Qt-Company-Qt-LGPL-Exception-1.1 | LGPL-3.0) | The-Qt-Company-Commercial"

Explicit brackets would be nice to disambiguate & and | precedence.

are we talking, eg:

(LGPL-2.1 & The-Qt-Company-Qt-LGPL-Exception-1.1) | LGPL-3.0

or

GFDL-1.3 & (BSD & (LGPL-2.1 & (The-Qt-Company-Qt-LGPL-Exception-1.1 |
LGPL-3.0)) | The-Qt-Company-Commercial)

whatever the answer is, more explicit bracketing would make it more
obvious to tedious readers, but maybe at the expense of readability
(if that makes sense).

I don't know which part of the code is in charge of evaluating these
expressions, is it eg.:
http://en.cppreference.com/w/cpp/language/operator_precedence,
https://docs.python.org/3/reference/expressions.html#operator-precedence,
or bitbake own sauce....

I think licensing is important to get right, clear and reliable.

Chris

