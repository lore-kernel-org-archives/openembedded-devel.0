Return-Path: <danismostlikely@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id 2BBCC60043
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Mar 2017 16:42:42 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id r45so6424209qte.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Mar 2017 09:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=EHKccROUde9UvWhSaBkt2+Jg8EFyjznLUTKdM/dKZ5I=;
	b=Oxu3e8agEJndx6SGghFFSn+J/qOEKp+TyqiFd7nNtsTfutVF7xB19yyphf7EKHRcgr
	5aBjBijC5dCVd0NV3pKGFQILomlZ37g2/BDv3qPNFoHcDBCLs/DWAQpGSy+3OARgwHfl
	PtM4tT9963U3GDwTISuUxNLRkIjaeVi9B/5+YnPv+Lp2LWS671wO6ohJRUdQAeNxXFrM
	rSQ5M8Z00uVqEKNAll8BAwAUPTYWSUcKlvuMj4QxsOqtctKCSwl2DdnrEiGExtMPZ7TT
	XgB9NJWzy/rPlWW9fsGyLvLaoL48+Xrw1c9drVzLAe8IV2i4I0lqOAUtrf9FIGkXS2jb
	zvkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=EHKccROUde9UvWhSaBkt2+Jg8EFyjznLUTKdM/dKZ5I=;
	b=YOC02o2UU28LAsX4sFdSpNjwibxrwdDw1dsDCCoSDwcxpIu4cjtXk0zQodjyMakRmy
	6Z8hzCJMrUzsCexP+XlknR/VSN5kopp05hk4ppfcB5snPp9hpP/k71uHoenr32VWhqDu
	iD/ousxRYyJJXO0vmbZAAiN6nvrvZhV+bmnYCcqARlUNahJyBsTRc5BR6g6o+u0q8Lqp
	i82BjOpTKSSMNsOmQQrUi0h52YIqb1K0uPS9KmjOwKURiLT9mndVLD8G8Y4bD10vF6QR
	dhBWpBaYJgSzMpMATJYggJJU+FC0oOxoE81QK3urlHVo4QwYjWpvXZqHuRlzPxlvpZFh
	gmuw==
X-Gm-Message-State: AFeK/H3e8QpTOUU769ULNuy5QiVzZTBuu18WUDakn3zsuMFBztHldvDNeCJaaCDKcU5a8Um9HGxP/AjRClZ2sw==
X-Received: by 10.237.49.131 with SMTP id 3mr9023542qth.174.1489682563805;
	Thu, 16 Mar 2017 09:42:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.55.77.18 with HTTP; Thu, 16 Mar 2017 09:42:43 -0700 (PDT)
In-Reply-To: <1489396937-21461-1-git-send-email-maxin.john@intel.com>
References: <1489396937-21461-1-git-send-email-maxin.john@intel.com>
From: Dan McGregor <danismostlikely@gmail.com>
Date: Thu, 16 Mar 2017 10:42:43 -0600
Message-ID: <CACS+7ZT=qTVr=mhaG97YCyPOps4mOhcSS6=g6CPs=BEpSHna9w@mail.gmail.com>
To: "Maxin B. John" <maxin.john@intel.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-java][PATCH] jikes: fix absolute symlink error
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
X-List-Received-Date: Thu, 16 Mar 2017 16:42:43 -0000
Content-Type: text/plain; charset=UTF-8

On 13 March 2017 at 03:22, Maxin B. John <maxin.john@intel.com> wrote:
> The following oe-core commit made asbolute symlink an error:
>
> commit 3eee8e99e114b3db8b718834ca52da8d2919b83f
> sstate: Make absolute symlinks an error
>
> Fix this by inheritting relative_symlinks class:
> ERROR: jikes-native-1.22-r0 do_populate_sysroot: sstate found an
> absolute path symlink
>
> Signed-off-by: Maxin B. John <maxin.john@intel.com>
> ---
>  recipes-core/jikes/jikes_1.22.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-core/jikes/jikes_1.22.bb b/recipes-core/jikes/jikes_1.22.bb
> index 0c33118..a35cfcf 100644
> --- a/recipes-core/jikes/jikes_1.22.bb
> +++ b/recipes-core/jikes/jikes_1.22.bb
> @@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = " \
>                     "
>  SRC_URI = "${SOURCEFORGE_MIRROR}/jikes/jikes-${PV}.tar.bz2"
>
> -inherit autotools update-alternatives
> +inherit autotools update-alternatives relative_symlinks
>
>  BBCLASSEXTEND = "native"
>
> --
> 2.4.0
>

This change makes the layer depend on master, not krogoth or master
like the README says. Should we add the relative_symlinks
functionality locally, or update the README?

