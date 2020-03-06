Return-Path: <martin.jansa@gmail.com>
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
	[209.85.208.54])
	by mail.openembedded.org (Postfix) with ESMTP id 6E891619D2
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Mar 2020 07:54:48 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id a13so1390235edu.7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Mar 2020 23:54:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=XU8+xRpN7MrCSG4qO7FvWWmfGhwOaKVenKCf9m8f/YQ=;
	b=rOn1319e+udRcLYDo+MLSTqCkxw9WRI/JF6Lp1xfzAHFTYQlMWPCJ0IgMjnAVuIa4t
	ZclqiCl0/AE1xG2UJyJE7qiGl66YY26eKUXcSGgBHQPsdvTl+xV+S2MV4pyEnOQg8kiZ
	TbkrZ7VNx5ciZhcBAjRxdgm1DVNx7XjEc6p1ufWMyRvwl81Vw7mZYW+oRpJY2Gxdv2bL
	Age2nrnbtkcVwkJNyGBZjW+boUSE3NPYADR6D3wVunXWVwLUjvFYI8lFp4vOhO4i4Xkw
	zy484r/lUVvM8rZQolLDJcd5hSMIkMYuz0K7z5OWv0euVo76+1RXb9mpx0Cgn8NQ/Xb3
	XjPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=XU8+xRpN7MrCSG4qO7FvWWmfGhwOaKVenKCf9m8f/YQ=;
	b=JPxX5BNcc9BRqvaU1oyvwz/xp8V3z75uqom5G67TRevNw3rvapwWYdybSPsXNRhbxD
	cd+TydvkEgFuF0l2jsoBXf1MQTnOFEATQEogkSDHtmu1fbe63RwyPjBKXyPab01qqoLm
	DR8XGfmQ3m+Grf0qKlEgSpMOOYfI7xAcKI6C8fnBtaiJemR88N3RPq1Ja5bFiXpxdlnu
	hWzIyQb+bHb8q8PZS1esujUI1LoQJJWwC2TEB2jFp5Ame0M/NyiqpBPD9TKxef1TKEI6
	6QgJ71kelS7mYAnFzeSUoS/6O0lq/gTzK7xFl1onoWrw3D3RJQQtNnuX+L4VdMTQupPn
	VBBQ==
X-Gm-Message-State: ANhLgQ2WQtVj2+YWiraaSuW4TlIhE4l0yUSSvJd+Hvyajo2L7PiIiSSn
	3k2FpI7F7lyXXl5bpCRNDsntfVOSVIn2baNDF7s=
X-Google-Smtp-Source: ADFU+vuSPpIUUZyjhO97F/LV1gsn5BtGM2gx27qtzbSKBhz2FkdSM1KsbOpXkohCK/w6+F+C9L/oDbxT3dhg7i1B97I=
X-Received: by 2002:a17:906:46cb:: with SMTP id
	k11mr1766035ejs.285.1583481289003; 
	Thu, 05 Mar 2020 23:54:49 -0800 (PST)
MIME-Version: 1.0
References: <1583473076-316898-1-git-send-email-changqing.li@windriver.com>
In-Reply-To: <1583473076-316898-1-git-send-email-changqing.li@windriver.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 6 Mar 2020 08:54:37 +0100
Message-ID: <CA+chaQeyJH+C1u6bmi+6oLm5EqwTUyavb_E1WBz7RNJ4+Yf4EQ@mail.gmail.com>
To: Changqing Li <changqing.li@windriver.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] layer.conf: add meta-python to LAYERDEPENDS
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
X-List-Received-Date: Fri, 06 Mar 2020 07:54:48 -0000
Content-Type: text/plain; charset="UTF-8"

Can we fix mozjs instead?

On Fri, Mar 6, 2020 at 6:38 AM <changqing.li@windriver.com> wrote:

> From: Changqing Li <changqing.li@windriver.com>
>
> yocto-check-layer/test_world failed since error:
> ERROR: test_world (common.CommonCheckLayer)
> ERROR: Nothing PROVIDES 'python3-pytoml-native' (but
> /meta-openembedded/meta-oe/recipes-extended/mozjs/mozjs_60.9.0.bb
> DEPENDS on or otherwise requires it). Close matches:
>   python3-numpy-native
>   python3-pycairo-native
>   python3-rpm-native
> ERROR: Required build target 'meta-world-pkgdata' has no buildable
> providers.
> Missing or unbuildable dependency chain was: ['meta-world-pkgdata',
> 'mozjs', 'python3-pytoml-native']
>
> mozjs depend on recipe under meta-python, but meta-python
> isn't in LAYERDEPENDS, so error occurred. Fix by add
> it into LAYERDEPENDS.
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  meta-oe/conf/layer.conf | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/meta-oe/conf/layer.conf b/meta-oe/conf/layer.conf
> index c537736..0ce0ad2 100644
> --- a/meta-oe/conf/layer.conf
> +++ b/meta-oe/conf/layer.conf
> @@ -27,7 +27,10 @@ BBFILE_PRIORITY_openembedded-layer = "6"
>  # cause compatibility issues with other layers
>  LAYERVERSION_openembedded-layer = "1"
>
> -LAYERDEPENDS_openembedded-layer = "core"
> +LAYERDEPENDS_openembedded-layer = " \
> +    core \
> +    meta-python \
> +"
>
>  LAYERSERIES_COMPAT_openembedded-layer = "thud warrior zeus"
>
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

