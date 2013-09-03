Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-la0-f53.google.com (mail-la0-f53.google.com
	[209.85.215.53])
	by mail.openembedded.org (Postfix) with ESMTP id 3E4B06BEF5
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Sep 2013 01:56:51 +0000 (UTC)
Received: by mail-la0-f53.google.com with SMTP id el20so4157206lab.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 02 Sep 2013 18:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=NQLTb6SwgIE8vQpaICv11YefdQHmkLmsCdeDV7uhSqA=;
	b=cLc89sKyvqu82y/NStHCvmHU+MNUE1MUuubbaaRD8DE1XKJOjE04+bD+GN6ZxV+AhW
	h3yqJMn6VQauFxtBul8gigvbt9R3bDWcKQZ/PvjVBnatH2wLXRQ3CFOkXmnAA25hGWpZ
	iy2QYUmK2KO5jkhOCGhfMbf+/X8JTRZO5DxFdNKLr6LYgTyvSLk0xlxV8LybAsYnlXI1
	rXdHrwI+SSVUorT+Gjp1YyiQLIqdvFzGLaaa+3YEFjZY7CX4lxxChIQYvLfNp4tXgIkY
	z8dDHAZP2H5pdnt+b2wKoL6W52hpzf1nBykPvrxsB7+1/xH6LFk4niIkMOpmkjDHoYU/
	q9Cw==
MIME-Version: 1.0
X-Received: by 10.152.21.225 with SMTP id y1mr24260793lae.18.1378173410464;
	Mon, 02 Sep 2013 18:56:50 -0700 (PDT)
Received: by 10.112.12.103 with HTTP; Mon, 2 Sep 2013 18:56:50 -0700 (PDT)
In-Reply-To: <1378110051-8976-1-git-send-email-lpapp@kde.org>
References: <1378110051-8976-1-git-send-email-lpapp@kde.org>
Date: Mon, 2 Sep 2013 21:56:50 -0400
Message-ID: <CADkTA4NZ-M6XBYx2bBBW_QtMtsUnDNdyYggr1Wa=6Qu33EHvPQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] openflow: Add latest from git
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
X-List-Received-Date: Tue, 03 Sep 2013 01:56:53 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Sep 2, 2013 at 4:20 AM, Laszlo Papp <lpapp@kde.org> wrote:
> 1) The version in meta-virtualization is quite old. It is basically from 2009,
> and a lot of things has changed since then.

And that was on purpose, there are some tight bindings to SDN and hence why
it is in meta-virtualization, and not a valid reason to not contact the layer
maintainers directly, have a discussion and not set the update to the current
layer.

If you would have asked, you would have been told that updates are pending
with bindings that need to stay in lock step with other parts of meta-virt.

>
> 2) More importantly, this software is more like for networking rather than
> virtualization, so I think it was misplaced.

I disagree, so for now meta-virt is going to keep it's variants of the
recipes and
we need to have an actual discussion to figure out the best way forward.

Cheers,

Bruce

> ---
>  .../recipes-support/openflow/openflow_1.0.bb       | 32 ++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
>  create mode 100644 meta-networking/recipes-support/openflow/openflow_1.0.bb
>
> diff --git a/meta-networking/recipes-support/openflow/openflow_1.0.bb b/meta-networking/recipes-support/openflow/openflow_1.0.bb
> new file mode 100644
> index 0000000..eb7770e
> --- /dev/null
> +++ b/meta-networking/recipes-support/openflow/openflow_1.0.bb
> @@ -0,0 +1,32 @@
> +SUMMARY = "OpenFlow"
> +DESCRIPTION = "Open standard that enables researchers to run experimental protocols in the campus networks"
> +HOMEPAGE = "http://www.openflow.org"
> +SECTION = "networking"
> +LICENSE = "GPLv2"
> +
> +LIC_FILES_CHKSUM = "file://COPYING;md5=e870c934e2c3d6ccf085fd7cf0a1e2e2"
> +
> +SRCREV = "c84f33f09d5dbcfc9b489f64cb30475bf36f653a"
> +PV = "1.0+git${SRCPV}"
> +SRC_URI = "git://gitosis.stanford.edu/openflow.git;protocol=git"
> +
> +DEPENDS = "virtual/libc"
> +
> +EXTRA_OECONF += "KARCH=${TARGET_ARCH}"
> +
> +PACKAGECONFIG ??= "libssl"
> +PACKAGECONFIG[libssl] = "--enable-ssl,--disable-ssl, openssl, libssl"
> +
> +S = "${WORKDIR}/git"
> +
> +inherit autotools
> +
> +do_configure() {
> +    ./boot.sh
> +    oe_runconf
> +}
> +
> +do_install_append() {
> +       # Remove /var/run as it is created on startup
> +    rm -rf ${D}${localstatedir}/run
> +}
> --
> 1.8.4
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

