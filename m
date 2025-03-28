Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4558DC28B20
	for <webhook@archiver.kernel.org>; Fri, 28 Mar 2025 14:21:17 +0000 (UTC)
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
 by mx.groups.io with SMTP id smtpd.web10.12388.1743171676624838833
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 28 Mar 2025 07:21:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=B0N2a9xl;
 spf=pass (domain: gmail.com, ip: 209.85.167.172, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-3fa6c54cdb2so1526471b6e.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 28 Mar 2025 07:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743171676; x=1743776476; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YOqgHTV/A54Feg4tvdntzAIJOHgmx+O0wnbXMcd4FOQ=;
        b=B0N2a9xlBuDqQTTfH3zy7BGeArEOm3VWUQVtM95YewNHfHhcXy9unvGSCwQbs8lYvh
         7COXNT1EkR9Ay6Ltw760kqmerSLccdNK/exBIW6AQypGIgNg7XiBWuacT1bt1ud7ie+S
         dsncle1w+eRbK9fF9YEf0h2orKAAEUupf3VoGzLByeuDeblgKB9qd8O1XYVS8JHyWKfv
         vkiKGHBjXsmpzn8Ar4MzwnUW0FBF0TkdiFfwpzzAeWPK4AWej7PURiRTYO1F0GBQ6Ygu
         OSNPtUilihkTryjTU11zTPlXsJl7uA4UQbySwc8oe1VmHQg3qgVnqt1Ov00QjEwvQ9cf
         deRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743171676; x=1743776476;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YOqgHTV/A54Feg4tvdntzAIJOHgmx+O0wnbXMcd4FOQ=;
        b=sx4Gx1vQRZqSa55+5tZyzdjPYuv9wzPKJSJ9z4rxojgsOCj0KKQ2u8YQZnROsacdDx
         b9iHXpG3Dz9Tr8Ck0gi1hbztZ9W1Hk0+SOU0YQokcLhL8csK40tEZc45Slp5zLBBs7ek
         GJFvFlhVnBFuDPME84PdMjJiPab64URk1Nye3E86M1zbZW9t0xEMdz1KZDE1V9whIYoz
         n3gZ7OEJ4JrKl4VNI6W2WmCPDgCv3kaUf95B424voU8izyfIrxSJK0lQpKM1+1AXR5aM
         dw32jX7fr49kwQOGuORmqM/qmJQlAR0rV7SmmxbEmDsNg2C3qdK3jWG42JLdK5CRnhgI
         XUcg==
X-Forwarded-Encrypted: i=1; AJvYcCWy80J0jynv/df3yHyyKEmHzcbAHZ7YqJ0mSK667LBmqLr6f+RpdnFumyaSVRsTuz5EoviGrH+DK8MPjZXBwz0CYmk=@lists.openembedded.org
X-Gm-Message-State: AOJu0YxdGvZDEo3z/tyKzkmx0YQCydRpxB5p7KlNAlPOTPIBV0ZW7TQX
	CNF8hMhEOsWd2WUxlNndTZ5jgjOPoxVp2VvkiMo2zEVwTtELZs2lT1xForXbti0dChyQnDD6ErV
	JHc47LfKGmaNbftvE/IWCUXPjnkY=
X-Gm-Gg: ASbGnct8Pq2rhWXZr3XoPxixf5tEBC/XOl3DnX9OsSw9F8E3KlmFH0+8iKujuWJsysL
	s4bjPHTdVotg8vfIIQEc/MNAFAR3Auhd8w7kcMzvzR6ysaDavArPsjcw3RO/DOHifJ7EDFJOcPJ
	me+8tgS3yOv7KilsRH405HNcOz4gsVPRUzpnRC
X-Google-Smtp-Source: AGHT+IEJt+nJPuWGT0fSYAlJWp4QjblQ1AEHg3AAHEXc/akYcETXGoVtHn9uRLmsfaLF8CRl4OWpDilwH4BpT3q6owE=
X-Received: by 2002:a05:6808:6a96:b0:3f7:ff67:1d8c with SMTP id
 5614622812f47-3fefa607a79mr4534864b6e.36.1743171675638; Fri, 28 Mar 2025
 07:21:15 -0700 (PDT)
MIME-Version: 1.0
References: <20250328090855.3347066-1-lizhi.xu@windriver.com>
In-Reply-To: <20250328090855.3347066-1-lizhi.xu@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 28 Mar 2025 07:20:49 -0700
X-Gm-Features: AQ5f1Jo7wnYF37iwCa3Se4zXH0_xxfZgFPZ2x3luBb8nc1MWbYNAl0uTAMqEdVI
Message-ID: <CAMKF1spZ3j3LEkadqA4bYGfP2Ddn3zyyWDeFghdmLGBhVw2nfg@mail.gmail.com>
Subject: Re: [oe] [PATCH] python: the fix for CVE-2019-20907 is adjusted in
 the python2
To: Lizhi.Xu@windriver.com
Cc: Rahul.Taya@kpit.com, ticotimo@gmail.com, 
	openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 28 Mar 2025 14:21:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116354

is it meant for meta-python2 ? if so prefix it with [meta-python2] in subje=
ct

On Fri, Mar 28, 2025 at 7:15=E2=80=AFAM Xu, Lizhi via lists.openembedded.or=
g
<Lizhi.Xu=3Dwindriver.com@lists.openembedded.org> wrote:
>
> In the python2, assertRaisesRegex is not defined in Lib/unittest/case.py,
> but assertRaisesRegexp is defined, so this error is reported.
> In addition, the file recursion.tar is missing in Lib/test/, so it is add=
ed
> together.
>
> Reproducer:
> python test/test_tarfile.py | sed -u -e '/\.\.\. ok/ s/^/PASS: /g' -e '/\=
.\.\. [ERROR|FAIL]/ s/^/FAIL: /g' -e '/\.\.\. skipp
>
> ERROR: test_length_zero_header (test.test_tarfile.MiscReadTest)
> ----------------------------------------------------------------------
> Traceback (most recent call last):
>   File "/usr/lib64/python2.7/test/test_tarfile.py", line 327, in test_len=
gth_zero_header
>     with self.assertRaisesRegex(tarfile.ReadError, "file could not be ope=
ned successfully"):
> AttributeError: 'MiscReadTest' object has no attribute 'assertRaisesRegex=
'
>
> Fixes: 044015255944 ("python: Add fix for CVE-2019-20907")
> Signed-off-by: Lizhi Xu <lizhi.xu@windriver.com>
> ---
>  .../python/python/CVE-2019-20907.patch            |   2 +-
>  recipes-devtools/python/python/recursion.tar      | Bin 0 -> 516 bytes
>  2 files changed, 1 insertion(+), 1 deletion(-)
>  create mode 100644 recipes-devtools/python/python/recursion.tar
>
> diff --git a/recipes-devtools/python/python/CVE-2019-20907.patch b/recipe=
s-devtools/python/python/CVE-2019-20907.patch
> index 624afd2..a2d050d 100644
> --- a/recipes-devtools/python/python/CVE-2019-20907.patch
> +++ b/recipes-devtools/python/python/CVE-2019-20907.patch
> @@ -37,7 +37,7 @@ index 89bd738..c61d02b 100644
>  +    def test_length_zero_header(self):
>  +        # bpo-39017 (CVE-2019-20907): reading a zero-length header shou=
ld fail
>  +        # with an exception
> -+        with self.assertRaisesRegex(tarfile.ReadError, "file could not =
be opened successfully"):
> ++        with self.assertRaisesRegexp(tarfile.ReadError, "file could not=
 be opened successfully"):
>  +            with tarfile.open(support.findfile('recursion.tar')) as tar=
:
>  +                pass
>  +
> diff --git a/recipes-devtools/python/python/recursion.tar b/recipes-devto=
ols/python/python/recursion.tar
> new file mode 100644
> index 0000000000000000000000000000000000000000..b8237251964983f54ed196629=
7e887636cd0c5f4
> GIT binary patch
> literal 516
> zcmYdFPRz+kEn=3DW0Fn}74P8%Xw3X=3Dl~85kIuo0>8xq$A1Gm}!7)KUsFc41m#O8A5+e
> I1_}|j06>QaCIA2c
>
> literal 0
> HcmV?d00001
>
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#116353): https://lists.openembedded.org/g/openembedde=
d-devel/message/116353
> Mute This Topic: https://lists.openembedded.org/mt/111954747/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

