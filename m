Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
	[209.85.128.48])
	by mail.openembedded.org (Postfix) with ESMTP id 387267DBC8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Apr 2019 11:17:15 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id z24so10601539wmi.5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Apr 2019 04:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=JsFKvuPi3TDAZNk1ggdmTDk2vCOyXflSgayxbL6Egvw=;
	b=veFC47VekrnohzqommBEjfuYBNEOwt06iQcj+XCVHoI0vBYq4eZIaKbNxmWcykwqAU
	/X3/Voa23A8XIf+S0hV3FGjOv91U6XFcj2ZPmRhAFlZM97O26zcqomvG+K1giHy5R6mR
	Wp7Mh1Kv8M8ozjOQA217yskhAhlZMB+ZRq3TooJ06n7dxk1Rc4KdMJlW+ssoLcrm5d54
	cZZzcsOhv9LOaxzDuKmcCfR6WkUC/HDqHH7mZSBcILM1p1SsT8ykWsa45W9jjwqMOaJ8
	OlQg6no1OP1nJrbeS+R5X+lYcOAVmGhxLaA/uW0ivWUIWq5KuxdYmKnVQfSMV1eVJADs
	F0Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=JsFKvuPi3TDAZNk1ggdmTDk2vCOyXflSgayxbL6Egvw=;
	b=AY60KTVZTLH1+jchWm4jW2JBpkPdZfxxm3B/1CuCke4NNJmO3hLqlDphULClvpObOp
	x7YNwWosmTDaheeCETIE1+6K0HYaSRrtaZbQ9TcfxRA4c7Hat2BKyxS5FiV7MI6SjS+U
	RSaiWNrF9cPXj0Bn98sEzYnTO+5qQDmCf9sNcWvJiLvQq+ba1KARieoxkJgrAi+k/x+R
	QQpEHGN/tmgo6oMIykMYtk6uFYPNTRtYsZmYeU0EvH4QWizmM29d9But+lWdJdNB4sUU
	hmsEswFpUEUJEIP+gi9flPST2vnRxiTqkGxspPXdnn8eYoq0d3uCNBHKvC4Jvq16rWsP
	Up1Q==
X-Gm-Message-State: APjAAAXhzds2GK7zDgMlNIFT7wkGgmBQYDiVbTJrLkQAdvStW3jzcSW5
	faL9kZl08h6QRbvze9JcFPOo2HKLmJHPQ0FF7p4=
X-Google-Smtp-Source: APXvYqz6LuqUz/KYoNnvSphaOputZRQ4cUfD3IgHJS0/G4OsYDVfQSA2S2fcILos1gCg1qJ/eW/titQVonwE5+Wk1NQ=
X-Received: by 2002:a1c:2d0e:: with SMTP id t14mr10025556wmt.33.1555067835920; 
	Fri, 12 Apr 2019 04:17:15 -0700 (PDT)
MIME-Version: 1.0
References: <1553566774-8056-1-git-send-email-akuster808@gmail.com>
In-Reply-To: <1553566774-8056-1-git-send-email-akuster808@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 12 Apr 2019 13:17:11 +0200
Message-ID: <CA+chaQe1b7cvszjtJpwBFn9a3-GZS_i8M+wSk9s25KXVxhLTUA@mail.gmail.com>
To: Armin Kuster <akuster808@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 1/2] ftgl: package requires openql add DISTRO_CHECK
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
X-List-Received-Date: Fri, 12 Apr 2019 11:17:15 -0000
Content-Type: text/plain; charset="UTF-8"

Shouldn't this be opengl _and_ x11 like freeglut?

freeglut was skipped: missing required distro feature 'x11' (not in
DISTRO_FEATURES)
ERROR: Required build target 'meta-world-pkgdata' has no buildable
providers.
Missing or unbuildable dependency chain was: ['meta-world-pkgdata', 'ftgl',
'freeglut']

On Tue, Mar 26, 2019 at 3:19 AM Armin Kuster <akuster808@gmail.com> wrote:

> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  meta-oe/recipes-graphics/ftgl/ftgl_2.1.3-rc5.bb | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-graphics/ftgl/ftgl_2.1.3-rc5.bb
> b/meta-oe/recipes-graphics/ftgl/ftgl_2.1.3-rc5.bb
> index b291159..c5eaf42 100644
> --- a/meta-oe/recipes-graphics/ftgl/ftgl_2.1.3-rc5.bb
> +++ b/meta-oe/recipes-graphics/ftgl/ftgl_2.1.3-rc5.bb
> @@ -3,7 +3,9 @@ HOMEPAGE = "https://sourceforge.net/projects/ftgl/"
>  LICENSE = "MIT"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=527a83e92c7bf363025380eec05df6e4"
>
> -inherit autotools pkgconfig
> +inherit autotools pkgconfig distro_features_check
> +
> +REQUIRED_DISTRO_FEATURES = "opengl"
>
>  DEPENDS += " \
>      freetype \
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

