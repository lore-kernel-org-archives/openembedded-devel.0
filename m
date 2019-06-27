Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8FEA17E9A4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Jun 2019 15:31:35 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x5RFUtUl021361
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 27 Jun 2019 08:31:10 -0700
Received: from [128.224.162.157] (128.224.162.157) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.439.0;
	Thu, 27 Jun 2019 08:30:45 -0700
To: Khem Raj <raj.khem@gmail.com>
References: <1561602827-2393-1-git-send-email-hongxu.jia@windriver.com>
	<CAMKF1sqDaR4w1y9VQ+BCtpUv-1PtQPY7H8u5RKyP8aS9h=aOSQ@mail.gmail.com>
From: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <1a502968-9502-1910-b4c8-90b36b440d9c@windriver.com>
Date: Thu, 27 Jun 2019 23:30:44 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1sqDaR4w1y9VQ+BCtpUv-1PtQPY7H8u5RKyP8aS9h=aOSQ@mail.gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-multimedia][PATCH V2] tvheadend: do not inherit gitpkgv
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
X-List-Received-Date: Thu, 27 Jun 2019 15:31:35 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 6/27/19 11:14 PM, Khem Raj wrote:
> git0 will sort lower than git1 so may be PE jump will be helpful here
>
Make sense, V3 incoming

//Hongxu

> On Wed, Jun 26, 2019 at 10:34 PM Hongxu Jia <hongxu.jia@windriver.com 
> <mailto:hongxu.jia@windriver.com>> wrote:
>
>     Do not inherit gitpkgv in meta-oe, since meta-multimedia
>     does not depends on meta-oe.
>
>     The pkg version will be minor changed
>
>     Before the fix:
>     tvheadend-4.3+git10478+bdc2ae9-r0.core2_64.rpm
>
>     After the fix:
>     tvheadend-4.3+git0+bdc2ae9e19-r0.core2_64.rpm
>
>     Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com
>     <mailto:hongxu.jia@windriver.com>>
>     ---
>      meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb
>     <http://tvheadend_git.bb> | 3 +--
>      1 file changed, 1 insertion(+), 2 deletions(-)
>
>     diff --git
>     a/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb
>     <http://tvheadend_git.bb>
>     b/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb
>     <http://tvheadend_git.bb>
>     index dc6cd46..bbe4ce0 100644
>     --- a/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb
>     <http://tvheadend_git.bb>
>     +++ b/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb
>     <http://tvheadend_git.bb>
>     @@ -1,7 +1,7 @@
>      SUMMARY = "Tvheadend: TV streaming server and recorder"
>      HOMEPAGE = "https://tvheadend.org/"
>
>     -inherit autotools-brokensep gettext gitpkgv pkgconfig
>     +inherit autotools-brokensep gettext pkgconfig
>
>      DEPENDS = "avahi cmake-native dvb-apps libdvbcsa libpcre2 openssl
>     uriparser zlib"
>
>     @@ -12,7 +12,6 @@ SRC_URI =
>     "git://github.com/tvheadend/tvheadend.git
>     <http://github.com/tvheadend/tvheadend.git>"
>
>      SRCREV = "bdc2ae9e19520a10cdf0bec0fcc0050b32bc75ff"
>      PV = "4.3+git${SRCPV}"
>     -PKGV = "4.3+git${GITPKGV}"
>
>      S = "${WORKDIR}/git"
>
>     -- 
>     2.7.4
>


