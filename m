Return-Path: <Zhe.He@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2948D78D24
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  4 Sep 2018 11:35:23 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w84BZNQZ020188
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 4 Sep 2018 04:35:23 -0700
Received: from [128.224.162.216] (128.224.162.216) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.408.0;
	Tue, 4 Sep 2018 04:35:22 -0700
To: Martin Jansa <martin.jansa@gmail.com>
References: <20180904110908.1105-1-zhe.he@windriver.com>
	<CA+chaQf8RHYtDy-hRv0z99EzpaLJBZr-uTNcfQ+kPs8Jsa2wAA@mail.gmail.com>
From: He Zhe <zhe.he@windriver.com>
Message-ID: <a0d102fd-506f-8492-15cd-a42d9c91e518@windriver.com>
Date: Tue, 4 Sep 2018 19:35:19 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CA+chaQf8RHYtDy-hRv0z99EzpaLJBZr-uTNcfQ+kPs8Jsa2wAA@mail.gmail.com>
X-Originating-IP: [128.224.162.216]
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking] [PATCH] spice: Upgrade 0.14.0 -> 0.14.1
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
X-List-Received-Date: Tue, 04 Sep 2018 11:35:24 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Emm, this was merged just before I finished my fix...
Anyway 0.14.1 resolves new CVE, I'll send v2 without HAVE_STDLIB_H part.

Thanks,
Zhe

On 2018年09月04日 19:22, Martin Jansa wrote:
> Wasn't this conflict with jpeglib.h already resolved in:
> http://git.openembedded.org/openembedded-core/commit/?id=d1e09cb2521ccb9d02ced2d61abb4034cb04836d ?
> it works for me.
>
> On Tue, Sep 4, 2018 at 1:09 PM He Zhe <zhe.he@windriver.com <mailto:zhe.he@windriver.com>> wrote:
>
>     - Fix the following build error.
>
>     ../config.h:65: error: "HAVE_STDLIB_H" redefined [-Werror]
>
>     jpeglib.h from libjpeg contains the same definition of HAVE_STDLIB_H
>     which is supposed to be overwritten. -Werror changes the warning to
>     an error. This patches deletes the definition in jpeglib.h
>
>     - Adjust location of spice-common source as new spice asks spice-common
>     to be put under "subprojects" directory.
>
>     Signed-off-by: He Zhe <zhe.he@windriver.com <mailto:zhe.he@windriver.com>>
>     ---
>      meta-networking/recipes-support/spice/spice_git.bb <http://spice_git.bb> | 13 +++++++++----
>      1 file changed, 9 insertions(+), 4 deletions(-)
>
>     diff --git a/meta-networking/recipes-support/spice/spice_git.bb <http://spice_git.bb> b/meta-networking/recipes-support/spice/spice_git.bb <http://spice_git.bb>
>     index 38b8bf306..5c0b2ca2a 100644
>     --- a/meta-networking/recipes-support/spice/spice_git.bb <http://spice_git.bb>
>     +++ b/meta-networking/recipes-support/spice/spice_git.bb <http://spice_git.bb>
>     @@ -13,18 +13,19 @@ architectures."
>      LICENSE = "BSD & LGPLv2.1+"
>      LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
>
>     -PV = "0.14.0+git${SRCPV}"
>     +PV = "0.14.1+git${SRCPV}"
>
>     -SRCREV_spice = "f1050bfc76c9c4146257e087baf74e0b62d7d218"
>     -SRCREV_spice-common = "95743f40a2da39e0a19859c305e69e2c99d39e42"
>     +SRCREV_spice = "eaa07ef15cfc3bf57a69da2576af66f028787774"
>     +SRCREV_spice-common = "6b93b3fce8909b836ef1d1434d191900d8aa00be"
>
>      SRCREV_FORMAT = "spice_spice-common"
>
>      SRC_URI = " \
>          git://anongit.freedesktop.org/spice/spice;name=spice <http://anongit.freedesktop.org/spice/spice;name=spice> \
>     -    git://anongit.freedesktop.org/spice/spice-common;destsuffix=git/spice-common;name=spice-common <http://anongit.freedesktop.org/spice/spice-common;destsuffix=git/spice-common;name=spice-common> \
>     +    git://anongit.freedesktop.org/spice/spice-common;destsuffix=git/subprojects/spice-common;name=spice-common <http://anongit.freedesktop.org/spice/spice-common;destsuffix=git/subprojects/spice-common;name=spice-common> \
>          file://0001-Convert-pthread_t-to-be-numeric.patch \
>      "
>     +
>      FOO = "\
>          file://0001-build-allow-separated-src-and-build-dirs.patch \
>      "
>     @@ -55,3 +56,7 @@ PACKAGECONFIG[xinerama] = "--enable-xinerama,--disable-xinerama,libxinerama,"
>      COMPATIBLE_HOST = '(x86_64|i.86).*-linux'
>
>      BBCLASSEXTEND = "native nativesdk"
>     +
>     +do_configure_append () {
>     +    sed -i -e '/#define HAVE_STDLIB_H/d' ${STAGING_DIR_HOST}/usr/include/jconfig.h
>     +}
>     -- 
>     2.11.0
>
>     -- 
>     _______________________________________________
>     Openembedded-devel mailing list
>     Openembedded-devel@lists.openembedded.org <mailto:Openembedded-devel@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>


