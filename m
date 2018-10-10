Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id 801E0600E3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Oct 2018 02:11:50 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id e22-v6so4043090qto.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Oct 2018 19:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=OBReSuB+avZT9Lc832v9c9dw++rnaTldwLbc00B/FyQ=;
	b=UZDg6EQed6vKk+le9XOdLRUIwjHh4nS0VTxbmib1INNkVnt0pR0W7i1FYkbYM5xiIy
	luCQm8ZcWLbTJOEf8Hl2CXQGWB9hKZ51WC5bbt2486DdsP4Rn6WO8DloMIIJ+sLNwdZq
	71gbYa2e1fZnYfp1jqxzG/TlV4bmI3Drq9KTjoK/O8U9LsGePEtMzRkoZhPrlwJq1ivJ
	wgtYhkP9lCasCdTduxVTFN2kBmu4JOA5FfmMEKYIY71mf7rDEHzFoJD8meKIUutJhQkd
	sgG8wfKLyPJdij6uDqnuVEhdk24CZ5vmgoenQE0mL42uKnowTklBvWWs6DdIxsZzczkO
	yuyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=OBReSuB+avZT9Lc832v9c9dw++rnaTldwLbc00B/FyQ=;
	b=VNuqSKYbfs7TRKPLGshmF+m8cbGt1Yp6tb7jPxfhgwArFSsKqWmXDaBwJa7k/SC7Pd
	PADAjy6Cmy2DAYEAqjqoN1V2q7/cZmTB6MVPrnUiKVPpkIc09GoahedEJxjAHzat9w54
	aaSGPDdvbeoGxTSa+GNr6diVPcZ+tXqkizvsHwlP5yXgpyzY9oMYkN6tUip+SkyIKO6p
	+NivduMDFs6CAPa3ns7pAQLWEauUhz1+F4CPdc1hpTThEPbBKLpuJWQrI2oy8wlbDJnm
	rVgntOQ5PkQYRUflS3KX0PdqIhsClytk/E+AYFZVbid8YmJxVS3dbcGHbkOJVFPhV/ND
	gCSQ==
X-Gm-Message-State: ABuFfog6T/BBmR1V6X+gLQb2blSw8eAw0jp3272ETm9YH3+NpMDs8/h4
	ig40RBWVUzEq1cJ1QkM+L5LPgKaopCGAxGgPDdY=
X-Google-Smtp-Source: ACcGV63bONI9yyMk5+2nxtrswP9iZXJJSQbkFdjq5rnApQZqLCy4QT2TTHFPMj8HuBgPlIa0rEAtDB3gquwouRJUEQo=
X-Received: by 2002:aed:3031:: with SMTP id
	46-v6mr25285679qte.29.1539137511210; 
	Tue, 09 Oct 2018 19:11:51 -0700 (PDT)
MIME-Version: 1.0
References: <20181010015517.16921-1-Randy.MacLeod@windriver.com>
In-Reply-To: <20181010015517.16921-1-Randy.MacLeod@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 9 Oct 2018 19:11:25 -0700
Message-ID: <CAMKF1spbqwKwtg-XkbxBwfTHOFCa1JkdPNObpK+2CX4KZq15wg@mail.gmail.com>
To: Randy MacLeod <Randy.MacLeod@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] postfix: update the upstream regex too
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
X-List-Received-Date: Wed, 10 Oct 2018 02:11:50 -0000
Content-Type: text/plain; charset="UTF-8"

i have squashed it into earlier version in master-next
On Tue, Oct 9, 2018 at 6:56 PM Randy MacLeod
<Randy.MacLeod@windriver.com> wrote:
>
> Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
> ---
>  meta-networking/recipes-daemons/postfix/postfix_3.3.1.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-networking/recipes-daemons/postfix/postfix_3.3.1.bb b/meta-networking/recipes-daemons/postfix/postfix_3.3.1.bb
> index 7f00c3c19..960356999 100644
> --- a/meta-networking/recipes-daemons/postfix/postfix_3.3.1.bb
> +++ b/meta-networking/recipes-daemons/postfix/postfix_3.3.1.bb
> @@ -8,4 +8,4 @@ SRC_URI += "file://0001-makedefs-Use-native-compiler-to-build-makedefs.test.patc
>  SRC_URI[md5sum] = "4381c6492f415e4a69cf5099d4acea76"
>  SRC_URI[sha256sum] = "54f514dae42b5275cb4bc9c69283f16c06200b71813d0bb696568c4ba7ae7e3b"
>
> -UPSTREAM_CHECK_REGEX = "postfix\-(?P<pver>3\.2(\.\d+)+).tar.gz"
> +UPSTREAM_CHECK_REGEX = "postfix\-(?P<pver>3\.3(\.\d+)+).tar.gz"
> --
> 2.17.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

