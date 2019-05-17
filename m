Return-Path: <martin.jansa@gmail.com>
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
	[209.85.208.65])
	by mail.openembedded.org (Postfix) with ESMTP id B61717DD9F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 May 2019 13:24:14 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id p27so10637573eda.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 May 2019 06:24:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=j4+OZt2aUQSvsXmdK7aeI3c22xeVeFd2gPWTgaRhDA4=;
	b=YPakEjYVUU1hqMdqgf4ySKyaOTQO/3kES+tuhlyj+IDu3SCeSnzANocvZlRngOp4Jk
	1iXaMfT+s8RV93d4qum9yr80V+39qxuNc7+DXwpIPwq9qga5bzJfHGIs+OJLajbBAESv
	QqVagMrPWCAE0AJGuOTJXV9hmbPGQIPs/+upK418EJhaDz6CAW46FbKF5TT2VgnKWcwT
	7f+ziAU5yTtNI3twFrNnQWR7vS6/goE7w4lsSMsEKmiytwTuum9WlXYVqMl9fe111pcy
	f0nKQfeCfjzzW/elarbJ1KCp6TnYhQXrgDM1rJTCV7hPch2bD6m2sSXVinlkTdjmVIZO
	3rjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=j4+OZt2aUQSvsXmdK7aeI3c22xeVeFd2gPWTgaRhDA4=;
	b=fUCjDOUn7FHymIb9DyuhQqpJ0Jl9/E7zCfOK/4Y0JY6raknMBEQBxgZGbl0v9pQL55
	sRxdMZOEqw9XgCp+5PCqhN8SOw2HRat0SP9dERhV7zQQGr8fxorLiJjeZfEUSMF7R9ke
	zDQTmMgJHwInMdm04T1X2p8x3QTJToFkErSSHTwlafe/aKM7DzuRleq4cNtDDVlF3iyu
	qzrelBbGke3NZeHTO40+3OK+BcP8ujYmFH96dJ4BbEjA12NNYiW+XZP7tBmBqhZjmkBH
	8DxpUp9N/VeN/uzM7jr6FZpwCwXuJ1DivT0qHcK/veYTxkDlYKKA0blNgM2L2NC7ZJ1X
	6Bsg==
X-Gm-Message-State: APjAAAX5UZAuHsygxUQWRsf2WAudMPUY+gG8gTQ2/KfqmhuNF78Eu3Ah
	06c3qv0B08urVE2yrN9SwZJ78SCSknOfYlIFISHqNQl/
X-Google-Smtp-Source: APXvYqzIBqfgZxZowkNYrofuywHQmnUJURtdArx4NSbRvYKpeqY9aagEC3oi60tr/VWof5q+uPfVt2JuszTkfQEuN8o=
X-Received: by 2002:a17:906:41c8:: with SMTP id
	g8mr29824494ejl.131.1558099455004; 
	Fri, 17 May 2019 06:24:15 -0700 (PDT)
MIME-Version: 1.0
References: <20190517113223.1072-1-Martin.Jansa@gmail.com>
In-Reply-To: <20190517113223.1072-1-Martin.Jansa@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 17 May 2019 15:24:04 +0200
Message-ID: <CA+chaQf4341yaUYC+t37ZtXt7KbcH1ZDjmatd2AYYeaTw_YPqw@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-python][PATCH] python-cassandra-driver.inc: fix DEPENDS
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
X-List-Received-Date: Fri, 17 May 2019 13:24:15 -0000
Content-Type: text/plain; charset="UTF-8"

It should also be ${PYTHON_PN}-cython-native if it really needs cython, but
somehow it built without that until now (as DEPENDS_${PN} doesn't do
anything useful).

On Fri, May 17, 2019 at 1:32 PM Martin Jansa <martin.jansa@gmail.com> wrote:

> * there is no such thing as DEPENDS_${PN}
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta-python/recipes-devtools/python/python-cassandra-driver.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git
> a/meta-python/recipes-devtools/python/python-cassandra-driver.inc
> b/meta-python/recipes-devtools/python/python-cassandra-driver.inc
> index 1cc1f4c494..53ebfec337 100644
> --- a/meta-python/recipes-devtools/python/python-cassandra-driver.inc
> +++ b/meta-python/recipes-devtools/python/python-cassandra-driver.inc
> @@ -28,6 +28,6 @@ RDEPENDS_${PN} += "\
>      libevent \
>  "
>
> -DEPENDS_${PN} += "\
> +DEPENDS += "\
>      ${PYTHON_PN}-cython \
>  "
> --
> 2.17.1
>
>

