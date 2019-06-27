Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 37C887E9B2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Jun 2019 16:07:28 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x5RG7Skc001148
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 27 Jun 2019 09:07:28 -0700 (PDT)
Received: from [128.224.162.157] (128.224.162.157) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.439.0;
	Thu, 27 Jun 2019 09:07:28 -0700
To: Martin Jansa <martin.jansa@gmail.com>
References: <1561651356-12247-1-git-send-email-hongxu.jia@windriver.com>
	<1561651356-12247-3-git-send-email-hongxu.jia@windriver.com>
	<CA+chaQcTNR-mZvh=qbGe_mWFFmeLpdeJOPwjm=YUy_ypWuYcdg@mail.gmail.com>
From: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <c63ca3c9-384c-1095-086f-48e70c221000@windriver.com>
Date: Fri, 28 Jun 2019 00:07:26 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <CA+chaQcTNR-mZvh=qbGe_mWFFmeLpdeJOPwjm=YUy_ypWuYcdg@mail.gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
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
X-List-Received-Date: Thu, 27 Jun 2019 16:07:28 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 6/28/19 12:05 AM, Martin Jansa wrote:
> > After the fix:
> > tvheadend-4.3+git20+bdc2ae9e19-r0.core2_64.rpm
>
> This is no longer matching the code with the PE bump.
>
I am afraid PE does not work, that's why 2 is added

//Hongxu

> On Thu, Jun 27, 2019 at 6:03 PM Hongxu Jia <hongxu.jia@windriver.com 
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
>     tvheadend-4.3+git20+bdc2ae9e19-r0.core2_64.rpm
>     Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com
>     <mailto:hongxu.jia@windriver.com>>
>     ---
>      meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb
>     <http://tvheadend_git.bb> | 6 +++---
>      1 file changed, 3 insertions(+), 3 deletions(-)
>
>     diff --git
>     a/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb
>     <http://tvheadend_git.bb>
>     b/meta-multimedia/recipes-dvb/tvheadend/tvheadend_git.bb
>     <http://tvheadend_git.bb>
>     index dc6cd46..e3875a2 100644
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
>     @@ -11,8 +11,8 @@ LIC_FILES_CHKSUM =
>     "file://LICENSE.md;md5=9cae5acac2e9ee2fc3aec01ac88ce5db"
>      SRC_URI = "git://github.com/tvheadend/tvheadend.git
>     <http://github.com/tvheadend/tvheadend.git>"
>
>      SRCREV = "bdc2ae9e19520a10cdf0bec0fcc0050b32bc75ff"
>     -PV = "4.3+git${SRCPV}"
>     -PKGV = "4.3+git${GITPKGV}"
>     +PV = "4.3+git2${SRCPV}"
>     +PE = "1"
>
>      S = "${WORKDIR}/git"
>
>     -- 
>     2.7.4
>
>     -- 
>     _______________________________________________
>     Openembedded-devel mailing list
>     Openembedded-devel@lists.openembedded.org
>     <mailto:Openembedded-devel@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>


