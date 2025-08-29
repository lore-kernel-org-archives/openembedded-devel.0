Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB355CA0EED
	for <webhook@archiver.kernel.org>; Fri, 29 Aug 2025 04:39:28 +0000 (UTC)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
 by mx.groups.io with SMTP id smtpd.web10.6156.1756442360337126225
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Aug 2025 21:39:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MD1Zex6V;
 spf=pass (domain: gmail.com, ip: 209.85.128.171, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-71d60504788so13244787b3.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 28 Aug 2025 21:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756442359; x=1757047159; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BFRAw1S7AyJzlWCjX2hnRVZ8WI7hwNjAcHMYL8tk+Pc=;
        b=MD1Zex6VSiKAw81kRdaUnyE7QruasZANAuel2VNw7dRuS5MXHNPIOx3nm8iEbaPf8T
         qwNmgtFZEc0yGbI3+ywWzuyKe05UsvcfLe3D66imwQPOmn11Da8Ws6+vokIvYUMKzOz2
         +xOCCFvIhTB+lo2TMrrYzIgntrDIG8MISHhOoVhwiOQOpEXpOK/KG/rBLMRKzIaL/ie/
         2oy88UM6Zh5GwGek+184G2I+DwmKgJNNtHw5qwL8LfQF8zfNuEIaflLxQ1GhX62ji/Yg
         DT1ilhHz0wYndXztTyk6+AHqW8G/aRcMa43Cx/spc4FbBO8iQ80qp1/HngqucunnfDZV
         zv0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756442359; x=1757047159;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BFRAw1S7AyJzlWCjX2hnRVZ8WI7hwNjAcHMYL8tk+Pc=;
        b=nRCxR4NksImb/Y0V05U4tX3KnXtWzxQJ4qLvG1jbMMOahDCpkEw6XzfoZ5Y+YvaOhj
         yBNqlXx+3Sc+dVFEw9JXxGSlRUt94rfFQK6lt+qqI5OjZaRVLqInG7dPDTz5RkSYd4zo
         iGMcCMCfJz9bJ/CpwT7gEWTFWtOT82MRwXtQ6nK4eWaf1rqlPTLqT0yahBnJA4375kfe
         VUGHbaRj8YkVLIISrubwWPXsKmTsnFZvwVl7NjxR1RW72wvSiyv0K2BC0Jc3rADsVF1c
         gzT0a+g/O8o8Zrlid4z9eWzO58YqtZxfmP4ogQRtUe+SVmmjzhFT28xgHREZUFWGdJ0M
         7cLw==
X-Gm-Message-State: AOJu0Yw1aIGeolo/9VddwMZjBwS1hZhlgg75f27Niz3oo2rBt3lY+Qw1
	YBIHe7IJyxlA7zU3biXsjfLsn3qddhlNFynlruggkWPUZzQZiDqcONHGJwEurNj28LXL1OXCMP9
	iM+PMY0fCc4hmdlTrHaM5LGJdL6HCGoln7lLS6fE=
X-Gm-Gg: ASbGncvgaY9+WPPc5dP4VZ8WugsVZpw9rCppQMr0plNX+/pBdZXA6VoWGIGf5hjra+x
	keBYK8uVVqR7/NtSPNhjxjYiZBEQzYyHq64763wwasNEq2nw42oJ2hKtwts9splCsjvP34sVKU0
	2M9cWneSdF+EaX3eNPN/IGRZdyJb5K9ZdQynv+yFmNsNQAaINX7I8VJneitIRW9+9HNeiJwKKy7
	B9eBFhhqRtJy2Vhf78+KWtN885zDjeb8QIODFye8E06/aJRpGQ7oP/kQXDkii7YLXkK7BmKrkNI
	YdyQnwVYdc4p8mH/EmD2vuuFwabgoRE50aoR3jIlAXTJjHR1bqb5pLfrOZ4pDenaa5VE
X-Google-Smtp-Source: AGHT+IFzyK+/YxVImexpc0+hOhH50me0mE/jzo/PRrVdMV528w9sM4bkKJx6HPUgyrGLTn/USFX/Og/NRHaiFQXN+3o=
X-Received: by 2002:a05:690c:a9e:b0:719:4cff:16db with SMTP id
 00721157ae682-71fdc401107mr307369287b3.25.1756442359266; Thu, 28 Aug 2025
 21:39:19 -0700 (PDT)
MIME-Version: 1.0
References: <20250828064523.114335-1-changqing.li@windriver.com>
 <CAMKF1spT8fpahqJ98FPE5H+GQ4FFd=P3f3PM1__ygrUnj7tdfg@mail.gmail.com> <782082d0-9cc5-4478-bbe0-38f5be967d95@windriver.com>
In-Reply-To: <782082d0-9cc5-4478-bbe0-38f5be967d95@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 28 Aug 2025 21:38:53 -0700
X-Gm-Features: Ac12FXyXOLALfBTpaKmOzKcsuDhYYjg3OHbAeqCMObLWW3Dn4bFZV559h8h4YuE
Message-ID: <CAMKF1squvavkkY171jKT_8zAx87Rw1x=2jNVfW=CrNtrjr6UmA@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] python3-frozenlist: disable the support
 of ccache
To: Changqing Li <changqing.li@windriver.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 29 Aug 2025 04:39:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119135

On Thu, Aug 28, 2025 at 8:30=E2=80=AFPM Changqing Li <changqing.li@windrive=
r.com> wrote:
>
>
> On 8/28/25 22:24, Khem Raj wrote:
>
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender an=
d know the content is safe.
>
> On Wed, Aug 27, 2025 at 11:45=E2=80=AFPM Changqing Li via
> lists.openembedded.org
> <changqing.li=3Dwindriver.com@lists.openembedded.org> wrote:
>
> From: Changqing Li <changqing.li@windriver.com>
>
> With ccache enable, python3-fronzenlist do_package_qa failed:
> ERROR: python3-frozenlist-1.7.0-r0 do_package_qa: QA Issue: File /usr/lib=
64/python3.13/site-packages/frozenlist/.debug/_frozenlist.cpython-313-x86_6=
4-linux-gnu.so in package python3-frozenlist-dbg contains reference to TMPD=
IR [buildpaths]
> ERROR: python3-frozenlist-1.7.0-r0 do_package_qa: QA Issue: File /usr/lib=
64/python3.13/site-packages/frozenlist/_frozenlist.cpython-313-x86_64-linux=
-gnu.so in package python3-frozenlist contains reference to TMPDIR [buildpa=
ths]
>
> Although we have set -ffile-prefix-map, the buildpaths is not replaced.
>
> Its not clear why this is happening. Can. you try doing a rebuild
> after cleaning sstate and ccache for this package alone ?
>
> Hi, Khem
>
> Thanks.  I did some tests according to your suggestion,  it turns out tha=
t:
>
> 1.  For clean project with ccache enabled,  bitbake python3-fronzenlist b=
uild successfully
>
> 2. For clean project, disable ccache, bitbake python3-fronzenlist, it wil=
l build successfully,
>
> then, with the same project, I enabled ccache in local.conf with followin=
g config, then
>
> bitbake python3-fronzenlist will failed with do_packge_qa error.
>
> INHERIT +=3D "ccache"
>
> CCACHE_DIR =3D "${TMPDIR}/ccache/${MULTIMACH_TARGET_SYS}/${PN}
>
> Can you give some suggestion about this issue?

Try moving ccache outside TMPDIR, I have

CCACHE_TOP_DIR =3D "/mnt/b/yoe/master/build/ccache"

 Keeping CCACHE_DIR out of ${TMPDIR} prevents the cache path itself
from being found by buildpaths.

>
> Regards
>
> Changqing
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  meta-python/recipes-devtools/python/python3-frozenlist_1.7.0.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta-python/recipes-devtools/python/python3-frozenlist_1.7.0=
.bb b/meta-python/recipes-devtools/python/python3-frozenlist_1.7.0.bb
> index 7d813a026c..363dab969e 100644
> --- a/meta-python/recipes-devtools/python/python3-frozenlist_1.7.0.bb
> +++ b/meta-python/recipes-devtools/python/python3-frozenlist_1.7.0.bb
> @@ -11,4 +11,6 @@ DEPENDS +=3D " \
>      python3-expandvars-native \
>  "
>
> +CCACHE_DISABLE =3D "1"
> +
>  BBCLASSEXTEND =3D "native nativesdk"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#119127): https://lists.openembedded.org/g/openembedde=
d-devel/message/119127
> Mute This Topic: https://lists.openembedded.org/mt/114930913/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

