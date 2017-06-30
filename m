Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id EAF5078067
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Jun 2017 01:09:35 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v5U19ZkD009741
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Thu, 29 Jun 2017 18:09:36 -0700
Received: from [128.224.162.212] (128.224.162.212) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 29 Jun 2017 18:09:35 -0700
To: Martin Jansa <martin.jansa@gmail.com>
References: <20170629090503.13157-1-kai.kang@windriver.com>
	<CA+chaQc5qaypv72qzhfHVx66nfuWFGz5sRB0OMF2MvmsNa7Trg@mail.gmail.com>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <e4401ee3-4011-18e0-17f4-eb5a79605008@windriver.com>
Date: Fri, 30 Jun 2017 09:10:44 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.1
MIME-Version: 1.0
In-Reply-To: <CA+chaQc5qaypv72qzhfHVx66nfuWFGz5sRB0OMF2MvmsNa7Trg@mail.gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] gflags: update downloadfilename
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
X-List-Received-Date: Fri, 30 Jun 2017 01:09:36 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2017年06月29日 23:19, Martin Jansa wrote:
> Change it to git fetcher, because github archives can be regenerated 
> from time to time.

OK.

--Kai

>
> On Thu, Jun 29, 2017 at 11:05 AM, <kai.kang@windriver.com 
> <mailto:kai.kang@windriver.com>> wrote:
>
>     From: Kai Kang <kai.kang@windriver.com
>     <mailto:kai.kang@windriver.com>>
>
>     The downloadfilename of gflags is not proper for multilib recipe.
>     Replace it with ${BP}.
>
>     Signed-off-by: Kai Kang <kai.kang@windriver.com
>     <mailto:kai.kang@windriver.com>>
>     ---
>      meta-oe/recipes-support/gflags/gflags_2.2.0.bb
>     <http://gflags_2.2.0.bb> | 2 +-
>      1 file changed, 1 insertion(+), 1 deletion(-)
>
>     diff --git a/meta-oe/recipes-support/gflags/gflags_2.2.0.bb
>     <http://gflags_2.2.0.bb>
>     b/meta-oe/recipes-support/gflags/gflags_2.2.0.bb
>     <http://gflags_2.2.0.bb>
>     index 5fc28f6..e2bac9a 100644
>     --- a/meta-oe/recipes-support/gflags/gflags_2.2.0.bb
>     <http://gflags_2.2.0.bb>
>     +++ b/meta-oe/recipes-support/gflags/gflags_2.2.0.bb
>     <http://gflags_2.2.0.bb>
>     @@ -5,7 +5,7 @@ HOMEPAGE = "https://github.com/gflags/gflags
>     <https://github.com/gflags/gflags>"
>      LICENSE = "BSD-3-Clause"
>      LIC_FILES_CHKSUM =
>     "file://COPYING.txt;md5=c80d1a3b623f72bb85a4c75b556551df"
>
>     -SRC_URI =
>     "https://github.com/gflags/gflags/archive/v${PV}.tar.gz;downloadfilename=${PN}-${PV}.tar.gz
>     <https://github.com/gflags/gflags/archive/v$%7BPV%7D.tar.gz;downloadfilename=$%7BPN%7D-$%7BPV%7D.tar.gz>"
>     +SRC_URI =
>     "https://github.com/gflags/gflags/archive/v${PV}.tar.gz;downloadfilename=${BP}.tar.gz
>     <https://github.com/gflags/gflags/archive/v$%7BPV%7D.tar.gz;downloadfilename=$%7BBP%7D.tar.gz>"
>      SRC_URI[md5sum] = "b99048d9ab82d8c56e876fb1456c285e"
>      SRC_URI[sha256sum] =
>     "466c36c6508a451734e4f4d76825cf9cd9b8716d2b70ef36479ae40f08271f88"
>
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


