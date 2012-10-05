Received: from mail-ie0-f175.google.com ([209.85.223.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1TK5ED-0000qw-Aq
	for openembedded-devel@lists.openembedded.org;
	Fri, 05 Oct 2012 12:33:58 +0200
Received: by mail-ie0-f175.google.com with SMTP id c13so3482611ieb.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Oct 2012 03:20:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-originating-ip:in-reply-to:references:from:date
	:message-id:subject:to:content-type:x-gm-message-state;
	bh=C5D+NIvsw5DLRpooiivsaUAiSjVoHFD1kG9KQ8c+ZE0=;
	b=j9lU7ZUniGPMkHttivDE45cMhLl+1iMb//BhfH8URjCrRhtKfhO+QtXA7f2ibUHp3l
	DmNm9KmhsyGObWFqwfhaXZtNhBEUdtf3dcNRfKP+xnxUkWUcjmmMfmmK2r/BRLkgQDtB
	b1zJzQW6AwJAVTB3Se5Sqywk233KG0XaphDjv2HinF0wk7rdYHCjs9zmfRYbegzHnTEA
	N6qiFgiA2eu+shMvEIQJtByGHaV+Klsbsmu0r/MWzBnUpCnN8dJOpBFakQHgXSQZMR1Z
	ZkPBeUJ7enxEyx3w2sYSReFngKG2t4RL+Nic2ZRORtb+JX6gUAuYmtSEVFIws/Ibvtj2
	Aajw==
Received: by 10.50.193.170 with SMTP id hp10mr201341igc.63.1349432454566; Fri,
	05 Oct 2012 03:20:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.64.52.8 with HTTP; Fri, 5 Oct 2012 03:20:34 -0700 (PDT)
X-Originating-IP: [89.121.200.106]
In-Reply-To: <1349401196-24611-1-git-send-email-jackie.huang@windriver.com>
References: <1349401196-24611-1-git-send-email-jackie.huang@windriver.com>
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Fri, 5 Oct 2012 13:20:34 +0300
Message-ID: <CAK18fxHsc8BjjkbS=Xo5zBHO6OEWx9GYUraND1Lv16u-n=r59Q@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Gm-Message-State: ALoCoQmI0PCXzCB+njo3DCz3AMTiAwOyv7SIIKRnEvnMDW+BTDCAEudJvP+G8GGAOf2hI3vrtehv
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [meta-oe][PATCH v3] iw: add iw 3.6 recipe
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
X-List-Received-Date: Fri, 05 Oct 2012 10:33:58 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello,

On Fri, Oct 5, 2012 at 4:39 AM, <jackie.huang@windriver.com> wrote:

> iw: add iw 3.6 recipe
>

Don't copy the subject here.


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
>

Do you really need this?

+do_install() {
> +       oe_runmake DESTDIR=${D} install
>

Why don't you add DESTDIR=${D} to EXTRA_OEMAKE and drop the install rule?

ag

