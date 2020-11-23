Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com [209.85.160.196])
 by mx.groups.io with SMTP id smtpd.web12.36645.1606145661370755767
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Nov 2020 07:34:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=VFAc5glT;
 spf=pass (domain: gmail.com, ip: 209.85.160.196, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f196.google.com with SMTP id 7so13642365qtp.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 23 Nov 2020 07:34:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RR8vg+C1cw1qnCkJogrXoVeNnkryAF2J0SNlgu8NjWI=;
        b=VFAc5glTeRyG7JAq+51jIYjMYWSNW4gHOA8eNOXEzwU+E3cFtAO5Mm3Q3LDII0W2Hg
         0HJOMNI4nGON/3PniN67Wb5+ULBeJ4+xCoo5IbcRJA/Med/gry9dRTXbEPRsgiNJLoh1
         6lfR2NNIsRFuX7rTyF9nFJEvH5HZkoHoA7FC51wOtSw13ah/rqxUeiqvdCUI07ZcejF5
         u1hkYvRZ7rsk/GCSvjQNIpqreXCNoAhCDgH2TDWIr2rwJem6r31EzjOeIBFAbBCAuNTt
         LjS61ekkhWJRPt+PbzVGXlDFT6ULsRh78U11vYdA5kFH2hG3NLTyUxlX5BirIZcnFyTb
         fQCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RR8vg+C1cw1qnCkJogrXoVeNnkryAF2J0SNlgu8NjWI=;
        b=eQ0MGkYXBg5puLl66HjUWJc8HfcwYc7bHmrx3yt8YVMdK8WC2lBVhF4G5k8oWOYj3L
         oJ2sgsozvnOqGVl1CqGMCgfa2zQUE1LfE5kBFnfiI3kdCxx5FkGC0op6a49To/XRUXj2
         E6oO2O5H/QNjrIcnbWQ516igiZGNVPf4RdOZFOWGwITIyD8Ew1hi70u5yugvJwYOb2VY
         x0q4VJZy2bYmX69Q1l2fo7r8dGdFCuGpSOWVXMqZe+CLx6+iuOvA/hmn5FJ07nFjI9cn
         pjccjd0xNP3L764Vrvike4ge7tMpgSU5JROa5p0Rl676QaNnjD/LheiulsnlknQaHNwP
         FjqQ==
X-Gm-Message-State: AOAM532q2HFBnCUsHjRTdyxlkLZmTXxgLDp6vys0X+CRM3Ni8/aGW8C0
	f++Y7QjRWl5WECKYP69Vn4xTeLHS8P7Eglg2oIQ=
X-Google-Smtp-Source: ABdhPJygrtx7xTjj/LN4RgdkzvxFMqW7wYjFaA8+E7HFbQO8VyQh7AumkhicC1TJRIry+XYXBGtuDQJui4Ncl4CgPsQ=
X-Received: by 2002:aed:2962:: with SMTP id s89mr15449789qtd.88.1606145660310;
 Mon, 23 Nov 2020 07:34:20 -0800 (PST)
MIME-Version: 1.0
References: <20201123141611.7329-1-Joshua.Watt@garmin.com>
In-Reply-To: <20201123141611.7329-1-Joshua.Watt@garmin.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Mon, 23 Nov 2020 07:33:54 -0800
Message-ID: <CAMKF1sqKCKCo3h2+z=yhy1PqG1K1s0+DU5-LjKayO0ckL7gf0Q@mail.gmail.com>
Subject: Re: [oe][meta-oe][PATCH] fcgiwrap: add recipe
To: Joshua.Watt@garmin.com
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>, 
	Senthil Selvaganesan <SenthilKumaran.Selvaganesan@garmin.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 23, 2020 at 6:17 AM Joshua Watt via lists.openembedded.org
<Joshua.Watt=garmin.com@lists.openembedded.org> wrote:
>
> From: Senthil Selvaganesan <SenthilKumaran.Selvaganesan@garmin.com>
>
> fcgiwrap is a simple server for running CGI applications over FastCGI.
> It hopes to provide clean CGI support to Nginx and other web servers
> that may need it. Homepage: https://github.com/gnosek/fcgiwrap.
>


lets add it to packagegroup-meta-webserver.bb as well

> Signed-off-by: Senthil Selvaganesan <SenthilKumaran.Selvaganesan@garmin.com>
> Signed-off-by: Joshua Watt <Joshua.Watt@garmin.com>
> ---
>  .../recipes-support/fcgiwrap/fcgiwrap_git.bb  | 22 +++++++++++++++++++
>  1 file changed, 22 insertions(+)
>  create mode 100644 meta-webserver/recipes-support/fcgiwrap/fcgiwrap_git.bb
>
> diff --git a/meta-webserver/recipes-support/fcgiwrap/fcgiwrap_git.bb b/meta-webserver/recipes-support/fcgiwrap/fcgiwrap_git.bb
> new file mode 100644
> index 000000000..f33b066c0
> --- /dev/null
> +++ b/meta-webserver/recipes-support/fcgiwrap/fcgiwrap_git.bb
> @@ -0,0 +1,22 @@
> +SUMMARY = "FastCGI wrapper for CGI scripts"
> +DESCRIPTION = "FcgiWrap is a simple server for running CGI applications over FastCGI. Fcgiwrap can be used together with Nginx to serve CGI or Perl scripts"
> +HOMEPAGE = "https://github.com/gnosek/fcgiwrap"
> +
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=a95d02d614a3a0232d4e6e51b7963c5b"
> +
> +SRCREV = "99c942c90063c73734e56bacaa65f947772d9186"
> +SRC_URI = "git://github.com/gnosek/fcgiwrap.git;protocol=https"
> +
> +DEPENDS = "fcgi"
> +S = "${WORKDIR}/git"
> +B = "${S}/../build/"

this seems redundant

> +CFLAGS_prepend = "-I${S}/../build/"

perhaps =+ is fine here without prepend

> +EXTRA_OEMAKE = "VPATH=${S}"
> +
> +inherit autotools pkgconfig
> +
> +do_install() {
> +    install -d "${D}/usr/sbin/"
> +    install -m 755 ${B}/fcgiwrap ${D}/usr/sbin/fcgiwrap

install -Dm 077 ${B}/fcgiwrap ${D}${sbindir}/fcgiwrap

would be a single liner
> +}
> --
> 2.29.2
>
>
> 
>
