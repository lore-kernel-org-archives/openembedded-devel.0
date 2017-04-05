Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 699FB73128
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Apr 2017 09:37:53 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v359brh0026275
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 5 Apr 2017 02:37:53 -0700 (PDT)
Received: from [128.224.162.185] (128.224.162.185) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 5 Apr 2017 02:37:53 -0700
To: Martin Jansa <martin.jansa@gmail.com>
References: <20170321025110.3562-1-kai.kang@windriver.com>
	<20170321055346.24665-1-kai.kang@windriver.com>
	<CA+chaQeDxFhUHzP2KinSOG2d9FYRTLnLbq630LOwn2fJX26RUg@mail.gmail.com>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <24ac3730-829b-f596-41eb-bfcafe846347@windriver.com>
Date: Wed, 5 Apr 2017 17:37:18 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <CA+chaQeDxFhUHzP2KinSOG2d9FYRTLnLbq630LOwn2fJX26RUg@mail.gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v2] gflags: correct S and update library install directory
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
X-List-Received-Date: Wed, 05 Apr 2017 09:37:54 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2017年03月30日 23:49, Martin Jansa wrote:
> This could be the reason for opencv failures:
> http://errors.yoctoproject.org/Errors/Details/138538/

Sorry for the trouble and I am working on it.

--Kai

>
>
> On Tue, Mar 21, 2017 at 6:53 AM, <kai.kang@windriver.com 
> <mailto:kai.kang@windriver.com>> wrote:
>
>     From: Kai Kang <kai.kang@windriver.com
>     <mailto:kai.kang@windriver.com>>
>
>     The current setting of S is not right for multilib. Remove the setting
>     and use the default value.
>
>     And library install directory is not right either. Pass ${libdir}
>     to fix
>     the [installed-vs-shipped] QA issue:
>
>     | ERROR: gflags-2.2.0-r0 do_package: QA Issue: gflags:
>     Files/directories
>     | were installed but not shipped in any package:
>     |   /usr/lib/libgflags.so
>     |   /usr/lib/libgflags_nothreads.so.2.2
>
>     Signed-off-by: Kai Kang <kai.kang@windriver.com
>     <mailto:kai.kang@windriver.com>>
>     ---
>      meta-oe/recipes-support/gflags/gflags_2.2.0.bb
>     <http://gflags_2.2.0.bb> | 3 +--
>      1 file changed, 1 insertion(+), 2 deletions(-)
>
>     diff --git a/meta-oe/recipes-support/gflags/gflags_2.2.0.bb
>     <http://gflags_2.2.0.bb>
>     b/meta-oe/recipes-support/gflags/gflags_2.2.0.bb
>     <http://gflags_2.2.0.bb>
>     index b9188c3..77617ef 100644
>     --- a/meta-oe/recipes-support/gflags/gflags_2.2.0.bb
>     <http://gflags_2.2.0.bb>
>     +++ b/meta-oe/recipes-support/gflags/gflags_2.2.0.bb
>     <http://gflags_2.2.0.bb>
>     @@ -8,13 +8,12 @@ LIC_FILES_CHKSUM =
>     "file://COPYING.txt;md5=c80d1a3b623f72bb85a4c75b556551df"
>      SRC_URI = "https://github.com/gflags/gflags/archive/v${PV}.tar.gz
>     <https://github.com/gflags/gflags/archive/v$%7BPV%7D.tar.gz>"
>      SRC_URI[md5sum] = "b99048d9ab82d8c56e876fb1456c285e"
>      SRC_URI[sha256sum] =
>     "466c36c6508a451734e4f4d76825cf9cd9b8716d2b70ef36479ae40f08271f88"
>     -S = "${WORKDIR}/${PN}-${PV}/"
>
>      FILES_${PN}-dev += "${libdir}/cmake"
>
>      inherit cmake
>
>     -EXTRA_OECMAKE="-DBUILD_SHARED_LIBS=ON -DREGISTER_INSTALL_PREFIX=OFF"
>     +EXTRA_OECMAKE="-DBUILD_SHARED_LIBS=ON
>     -DREGISTER_INSTALL_PREFIX=OFF -DLIBRARY_INSTALL_DIR=${libdir}"
>
>      PACKAGES =+ "${PN}-bash-completion"
>      FILES_${PN}-bash-completion += "${bindir}/gflags_completions.sh"
>     --
>     2.10.1
>
>     --
>     _______________________________________________
>     Openembedded-devel mailing list
>     Openembedded-devel@lists.openembedded.org
>     <mailto:Openembedded-devel@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>     <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>
>
>


-- 
Regards,
Neil | Kai Kang


