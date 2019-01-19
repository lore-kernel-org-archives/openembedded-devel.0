Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com
	[209.85.222.169])
	by mail.openembedded.org (Postfix) with ESMTP id 6AB617BEF1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Jan 2019 16:24:22 +0000 (UTC)
Received: by mail-qk1-f169.google.com with SMTP id z18so9786958qkj.10
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Jan 2019 08:24:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=5Ohw149hTeZFwMvk0pV6DFFcK39ig4OsVdP//gEwX/Q=;
	b=VX04D+NMOuhY7InOw28JXJAvszqjotGCctbMZ6ab13cMXPmKWJLuPwFQJmRSn3UCmq
	XNfi2geInyfJGRVhR46BbH/gARrYtGzRDoRLVmEOoxyEoeQUYlnO3viUOu4xBGW4Th49
	oEt4e+w9ZXGuqjCiIq/un0ClNz63HxrCmU/St6uAQ+4TdJ85bOYm4QQ8i0sFFEV4WZ6J
	+nbbVIW/oLGLPx8u4aDgsQVFSMR5t/hIoS78g2KjvAJi2IL4+fMO76zZKiJHO4+Q5rA5
	CTDz/nE9xk50o7d+IHga/fBgLjuDcnfqQrnSR7gtXSt5Bl2FzTzcO1+esrYmDoRBioJP
	OR1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=5Ohw149hTeZFwMvk0pV6DFFcK39ig4OsVdP//gEwX/Q=;
	b=YZSP7XuRXFcPxcFUNHQnj9+kHZ3kRstb1j8YVJAdcu6ZYw9f4sL1KySZKd3aoARSkn
	TilePFhWlGjqIkGQOIfm/eEtGjeBKGWUmNiTx+WzUDpJJQWADVDM0C9aQCK9JoMamJEr
	x37JgkdxucOMd3+LySbh9F2DRy8kKlzSw4KDkT61UAIDFHMrH+pjVjdIC3UuvGJ+AArh
	41XnHbxkr8fYI1cGBhyyXa1TpBEBAPEb/vh4AaIJGqbzbA7XX66s/KIPAm/8MyU/o8iF
	peDq1p0VNOTbYVG8n09gIYjDRX9zT47/HWz3vbIFiob18FZeUlLiQUZOECkBRth52zhr
	8KNA==
X-Gm-Message-State: AJcUukeLSM1xaYVqFRxjlB1nw9smVRNKLYec8zQDTk9HV9NVQ5o7RM1D
	rsYNEJ66v/1pulIHn5lMKhA6s8A+5FD/J2S40oA=
X-Google-Smtp-Source: ALg8bN53hzrXEuw4nnzcz13G1ldolbXE2HZM9UJBF6x0djee7NlrTZgyMpMJyYbvjhveZkLKPSwuphvvHqaefn7ToQ4=
X-Received: by 2002:a37:a80a:: with SMTP id r10mr19683762qke.2.1547915063066; 
	Sat, 19 Jan 2019 08:24:23 -0800 (PST)
MIME-Version: 1.0
References: <20190119134320.9082-1-shantanu@senic.com>
In-Reply-To: <20190119134320.9082-1-shantanu@senic.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 19 Jan 2019 08:23:56 -0800
Message-ID: <CAMKF1spKp_MyCLEfD-cArEKMsW5h=45HdCjRU+Y1h1gHyFpMwA@mail.gmail.com>
To: Shantanu <shantanu@senic.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Shantanu <baali@muse-amuse.in>
Subject: Re: [meta-oe][PATCH] Add recipe for python bindings of Berkeley DB
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
X-List-Received-Date: Sat, 19 Jan 2019 16:24:22 -0000
Content-Type: text/plain; charset="UTF-8"

Thanks for your contributionIt fails to buildERROR: Nothing PROVIDES
'python3-core' (but
/mnt/a/yoe/sources/meta-openembedded/meta-python/recipes-devtools/python/python3-bsddb3_6.2.6.bb
DEPENDS on or otherwise requires it). Close matches:  python3-nose
python3-chardet  python3-redis  python3 RPROVIDES python3-coreERROR:
Nothing RPROVIDES 'python3-bsddb3' (but
/mnt/a/yoe/sources/meta-openembedded/meta-python/recipes-devtools/python/python3-bsddb3_6.2.6.bb
RDEPENDS on or otherwise requires it)No eligible RPROVIDERs exist for
'python3-bsddb3'NOTE: Runtime target 'python3-bsddb3' is unbuildable,
removing...Missing or unbuildable dependency chain was:
['python3-bsddb3']ERROR: Nothing RPROVIDES 'python3-bsddb3-dev' (but
/mnt/a/yoe/sources/meta-openembedded/meta-python/recipes-devtools/python/python3-bsddb3_6.2.6.bb
RDEPENDS on or otherwise requires it)No eligible RPROVIDERs exist for
'python3-bsddb3-dev'NOTE: Runtime target 'python3-bsddb3-dev' is
unbuildable, removing...Missing or unbuildable dependency chain was:
['python3-bsddb3-dev']
On Sat, Jan 19, 2019 at 5:44 AM Shantanu <shantanu@senic.com> wrote:
>
> From: Shantanu <baali@muse-amuse.in>
>
> Signed-off-by: Shantanu <shantanu@senic.com>
> ---
>  .../python/python3-bsddb3_6.2.6.bb            | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/python3-bsddb3_6.2.6.bb
>
> diff --git a/meta-python/recipes-devtools/python/python3-bsddb3_6.2.6.bb b/meta-python/recipes-devtools/python/python3-bsddb3_6.2.6.bb
> new file mode 100644
> index 000000000..4697f0070
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-bsddb3_6.2.6.bb
> @@ -0,0 +1,19 @@
> +SUMMARY = "pybsddb is the Python binding for the Oracle Berkeley DB"
> +HOMEPAGE = "https://www.jcea.es/programacion/pybsddb.htm"
> +SECTION = "devel/python"
> +LICENSE = "BSD-3-Clause"
> +LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=b3c8796b7e1f8eda0aef7e242e18ed43"
> +SRC_URI[sha256sum] = "42d621f4037425afcb16b67d5600c4556271a071a9a7f7f2c2b1ba65bc582d05"
> +
> +inherit pypi setuptools3
> +
> +PYPI_PACKAGE = "bsddb3"
> +
> +DEPENDS = "db \
> +  python3-core \
> +"
> +
> +DISTUTILS_BUILD_ARGS = "--berkeley-db=${STAGING_DIR_HOST}/usr"
> +DISTUTILS_INSTALL_ARGS = "--berkeley-db=${STAGING_DIR_HOST}/usr"
> +

Perhaps we can use STAGING_EXECPREFIXDIR instead of ${STAGING_DIR_HOST}/usr

> +RDEPENDS_${PN} = "db"
> \ No newline at end of file
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

