Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f196.google.com (mail-ua0-f196.google.com
	[209.85.217.196])
	by mail.openembedded.org (Postfix) with ESMTP id 914E2773A2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Jan 2017 01:16:19 +0000 (UTC)
Received: by mail-ua0-f196.google.com with SMTP id 96so27665418uaq.2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Jan 2017 17:16:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=maSMvZ+yEsqG5GmjxdSdT3RAEdXPMVx7sJwLZGSfhxI=;
	b=oi/W5rYdUEg4XJHnUbpF98AcQ7zcDywYnP54ectoCsijUN9wBqMqtiuJEQYJxENOog
	0VanDPWh/FSg/b9f6084CWLn5sa+7ADSxmkCFUKHhpTAn9biMh8EVUHqMGEowJ5h3TiU
	UjTAknUadNyE2i766Y0lTwSIxrNmjHpUfiObE3E8UAcgWPgxCUzyu5nYSrT4/1hTSxaI
	NmzMYq5LTNbz/5ztJWRX8ZIhayDDhx/rc+Q7tLHNHzUjtI3ttX6nrR2ZNMJNIo/1tWul
	lc1xV3zFj7B2+WbTQZuI25/BRnKMHJCqm/10xZq3jDi7+MFiTRN9yUYWnfuSN8bZPBvQ
	wH8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=maSMvZ+yEsqG5GmjxdSdT3RAEdXPMVx7sJwLZGSfhxI=;
	b=CoH6Gu4HDtfHmqoOXc9N4xqGwGqD7iXgLwhHIjbopW+RLAwOmV9CGSeCWQZGCP7Pf+
	UFVNUTvHhFUlXoDWo72b1H9dGtczjWW8yfxHRHoRBgXjt0LcLTxbdn/JseuzzU3v1sqs
	WiaZhwiDj8HDZMuyyqy7mf3hSPHJQcsLDCS5hsWUX9dp6PVMNlGGDbQEsfp6TeCz4cUs
	TEdKFK72LAW6lhl2C49WgNLdZcmPvL8G34kZF+8j82h0f6rN54YRA2mpbkKKdMp26KYC
	nL9Brx770P/UISRGhNmxT+qFe0CZrBTFqVS8PTQ/mvxuJ28yXjyRDggi0W4VjrRq0lDl
	QPxw==
X-Gm-Message-State: AIkVDXJ75iZH+WJKbaah+1GM1KGYAPdCvMPoASkaAqiQabNlrTXb9QoYnu98QMAiyCwE4uNCXnKSaOTnmTM5aA==
X-Received: by 10.176.66.66 with SMTP id i60mr8335025uai.131.1485652579894;
	Sat, 28 Jan 2017 17:16:19 -0800 (PST)
MIME-Version: 1.0
Received: by 10.159.48.222 with HTTP; Sat, 28 Jan 2017 17:15:49 -0800 (PST)
In-Reply-To: <1485634193-30863-1-git-send-email-akuster808@gmail.com>
References: <1485634193-30863-1-git-send-email-akuster808@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 28 Jan 2017 17:15:49 -0800
Message-ID: <CAMKF1soqDfNtAaJYKzuoqz7fpKZ=ps2R26sjiXYZ=t=kO6mD4A@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Cc: akuster <akuster@mvista.com>
Subject: Re: [meta-perl][PATCH] libnet-ssleay-perl: fix build error
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
X-List-Received-Date: Sun, 29 Jan 2017 01:16:31 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, Jan 28, 2017 at 12:09 PM, Armin Kuster <akuster808@gmail.com> wrote:
> ../../libexec/i586-oe-linux/gcc/i586-oe-linux/6.3.0/ld: cannot find -lssl -lcrypto -lz
> | collect2: error: ld returned 1 exit status
> | Makefile:492: recipe for target 'blib/arch/auto/Net/SSLeay/SSLeay.so' failed
> | make: *** [blib/arch/auto/Net/SSLeay/SSLeay.so] Error 1
>
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.65.bb | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.65.bb b/meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.65.bb
> index cfd6f51..f347942 100644
> --- a/meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.65.bb
> +++ b/meta-perl/recipes-perl/libnet/libnet-ssleay-perl_1.65.bb
> @@ -32,8 +32,7 @@ inherit cpan ptest
>
>  EXTRA_CPANFLAGS = "LIBS='-L=${STAGING_LIBDIR} -L=${STAGING_BASELIBDIR}' \
>                     INC=-I=${STAGING_INCDIR} \
> -                   'EXTRALIBS=-lssl -lcrypto -lz' \
> -                   'LDLOADLIBS=-lssl -lcrypto -lz' \
> +                   '-lssl -lcrypto -lz' \

Similar to LIBS and INC, there should be a LDFLAGS or some such flag.
I guess it needs
to go there.

>                    "
>
>  do_configure_prepend() {
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

