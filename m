Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85362CD98C5
	for <webhook@archiver.kernel.org>; Tue,  9 Jun 2026 16:08:09 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.83753.1781021280760999469
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Jun 2026 09:08:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=aFwqaLO5;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: raj.khem@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-bec450b950dso828880166b.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 09 Jun 2026 09:08:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781021279; cv=none;
        d=google.com; s=arc-20240605;
        b=RsMm89j8Jc8NVswNvClobrkSJWvO+5qfOjaNu+YNgDXwdOVJR0PH/y1f0TeRF9VMuB
         0p+gQfLCdER9rncY7+bolkAv9tUPibYwsNQjaaLgcQBMGe/0YpjaIGWA60+dsEdrF4F7
         I1eaYQLrk2nid8i2ZunOT9G6hwj9LVQhR4CWvszPeeszuoVR4/hHMj5oOMHRy1h7E3pR
         myLtui08lcAu3GZgX20mRdnq+92K/iMgJUxCQNhwSwxzC6dLASZqNIB1WvTHMN+1/n6T
         M9x/bTIfbIRdbvdZiiOtmA/pO6A3673xLPFia5vbjiQlMXOL2YBRyJ9Je/99MWBN5RH6
         ko2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=IyOlMF5Qqzvl1POnk49MjukhVQGF/9TrmGy13P66chw=;
        fh=uVpPbEU97r8V9RUnPGZwXa1t/o0fNapWGjyM9OsQIIs=;
        b=T6aG9CH7Yyc9GZn7iqZhPxSZDOzUo3LRpMxcU3AaiofCU0mXbMnM18YO+f0qf3EuMR
         rcsfP84XhG9C7/p4fN5L1LmjYNtXH/oq+u1g0gInM2xEdFLiU80eBWnhRuz2vsDM7ddq
         UeFCFD+MSMOfvfuqI2ZwFgKdoFxiJBqZfnz3eUtv5qm+af0uDrIiFg+Rl8f9PcUgxT24
         SWLEoTzCi1mbg5MNWR6Lmya93+NQto3l8njwHVtH9jvN8xvP5t45Tz+hojwH3IhK+Ta+
         Uf/n3fOGD7sxyby++RKmaGSIQeozj6axHu4acJPXozsOg9ou8uuwiqus+SJNlJFRjJ0x
         9iCA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781021279; x=1781626079; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IyOlMF5Qqzvl1POnk49MjukhVQGF/9TrmGy13P66chw=;
        b=aFwqaLO52UcVNJ1HenbJds9sftF0/ypBn3g5rcJf+qZJEfmQT6M8o7pGCyRV1fdZ4E
         2o6dGJneZIvs9hzkUFId233E+qAjUlyOqyzKM5RmpkAKpm4HEWbj6Utw1A3JDyFDMIWw
         WrXYDcrlgw78zgBQyhV1gwfeJuAZkFhauI+1kTW0DBwv3glZqQynuR3frM1FaqO3xrxW
         CmcG/IND0ZPuhA9Pymq2W0udOpRy2qygalRq3bxn9Nr0fUz7xZzpRPn2jFkVyBcD3Htc
         JW8Ca5CwEUiQLno84i4fAIy8YnGTq5xC4q6oaLDj2qHtQ+HoR4kCfrbp5iSd9UB8SVbL
         YcpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781021279; x=1781626079;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IyOlMF5Qqzvl1POnk49MjukhVQGF/9TrmGy13P66chw=;
        b=Ax6eSRXvk7ozU6X6yY7SHv03M3WseveV8WSct7hF9gOQxvAikwfsIdRFhuDKZCpewz
         3eZZncL8bp0nda8HNssloSFPmqBcbk0TDfonhN1jeb6dt0b0ez78lZpARubF4kQWy4nR
         2EbtzPXokPB8sLi6mBRNI3QTIkq6H3aa2F3UIahexu8H5FRaBxzJHJ7Rv0mFjNkrkon3
         8KOltTHdMI8Ll5NW2HSC/hAzGP9TGUnDibu0594TvtIrAZvN6vsAAitORsOypVi4hhEh
         hgPXNYALmc+c4RveM42DiFZeY897w+ADK0D05rzqQbNMfApuLtjaX+Cj5zT1U6iZ6hNy
         Y8LA==
X-Forwarded-Encrypted: i=1; AFNElJ8EC9NToPFLJ2Y/Y7GTRihRl07ohlMHV96fJ8WTIe0mfvEj3SOMDeLXRfCO3VFWppD85PZ7BS1itakUoj/7PfNcdVc=@lists.openembedded.org
X-Gm-Message-State: AOJu0YzqSzQWfYWkAQ59DVyi3Vej86aOLIdEpwXRVnyVMBkt8sli63f1
	lJg+fUxZ9mu2PAqngVsDFSK0+lZIizhDsxLjIk+mKM9McbwDQ4a/PyeMxROaBOg0D/yBqqMmBIb
	vQfUecmTRE/bJpbkgj1jMc5uqolh/wk0=
X-Gm-Gg: Acq92OE8cS98kXLRaCXaq/Op5vTZEmimoHppvO4jHy8G9iscrZLTKITuNpZVl2IamAX
	5CD7c2PRGXf8H9JZWjTX1dFnc3oEI13YDB6RZHZfAw9fZXrJxWjzqfrkn7whjDcwMlKFUqWl1R2
	e1re/ZuwwbsHSP80XnyezqB41HWzXjJN4gM1OA8aMidi6SUIqsDZjfEpGvwwSJqHBrel3uvI0kS
	n3qiSqN4LM8fhmGlFksmFalpu53AVmDlSZBo+ptDLD0MwkMKhMt8dsJHluqci3Lt4vsyoh5ORFN
	VHcKqklENX/JfmVUx62kfaJzvWbR0/9u2WY6j7u4YhsjUrZunGUGeXJeNWfOgHOMLnOJzYq6obf
	Z5az0AC4NqAzuPhZQqKEDYnWi2UNzqtE2KRACcVOOAf+lOgimx/c+5yQSMQiJiKUlaoodykT5o6
	wyP60zOPMTzHDuoN+0zeL1wBN3RKSg
X-Received: by 2002:a17:907:6b0e:b0:bdd:f2e9:37d2 with SMTP id
 a640c23a62f3a-bf372642192mr992850966b.33.1781021278645; Tue, 09 Jun 2026
 09:07:58 -0700 (PDT)
MIME-Version: 1.0
References: <20260530081837.2192126-1-f_l_k@t-online.de> <cdc55fbc-4ea9-452d-93cc-2eec2fd1a8c7@myspectrum.nl>
 <4651ae38-19f8-4b7e-95da-19cbaf3b7bf7@myspectrum.nl> <RUR1GT.7FBB4YSJA2AH1@t-online.de>
 <194e3c6b-3c34-4cdb-a0dd-f168374888e9@myspectrum.nl> <CAMKF1srL-CgP594CTzd-h1TPGVQx3bjgayOxvhxP67D9rNnpBw@mail.gmail.com>
 <VIDDGT.4G2WON9M88WE@t-online.de>
In-Reply-To: <VIDDGT.4G2WON9M88WE@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 9 Jun 2026 09:07:26 -0700
X-Gm-Features: AVVi8CdFrT0yFP0LEaO0eFtgZr_lhqoYG_1he1PDAsDuALeg_cQBK-HEd7RziSU
Message-ID: <CAMKF1srndms=8QbBdb8=YLFQ1gh+nUj7q43UKd33oNR0cNJC-g@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] gd: fix build with gcc 16
To: Markus Volk <f_l_k@t-online.de>
Cc: jeroen@myspectrum.nl, openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000a6b2da0653d4541b"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Jun 2026 16:08:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127502

--000000000000a6b2da0653d4541b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

yes lets disable it via cmdline.


On Tue, Jun 9, 2026 at 7:57=E2=80=AFAM Markus Volk <f_l_k@t-online.de> wrot=
e:

> Am So, 7. Jun 2026 um 14:04:24 -07:00:00 schrieb Khem Raj <
> raj.khem@gmail.com>:
>
> yeah, I think if upstream is not taking this patch lets disable the
> warning temporarily and see what lands as right fix.
>
>
> This would just disable the warning without patching the code:
> CFLAGS +=3D "-Wno-error=3Dmaybe-uninitialized"
>
>
> We already have this added for DEBUG_OPTIMIZATION:
> DEBUG_OPTIMIZATION:append =3D " -Wno-error=3Dmaybe-uninitialized"
>
>  I assume it makes sense to keep this line as well since that CFLAGS entr=
y
> is only meant to be temporary ?
>
>

--000000000000a6b2da0653d4541b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">yes lets disable=C2=A0it via cmdline.</div><div dir=3D"ltr=
"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr=
" class=3D"gmail_attr">On Tue, Jun 9, 2026 at 7:57=E2=80=AFAM Markus Volk &=
lt;<a href=3D"mailto:f_l_k@t-online.de" target=3D"_blank">f_l_k@t-online.de=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
<div id=3D"m_-4132620102548319465m_5276350780947825171geary-body" dir=3D"au=
to">Am So, 7. Jun 2026 um 14:04:24 -07:00:00 schrieb Khem Raj &lt;<a href=
=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt;=
:<br><blockquote type=3D"cite">yeah, I think if upstream is not taking this=
 patch lets disable the warning temporarily and see what lands as right fix=
.</blockquote><div><br></div><div>This would just disable the warning witho=
ut patching the code:</div><div><div>CFLAGS +=3D &quot;-Wno-error=3Dmaybe-u=
ninitialized&quot;</div><div><br></div><div><br></div><div>We already have =
this added for DEBUG_OPTIMIZATION:</div><div>DEBUG_OPTIMIZATION:append =3D =
&quot; -Wno-error=3Dmaybe-uninitialized&quot;</div></div><div><br></div><di=
v>=C2=A0I assume it makes sense to keep this line as well since that CFLAGS=
 entry is only meant to be temporary ?</div><div><br></div></div></blockquo=
te></div></div>

--000000000000a6b2da0653d4541b--

