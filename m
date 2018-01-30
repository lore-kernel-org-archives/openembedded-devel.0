Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id 604F178859
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Jan 2018 15:07:47 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id g21so11499512wrb.13
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Jan 2018 07:07:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ZZkEsgCoUYJ17v/gBzEhGjy3mGviTO8g0O2CX5rDYfM=;
	b=lTKIKeiuLPy94qcYb9oi5fO6QTm0cHLf2X2oR0mEDh4D9q9dQoFHBuRLlGZRPPis3h
	H0GUaAKN+rba0mwbFsawvXzk8LXpI2uw2jxbaSR1wFtSxFPLdX5irKfwhvTvEjkrde3a
	3tQ433FEUqxvqdkIN8TFM/GjvDyyKzD6LfABO24xns111DFUcuYUqNPXHUrafTFYxyzU
	Yn15+VEUArazOwooMr2h6VhzHnER+KVbzpJbtZkL1ozIETdbqAXWhrzmIEmw9yj1TLjl
	riFnszL6DV3cIFCXOD0VueeSEJrM5+y6sm00qLJdyzjCczU8v54eZZ7+Gm7YxpUJnpab
	vfiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ZZkEsgCoUYJ17v/gBzEhGjy3mGviTO8g0O2CX5rDYfM=;
	b=e700zOaCrWgdeT/klRHdK5vDsh9/ZVhuoEgKrzjDpaO6O7KaCXPi5pnvivKwtAH5M6
	lheH6oS3kRBr28U3Ha+Ne1pu+Sw2VK0I4ZL5C4j8fi7j3kbElbRiD/Sbpm4dt6dhrY7x
	VjG6k0v7WPhBGK1YvYauysevZ5mCp9wbwx03/0AB8R7o+V1B3+2ghIc/oEiYlaEbVH0N
	DlM6aC/Rd1KSShKobKHgw5LRnKiko2rqoPHufaUqNZ+yfkmRTlh0thKP1itK8RItAECf
	WEMGx1hPHqv5wUPMhXxcgupYmOej1DAPg+5yuRW7oBTx4ZlXsU3uUMekonKvotInuboR
	v4xg==
X-Gm-Message-State: AKwxytcVCHMOrUDsBxAwhfe0dPMJ8pGbywdkLKvsfdhBUG4aOJDdSm+y
	iesXt6YUObz0lnenxNmJrMt3jEQijrQuH5p1rng=
X-Google-Smtp-Source: AH8x225D/Eh5v7DyiBFossv/nsdRwk7Y6fwVrMyrJxwTVJ6m0T++pimyNv/c1C+tMm7sSB4Q7RWjsvqgjOHhbbz2WwA=
X-Received: by 10.223.195.78 with SMTP id e14mr22496932wrg.68.1517324868255;
	Tue, 30 Jan 2018 07:07:48 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.74.211 with HTTP; Tue, 30 Jan 2018 07:07:47 -0800 (PST)
In-Reply-To: <1d1b437e-fa66-ea0f-6af2-c04933376a2c@gmail.com>
References: <20180117144230.6819-1-pascal.bach@siemens.com>
	<1d1b437e-fa66-ea0f-6af2-c04933376a2c@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 30 Jan 2018 16:07:47 +0100
Message-ID: <CA+chaQdJuci0QP4Eg4UjpxC91JRRy2EQ5GSZ0HvLumbYMS6dbQ@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] poco: update to 1.8.1
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
X-List-Received-Date: Tue, 30 Jan 2018 15:07:47 -0000
Content-Type: text/plain; charset="UTF-8"

Anyone else seeing strange behavior with poco and libCppUnit.so.1 library?

WARNING: poco-1.8.0.1-r0 do_package: poco-cppunit-1.8.0.1 was registered as
shlib provider for libCppUnit.so.1, changing it to poco-1.8.0.1 because it
was built later
WARNING: poco-1.8.0.1-r0 do_package: poco-1.8.0.1 was registered as shlib
provider for libCppUnit.so.1, changing it to poco-cppunit-1.8.0.1 because
it was built later

this is happening with the 1.8.0.1 version already, but it would be good to
fix if it isn't fixed in 1.8.1 already. Maybe just passing explicit
-DENABLE_TESTS=OFF in
${@bb.utils.contains('PTEST_ENABLED', '1', '-DENABLE_TESTS=ON ', '', d)}"
might help (I haven't tried, I don't use poco anywhere, so I've just
blacklisted it locally).

On Mon, Jan 22, 2018 at 5:05 PM, akuster808 <akuster808@gmail.com> wrote:

>
>
> On 01/17/2018 06:42 AM, Pascal Bach wrote:
> > Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
>
> Failed to build. Please see
>
> http://errors.yoctoproject.org/Errors/Build/51576/
> > ---
> >  meta-oe/recipes-support/poco/{poco_1.8.0.1.bb => poco_1.8.1.bb} | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >  rename meta-oe/recipes-support/poco/{poco_1.8.0.1.bb => poco_1.8.1.bb}
> (98%)
> >
> > diff --git a/meta-oe/recipes-support/poco/poco_1.8.0.1.bb
> b/meta-oe/recipes-support/poco/poco_1.8.1.bb
> > similarity index 98%
> > rename from meta-oe/recipes-support/poco/poco_1.8.0.1.bb
> > rename to meta-oe/recipes-support/poco/poco_1.8.1.bb
> > index 160b4d391..e44ff4470 100644
> > --- a/meta-oe/recipes-support/poco/poco_1.8.0.1.bb
> > +++ b/meta-oe/recipes-support/poco/poco_1.8.1.bb
> > @@ -12,7 +12,7 @@ inherit cmake ptest
> >
> >  BBCLASSEXTEND = "native"
> >
> > -SRCREV = "af527ab21fca5ab2659285408aec9920ed7c7b17"
> > +SRCREV = "2eca6c1813632fb779e07f1e1968afefa81e1dd0"
> >  SRC_URI = " \
> >      git://github.com/pocoproject/poco.git \
> >      file://run-ptest \
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

