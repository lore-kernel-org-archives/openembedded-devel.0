Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 36D8F77D01
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Aug 2017 01:37:18 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v7O1bJm8028022
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 23 Aug 2017 18:37:19 -0700 (PDT)
Received: from [128.224.162.167] (128.224.162.167) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Wed, 23 Aug 2017 18:37:18 -0700
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
References: <1503482923-13058-1-git-send-email-Qi.Chen@windriver.com>
	<CAHiDW_GTtM44B+p-AU6UGUiyuAC0q+WdNCdkC4um9WrqwDZU-Q@mail.gmail.com>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <df215383-5957-d830-8d6f-d24de0a41666@windriver.com>
Date: Thu, 24 Aug 2017 09:42:08 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAHiDW_GTtM44B+p-AU6UGUiyuAC0q+WdNCdkC4um9WrqwDZU-Q@mail.gmail.com>
X-Originating-IP: [128.224.162.167]
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] openconnect: fix parallel compilation failure
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
X-List-Received-Date: Thu, 24 Aug 2017 01:37:19 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 08/23/2017 06:46 PM, Jussi Kukkonen wrote:
> On 23 August 2017 at 13:08, <Qi.Chen@windriver.com 
> <mailto:Qi.Chen@windriver.com>> wrote:
>
>     From: Chen Qi <Qi.Chen@windriver.com <mailto:Qi.Chen@windriver.com>>
>
>     This patch solves the following error which appears now and then
>     because of
>     parallel building.
>
>       ../git/main.c:78:21: fatal error: version.c: No such file or
>     directory
>
>     version.c is generated at build time. And it's needed by some
>     objects. So
>     it needs to be generated first to avoid compilation failure.
>
>     This patch fix the problem by generating version.c first before
>     building others.
>
>     Signed-off-by: Chen Qi <Qi.Chen@windriver.com
>     <mailto:Qi.Chen@windriver.com>>
>     ---
>      meta-networking/recipes-connectivity/openconnect/openconnect_git.bb
>     <http://openconnect_git.bb> | 4 ++++
>      1 file changed, 4 insertions(+)
>
>     diff --git
>     a/meta-networking/recipes-connectivity/openconnect/openconnect_git.bb
>     <http://openconnect_git.bb>
>     b/meta-networking/recipes-connectivity/openconnect/openconnect_git.bb
>     <http://openconnect_git.bb>
>     index 3a1f0f3..4242aa5 100644
>     ---
>     a/meta-networking/recipes-connectivity/openconnect/openconnect_git.bb
>     <http://openconnect_git.bb>
>     +++
>     b/meta-networking/recipes-connectivity/openconnect/openconnect_git.bb
>     <http://openconnect_git.bb>
>     @@ -25,3 +25,7 @@ inherit autotools pkgconfig
>
>      EXTRA_OECONF +=
>     "--with-vpnc-script=${SYSROOT_DESTDIR}${sysconfdir}/vpnc/vpnc-script \
>                       --disable-static"
>     +
>     +do_compile_prepend() {
>     +    make version.c
>     +}
>
>
> Upstream has had a proper Makefile.am fix for this since August 2016. 
> I think the recipe should just be upgraded -- VPN software from 2015 
> is a bad idea.
>
> Jussi


Thanks a lot. I'll send out a patch to upgrade it.

Best Regards,

Chen Qi


