Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10E62CA0EE4
	for <webhook@archiver.kernel.org>; Sun, 17 Aug 2025 09:20:19 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web11.49981.1755422408579079501
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 Aug 2025 02:20:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LJDiICIY;
 spf=pass (domain: gmail.com, ip: 209.85.208.42, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6197efa570eso2200220a12.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 17 Aug 2025 02:20:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755422407; x=1756027207; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2RKf4awJ2v0E7oxcl6Py/Bj4Kt8fY8IgPPp2ccwsYvo=;
        b=LJDiICIYyMqkWI2mu42qP0GDHJ1pHmBT6DDbcVH7TJioLEs5wtDpwm3Cqaj1U+BnTj
         wK3sRfTSl2d4ztafFkWQVTK6Be0TvwCz4EdN+T43VhVcn9x4mHaf+OFiM9fvwWVZjPQg
         vnI7QVL9fisuEQMdEpfdYozcubzT+H6phtNWqW+S7QQY0sOT/K0q9AFHH6Yx36WzbzIA
         K3Pku3YkaNaZYT4ZhKSVh/zSQIWkLR+Ff0zXtkU7eHbjH6Zg0MC9IF8ul+vTZxIe7k9a
         Xn+MqHu0mI9BY97lZcmBdx46rAkPBA20CI5KugCqdBv7bgRXJ+tUWNRwlzr5myCzDsui
         wIMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755422407; x=1756027207;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2RKf4awJ2v0E7oxcl6Py/Bj4Kt8fY8IgPPp2ccwsYvo=;
        b=B48GnVVxQ6V40Cx7BqCyQpZMkHufIM9FxiV1CVwAvY49v0POEyfy2d/lEzRxCI5Osn
         Gm1X7YXfSndaxnHlAGRaazJ5tGeq7Qh0u9+eSJlfJIvrmnoP41MyVd10fIZSJueTBSba
         7bNnmMxStTkN4+rYamxUOcJUSlJ6omRsWxKh3dJiLQLRD0FoCVXi9rvRiOcwv7Asxcq7
         792od08St7Wd1XrVwG33j7TBGGLDWW1VF1wsHfpmJcnP1ODjw7d2OS1vn6Onb6AwOnTy
         ou+GV8kyHmyN+srl5tBZfKNt1V4ShzynG1ukUrl3qpU7PZpV0LAxjx+/2x/nzE21AQAe
         x8eA==
X-Gm-Message-State: AOJu0YyEjapdL1x6mFyXNyb1z0uEcWcIle5oedzWQ4n9Ln1zl5EQ0GGG
	bCFkg9itgvBWZutxoXuj/U6PgxHscGNJ9uweE/LcDPX3vCgnmnxYeMpWbIO4wg==
X-Gm-Gg: ASbGncsjmZhvP372ucpdAP8Pednt726C/brPHGZ00DiVlPrPAHrSwMd/jBYHZvDS2xf
	6cKeIDoDX1FD+GK4fczxvMDtuZOurDYMX/fXvE+2b5+draiyqzEOIJVFpfNFfp2siXGDU7DRKWk
	EWLsuiJWoHszp9aEwUSXkawPMHvZBNZbkpQaw01hPZy3jsdc/9U5LxAKv5pobSkixtSom5qrmJl
	Xhdb+3H5DDcQoC3FY7q94dTphwkFqi4u3YjfohjpZhOlqTpWffui1Ed1vue/O0fUhhJ4kAt1OF/
	2ZmtgyTZYSvYRozuil2uA/8UGXJWcW/TWbntWJPtpgh1bHsbdlVVs+AMGhAoqQIZxqS4M7xCHtH
	tmK8HpWgafXwCqOlzC/xzzrZdrciwn+aZIwVaeulR0Q==
X-Google-Smtp-Source: AGHT+IHTFhg5rch75fVsIaNOdr6ThDudeDv4dAIhCh2yPWwhK/8MdnQvF3moxQdj5PYF0DkSORUDzA==
X-Received: by 2002:a05:6402:2102:b0:618:10c3:d799 with SMTP id 4fb4d7f45d1cf-619bf20ff00mr5322436a12.28.1755422406724;
        Sun, 17 Aug 2025 02:20:06 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-618af9da4aesm4800577a12.15.2025.08.17.02.20.06
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 17 Aug 2025 02:20:06 -0700 (PDT)
Message-ID: <a9af725a-1a3a-4e29-99d3-441593077e39@gmail.com>
Date: Sun, 17 Aug 2025 11:20:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][PATCH] gitpkgv.bbclass: inspect repository in
 UNPACKDIR
To: openembedded-devel@lists.openembedded.org
References: <185C8340ADC0E6D9.8958@lists.openembedded.org>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <185C8340ADC0E6D9.8958@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 17 Aug 2025 09:20:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118982

In my testing it looks okay, but if someone else could test/review it
also to see if it makes sense, it would be useful.

On 8/17/25 11:17, Gyorgy Sarvari via lists.openembedded.org wrote:
> When BB_GIT_SHALLOW = "1" is used, the unpacked gir repository doesn't
> exist in the download folder, and the class isn't able to instect the
> details of the repository.
>
> Instead inspect the repository it the UNPACKDIR.
>
> Reported-by: WXbet <WXbet@proton.me>
> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> ---
>  meta-oe/classes/gitpkgv.bbclass | 17 ++++++++++++-----
>  1 file changed, 12 insertions(+), 5 deletions(-)
>
> diff --git a/meta-oe/classes/gitpkgv.bbclass b/meta-oe/classes/gitpkgv.bbclass
> index eb4b1eae9a..1afe9c53d8 100644
> --- a/meta-oe/classes/gitpkgv.bbclass
> +++ b/meta-oe/classes/gitpkgv.bbclass
> @@ -59,6 +59,9 @@ def get_git_pkgv(d, use_tags):
>      from shlex import quote
>  
>      src_uri = d.getVar('SRC_URI').split()
> +    unpackdir = d.getVar('UNPACKDIR')
> +    def_destsuffix = (d.getVar("BB_GIT_DEFAULT_DESTSUFFIX") or "git") + "/"
> +
>      fetcher = bb.fetch2.Fetch(src_uri, d)
>      ud = fetcher.ud
>  
> @@ -78,20 +81,24 @@ def get_git_pkgv(d, use_tags):
>      found = False
>      for url in ud.values():
>          if url.type == 'git' or url.type == 'gitsm':
> -            if not os.path.exists(url.localpath):
> +            destsuffix = url.parm.get("destsuffix", def_destsuffix)
> +            subdir = url.parm.get('subdir', '')
> +            destdir = os.path.join(unpackdir, destsuffix, subdir)
> +
> +            if not os.path.exists(destdir):
>                  return None
>  
>              found = True
>  
> -            vars = { 'repodir' : quote(url.localpath),
> +            vars = { 'repodir' : quote(destdir),
>                       'rev' : quote(url.revision) }
>  
>              rev = bb.fetch2.get_srcrev(d).split('+')[1]
> -            rev_file = os.path.join(url.localpath, "oe-gitpkgv_" + url.revision)
> +            rev_file = os.path.join(destdir, "oe-gitpkgv_" + url.revision)
>  
>              if not os.path.exists(rev_file) or os.path.getsize(rev_file)==0:
>                  commits = bb.fetch2.runfetchcmd(
> -                    "git --git-dir=%(repodir)s rev-list %(rev)s -- 2>/dev/null | wc -l"
> +                    "git -C %(repodir)s rev-list %(rev)s -- 2>/dev/null | wc -l"
>                      % vars, d, quiet=True).strip().lstrip('0')
>  
>                  if commits != "":
> @@ -107,7 +114,7 @@ def get_git_pkgv(d, use_tags):
>              if use_tags:
>                  try:
>                      output = bb.fetch2.runfetchcmd(
> -                        "git --git-dir=%(repodir)s describe %(rev)s --tags --exact-match 2>/dev/null"
> +                        "git -C %(repodir)s describe %(rev)s --tags --exact-match 2>/dev/null"
>                          % vars, d, quiet=True).strip()
>                      ver = gitpkgv_drop_tag_prefix(d, output)
>                  except Exception:
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#118981): https://lists.openembedded.org/g/openembedded-devel/message/118981
> Mute This Topic: https://lists.openembedded.org/mt/114745266/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


