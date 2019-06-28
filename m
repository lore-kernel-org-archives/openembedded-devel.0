Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6D3827E819
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Jun 2019 15:50:37 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x5SFnpU2031100
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 28 Jun 2019 08:50:12 -0700
Received: from [128.224.162.157] (128.224.162.157) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.439.0;
	Fri, 28 Jun 2019 08:49:56 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <raj.khem@gmail.com>
References: <1561651356-12247-1-git-send-email-hongxu.jia@windriver.com>
	<1561651356-12247-3-git-send-email-hongxu.jia@windriver.com>
Message-ID: <0a6d9c17-705a-e27b-05fc-6e7e4a0cb09a@windriver.com>
Date: Fri, 28 Jun 2019 23:49:54 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <1561651356-12247-3-git-send-email-hongxu.jia@windriver.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-multimedia][PATCH V3 3/3] tvheadend: do not inherit gitpkgv
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
X-List-Received-Date: Fri, 28 Jun 2019 15:50:37 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Please drop this fix, since meta-multimedia depends on meta-python,
and meta-python depends on meta-oe, the fix is not necessary

//Hongxu

On 6/28/19 12:02 AM, Hongxu Jia wrote:
> Do not inherit gitpkgv in meta-oe, since meta-multimedia
> does not depends on meta-oe.
>
> The pkg version will be minor changed
>
> Before the fix:
> tvheadend-4.3+git10478+bdc2ae9-r0.core2_64.rpm
>
> After the fix:
> tvheadend-4.3+git20+bdc2ae9e19-r0.core2_64.rpm
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>   meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb b/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb
> index dc6cd46..e3875a2 100644
> --- a/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb
> +++ b/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb
> @@ -1,7 +1,7 @@
>   SUMMARY = "Tvheadend: TV streaming server and recorder"
>   HOMEPAGE = "https://tvheadend.org/"
>   
> -inherit autotools-brokensep gettext gitpkgv pkgconfig
> +inherit autotools-brokensep gettext pkgconfig
>   
>   DEPENDS = "avahi cmake-native dvb-apps libdvbcsa libpcre2 openssl uriparser zlib"
>   
> @@ -11,8 +11,8 @@ LIC_FILES_CHKSUM = "file://LICENSE.md;md5=9cae5acac2e9ee2fc3aec01ac88ce5db"
>   SRC_URI = "git://github.com/tvheadend/tvheadend.git"
>   
>   SRCREV = "bdc2ae9e19520a10cdf0bec0fcc0050b32bc75ff"
> -PV = "4.3+git${SRCPV}"
> -PKGV = "4.3+git${GITPKGV}"
> +PV = "4.3+git2${SRCPV}"
> +PE = "1"
>   
>   S = "${WORKDIR}/git"
>   



