Return-Path: <lpapp@archlinux.us>
Received: from mail-pd0-f182.google.com (mail-pd0-f182.google.com
	[209.85.192.182])
	by mail.openembedded.org (Postfix) with ESMTP id 61C436C00A
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Sep 2013 14:55:04 +0000 (UTC)
Received: by mail-pd0-f182.google.com with SMTP id r10so6144776pdi.27
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Sep 2013 07:55:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=QZLot4khv82JPvN2G0WuQTSBnWIfFR4iJR0Ado9a7U4=;
	b=JydcLODDDyj49YnWpInmfTKuqY/NTicg8ZAFztxG4HtevWBH/8GuMQq9b9CeeV0rpG
	2FaCsh9WF+QRtAtk4pZfPqAkPfKeY2gxNi4dXCiROPAynNcFh5DC2Je2r5r8YM4IISQa
	A/l1tTtBBMIeQWa46RTtUm9naZHJz4AKUDPb2fF8Omdx8yoE4AT1CggowRCiE9mLyB9+
	CK5dKjJ/KdjTqHigWq07+3cP1MA0YMGbGPlt+fS3WnEHUoY3RdUGf8bxsch+pvK7NjHT
	RnkbXX0Tg0M1NHSYPvKNzO0pnCL6+GYjFTS5eryOX1ulrvB4ac6L/4jJ9Gh3l4XesAnJ
	vtTA==
X-Gm-Message-State: ALoCoQmA8TPbXSnF2ijYD9rK3BXzjXvReFFS2WKKqaxQTSsVqSBbq238F90lxf/ye5nI1N6FJot2
MIME-Version: 1.0
X-Received: by 10.66.27.143 with SMTP id t15mr3548301pag.171.1378220105277;
	Tue, 03 Sep 2013 07:55:05 -0700 (PDT)
Sender: lpapp@archlinux.us
Received: by 10.70.57.234 with HTTP; Tue, 3 Sep 2013 07:55:05 -0700 (PDT)
In-Reply-To: <1378219999-12757-1-git-send-email-erp@movis.dk>
References: <1378219999-12757-1-git-send-email-erp@movis.dk>
Date: Tue, 3 Sep 2013 15:55:05 +0100
X-Google-Sender-Auth: 9XNTQ4t5zyqf5sNo_D_cbj9b_B4
Message-ID: <CAOMwXhPf33o2i_Ci6pRYe-j1ZYnF7ronJ7-8ydrA1Z9b=BLzWA@mail.gmail.com>
From: Laszlo Papp <lpapp@kde.org>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [PATCH] libcarp-perl: added
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 03 Sep 2013 14:55:04 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hmm, shouldn't you mention in the commit message which version just in case?


On Tue, Sep 3, 2013 at 3:53 PM, Emil Petersen <erp@movis.dk> wrote:

> Carp recipe added
>
> Signed-off-by: Emil Petersen <erp@movis.dk>
> ---
>  .../recipes-perl/libcarp-perl/libcarp-perl_1.26.bb | 25
> ++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
>  create mode 100644 meta-perl/recipes-perl/libcarp-perl/
> libcarp-perl_1.26.bb
>
> diff --git a/meta-perl/recipes-perl/libcarp-perl/libcarp-perl_1.26.bbb/meta-perl/recipes-perl/libcarp-perl/
> libcarp-perl_1.26.bb
> new file mode 100644
> index 0000000..0ae7bf3
> --- /dev/null
> +++ b/meta-perl/recipes-perl/libcarp-perl/libcarp-perl_1.26.bb
> @@ -0,0 +1,25 @@
> +SUMMARY = "Carp - alternative warn and die for modules"
> +AUTHOR = "Andrew Main <zefram@fysk.org>"
> +HOMEPAGE = "https://metacpan.org/module/Carp"
> +SECTION = "libs"
> +LICENSE = "Artistic-1.0 | GPL-1.0+"
> +LIC_FILES_CHKSUM = "file://README;md5=d613c00d4cb8d48c01f09fca2a7873a0"
> +
> +RPROVIDES_${PN} = "libcarp-heavy-perl"
> +
> +RDEPENDS_${PN} += "perl-module-strict \
> +                   perl-module-warnings \
> +                   libexporter-perl \
> +                   libtest-more-perl \
> +                  "
> +
> +SRC_URI = "
> http://cpan.metacpan.org/authors/id/Z/ZE/ZEFRAM/Carp-${PV}.tar.gz"
> +SRC_URI[md5sum] = "86229a6f0dc44e0730f96c1909bb346d"
> +SRC_URI[sha256sum] =
> "0a310222a9a52eca9425bca19e6d8e04faa8bb4f64d5c16f2f6cce8190c0a99b"
> +
> +S = "${WORKDIR}/Carp-${PV}"
> +
> +inherit cpan
> +
> +BBCLASSEXTEND = "native"
> +
> --
> 1.8.4.rc3
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

