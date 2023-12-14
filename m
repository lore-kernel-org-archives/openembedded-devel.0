Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 325D7C4332F
	for <webhook@archiver.kernel.org>; Thu, 14 Dec 2023 16:47:20 +0000 (UTC)
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
 by mx.groups.io with SMTP id smtpd.web10.27732.1702572431274998678
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Dec 2023 08:47:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dptGUAXl;
 spf=pass (domain: gmail.com, ip: 209.85.210.46, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-6da3a585c29so1301660a34.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 14 Dec 2023 08:47:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702572430; x=1703177230; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oRN+4dE7gv06YOVxcBv6WoxYl5O663a3FOGc4S+zqZg=;
        b=dptGUAXlj8q9a59uurX/XIfBr9e4aMPTTNEEZKXZPmUqMb7E+P3bM8GO9qRz80YBjT
         0ehMV0tJN5ZsnS6eNfKmCEc+JAlvoI2yCfcewH8guyRIFI2yQmHoie+Q723OM7EiN5Vj
         IVrqNMDNqU0bJB/39h2XxYkI21ligZRELNceOb7dnB48rQtZSd10+tiiAWepxvKMsnUb
         D6KLC1SkqH7XIERe9sCvsiTEznR66MKtLMJvnsC+alRGfA3TbZ2ewCsCpQ8BS7/ifBCz
         hemvp/lPCqRsj/heO+Fj5NAu8dpQDDfrwP/vv7uAHPzr0ocmI4YsfgrHhq23zWMjmtAc
         ZHKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702572430; x=1703177230;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oRN+4dE7gv06YOVxcBv6WoxYl5O663a3FOGc4S+zqZg=;
        b=onJjaSG12YQ6vq4pFaFYEVx9ZJrL9Zf+as0oApU9fPxXO7+y+kGYxo/ePMg+TZJI/d
         s+xC5E/XExLqYRLUyFeISEdWSV8vuPD0HpnsWmRvAIaj3XzgrqBeZ5KzF3pD0jnFrOoB
         561ogkY0xDk7MAV2Fz9glhXSGbcyBOfYvkjFhxgnRSw7MvrBu9wd3T/Tt1H9+6m0tG7n
         0/bZkm9P7GMUBYFBfk0M1cEEEQ+ZdIflTZ6d71D1AETHZrZLMcagVtNtHaS7Dn2+9q+5
         OyZfREg1o6LfHNIRpnWAIU9EcmjDDOIaXU7IV5L4+FmYp84HTFFiDOPRymbmhHhNSHcV
         cYCQ==
X-Gm-Message-State: AOJu0YxaMy9wljF6kk6dCw8QT4SRtS80DcGiEBa8y3/RCshZ9pyWX0sh
	/8+S9OS25eUgzpeCyo9wcUNiZvmmpnI1IgoLCd1ge3g7
X-Google-Smtp-Source: AGHT+IG6vNivRQFh+Fe+Ed52zqaQEhj+BU0KBBZKKwn00O2DiJ/B4IyQKAssn3vLeml+j7DBTuenLSCeFUbdS1pgSPs=
X-Received: by 2002:a05:6870:7029:b0:1fb:75b:2fd4 with SMTP id
 u41-20020a056870702900b001fb075b2fd4mr11778240oae.107.1702572430288; Thu, 14
 Dec 2023 08:47:10 -0800 (PST)
MIME-Version: 1.0
References: <20231214103812.512113-1-meenali.gupta@windriver.com>
In-Reply-To: <20231214103812.512113-1-meenali.gupta@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 14 Dec 2023 08:46:44 -0800
Message-ID: <CAMKF1spE4bd8H3ATZOKcxYP01Cstp2hvBXZ9Qc9DeC8pQtoVWw@mail.gmail.com>
Subject: Re: [oe][meta-webserver][kirkstone][PATCH 1/1] nginx: upgrade 1.25.2
 -> 1.25.3
To: meenali.gupta@windriver.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Dec 2023 16:47:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107454

we need this on master as well. Its good to mention the branches a
patch is needed in subject. Its fine to mention more than one if it
applied directly to all of the requested branches.
I almost ignored it as it said kirkstone alone.

On Thu, Dec 14, 2023 at 2:38=E2=80=AFAM Meenali Gupta via
lists.openembedded.org
<meenali.gupta=3Dwindriver.com@lists.openembedded.org> wrote:
>
> From: Meenali Gupta <meenali.gupta@windriver.com>
>
> Changelog:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> https://nginx.org/en/CHANGES
>
> *) Change: improved detection of misbehaving clients when using HTTP/2.
>
> *) Feature: startup speedup when using a large number of locations.
>        Thanks to Yusuke Nojima.
>
> *) Bugfix: a segmentation fault might occur in a worker process when
>        using HTTP/2 without SSL; the bug had appeared in 1.25.1.
>
> *) Bugfix: the "Status" backend response header line with an empty
>        reason phrase was handled incorrectly.
>
> *) Bugfix: memory leak during reconfiguration when using the PCRE2
>        library.
>        Thanks to ZhenZhong Wu.
>
> *) Bugfixes and improvements in HTTP/3.
>
> Signed-off-by: Meenali Gupta <meenali.gupta@windriver.com>
> ---
>  .../recipes-httpd/nginx/{nginx_1.25.2.bb =3D> nginx_1.25.3.bb}    | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-webserver/recipes-httpd/nginx/{nginx_1.25.2.bb =3D> nginx_1.=
25.3.bb} (51%)
>
> diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.25.2.bb b/meta-we=
bserver/recipes-httpd/nginx/nginx_1.25.3.bb
> similarity index 51%
> rename from meta-webserver/recipes-httpd/nginx/nginx_1.25.2.bb
> rename to meta-webserver/recipes-httpd/nginx/nginx_1.25.3.bb
> index 66eef23895..8aa9fa0267 100644
> --- a/meta-webserver/recipes-httpd/nginx/nginx_1.25.2.bb
> +++ b/meta-webserver/recipes-httpd/nginx/nginx_1.25.3.bb
> @@ -2,5 +2,5 @@ require nginx.inc
>
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D79ad2eb837299421c4435dedc8897=
b3d"
>
> -SRC_URI[sha256sum] =3D "05dd6d9356d66a74e61035f2a42162f8c754c97cf1ba64e7=
a801ba158d6c0711"
> +SRC_URI[sha256sum] =3D "64c5b975ca287939e828303fa857d22f142b251f17808dfe=
41733512d9cded86"
>
> --
> 2.40.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#107451): https://lists.openembedded.org/g/openembedde=
d-devel/message/107451
> Mute This Topic: https://lists.openembedded.org/mt/103167529/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

