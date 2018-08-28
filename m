Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by mail.openembedded.org (Postfix) with ESMTP id F30AB745FA
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Aug 2018 16:45:57 +0000 (UTC)
Received: by mail-qt0-f196.google.com with SMTP id k38-v6so2438284qtk.11
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Aug 2018 09:45:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Na1TA4SkknWjiVw3i3leBCqBFFqbLDZ8/qZn/O2Ysho=;
	b=nLuJWn90huvGfFvSjh+KbqtDaaqPgI2pbmKn9qcLlgVt78i1TovV2+dktIBP6R5c4j
	IOEbk6SvAHi75jVE1BbLAdfQSERGMDml+KnMoffpWR701HjsAAypEFoQaM9FayWzvihw
	+Ft9Wfwnuq9V7Hx3Bhqa9vAmw9pIWnqT0YwsRO7WnAfs3MztInX1SMbWmk7eojQs8Vtu
	OgiqY1QSExoL3FuJSj10LwTnngmc5CaHKXwrQXmS24PkyJM66oGD4H+IxTwN62Ll7Dtb
	6qcsXQYyZf/eRFAe5SI9cNrryAwrHdIiNAtvwzMYUuXlDp8WMjsEs22L6PmuFcfeiG8+
	NJTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Na1TA4SkknWjiVw3i3leBCqBFFqbLDZ8/qZn/O2Ysho=;
	b=CAXIyyiG2V7b8H/IZ8kBNougxNs3DClrhvPr3BjAzlZW4eiI7PkOm9H6ab79e88oUQ
	unjbX15ueetkQl4uAsfvJNatehs+glRCvuKeUv5NzV3HOG+NQvKfwEXbiO/DunMBxiSW
	qRwHGHOBqKsUNqYSusQ9zkxZiBCP/lW+bI75KCeeI0mJwF04q2+t76gYE6C0ZUeuZ7b/
	/T9oxjuiajeqCgR5u1N2j/JMh01ZY607hIoKlGjR4ylghTCGnp0a2xn9d+X0+AoMLYBZ
	gNYF68TNTVwOEV+W7pVjhFOF5bA0xfwNUoJlPR/Hqbdo4MdubYUsTCklwzRcT9fQ1S/A
	LqHw==
X-Gm-Message-State: APzg51DbMJ5I01madL+Xm0rzvg4UDzYLmqM5wqqLSeZsAQAWyBoIFOK2
	fmUM9Uuh/GXRh/1Vftc2gFX73eq8UOhfvSPyO/Y=
X-Google-Smtp-Source: ANB0VdbbS3cLQjNR5gncB6UMOfKRZ8r4Yp3NCmC03XIXz/Hcv8/Ob2nyK0B4r5TrIUug7PYQmEZv2hWZ307IXRsTp3s=
X-Received: by 2002:a0c:e205:: with SMTP id
	q5-v6mr2427554qvl.224.1535474758510; 
	Tue, 28 Aug 2018 09:45:58 -0700 (PDT)
MIME-Version: 1.0
References: <1535441994-32199-1-git-send-email-dengke.du@windriver.com>
In-Reply-To: <1535441994-32199-1-git-send-email-dengke.du@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 28 Aug 2018 09:45:32 -0700
Message-ID: <CAMKF1soJ5kaqW+XKAgCPtNwZE08yuzz5TCOKt7eVX=TitSYBDA@mail.gmail.com>
To: Dengke Du <dengke.du@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] snappy: add -fPIC flags
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
X-List-Received-Date: Tue, 28 Aug 2018 16:45:58 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 28, 2018 at 12:29 AM Dengke Du <dengke.du@windriver.com> wrote:
>
> Let the libsnappy.a be position independent code, so other packages can use it
> to make shared PIC library, such as ceph.
>
> Signed-off-by: Dengke Du <dengke.du@windriver.com>
> ---
>  meta-oe/recipes-extended/snappy/snappy_1.1.7.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta-oe/recipes-extended/snappy/snappy_1.1.7.bb b/meta-oe/recipes-extended/snappy/snappy_1.1.7.bb
> index 6f1978a..70223be 100644
> --- a/meta-oe/recipes-extended/snappy/snappy_1.1.7.bb
> +++ b/meta-oe/recipes-extended/snappy/snappy_1.1.7.bb
> @@ -19,3 +19,4 @@ inherit cmake pkgconfig
>
>  PACKAGECONFIG ??= ""
>  PACKAGECONFIG[lzo] = "-DHAVE_LIBLZO2=1,-DHAVE_LIBLZO2=0,lzo,"
> +TARGET_CFLAGS += "-fPIC"

perhaps adding the -fPIC flag to CPPFLAGS is better since adding to
it would mean it applies to  C and C++ compilers equally


> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

