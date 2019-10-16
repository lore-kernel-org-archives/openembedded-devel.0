Return-Path: <alistair23@gmail.com>
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
	[209.85.208.194])
	by mail.openembedded.org (Postfix) with ESMTP id ECEA07D088
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Oct 2019 16:03:02 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id j19so24625579lja.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Oct 2019 09:03:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=57CRHDb+DVUPd9NThBpgVfksnTvP8kJ/O86FbVnx29c=;
	b=b13UXypzl2SBORehonG886T6yAlj/Qh7r5Jz1dbdAVAYSHGTTW1M/CjXhB9wtnK9AJ
	SydtPjiIXcJWQH9UH4H/hbolCpfLxlAAGFutAiFn7oohgCKRmvppZY0KbyYlC/HSVRFn
	QbxO0ebTDDZhEUfZn4du7MJx7Y7HMTRsqpQeJ/Jzc8T2OZMtMdnRF3T3NYFxZPsHcjTI
	L4mdZNkg+ImoRdNUXsPyU1mgotgktpDlQ8PxKF7L0+8IDfbelSM3F8wywFob+DuvvwOf
	8lrMONwN+WOyWRCwSbPkg1ypYXx2IvmGJZWpYal3czBwO9E0nKJE2ADs5AJSNDinkJdo
	7DUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=57CRHDb+DVUPd9NThBpgVfksnTvP8kJ/O86FbVnx29c=;
	b=hcZQ5lSrzNhXOhuuvv9N5p6uqXuCQu9/A3Jj+jV8NseWc4ZVzEu0721Zb7nCDDY8KT
	QKDfX1XCp6m96AvQoyLDIF5ERzlZxqRlNw5x3EMR58eKliOd/T6m/7507Du6FMTWk7cU
	qB+9tuACQL+xTYxEpmgqE0TMmWivBDLhjoioa7oA4hKkqGZgAzOL4YgeS18+SNiG0Q06
	9TY1OjEKm5eBO/PwV6jARnDnsL1OYm2dFXVAs+f1h/53GrJ1mWhj+C4uQXHEccsuUW7C
	jjb1umrhsn73OLzJCGr+26jO0ysABTGB5Zgejw/DuKV5S0wAFHam+sX0ALvIUCA/Ehw+
	DJKw==
X-Gm-Message-State: APjAAAXDEGpbSthaAZG/tJ5H9btZOB+81b65CPXzS3lmkfapGLsuWG/X
	jdTBof99Y46rLj1aIlPMAUQOmllQlPJ0UxGAcB0=
X-Google-Smtp-Source: APXvYqzXLWYeYANseGTvn6qWtKeMbrTBP1dJ59+sRNfeZCEWyOf1VPhQc2PVwzt/SLhAezGC9hP2AGVuS1s971Buz7M=
X-Received: by 2002:a2e:b17b:: with SMTP id a27mr26189652ljm.7.1571241782887; 
	Wed, 16 Oct 2019 09:03:02 -0700 (PDT)
MIME-Version: 1.0
References: <20191015225422.18179-1-alistair.francis@wdc.com>
	<20191015225422.18179-5-alistair.francis@wdc.com>
	<CAMKF1spM=ZZVrct1NTfNLBuvS2b8YVY05Fu2F7qOtT0r85bLjQ@mail.gmail.com>
In-Reply-To: <CAMKF1spM=ZZVrct1NTfNLBuvS2b8YVY05Fu2F7qOtT0r85bLjQ@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 16 Oct 2019 08:57:55 -0700
Message-ID: <CAKmqyKOT5-7o7bTHDAcwqeBi9M9hCj3_ODD4zk2FabPj1GHXoQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-multimedia][PATCH 5/7] python3-google-api-python-client: Initial commit of 1.7.11
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
X-List-Received-Date: Wed, 16 Oct 2019 16:03:03 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 15, 2019 at 7:40 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> meta-python is probably better place for this

Yes it is. That is where I meant for it to go.

I'll re-send the Python patches and they can go in first. Let's drop
this series.

Alistair

>
>
> On Wed, Oct 16, 2019 at 4:30 AM Alistair Francis <alistair.francis@wdc.com>
> wrote:
>
> > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > ---
> >  .../python/python3-google-api-python-client_1.7.11.bb    | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> >  create mode 100644 meta-python/recipes-devtools/python/
> > python3-google-api-python-client_1.7.11.bb
> >
> > diff --git a/meta-python/recipes-devtools/python/
> > python3-google-api-python-client_1.7.11.bb
> > b/meta-python/recipes-devtools/python/
> > python3-google-api-python-client_1.7.11.bb
> > new file mode 100644
> > index 000000000..25e3b9c3f
> > --- /dev/null
> > +++ b/meta-python/recipes-devtools/python/
> > python3-google-api-python-client_1.7.11.bb
> > @@ -0,0 +1,9 @@
> > +SUMMARY = "The Google API Client for Python is a client library for
> > accessing the Plus, Moderator, and many other Google APIs."
> > +HOMEPAGE = "https://github.com/googleapis/google-api-python-client"
> > +LICENSE = "Apache-2.0"
> > +LIC_FILES_CHKSUM = "file://LICENSE;md5=94023d14f6b58272fd885e4e3f2f08b3"
> > +
> > +SRC_URI[md5sum] = "6e28e8caf2e4d55ed5b7c48a538a61c9"
> > +SRC_URI[sha256sum] =
> > "a8a88174f66d92aed7ebbd73744c2c319b4b1ce828e565f9ec721352d2e2fb8c"
> > +
> > +inherit pypi setuptools3
> > --
> > 2.23.0
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

