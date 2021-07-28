Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
 by mx.groups.io with SMTP id smtpd.web10.701.1627493088249638681
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 28 Jul 2021 10:24:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=q1ng+IN5;
 spf=pass (domain: gmail.com, ip: 209.85.219.42, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f42.google.com with SMTP id s11so1927671qvz.7
        for <openembedded-devel@lists.openembedded.org>; Wed, 28 Jul 2021 10:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WLX9XPT//bpUrAmsvhkqE1UXkoOovS7GwIo3D9EzYN4=;
        b=q1ng+IN5MHOesesywh0vEV7RKGEvZTi2w7jxEdZxxQd8ckRM7MxjzVp63OcA5f6BTo
         oYanP3TGf2yrd1VV3cShp9VybTYI1XSLl/wj76iI+GaH550kN8cUctyfmsM8oaEX3TYc
         xtJlCrPc94vFdsEpVJlMoDV88ZYexVnRWotnu5Rirj2VIh/tDpuULegjFfeHGLqFIzjd
         faFQ6bydsojf9ZVg+s+SOWCDGeBU/Sdn0OH7oSFmyq1BhDFyGH80fl2S8uoJif0OlbHk
         K0JSDtW92i6L/Mro3uPHDtXEavWZ6M8dw0FL8dj7Oc6JwmWMQUEJJGsoiLOLqYFlbOku
         FQWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WLX9XPT//bpUrAmsvhkqE1UXkoOovS7GwIo3D9EzYN4=;
        b=P2VD+mraQjfIAe1x2qvgfQJyyneRG54u7/ZzxuUIMV7lPEgcrgQOESHkP864RIgRO9
         hUQTRQ29DjpdJrBjaHcl3CsKCTNssdEqH9gLpAVsJsfSSUVZKYn1bgrcSjsCSD/gtE61
         16l+3fJeNEdY9az1TZ/GKjM5VXgjCMvYLpCqNil7LTiRiGt1bx04Vj7YGG8aGf6TIGgL
         shwUmT7JO7OTz+vSLMWNYN1vu3qZ6d9hj1Ub/lmB/iSI8zjDXkaCe6qgAn0CN2whsSoY
         3y//a6PGvzAlGoWX24l9GKgddBDmiSmEj88AcQH3shnvV50rXNIazOwOQ4rexRNNga7E
         Wdvw==
X-Gm-Message-State: AOAM532DtIdI/G5iu2QX7eHTpd310AnuzV+RG/w17IHp6pi6YAhJroRv
	bkEy9wROZb74+twTYfWjAGhhHUzeuLnjoZAaEeKEuMJCxaiwnQ==
X-Google-Smtp-Source: ABdhPJw2p+qfstaZ7CM4yMSz16Pipfttd80kndhALJWV+Ym5n9z8SjimT9f5+EKBLHis8QVYGUBsjgiPc+MSHSxjEEs=
X-Received: by 2002:a05:6214:2a3:: with SMTP id m3mr1043896qvv.55.1627493087163;
 Wed, 28 Jul 2021 10:24:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210728093300.7665-1-anastasios.kavoukis@arm.com>
In-Reply-To: <20210728093300.7665-1-anastasios.kavoukis@arm.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 28 Jul 2021 10:24:21 -0700
Message-ID: <CAMKF1soxQEtozKDYLuQ_vgneSAhKXZHMctu39X2v=DmP8mmZeA@mail.gmail.com>
Subject: Re: [oe] [PATCH] [meta-oe] pm-qa: fix paths for shell scripts
To: Anastasios Kavoukis <anastasios.kavoukis@arm.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>, nd <nd@arm.com>
Content-Type: text/plain; charset="UTF-8"

Thanks Anastasios for contribution sadly it fails to parse

ERROR: /mnt/b/yoe/master/sources/meta-openembedded/meta-oe/recipes-test/pm-qa/pm-qa_git.bb:
Error during parse shell code, the last 5 lines are:
                             | ETA:  --:--:--

        script_basename=`basename ${script}`
        install -m 0755 $script
/mnt/b/yoe/master/build/tmp/work/core2-64-yoe-linux/pm-qa/0.5.2-r0/image/usr/bin/${script_basename}
    done

On Wed, Jul 28, 2021 at 2:33 AM Anastasios Kavoukis
<anastasios.kavoukis@arm.com> wrote:
>
> A commit in the repo of pm-qa:
>
> "adf9df9 Fix path to library files and change shebang line"
>
> Changed the text that sed was using to replace relative to
> absolute paths.
>
> As a result sed was not effectively finding the text
> "source ../include" to replace it, as the sed should be now
> searching for ". ../include".
>
> Similarly for "../Switches"
>
> Signed-off-by: Anastasios Kavoukis <anastasios.kavoukis@arm.com>
> ---
>  meta-oe/recipes-test/pm-qa/pm-qa_git.bb | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-test/pm-qa/pm-qa_git.bb b/meta-oe/recipes-test/pm-qa/pm-qa_git.bb
> index 7e9971ea4..9a60caa6d 100644
> --- a/meta-oe/recipes-test/pm-qa/pm-qa_git.bb
> +++ b/meta-oe/recipes-test/pm-qa/pm-qa_git.bb
> @@ -42,6 +42,7 @@ do_install () {
>      do
>          # Remove hardcoded relative paths
>          sed -i -e 's#..\/utils\/##' ${script}
> +        sed -i -e 's#. ..\/Switches#${bindir}#g" ${script}
>
>          script_basename=`basename ${script}`
>          install -m 0755 $script ${D}${libdir}/${BPN}/${script_basename}
> @@ -54,7 +55,7 @@ do_install () {
>          # if the script includes any helper scripts from the $libdir
>          # directory then change the source path to the absolute path
>          # to reflect the install location of the helper scripts.
> -        sed -i -e "s#source ../include#source ${libdir}/${BPN}#g" ${script}
> +        sed -i -e "s#. ../include#. ${libdir}/${BPN}#g" ${script}
>          # Remove hardcoded relative paths
>          sed -i -e 's#..\/utils\/##' ${script}
>
> --
> 2.17.1
>
>
> 
>
