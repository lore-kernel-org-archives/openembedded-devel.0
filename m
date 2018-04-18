Return-Path: <schnitzeltony@gmail.com>
Received: from mail-ot0-f196.google.com (mail-ot0-f196.google.com
	[74.125.82.196])
	by mail.openembedded.org (Postfix) with ESMTP id 9892C60291
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Apr 2018 10:43:11 +0000 (UTC)
Received: by mail-ot0-f196.google.com with SMTP id d9-v6so1358514oth.10
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Apr 2018 03:43:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=fn3/Ouhy7xifeva6/GMYLT7isOEVUrqjXpoY8vrL0w4=;
	b=KfKAIpiRqT3NnCdMqTy7JiuO7Z2Bp9rNwT/XCbxA0ZWrNM0kBzerKaH9unbMsR2rif
	EXEakEpxujCaZ1poJKW0S2YlfXEEKhBTBTx7Fh04PIAH64JcxYSCj1oZElN5SD7CMMZP
	18YUUQUiD86uCT3ZaaRUIVeIyfnrcQd1cUIFQp9gKtHYBWvMIBY5S3on+SKhY/Eay/5a
	WVcCJE8qcpu4nJVAhRxNEYO5HHnyOHRpsSdChGOc8QdG2jtsE3ebXAa44rKlzrt8iuP9
	XqvYgJMn+wvA2zH+Bf39X94Vjkryeu5pvKx5Y/A3V5WC5AoCGNjtjfXPUHpEzwEhBX4p
	olNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=fn3/Ouhy7xifeva6/GMYLT7isOEVUrqjXpoY8vrL0w4=;
	b=IpxZAZKwrpRDJXrbm4OAiCu6Q/15JnFb7sYNd0AEff+rkzx/LcwJQgdrYQRNXaeHbt
	HdWj2Q0jIl9Uq8vrJ4/wwXBQ9zhISeaY3qsVAFmjwF3PdiZmdK1TdqzzWz1jgwES+OY3
	0DQzcRjuSluG2gkwePcKrxa1WhchcTsx/FvAyTddqmcgzQMo5pI1QNzdh+Zuwg95UwUa
	uFKM/Fiu0IK4Qj00ifaTUn+iSGSu6Hx3SSza8/yEyZzT/dbRJtV8IcXAaDJKkzclkCr5
	4EYJkyuL2sf5MYUsSkKaDUWQTsSLty8RrBVEVzfSse6hB9ddOL9JAxHJ3L8hiBkUlg5t
	RYuQ==
X-Gm-Message-State: ALQs6tAajlAwBnJooXEvCy8wZyUfV3iGTVRXQF9IOf652M96NPiC62gr
	jNfVcxfH1RnT3o7a0ODRpYIjYmeBcAlBnF6FPASxTQ==
X-Google-Smtp-Source: AIpwx48WW4cvs+Zij3VYejoUinaiRWdvvJueJz850tOCL/Rc7GwaofHJxgrovOl2+GbWWJ6M6v2WAiFwjO/FxM+73Gk=
X-Received: by 2002:a9d:1066:: with SMTP id
	o35-v6mr776486oto.299.1524048192260; 
	Wed, 18 Apr 2018 03:43:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.201.25.81 with HTTP; Wed, 18 Apr 2018 03:43:11 -0700 (PDT)
In-Reply-To: <1524042429-22741-1-git-send-email-hongxu.jia@windriver.com>
References: <1524042429-22741-1-git-send-email-hongxu.jia@windriver.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Wed, 18 Apr 2018 12:43:11 +0200
Message-ID: <CALbNGRSieZUg5Hvbnccxxvw6f=dTzYe6DWDO8QTSftN7DPCZrg@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-xfce][PATCH] xfce4-screenshooter: fix parallel build issue
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 18 Apr 2018 10:43:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 18, 2018 at 11:07 AM, Hongxu Jia <hongxu.jia@windriver.com> wro=
te:
> While do an out-of-tree build, if dir panel-plugin is not created
> in time, there is a compile failure:
> ...
> | intltool-merge  -d -u -c ./po/.intltool-merge-cache ../xfce4-screenshoo=
ter-1.9.1/po
> ../xfce4-screenshooter-1.9.1/panel-plugin/screenshooter.desktop.in
> panel-plugin/screenshooter.desktop
> | Died at intltool-merge line 1184, <PO_FILE> line 22700.
> ...
> Ensure panel-plugin subdirectory exists fixes the issue.
>
> The fix refers the following commit:
> ...
> commit 754754b53bbf4c72d7855e9209f1ccecce5cd8dd
> Author: Catalin Enache <catalin.enache@windriver.com>
> Date:   Thu Nov 9 11:12:29 2017 +0800
>
>     xfce4-screenshooter: create src dir before build
> ...
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.9.1.bb =
| 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshoot=
er_1.9.1.bb b/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshoote=
r_1.9.1.bb
> index e449dce..6702d73 100644
> --- a/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.9.=
1.bb
> +++ b/meta-xfce/recipes-apps/xfce4-screenshooter/xfce4-screenshooter_1.9.=
1.bb
> @@ -12,7 +12,7 @@ SRC_URI[sha256sum] =3D "e62b31d9cf06a7414a26400c2ebe7a2=
ae7c2b22aa60f997f25145ea9eb
>
>  do_compile_prepend() {
>      mkdir -p lib
> -    mkdir -p src
> +    mkdir -p src panel-plugin
>  }
>
>  FILES_${PN} +=3D " \
> --
> 2.7.4
>
Acked-by: Andreas M=C3=BCller <schnitzeltony@google.com>

