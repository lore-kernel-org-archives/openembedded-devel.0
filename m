Received: from mail-ie0-f175.google.com ([209.85.223.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1THtOK-0000jy-GW
	for openembedded-devel@lists.openembedded.org;
	Sat, 29 Sep 2012 11:31:20 +0200
Received: by iebc13 with SMTP id c13so9239281ieb.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 29 Sep 2012 02:18:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-originating-ip:in-reply-to:references:date
	:message-id:subject:from:to:content-type:x-gm-message-state;
	bh=2VQIkznMBxiYMsHxFKVWfpj3gobVHk7Gj56xyefi1lc=;
	b=gQR4GWrtWjT34WVTWtcetRuGZrSJKNnodkocr2HMIhGcECk3GPSrd05tC203GbVABA
	Lkzt+3yjyXqRePOMf3sHadEM4jMriioTHHSCC5FtXsW9KxJeQ18W/l3drAmTUSQkRqzE
	RrHYwIKmpttl+tepQNC6KJJzhPjCmo3M+7yo4rLJb5UG8D6USirWXrJ8Gwpu9zHTluRf
	eTp3eZ4Vfun4IbBL+FLVB/ThlY1xBeVlILZoKQ+FK85qLp+8qZhrD3tClk0UVbywHMXf
	O4ONlhT4e5pi1T/Dlu/4lVoDeBNQ4kbx4j95U64gzMdKb2Sb6LwKKnkLrnz9uGYJM4Hb
	L+xg==
MIME-Version: 1.0
Received: by 10.50.7.135 with SMTP id j7mr941839iga.34.1348910305596; Sat, 29
	Sep 2012 02:18:25 -0700 (PDT)
Received: by 10.64.52.8 with HTTP; Sat, 29 Sep 2012 02:18:25 -0700 (PDT)
X-Originating-IP: [79.118.166.187]
Received: by 10.64.52.8 with HTTP; Sat, 29 Sep 2012 02:18:25 -0700 (PDT)
In-Reply-To: <1348889736-6462-1-git-send-email-jackie.huang@windriver.com>
References: <1348889736-6462-1-git-send-email-jackie.huang@windriver.com>
Date: Sat, 29 Sep 2012 12:18:25 +0300
Message-ID: <CAK18fxG59TmeuKPC6ay+XAk42CL=QkEDKzV3P0OcvYWTdb47CA@mail.gmail.com>
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-devel@lists.openembedded.org
X-Gm-Message-State: ALoCoQmq56ZBEVgTnwLO4Nuw4uzeXJzIOoGKozHaoPPdi/QFOEjGxDKX6Qn/ywWar3z/xZvt9y/K
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [meta-oe][PATCH v2] iw: update to 3.6
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
X-List-Received-Date: Sat, 29 Sep 2012 09:31:20 -0000
Content-Type: text/plain; charset=ISO-8859-1

Why is this an update? I see you create a new recipe...
On Sep 29, 2012 6:35 AM, <jackie.huang@windriver.com> wrote:

> iw: update to 3.6
>
> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> ---
>  meta-oe/recipes-connectivity/iw/iw_3.6.bb |   23 +++++++++++++++++++++++
>  1 files changed, 23 insertions(+), 0 deletions(-)
>  create mode 100644 meta-oe/recipes-connectivity/iw/iw_3.6.bb
>
> diff --git a/meta-oe/recipes-connectivity/iw/iw_3.6.bbb/meta-oe/recipes-connectivity/iw/
> iw_3.6.bb
> new file mode 100644
> index 0000000..42a43c3
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/iw/iw_3.6.bb
> @@ -0,0 +1,23 @@
> +SUMMARY = "nl80211 based CLI configuration utility for wireless devices"
> +DESCRIPTION = "iw is a new nl80211 based CLI configuration utility for \
> +wireless devices. It supports almost all new drivers that have been added
> \
> +to the kernel recently. "
> +HOMEPAGE = "http://linuxwireless.org/en/users/Documentation/iw"
> +SECTION = "base"
> +LICENSE = "BSD"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=878618a5c4af25e9b93ef0be1a93f774"
> +
> +DEPENDS = "libnl pkgconfig"
> +
> +SRC_URI = "http://wireless.kernel.org/download/iw/${P}.tar.bz2 \
> +
> file://0001-iw-version.sh-don-t-use-git-describe-for-versioning.patch \
> +          "
> +
> +SRC_URI[md5sum] = "1c18bfbbc8773629e5e8ac733a39540c"
> +SRC_URI[sha256sum] =
> "df11036ac11df31f44083da962a6e9c74bdea7c01c596c4b5840f948cdb6c857"
> +
> +EXTRA_OEMAKE = ""
> +
> +do_install() {
> +       oe_runmake DESTDIR=${D} install
> +}
> --
> 1.7.4
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

