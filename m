Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com [209.85.160.195])
 by mx.groups.io with SMTP id smtpd.web10.6083.1598479899425472600
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Aug 2020 15:11:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=g3MpBtZA;
 spf=pass (domain: gmail.com, ip: 209.85.160.195, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f195.google.com with SMTP id s16so3046302qtn.7
        for <openembedded-devel@lists.openembedded.org>; Wed, 26 Aug 2020 15:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IrSaueFsig1nPjLPDixx3JDGzHeYCvfRNzaUkK7qiss=;
        b=g3MpBtZAP98TE+3ZnI7EzKsvSKGrSe9OGr4ER2Tomr0YNNaS1hOFlOtIejTK7LeV8r
         Axcis7OMp945CX9mou4BFqvEnckFvVxZNXpCklyOS6tu1kpNJ5gJZ7989O/+oF/a/wWc
         uJqiUBWP/Y1MiFr8ctwj+UO1SrZik3gwrLNW6hGspaF3cypqvA1IWnVHvKw/ZCEdWDvr
         gyQaJVmHpTfesEH7uOjPhapWP0OGi8OMMX0dRpdEas3wPuO8YE3N6DlefWpeJBV3GUr0
         W7ymCOTCfUsMW45PhYfut0PL0hq0ZX9P2AnSoJ6cC8UTH25VdQvhe/2YkUBmVLj5h3nJ
         Q4Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IrSaueFsig1nPjLPDixx3JDGzHeYCvfRNzaUkK7qiss=;
        b=NbLev2RshhtWhibY7u/TMxZqd6zsOhouD5ReFOL2quTVMbK4y607sDwhII1KPaMXD6
         YYrJybCqGeziJx50vjEz8zsU0pssRglJeOH4q1Roba+bQLJjoaz8tt1BrsQ3NS11lEOk
         vcaegP4LXos2TtlyRqAbnts2VbCE9HTKG/Q7yT0Aq4y7XcpqIRmoEsdRRmt8IXz21ZrB
         iwh7183EkBrAdGGEVDI0KGjIoZUUpC+hVzKikjrTbgRyfBw8iZ7h9U6IykcxnyDzgPBE
         64QVciMpl8jUSbaLz3SMhZaSuwexP/jrwhBtwoi5PqRWVlRZn1MJh1t4/5zIQp+JsKA9
         JQfA==
X-Gm-Message-State: AOAM533p2U7oUqjUYDMcbm4vlqT0r1CFRiSBw2Ip18SLvA4Q8DJ7oEeE
	yHe68ffTf4Ok9Kphx9L7Bg5SiPJqx6ezSyUKvIU=
X-Google-Smtp-Source: ABdhPJxEvx8V6bY8lVg3K/huH51UfPgdaOevqqnJTs+qsEHf6UI84XkOboerntkCaMx2Wbk9fPRbkc/kOR4IVL3rirE=
X-Received: by 2002:ac8:f42:: with SMTP id l2mr11307015qtk.80.1598479898478;
 Wed, 26 Aug 2020 15:11:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200825040803.837645-1-arthur.she@linaro.org>
 <CAMKF1sp9NYtca+=CE3RpYDTg4cSOYEhjg0kRecnbmVvM3n_QQQ@mail.gmail.com>
 <CAJ8hLzFxzfX1vUasMcUmiSW=p_YTZvnCMp+wR_AcB9mLf4NrmA@mail.gmail.com>
 <CAMKF1sp=_fV84eJ7S2vCjCvEf=5Y9qmsGp8UL_-VYCEhhuE6og@mail.gmail.com> <CAJ8hLzH8A1aLVynEW1xyee=3YZG3_vdumq7D-OKt7pipnOZNzw@mail.gmail.com>
In-Reply-To: <CAJ8hLzH8A1aLVynEW1xyee=3YZG3_vdumq7D-OKt7pipnOZNzw@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 26 Aug 2020 15:11:12 -0700
Message-ID: <CAMKF1sqQnN-6KT0X4R9-kSf1seRk59O9WpJ9v8y-MHviB1LSnA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] xmlrpc-c: fix Makefile macro error
To: Arthur She <arthur.she@linaro.org>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 26, 2020 at 1:28 PM Arthur She <arthur.she@linaro.org> wrote:
>
> We built curl and xmlrpc-c for arm and aarch64 architectures.
> Except for the Makefile macro error of xmlrpc-c-1.54.02, everything works fine so far.
>
> Could you give me an example of the config files with pkgconfig calls?
>

see meta/recipes-support/gnupg/gnupg/0002-use-pkgconfig-instead-of-npth-config.patch

> Thanks,
> Arthur
>
>
> On Tue, Aug 25, 2020 at 10:26 PM Khem Raj <raj.khem@gmail.com> wrote:
>>
>> On Tue, Aug 25, 2020 at 9:58 PM Arthur She <arthur.she@linaro.org> wrote:
>> >
>> > Hi Khem,
>> > I am not sure I understand what you mean.
>> > Could you share some more details?
>> >
>>
>> We have replaced many of these config files with pkgconfig calls,
>> since they do not work reliably in cross compile envs
>> but I don't see this being done for curl-config yet so perhaps it does
>> work ok in cross builds.
>>
>> > Thanks,
>> > Arthur
>> >
>> > On Tue, Aug 25, 2020 at 11:34 AM Khem Raj <raj.khem@gmail.com> wrote:
>> >>
>> >> On Mon, Aug 24, 2020 at 9:08 PM Arthur She <arthur.she@linaro.org> wrote:
>> >> >
>> >> > This error caused the curl library not to be linked.
>> >> >
>> >> > Signed-off-by: Arthur She <arthur.she@linaro.org>
>> >> > ---
>> >> >  .../0003-Fix-Makefile-macro-error.patch       | 26 +++++++++++++++++++
>> >> >  .../xmlrpc-c/xmlrpc-c_1.54.02.bb              |  1 +
>> >> >  2 files changed, 27 insertions(+)
>> >> >  create mode 100644 meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c/0003-Fix-Makefile-macro-error.patch
>> >> >
>> >> > diff --git a/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c/0003-Fix-Makefile-macro-error.patch b/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c/0003-Fix-Makefile-macro-error.patch
>> >> > new file mode 100644
>> >> > index 000000000..e0be24bf7
>> >> > --- /dev/null
>> >> > +++ b/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c/0003-Fix-Makefile-macro-error.patch
>> >> > @@ -0,0 +1,26 @@
>> >> > +From bb4057f06dd4a0b7823c1952b14cee7882664f1b Mon Sep 17 00:00:00 2001
>> >> > +From: Arthur She <arthur.she@linaro.org>
>> >> > +Date: Mon, 24 Aug 2020 20:50:58 -0700
>> >> > +Subject: [PATCH] Fix Makefile macro error
>> >> > +
>> >> > +The libcurl will not be liked due to this error.
>> >> > +---
>> >> > + src/Makefile | 2 +-
>> >> > + 1 file changed, 1 insertion(+), 1 deletion(-)
>> >> > +
>> >> > +diff --git a/src/Makefile b/src/Makefile
>> >> > +index 1cdf8b0..acd04dd 100644
>> >> > +--- a/src/Makefile
>> >> > ++++ b/src/Makefile
>> >> > +@@ -57,7 +57,7 @@ ifeq ($(MUST_BUILD_CURL_CLIENT),yes)
>> >> > +   TRANSPORT_MODS += $(BLDDIR)/lib/curl_transport/xmlrpc_curl_transport
>> >> > +   TRANSPORT_MODS += $(BLDDIR)/lib/curl_transport/curltransaction
>> >> > +   TRANSPORT_MODS += $(BLDDIR)/lib/curl_transport/curlmulti
>> >> > +-  TRANSPORT_LIBDEP += $(shell $CURL_CONFIG --libs)
>> >> > ++  TRANSPORT_LIBDEP += $(shell $(CURL_CONFIG) --libs)
>> >>
>> >> do we then point CURL_CONFIG to PKGCONFIG or pkgconfig ?
>> >> I think it would be better to do so as well while here.
>> >>
>> >> > +   TRANSPORT_INCLUDES += -Isrcdir/lib/curl_transport
>> >> > + endif
>> >> > + ifeq ($(MUST_BUILD_LIBWWW_CLIENT),yes)
>> >> > +--
>> >> > +2.25.1
>> >> > +
>> >> > diff --git a/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.54.02.bb b/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.54.02.bb
>> >> > index c1f0b78ca..eec945824 100644
>> >> > --- a/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.54.02.bb
>> >> > +++ b/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.54.02.bb
>> >> > @@ -8,6 +8,7 @@ LIC_FILES_CHKSUM = "file://doc/COPYING;md5=aefbf81ba0750f02176b6f86752ea951"
>> >> >  SRC_URI = "git://github.com/mirror/xmlrpc-c.git \
>> >> >             file://0001-test-cpp-server_abyss-Fix-build-with-clang-libc.patch \
>> >> >             file://0002-fix-formatting-issues.patch \
>> >> > +           file://0003-Fix-Makefile-macro-error.patch \
>> >> >             "
>> >> >
>> >> >  #Release 1.54.02
>> >> > --
>> >> > 2.25.1
>> >> >
>> >> > 
