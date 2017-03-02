Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id 1E414775F4
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Mar 2017 16:52:47 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id u48so10295996wrc.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Mar 2017 08:52:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=HOm21R6IRGiVYCsBzP1JKCYSP/BLtHFRxLnu/HXr49w=;
	b=MeLAGoNhDLXzRu0ztIa2p//hchgoJwFduSVc3FadYuDbeDuRTqXBhAWtFRNX3IvQiV
	p7z/0VfXofbOxej11gB8CpJsgDqxrLJ7zU2nykEH8zUqqFKLyiYifapdJ8UTfjcU+cNl
	oB/k9uOV5zxBs8/vAQYxRH5cXLDBJsQaIPKZGjFAmaUpYIuGvz/iXYDyCMtuMFBfJcp8
	fQoRYop5TyNFhEuIYI77yvJzuBhP0z2dwWzqwLL73Mm8KkcCJ2TuAAOq2/1p/gZaDw79
	PdXuGM5kv7XQBoM/j74rz0cHmwerAWBcN777GZ00F6Z5TNZXBbS3IYaPLLzeJFsW2qxE
	2m4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=HOm21R6IRGiVYCsBzP1JKCYSP/BLtHFRxLnu/HXr49w=;
	b=C19VSMNeE9ZPkM9rBjWtr1iRRqrYTZKSi7mprSS3+TQi9JlLx9mp2N6r6D39dqBbUD
	2YBOV617wgSx1fAYF+RKvBzCynJnb1TtocD5iFJlN7HHsxFfKoT/4J9XRf6XS6e+0prp
	7ih1dx1u2ypFIqqZJKh7RccEVPP4jF1VWBxLXCUFzZHAG5ZD9ctrWWferFvgl97kSYUS
	0oI60TxMc41xZD3eKV4YAkaF8tq7i9NuwO9SVmAdAcn5ntp8RocmzPnw37veVhY0x1b4
	1PRObDy/4vR2y1eqBLoDJ9CqGyjFWUNaN6mhxS7q0yeLBa+7EUQu8wjm5zYk8zcrMTPd
	gPdw==
X-Gm-Message-State: AMke39ktujQxah76NVuv4c6v1011154QhuiRIUoGUIJ5AvyODkHKVmI8vjAh0gAQ6+yJ+TqHVXYiNu4wmdQc8Q==
X-Received: by 10.223.164.212 with SMTP id h20mr4005578wrb.196.1488473568457; 
	Thu, 02 Mar 2017 08:52:48 -0800 (PST)
MIME-Version: 1.0
Received: by 10.80.145.24 with HTTP; Thu, 2 Mar 2017 08:52:47 -0800 (PST)
In-Reply-To: <1488471230-46540-1-git-send-email-adrian.calianu@enea.com>
References: <1488471230-46540-1-git-send-email-adrian.calianu@enea.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 2 Mar 2017 17:52:47 +0100
Message-ID: <CA+chaQecKFVLcU6zXnNSUfogCNRmp08bJW1gnyvxTVoXaJ_Ezg@mail.gmail.com>
To: Adrian Calianu <adrian.calianu@enea.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] krb5: allow to generate empty package
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
X-List-Received-Date: Thu, 02 Mar 2017 16:52:48 -0000
Content-Type: text/plain; charset=UTF-8

> Since other packages may depend on krb5(${PN}).

Then fix these other packages.

On Thu, Mar 2, 2017 at 5:13 PM, Adrian Calianu <adrian.calianu@enea.com>
wrote:

> Since other packages may depend on krb5(${PN}).
>
> Signed-off-by: Adrian Calianu <adrian.calianu@enea.com>
> ---
>  meta-oe/recipes-connectivity/krb5/krb5_1.13.6.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta-oe/recipes-connectivity/krb5/krb5_1.13.6.bb
> b/meta-oe/recipes-connectivity/krb5/krb5_1.13.6.bb
> index 656a02f..a0589a6 100644
> --- a/meta-oe/recipes-connectivity/krb5/krb5_1.13.6.bb
> +++ b/meta-oe/recipes-connectivity/krb5/krb5_1.13.6.bb
> @@ -107,6 +107,8 @@ PACKAGES =+ "${PN}-admin-server \
>               libkrb5support \
>               libverto"
>
> +ALLOW_EMPTY_${PN} = "1"
> +
>  FILES_${PN} = ""
>  FILES_${PN}-doc += "${datadir}/examples"
>  FILES_${PN}-dbg += "${libdir}/krb5/plugins/*/.debug"
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

