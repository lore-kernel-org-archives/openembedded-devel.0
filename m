Return-Path: <ticotimo@gmail.com>
Received: from mail-it1-f179.google.com (mail-it1-f179.google.com
	[209.85.166.179])
	by mail.openembedded.org (Postfix) with ESMTP id 133807E05D
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Jun 2019 06:56:01 +0000 (UTC)
Received: by mail-it1-f179.google.com with SMTP id m3so1196153itl.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 Jun 2019 23:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=iigSwMnVM4LgI9fwarxF6j/j/AvTmuq1GpeRGvvxzkA=;
	b=oyVcti1FZgHaDZLI4A01WJJ0f+MZHAHkTo5AyN2LxNaZNHeZhC4qtmUwvperxt/i7y
	mfNXzjOtppqeInexe8lSb5kX0dHa4qzvjMtzUF8xspY3xrUgVPtCHM1E4rShM5I93fpL
	5Wk9JoRxKnYUHn91l+jT/1uN9dEqf0t8HNPVIWqeND/VIgldHXOz21BWiMBOmWcQYZFn
	PfH6+HrxcJNhPH/OVR4BkE4M5FAyFAmnZjtKNiQ44MPFjW7lgzP6D7n7Ej/TGixxtJqQ
	OhzXhnk3OJ2R9PuROqv2FkJhTlWcP1Fek1Hz+11oFY+1PNSp5eT/k6LX4gvnqMcN4m4I
	j7cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=iigSwMnVM4LgI9fwarxF6j/j/AvTmuq1GpeRGvvxzkA=;
	b=iUPiBxA7WkRg4+pmm6Rym3dHBOs27THooM1n9yN6Pa8MPcKY4j2zzq4bdReMLIyiww
	g5BgTbEFfQTHdiTO8NrPyuP4sapl1le1XpuSD0U5SJJZP17WYt+kFuTOkkEm9uMe1AHc
	ldkQmCzF3/EQvJdk6sLrhcOrAYAc3ajm5CKLpbWTD4A5l+cxwY/Uby8yxtY+/JfbFsoS
	arFLc/mtZY8lo/xcsNuqrSkAFuUPVU+1G44WXyYUVvfhuBPbUz6cBiCVWXacSy6cycis
	GF4CdPbQiUR2LymAteRqBxoUzG21tDWlMNTlrG5Je6CcbnezBAHx76HxMOW+LMUh9kND
	rVsg==
X-Gm-Message-State: APjAAAU5HkappbbY9/QqWcPrCiidZ9Qp7yj1GrUs5m52kXkcfS2uBB0X
	tjgC9KLvyz+ywYoWtJ6StopKS4pnFRzUC5pM3QY=
X-Google-Smtp-Source: APXvYqxy5YgzSypUtKr33x6zwEs15JcTgR1NYsnvILL8n7TUCoUXDJj4VDuWNlg/revYXXuC1qZIfJinAQYA6ZEep6M=
X-Received: by 2002:a24:a43:: with SMTP id 64mr3201061itw.100.1559890562894;
	Thu, 06 Jun 2019 23:56:02 -0700 (PDT)
MIME-Version: 1.0
References: <20190606033611.11531-1-zangrc.fnst@cn.fujitsu.com>
In-Reply-To: <20190606033611.11531-1-zangrc.fnst@cn.fujitsu.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Thu, 6 Jun 2019 23:55:52 -0700
Message-ID: <CANx9H-Ci9Fpot+2YhEOTTvpqdcNUR5_eXGgWYHARL7A08x_pFg@mail.gmail.com>
To: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-python] [PATCH] python-pbr: upgrade 5.2.0 -> 5.2.1
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
X-List-Received-Date: Fri, 07 Jun 2019 06:56:02 -0000
Content-Type: text/plain; charset="UTF-8"

This recipe has no python3 version and will be at risk of being dropped
when python2 is EOL. Can you consider refactoring and provide a python2 and
python3 version please?

On Wed, Jun 5, 2019 at 8:35 PM Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
wrote:

> -Upgrade from python-pbr_5.2.0.bb to python-pbr_5.2.1.bb.
>
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  .../python/{python-pbr_5.2.0.bb => python-pbr_5.2.1.bb}       | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-python/recipes-devtools/python/{python-pbr_5.2.0.bb =>
> python-pbr_5.2.1.bb} (62%)
>
> diff --git a/meta-python/recipes-devtools/python/python-pbr_5.2.0.bb
> b/meta-python/recipes-devtools/python/python-pbr_5.2.1.bb
> similarity index 62%
> rename from meta-python/recipes-devtools/python/python-pbr_5.2.0.bb
> rename to meta-python/recipes-devtools/python/python-pbr_5.2.1.bb
> index a42388797..ccc75de8d 100644
> --- a/meta-python/recipes-devtools/python/python-pbr_5.2.0.bb
> +++ b/meta-python/recipes-devtools/python/python-pbr_5.2.1.bb
> @@ -2,8 +2,8 @@ inherit setuptools
>  # The inc file is in oe-core
>  require recipes-devtools/python/python-pbr.inc
>
> -SRC_URI[md5sum] = "2bca008fd08d035a2f78c606d876a6db"
> -SRC_URI[sha256sum] =
> "d950c64aeea5456bbd147468382a5bb77fe692c13c9f00f0219814ce5b642755"
> +SRC_URI[md5sum] = "f72c2dd10602abad3695097d634e94bb"
> +SRC_URI[sha256sum] =
> "93d2dc6ee0c9af4dbc70bc1251d0e545a9910ca8863774761f92716dece400b6"
>
>  do_install_append() {
>          if [ -f ${D}${bindir}/pbr ]; then
> --
> 2.20.1
>
>
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

