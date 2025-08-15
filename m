Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F4F7CA0EE6
	for <webhook@archiver.kernel.org>; Fri, 15 Aug 2025 09:09:09 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.web11.7703.1755248943156805852
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Aug 2025 02:09:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Yzr001IL;
 spf=pass (domain: gmail.com, ip: 209.85.219.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-709e781cf2eso22773656d6.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 15 Aug 2025 02:09:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755248942; x=1755853742; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=88jGFD0olSZogH33L7ymF6+Ql89TN31Y8odYKMuj9GY=;
        b=Yzr001ILq75ewz1gMbOjqVdG3gaVTEXJNtX0DO0CP93I5fbe3kDyKKXrHc8nxzALDB
         lVABbPJa8ivbO4BCz8qNGwoCZQsHWK21avkuSCsYchSG9Jw2uRmkUY/Pp5VpZNti+kCK
         S3oR1kVwllDagTTyFrzktxKdmac9+wsJfkeZIQTxGFrWMUiqR28+lX65F1Dgh4LIvZik
         /DBkO7iuge+bsWLmXXo66XPjFPK0rFFSmkSoAriIrmQPaPSqWeK4fF9Ps36y9IrkXXh0
         c4yZN1Ekf5JBt8KiIwvexHCfe3/3niGtJTJnuGFEHXNo/qsGmNiEGjx/zesczJhUMVZI
         bl5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755248942; x=1755853742;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=88jGFD0olSZogH33L7ymF6+Ql89TN31Y8odYKMuj9GY=;
        b=D3RS29sUoisC96Aeg+Ky5ovB6KDLUtYruD+LxjG2bdh3bgtlSeLaVr9xV2o8jdITO/
         xq6EO+m5nIvl8EhZVx79SOtV4sRgTpCvSd3BLMlqZNEMRhItGAyCC/yTs8/smo4RVCk+
         27wF80Lk+1uG09kwXiY4CN5zgU0EYPe5AHZCSNBFmMru/k7duJqL3CX/7YjqDCA/dUXk
         qZokZkbwCK5gsH9KyfeHCbwHkVPVYyuNSC1bS3y1XNHMAlGOOWkaWZm373v8OKTPm+9L
         278r5zN8igOoqe4BZ5i+axehR487eRz7QgmriLgj/v9hesmCdKegYsexP0A6GXd/o4aY
         lpMQ==
X-Forwarded-Encrypted: i=1; AJvYcCWHVHNiZDxVc6EFMwqY/lkoxzWSEOToWhWLiL3TbW4ktnJTvUnZyVH43g3afGWlr18vVbDDE1pfdHMPoS9H2MV5gwg=@lists.openembedded.org
X-Gm-Message-State: AOJu0YyVVx1uw4WUMs82phIGaSAjmgesVb0uRkIybZVP1WL9jZLV4JG8
	Lzkrqs49eyI8q+IOA7O7S99ybKO6nsuXaaTO6VCoLyufm1Qm2O3jcP4EvVxFFT7CbFodT5kQHW4
	gwBRSjzzTmoK94Wayr17XOYg66uIJhZo=
X-Gm-Gg: ASbGncvBtvTtVf8OfJrREuHlNGLBxG4mU6F0luH2tt0QjDAbE9YrejPzi/TEd2DFnhA
	m71HOrrLjP/gadpL0HOIkDz5FObRnYRTRlQ+dw0Bt1Jwwvi8kwG2OZZbkbZhDHrwbVjgoF0siKW
	ifVpHrkxCNMY+sCAxeOzUmYAzCOQzVpQ7uQqYO7REiB0W4UKg3/rWWqmHrItJVe4B2u+Wu8Ofze
	c0PO9BbDVT1uCRVz5pt72m8sMgSqwSAO1nAVtPU8PWnAPYf
X-Google-Smtp-Source: AGHT+IHgl2QZmQl8JTEfvKY3RNc3CcmsztBsOjMvJrCabdGOTA81ZDqIP1aNxNQxtPhhkJh/kCgRrjBZwbCQovcX6aY=
X-Received: by 2002:a05:6214:d03:b0:707:533d:eaa6 with SMTP id
 6a1803df08f44-70ba6525626mr16379486d6.16.1755248942101; Fri, 15 Aug 2025
 02:09:02 -0700 (PDT)
MIME-Version: 1.0
References: <20250814225042.3310913-1-d.schultz@phytec.de> <CAMKF1sqM_bVMcSJ+929XJ8DK_4_NDhDN75KtnTtF=Rz+bRkFgQ@mail.gmail.com>
 <63158bab-8681-4e23-af58-418e2874ea78@gmail.com>
In-Reply-To: <63158bab-8681-4e23-af58-418e2874ea78@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 15 Aug 2025 11:08:52 +0200
X-Gm-Features: Ac12FXw9g2VLzoRYXDbEsJsuKFAxMZLBXBFnqCdDbhNW4ffG33VDFRDTMccD9NA
Message-ID: <CANNYZj-xiJWKedBF-k9rzA5W734b1cMkz3U91Ahjt7upjTA8oQ@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH] meta-networking: mbedtls: Remove
 tag from SRC_URI
To: skandigraun@gmail.com
Cc: raj.khem@gmail.com, d.schultz@phytec.de, 
	openembedded-devel@lists.openembedded.org, upstream@lists.phytec.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Aug 2025 09:09:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118963

Same as the other proposed patch. I would not take it before there is
an explanation of why the issue suddenly appeared. Did something
change in scarthgap, or is there a mismatch between the tag and
revision?

Alex

On Fri, 15 Aug 2025 at 07:53, Gyorgy Sarvari via
lists.openembedded.org <skandigraun=3Dgmail.com@lists.openembedded.org>
wrote:
>
> On 8/15/25 04:06, Khem Raj via lists.openembedded.org wrote:
> > I wonder why it works on autobuilder. Can you try with bitbake -ccleana=
ll ?
> > and see if fetching works. I can see the SRCREV is same as v3.6.4 tag.
>
> Was this patch meant for scarthgap, where mbedtls got just broken due to
> this rev vs tag issue?
>
>
> > On Thu, Aug 14, 2025 at 3:51=E2=80=AFPM Daniel Schultz via
> > lists.openembedded.org <d.schultz=3Dphytec.de@lists.openembedded.org>
> > wrote:
> >> This recipe uses SRCREV as well as defines a tag in the SRC_URI.
> >> Only use SRCREV since this will generate an error.
> >>
> >> Fix following error:
> >>   [...] FetchError: Fetcher failure: Conflicting revisions
> >>   (c765c831e5c2a0971410692f92f7a81d6ec65ec2 from SRCREV and v3.6.4
> >>   from the url) found, please specify one valid value
> >>
> >> Signed-off-by: Daniel Schultz <d.schultz@phytec.de>
> >> ---
> >>  meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.4.bb | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.=
4.bb b/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.4.bb
> >> index 88b50a406b..a0dc6a689a 100644
> >> --- a/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.4.bb
> >> +++ b/meta-networking/recipes-connectivity/mbedtls/mbedtls_3.6.4.bb
> >> @@ -23,7 +23,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D379d58199=
37a6c2f1ef1630d341e026d"
> >>  SECTION =3D "libs"
> >>
> >>  S =3D "${WORKDIR}/git"
> >> -SRC_URI =3D "gitsm://github.com/Mbed-TLS/mbedtls.git;protocol=3Dhttps=
;branch=3Dmbedtls-3.6;tag=3Dv${PV} \
> >> +SRC_URI =3D "gitsm://github.com/Mbed-TLS/mbedtls.git;protocol=3Dhttps=
;branch=3Dmbedtls-3.6 \
> >>             file://run-ptest \
> >>             "
> >>
> >> --
> >> 2.25.1
> >>
> >>
> >>
> >>
> >>
> >>
> >>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#118958): https://lists.openembedded.org/g/openembedde=
d-devel/message/118958
> Mute This Topic: https://lists.openembedded.org/mt/114709547/1686489
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [a=
lex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

