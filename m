Return-Path: <raj.khem@gmail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id 364D87804A
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Jun 2017 16:00:19 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id u101so16998972wrc.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Jun 2017 09:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=JoBW613cTjDE03iz8z6AFjyAbvcbif1e+XrGFd/HjMo=;
	b=ASeNSBfV1mzJCg2R35ZI8W+C4wj+LSUXY1Y11a8rOxa7yK2mvAFk9ufjx1te4sdTN9
	KC0RsJttiRvTEFojx6lSFWb83vCUadlf+VKFgrEmGxLM5vswE2U/mOzsDNo1ZMCLNZCw
	TaYAQ4v2J9H2KJQDDonXSWdqg4+0Zf2nR/6QI5lxwLxcNJFOyUC/sQ4lJPwSgNa3iLeg
	o0pK5bf125vReVN7fqm9VCDoc9jWUF0AIE8yvGC4VXKSfk8VOnILc0sd3MFrFId19Uqu
	C4Yz6g0PoSnFCP9dOL8C8fIyuW3DXxDJIiv5GQJeS0FyDW1xMRkTKVjK2AzQRo4rNdh4
	g72w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=JoBW613cTjDE03iz8z6AFjyAbvcbif1e+XrGFd/HjMo=;
	b=azVI9n8gwJOG9mU8j+ShPJtbGMweKiEoWtlr9WLucL/CvINdBsWza/6MtFfRPkb/K+
	8OapeGGkmn8v5crqS9Bp02VLkwOkuYXdfr85qY8Y/XPNYlkfaXLIGtfkxFG1c9rNoUj1
	65eTiLIuDbqdpTpEnfHtt1o36hREh9cZ92qKKXQ8BrsmE9DJ/9T/DLB5f82WYAIr0lJQ
	Vx1yCK/mrpfTttt+dBcrRMIDUX7/+6htQzPd9kUqt89Ll8BKuAAnsolst75H31BoirKp
	T4TZ06q7QjUA2X6HCMDn/f+x/PTHY43PZ627BIcTG6gmVQWqkDbGDIlOT86NnNGx5kT4
	nvLQ==
X-Gm-Message-State: AODbwcC8sH/gUsrTElrTgsRAeuQadBS3uVhwEtNAiUYClPABMBHWI7TQ
	Awx0H8KN3/AuDmJj/z2vYI1HMfAUKw==
X-Received: by 10.80.137.36 with SMTP id e33mr26196666ede.67.1497196820214;
	Sun, 11 Jun 2017 09:00:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.153.222 with HTTP; Sun, 11 Jun 2017 08:59:49 -0700 (PDT)
In-Reply-To: <1497193576-3774-1-git-send-email-trini@konsulko.com>
References: <1497193576-3774-1-git-send-email-trini@konsulko.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 11 Jun 2017 08:59:49 -0700
Message-ID: <CAMKF1srsu4Aq=aPVwCCCQynDNz5uPe1MsaasP7Mrx4oXm=MS4A@mail.gmail.com>
To: Tom Rini <trini@konsulko.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 1/2] libfile-fnmatch-perl: New recipe
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
X-List-Received-Date: Sun, 11 Jun 2017 16:00:19 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, Jun 11, 2017 at 8:06 AM, Tom Rini <trini@konsulko.com> wrote:
> File::FnMatch::fnmatch() provides simple, shell-like pattern matching.
>
> Though considerably less powerful than regular expressions, shell patterns
> are nonetheless useful and familiar to a large audience of end-users.
>
> Signed-off-by: Tom Rini <trini@konsulko.com>
> ---
>  .../perl/libfile-fnmatch-perl_0.02.bb              | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>  create mode 100644 meta-oe/recipes-extended/perl/libfile-fnmatch-perl_0.02.bb
>
> diff --git a/meta-oe/recipes-extended/perl/libfile-fnmatch-perl_0.02.bb b/meta-oe/recipes-extended/perl/libfile-fnmatch-perl_0.02.bb

may be meta-perl is better suited for this

> new file mode 100644
> index 000000000000..035fe9f654e9
> --- /dev/null
> +++ b/meta-oe/recipes-extended/perl/libfile-fnmatch-perl_0.02.bb
> @@ -0,0 +1,22 @@
> +SUMMARY = "Perl module that provides simple filename and pathname matching"
> +DESCRIPTION = "File::FnMatch::fnmatch() provides simple, shell-like pattern \
> +matching. \
> +Though considerably less powerful than regular expressions, shell patterns \
> +are nonetheless useful and familiar to a large audience of end-users."
> +
> +HOMEPAGE = "http://search.cpan.org/dist/File-FnMatch/"
> +SECTION = "libs"
> +LICENSE = "Artistic-1.0 | GPL-1.0+"
> +
> +LIC_FILES_CHKSUM = "file://README;beginline=34;endline=37;md5=54fdfac62963b7cece5583ab38f2cf0d"
> +
> +SRC_URI = "https://cpan.metacpan.org/authors/id/M/MJ/MJP/File-FnMatch-${PV}.tar.gz"
> +
> +SRC_URI[md5sum] = "22f77c20d0fb5af01a3165e2df2fe34c"
> +SRC_URI[sha256sum] = "962454b8e86bea8b132bf8af35757d0c6a8f5d599015bd6a5d68cb7ae7a9e916"
> +
> +S = "${WORKDIR}/File-FnMatch-${PV}"
> +
> +inherit cpan
> +
> +BBCLASSEXTEND = "native"
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

