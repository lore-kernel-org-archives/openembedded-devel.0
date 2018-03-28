Return-Path: <schnitzeltony@gmail.com>
Received: from mail-yb0-f193.google.com (mail-yb0-f193.google.com
	[209.85.213.193])
	by mail.openembedded.org (Postfix) with ESMTP id AC6487841B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Mar 2018 11:25:00 +0000 (UTC)
Received: by mail-yb0-f193.google.com with SMTP id x72-v6so650237ybe.8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Mar 2018 04:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=bwC73/KmJzQiN2f3x7B+LopzCAjcifjOH5Y57XYm9us=;
	b=I8nmENqPXi52zIjxlrXc9uFwZ24f/QjzJ2q6xtIIo41S6RZjpVTxzX4cJm8qaBz+iW
	kiJnLeCaTL0LsZ9Bb/5TMEzXwOSnTHwRahQj7eilLa9urd6RVvZaJKUG2XzFW9jFrAP7
	68O/BQ6ayfELesmdrRUODfNB7y+pUT+B4E8qpJm4XgNzoxoQ4v+ZJbkIh825298/y0ZY
	y549Y+GLwPpJKfospL0YksUFUsItUS/hsEjWzDLsvwSrDh3aQmVB3roJgQHcsJXqqP+J
	+tgBRpKuHeZMh0Uv7JPZnq8+8E81HcfaHA610Jyyy0BNMrolKmlXpct//QPBzQUX5zDJ
	JH8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=bwC73/KmJzQiN2f3x7B+LopzCAjcifjOH5Y57XYm9us=;
	b=J6pU716JpBbQFeVbjAQgNiK+etvdKHd0pzJCnUxZklgAjZ3Bc0fKLk2ZRFg0U99Xpa
	byquZEb1MfTxkV+/LMcavlkOOykXjT9lCOrvcQ2Jkrl6GOJ7ekuOuEch5A7/326rPlpl
	YvZGUrNIsJ/elr3Ah1eofbfUji70xnKDjRy/qR0fzplWVBGjDanprEF5wRgyeK1h9QOJ
	dGK5plWBAyim1mTY4e+VkMaN8sYsFmjzAIY15nQahgKbT5XCMmtl1GmLLHx3/G5bta9c
	DgX/Dn7EMTrj9FT81SqykMDhJO9LtEg2T3jR8o+Gf5ZVpTmNw5wF3jdqhNcelao0w+Rv
	h+OA==
X-Gm-Message-State: AElRT7FEIxwxXWA4o+Ss4/sk5rOdG6/CJDC5pfuWAJ+L9VGEyDYW6aBk
	wyRlggP78cfVjOZyaeoLzlt94B/86KbrTvK0wrc=
X-Google-Smtp-Source: AIpwx4+t1L8GBPi6ipQiyh5LD7E8Etywkrthg8JxC7aCvlc56hC3AgLJtsrK7UuVfUhpj2ToziEJCxUPStNPzt236cs=
X-Received: by 2002:a25:d0c6:: with SMTP id
	h189-v6mr1788408ybg.185.1522236301687; 
	Wed, 28 Mar 2018 04:25:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a25:d105:0:0:0:0:0 with HTTP; Wed, 28 Mar 2018 04:25:01
	-0700 (PDT)
In-Reply-To: <1522039298-25092-1-git-send-email-Qi.Chen@windriver.com>
References: <1522039298-25092-1-git-send-email-Qi.Chen@windriver.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Wed, 28 Mar 2018 13:25:01 +0200
Message-ID: <CALbNGRQFMg0B5MoE2_wezcdGUh3Z6e96UKnvO5+0f+QDMeHy9w@mail.gmail.com>
To: Chen Qi <Qi.Chen@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] cyrus-sasl: fix systemd related setting
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
X-List-Received-Date: Wed, 28 Mar 2018 11:25:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 26, 2018 at 6:41 AM,  <Qi.Chen@windriver.com> wrote:
> From: Chen Qi <Qi.Chen@windriver.com>
>
> The service file belongs to ${PN}-bin instead of ${PN}, fix things
> accordingly.
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26=
.bb b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb
> index 64d1a76d6..6dbff87dd 100644
> --- a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb
> +++ b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb
> @@ -75,8 +75,8 @@ do_install_append() {
>  USERADD_PACKAGES =3D "${PN}-bin"
>  USERADD_PARAM_${PN}-bin =3D "--system --home=3D/var/spool/mail -g mail c=
yrus"
>
> -SYSTEMD_PACKAGES =3D "${PN}"
> -SYSTEMD_SERVICE_${PN} =3D "saslauthd.service"
> +SYSTEMD_PACKAGES =3D "${PN}-bin"
> +SYSTEMD_SERVICE_${PN}-bin =3D "saslauthd.service"
>  SYSTEMD_AUTO_ENABLE =3D "disable"
>
>  SRC_URI[md5sum] =3D "a7f4e5e559a0e37b3ffc438c9456e425"
> --
> 2.11.0
>
Was about to send similar.

Acked-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>

