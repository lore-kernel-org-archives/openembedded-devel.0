Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com [209.85.160.193])
 by mx.groups.io with SMTP id smtpd.web10.6336.1598419617512050474
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Aug 2020 22:26:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=KV7zyDpL;
 spf=pass (domain: gmail.com, ip: 209.85.160.193, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f193.google.com with SMTP id x12so613514qtp.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 25 Aug 2020 22:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=K1aaXVOJZD1FbqzwNNan2yaPTuVNImQCEb55R0sftoE=;
        b=KV7zyDpLh3hcnJJOVkBVffIGHmJFTpnccoXbOPV7RX/fhCmBWQoJTUfiwa+7aCTipd
         Ph1UIg1jBt4qjBdDL/hQZcw3RBZFo9bfhQ/ucc11SRPuCk/780rqxw6uJK2G0Fn0FROR
         WIRDf3yDCxWvpijOWJtCRGdnlMjoGg7fMZAvngfuDu0aAWnrrMZFdMJhvIBP82MhXDTo
         ulUbRP/fAJTuXxjXyQtCtr/LSqi3y8kxrYBB1W6jcmG9yxTsT0ga0x1+wCbcv4+Qz+yf
         EonjybjyF4pLmusD3JbN1IU67Q5UoIXzF98oEe/64MobllKkfkGjHUbU4IDUfJh2WpRk
         fJKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=K1aaXVOJZD1FbqzwNNan2yaPTuVNImQCEb55R0sftoE=;
        b=CMhJEsr98m18uNjGMr23+VrcuHiangyA9zPobILvp3wH8ojzHeZyWcAh1sDn0YyGXD
         57zEh1cuV+LIBHWwzXR7UpMSBws24viNWV4EhGMpq/Q4o8zb7g1hEm2AkViwZD0kjP7x
         zdPpGO1OGAorKauMsTHSNzcu64VIj6b3agLUNx+vhSps6WNkN241YwiXCd7zmtzo4SSl
         aE1m7I2I5NfatNF8z2/G/9ZGBq72zSe2gErdaTgApt1bdWZcdmZTKKYW7CEb9U9K8mbG
         dAsA1/HbbdoRZciszzp/XEj0k899B9uOpWvD3WzLbicm0vYBniAhO40QSkWlV+dyD3op
         3Cmg==
X-Gm-Message-State: AOAM531o1WS9whocLjvM5oHpfNWvkfVvQYoU2dBzZtoP1bFsVXB83Iwm
	BpX7Gw0LpFQw9LR/EbRTR7vzo8jiY42/oOTK/UM=
X-Google-Smtp-Source: ABdhPJztg1pMvMRzr9gOiJzv9ZMjoZrSWaq8fYQmmdj08m8KVFUhWRdll2iRcQW6eMQFEDqfLD0j9xtJvmCPf+BCgNE=
X-Received: by 2002:ac8:70cd:: with SMTP id g13mr12728690qtp.53.1598419616504;
 Tue, 25 Aug 2020 22:26:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200825040803.837645-1-arthur.she@linaro.org>
 <CAMKF1sp9NYtca+=CE3RpYDTg4cSOYEhjg0kRecnbmVvM3n_QQQ@mail.gmail.com> <CAJ8hLzFxzfX1vUasMcUmiSW=p_YTZvnCMp+wR_AcB9mLf4NrmA@mail.gmail.com>
In-Reply-To: <CAJ8hLzFxzfX1vUasMcUmiSW=p_YTZvnCMp+wR_AcB9mLf4NrmA@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Tue, 25 Aug 2020 22:26:30 -0700
Message-ID: <CAMKF1sp=_fV84eJ7S2vCjCvEf=5Y9qmsGp8UL_-VYCEhhuE6og@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] xmlrpc-c: fix Makefile macro error
To: Arthur She <arthur.she@linaro.org>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 25, 2020 at 9:58 PM Arthur She <arthur.she@linaro.org> wrote:
>
> Hi Khem,
> I am not sure I understand what you mean.
> Could you share some more details?
>

We have replaced many of these config files with pkgconfig calls,
since they do not work reliably in cross compile envs
but I don't see this being done for curl-config yet so perhaps it does
work ok in cross builds.

> Thanks,
> Arthur
>
> On Tue, Aug 25, 2020 at 11:34 AM Khem Raj <raj.khem@gmail.com> wrote:
>>
>> On Mon, Aug 24, 2020 at 9:08 PM Arthur She <arthur.she@linaro.org> wrote:
>> >
>> > This error caused the curl library not to be linked.
>> >
>> > Signed-off-by: Arthur She <arthur.she@linaro.org>
>> > ---
>> >  .../0003-Fix-Makefile-macro-error.patch       | 26 +++++++++++++++++++
>> >  .../xmlrpc-c/xmlrpc-c_1.54.02.bb              |  1 +
>> >  2 files changed, 27 insertions(+)
>> >  create mode 100644 meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c/0003-Fix-Makefile-macro-error.patch
>> >
>> > diff --git a/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c/0003-Fix-Makefile-macro-error.patch b/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c/0003-Fix-Makefile-macro-error.patch
>> > new file mode 100644
>> > index 000000000..e0be24bf7
>> > --- /dev/null
>> > +++ b/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c/0003-Fix-Makefile-macro-error.patch
>> > @@ -0,0 +1,26 @@
>> > +From bb4057f06dd4a0b7823c1952b14cee7882664f1b Mon Sep 17 00:00:00 2001
>> > +From: Arthur She <arthur.she@linaro.org>
>> > +Date: Mon, 24 Aug 2020 20:50:58 -0700
>> > +Subject: [PATCH] Fix Makefile macro error
>> > +
>> > +The libcurl will not be liked due to this error.
>> > +---
>> > + src/Makefile | 2 +-
>> > + 1 file changed, 1 insertion(+), 1 deletion(-)
>> > +
>> > +diff --git a/src/Makefile b/src/Makefile
>> > +index 1cdf8b0..acd04dd 100644
>> > +--- a/src/Makefile
>> > ++++ b/src/Makefile
>> > +@@ -57,7 +57,7 @@ ifeq ($(MUST_BUILD_CURL_CLIENT),yes)
>> > +   TRANSPORT_MODS += $(BLDDIR)/lib/curl_transport/xmlrpc_curl_transport
>> > +   TRANSPORT_MODS += $(BLDDIR)/lib/curl_transport/curltransaction
>> > +   TRANSPORT_MODS += $(BLDDIR)/lib/curl_transport/curlmulti
>> > +-  TRANSPORT_LIBDEP += $(shell $CURL_CONFIG --libs)
>> > ++  TRANSPORT_LIBDEP += $(shell $(CURL_CONFIG) --libs)
>>
>> do we then point CURL_CONFIG to PKGCONFIG or pkgconfig ?
>> I think it would be better to do so as well while here.
>>
>> > +   TRANSPORT_INCLUDES += -Isrcdir/lib/curl_transport
>> > + endif
>> > + ifeq ($(MUST_BUILD_LIBWWW_CLIENT),yes)
>> > +--
>> > +2.25.1
>> > +
>> > diff --git a/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.54.02.bb b/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.54.02.bb
>> > index c1f0b78ca..eec945824 100644
>> > --- a/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.54.02.bb
>> > +++ b/meta-oe/recipes-devtools/xmlrpc-c/xmlrpc-c_1.54.02.bb
>> > @@ -8,6 +8,7 @@ LIC_FILES_CHKSUM = "file://doc/COPYING;md5=aefbf81ba0750f02176b6f86752ea951"
>> >  SRC_URI = "git://github.com/mirror/xmlrpc-c.git \
>> >             file://0001-test-cpp-server_abyss-Fix-build-with-clang-libc.patch \
>> >             file://0002-fix-formatting-issues.patch \
>> > +           file://0003-Fix-Makefile-macro-error.patch \
>> >             "
>> >
>> >  #Release 1.54.02
>> > --
>> > 2.25.1
>> >
>> > 
