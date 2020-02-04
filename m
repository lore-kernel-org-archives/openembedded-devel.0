Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by mail.openembedded.org (Postfix) with ESMTP id 2F6276112C
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  4 Feb 2020 17:27:23 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id t13so14950383qto.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 04 Feb 2020 09:27:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=kOD6nitD6WDN1unGANPR3iTXoqIqnPb3jUKQEotIvZE=;
	b=ZbnDpKwXCy0pcmlYB1IyfSXxEAWzJFM7BKCXzMbRZQW43tGk0XeyMMCtBBp7imch8i
	VhXkjgRxjgDevDDY8LDH9V26BdB9Q2tjEAniP/dyJexWmA+mWnKtpA5eFPuOwhbkxXQx
	yU0YiNSSb4kK6GWJ0cK8+doyGBcOGLE/yOH6tndGoNJUvhUlO3BNEss7Q2z1X1WB//l1
	iRUrqm7yQoGRYG8GpUx1elOmbxyP/RwrBGoSdmRAp7/h0BHtVkstc50DT+tFAFt79q67
	iIG5UTTtOhfkucwMZNQo0mpUt/ke4PwkNb1cLqgd19wNWJEV5w/T4uQtAL48zVJMh4vX
	K2Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=kOD6nitD6WDN1unGANPR3iTXoqIqnPb3jUKQEotIvZE=;
	b=i80+j/86SKYqmfBHK5UyWsCsBo8oek2OaUmp6RBPCkHQJrDlXNbT/NLW1otyX0GVi9
	ll6iL99tZCiLKyP8fd9EQ6VPfVWgXZBC+lMC18RMjkyCBbWovsUzwaCJx6uGCA7nHCQG
	D+CkwbS8uxyzr8aTCj2e9pb1ZWpgoWIEDBiipJglbA/VNeRfde7MlH8ekkUzYZU89Aei
	ONN7xIqUMB8WjXAcp80lipUHv+csMhZzU0TVZ8ql+zMGPmqgRnJYJB+AWVTpa4xlmwWP
	ov1xdUTxpXYWAbQz2I12XPOSfAlBKMuHHXqlomGGfGDybET+xLdJgDi3WMW447BZOggu
	xSiA==
X-Gm-Message-State: APjAAAWA5sUtjZQQX5tAMr6YV5Zzl7IvzqA8SE2HglWSHB7Yv9YTzVZG
	FtiiEptWJf4YVabYfIiCslxQE1IpIW01/kDL8nfOZfJa0dU=
X-Google-Smtp-Source: APXvYqx3TV6jLJV15ICqZ8XQekSoNbFqEYxXw1nsZb1K2luGXk6qNYR6siitJC6mFyeslxAzgMpu5V7tHK1yertw8TI=
X-Received: by 2002:ac8:4419:: with SMTP id j25mr29852262qtn.378.1580837244518;
	Tue, 04 Feb 2020 09:27:24 -0800 (PST)
MIME-Version: 1.0
References: <20200204055320.107588-1-Qi.Chen@windriver.com>
In-Reply-To: <20200204055320.107588-1-Qi.Chen@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 4 Feb 2020 09:26:58 -0800
Message-ID: <CAMKF1sqO8TMBgSzgi34gb3mW=Z5JwkkxJKMc8_DiZCXxKjtacQ@mail.gmail.com>
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] rsyslog: disable ptest as it requires python2
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
X-List-Received-Date: Tue, 04 Feb 2020 17:27:24 -0000
Content-Type: text/plain; charset="UTF-8"

We need to disable reference to rsyslog-ptest in
./meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb as well.

On Mon, Feb 3, 2020 at 9:54 PM Chen Qi <Qi.Chen@windriver.com> wrote:
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  meta-oe/recipes-extended/rsyslog/rsyslog_8.1911.0.bb | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog_8.1911.0.bb b/meta-oe/recipes-extended/rsyslog/rsyslog_8.1911.0.bb
> index 29bba2d9a..b109e4dec 100644
> --- a/meta-oe/recipes-extended/rsyslog/rsyslog_8.1911.0.bb
> +++ b/meta-oe/recipes-extended/rsyslog/rsyslog_8.1911.0.bb
> @@ -35,7 +35,9 @@ SRC_URI[sha256sum] = "e1f4776b1c62ad7220f4d624a89a96b0c3d4738006899356eaaef0f1f9
>  UPSTREAM_CHECK_URI = "https://github.com/rsyslog/rsyslog/releases"
>  UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
>
> -inherit autotools pkgconfig systemd update-rc.d ptest
> +inherit autotools pkgconfig systemd update-rc.d
> +# ptest is disabled for now because it requires python2, after upstream solves  this problem, re-enable it
> +# inherit ptest
>
>  EXTRA_OECONF += "--disable-generate-man-pages ap_cv_atomic_builtins=yes"
>  EXTRA_OECONF += "--enable-imfile-tests"
> --
> 2.21.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

