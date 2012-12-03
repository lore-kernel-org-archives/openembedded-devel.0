Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TfWAp-00026i-FT
	for openembedded-devel@lists.openembedded.org;
	Mon, 03 Dec 2012 14:35:03 +0100
Received: by mail-we0-f175.google.com with SMTP id z53so1023951wey.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Dec 2012 05:20:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=I/kxiHIhRsz5jbKIYxwLcMcZ6XwOWuAmZrZc20BNT7M=;
	b=PEyaoA10/o/ercmqoVI1UN6K6XWgZpoRR7rQJtvFwrC+vevyUSE4pQjeiRmwamvIbS
	rotFETDeBDrON0t8ZnQ4jBnK2mxptAphmMl9uqVXPDAHMck+aHTDNHh3mllRu3yLlrmD
	kEqqb8kSSuXFVSZmnRBa7ZZzj9bOmLYEJ7FM8ePYC8IQBppY3pqVyPgXKLrAK2uy9NGW
	Qany0kgzrL+nd7sE1lU18YpiFTSolp+/tCW6fc/+kmjpIVtd7w0eJ/c6rhO+UHR7gXBn
	VkNlH0spi94mMM1GdHyX8uZxqeGJWYhbdYTB5NbURVSXuU8S3M4nwS6mWGzYd8ssJ8Fs
	7pow==
MIME-Version: 1.0
Received: by 10.216.212.131 with SMTP id y3mr3320436weo.62.1354540842506; Mon,
	03 Dec 2012 05:20:42 -0800 (PST)
Received: by 10.194.84.103 with HTTP; Mon, 3 Dec 2012 05:20:42 -0800 (PST)
In-Reply-To: <1351604444-16246-1-git-send-email-s.stirtzel@googlemail.com>
References: <1351604444-16246-1-git-send-email-s.stirtzel@googlemail.com>
Date: Mon, 3 Dec 2012 14:20:42 +0100
Message-ID: <CA+chaQfjv11Mk_vZwAHsfQEr=ncqda9BOKfych_xU+Gs8wZyQQ@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] maliit-plugins: Clean up recipe and add missing RDEPENDS
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 03 Dec 2012 13:35:03 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Oct 30, 2012 at 2:40 PM, Samuel Stirtzel
<s.stirtzel@googlemail.com> wrote:
> The following errors are only shown when started from console, also there are no visible errors during execution.
> Error fixed: QML Image: Error decoding: file:///usr/share/maliit/plugins/org/nemomobile/icon-m-input-methods-shift-lowercase.svg: Unsupported image format
>
> This is unaffected from whether libqtsvg4 is installed or not.
>
> Signed-off-by: Samuel Stirtzel <s.stirtzel@googlemail.com>
> ---
>  .../recipes-support/maliit/maliit-plugins_git.bb   |   10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
>
> diff --git a/meta-oe/recipes-support/maliit/maliit-plugins_git.bb b/meta-oe/recipes-support/maliit/maliit-plugins_git.bb
> index 932c0ae..2fb52c7 100644
> --- a/meta-oe/recipes-support/maliit/maliit-plugins_git.bb
> +++ b/meta-oe/recipes-support/maliit/maliit-plugins_git.bb
> @@ -8,6 +8,8 @@ inherit autotools qt4x11
>
>  DEPENDS = "maliit-framework"
>
> +RDEPENDS_${PN} += "qt4-plugin-iconengine-svgicon qt4-plugin-imageformat-svg"
> +
>  SRC_URI = "git://gitorious.org/maliit/maliit-plugins.git;branch=master"
>
>  SRCREV = "0760e585df494b394df1b887e5138ffef19c481f"
> @@ -23,12 +25,8 @@ FILES_${PN} += "\
>      ${datadir} \
>      "
>
> -FILES_${PN}-dbg += "\
> -    ${libdir}/maliit/plugins-*/.debug \
> -    "
> +FILES_${PN}-dbg += "${libdir}/maliit/plugins-*/.debug"
>
>  S= "${WORKDIR}/git"
>
> -do_install() {
> -  cd ${S} && (INSTALL_ROOT=${D} oe_runmake install)
> -}
> \ No newline at end of file
> +EXTRA_OEMAKE += "INSTALL_ROOT=${D}"
> --

It fails to build docs on hosts without doxygen, can we disable docs?

| make[1]: Entering directory
`/OE/jansa-test/shr-core/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/maliit-plugins/0.92.3+git1+0760e585df494b394df1b887e5138ffef19c481f-r0/git/doc'
| sed -e "s;@VERSION@;0.92.3;g" -e
"s;@IN_PWD@;/OE/jansa-test/shr-core/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/maliit-plugins/0.92.3+git1+0760e585df494b394df1b887e5138ffef19c481f-r0/git/doc;g"
doxyfile.conf.in >
/OE/jansa-test/shr-core/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/maliit-plugins/0.92.3+git1+0760e585df494b394df1b887e5138ffef19c481f-r0/git/doc/doxyfile.conf
&& doxygen /OE/jansa-test/shr-core/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/maliit-plugins/0.92.3+git1+0760e585df494b394df1b887e5138ffef19c481f-r0/git/doc/doxyfile.conf
| /bin/sh: doxygen: command not found
| make[1]: *** [html/index.html] Error 127
| make[1]: Leaving directory
`/OE/jansa-test/shr-core/tmp-eglibc/work/armv7a-vfp-neon-oe-linux-gnueabi/maliit-plugins/0.92.3+git1+0760e585df494b394df1b887e5138ffef19c481f-r0/git/doc'

Cheers,


