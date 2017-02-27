Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 34CAD6093F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Feb 2017 14:08:56 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id r18so13637460wmd.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Feb 2017 06:08:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=8a0ZzDf2BVn8s4vvCWUlV0rfjGOwPxJPpovHMdZtHCc=;
	b=KfMckXUUUB1YeHnQ01LATwBw7Xy8C4drKWLuPZYcY2X6wzZZ5jWA9n9VO+0rMCSK0D
	nC8WH8hwplp4SiZktJLfI8wg+bFSL3a8CJQMF/I00AxTwO6LakTzgZ92Mx5cmc1KxRhs
	48X+5188996pZUhU0esmOLXAPS7AuXdkRhiUnaiDBmnhQDGpbetRzt/Pr1iCM/8NBeeR
	HtywjOSLPyLaRyPUwpUcrXzm+qGasyQ4Cdpvt/gVj1zfBcrFBN26HfDqSUoHwygww+b7
	7QVWej22Hu6s8cpOkcU5fr1UomvYGQY/ffdhERzfKgwZ6tcZWuz0R2WR1l5IrR1qljdk
	Z3fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=8a0ZzDf2BVn8s4vvCWUlV0rfjGOwPxJPpovHMdZtHCc=;
	b=iT2eHfuSjl0gr8YqPg/fP75PfxNzveVP8B/EIXciK30iixTTC/umKKpMK9clalESHP
	cPoKlDC6nPLKpTEDhfxoZ6QsamMY+KJb0pl09h4wvSDwmMkL5zunLOqJqmfzkoHlk0fq
	vFdSeiREqMln2KQeclHrFHn4R8LAXLxTDPLXPZ9JTns5eCZY/sgQkMAWeWlzL/a7AwVD
	pcgPW/6v4dePbxxbWKRlOlksp6o9SFGOMVOlpjFMABMuTTfvgT5Vixn8KNxaBQfx5FiX
	oa+v0eZtOWzrjAsMUS0yQp3CtbzWhEnQSVQPXG+3aaNiXywUYJ/VA8nCT+j0to0ZPLf/
	+Q3Q==
X-Gm-Message-State: AMke39kWXhAGqVcYI2g4iSpSv1+R7SLaaU0OmjxBtr1YBqfvwKbiqKNJGcQU6RdQuYwM2z4rr+DNLg6q0cSg3g==
X-Received: by 10.28.6.78 with SMTP id 75mr14674197wmg.81.1488204538063; Mon,
	27 Feb 2017 06:08:58 -0800 (PST)
MIME-Version: 1.0
Received: by 10.80.145.24 with HTTP; Mon, 27 Feb 2017 06:08:57 -0800 (PST)
In-Reply-To: <1487965301-24934-1-git-send-email-derek@asterius.io>
References: <1487965301-24934-1-git-send-email-derek@asterius.io>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 27 Feb 2017 15:08:57 +0100
Message-ID: <CA+chaQcMcm3mkYNpMnHhvVw78TXBSzRihKa3so5am+Jbwd+sKQ@mail.gmail.com>
To: Derek Straka <derek@asterius.io>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-ruby][PATCH] bundler: resolve build issues with RSS
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
X-List-Received-Date: Mon, 27 Feb 2017 14:08:57 -0000
Content-Type: text/plain; charset=UTF-8

Still fails in bitbake world:

ERROR: bundler-1.9.4-r0 do_compile: Function failed: do_compile (log
file is located at
/home/jenkins/oe/world/shr-core/tmp-glibc/work/i586-oe-linux/bundler/1.9.4-r0/temp/log.do_compile.3462)
ERROR: Logfile of failure stored in:
/home/jenkins/oe/world/shr-core/tmp-glibc/work/i586-oe-linux/bundler/1.9.4-r0/temp/log.do_compile.3462
Log data follows:
| DEBUG: Executing shell function do_compile
| ERROR:  Loading command: build (LoadError)
| 	cannot load such file -- zlib
| ERROR:  While executing gem ... (NoMethodError)
|     undefined method `invoke_with_build_args' for nil:NilClass
| WARNING: exit code 1 from a shell command.
| ERROR: Function failed: do_compile (log file is located at
/home/jenkins/oe/world/shr-core/tmp-glibc/work/i586-oe-linux/bundler/1.9.4-r0/temp/log.do_compile.3462)
NOTE: recipe bundler-1.9.4-r0: task do_compile: Failed
ERROR: Task (/home/jenkins/oe/world/shr-core/meta-openembedded/meta-ruby/recipes-devtools/ruby/bundler_git.bb:do_compile)
failed with exit code '1'


On Fri, Feb 24, 2017 at 8:41 PM, Derek Straka <derek@asterius.io> wrote:

> Signed-off-by: Derek Straka <derek@asterius.io>
> ---
>  meta-ruby/recipes-devtools/ruby/bundler_git.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta-ruby/recipes-devtools/ruby/bundler_git.bb
> b/meta-ruby/recipes-devtools/ruby/bundler_git.bb
> index f2d8f3c..2b5cef4 100644
> --- a/meta-ruby/recipes-devtools/ruby/bundler_git.bb
> +++ b/meta-ruby/recipes-devtools/ruby/bundler_git.bb
> @@ -20,6 +20,8 @@ PV = "1.9.4"
>
>  S = "${WORKDIR}/git"
>
> +DEPENDS += "zlib"
> +
>  SRC_URI = " \
>      git://github.com/bundler/bundler.git;branch=${BRANCH} \
>      "
> @@ -29,5 +31,3 @@ inherit ruby
>  RDEPENDS_${PN} = "git"
>
>  BBCLASSEXTEND = "native"
> -
> -PNBLACKLIST[bundler] ?= "Fails to build with RSS
> http://errors.yoctoproject.org/Errors/Details/130640/"
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

