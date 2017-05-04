Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id ADCBE71996
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 May 2017 02:49:02 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v442n2Xt016775
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Wed, 3 May 2017 19:49:02 -0700
Received: from [128.224.162.201] (128.224.162.201) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.294.0;
	Wed, 3 May 2017 19:49:01 -0700
To: Martin Jansa <martin.jansa@gmail.com>
References: <1493275064-7998-1-git-send-email-Qi.Chen@windriver.com>
	<CA+chaQeF3pcN7N1JzvKDJG+b3v8pcyQiHn42hpTWhtZYF+eVZg@mail.gmail.com>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <59deb337-cb6c-21f8-d8bb-499d1da23e2a@windriver.com>
Date: Thu, 4 May 2017 10:51:09 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CA+chaQeF3pcN7N1JzvKDJG+b3v8pcyQiHn42hpTWhtZYF+eVZg@mail.gmail.com>
X-Originating-IP: [128.224.162.201]
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-filesystems][PATCH] xfsdump: upgrade to 3.1.6 and remove from blacklist
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
X-List-Received-Date: Thu, 04 May 2017 02:49:03 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

Sorry for my carelessness. I'll fix the problem ASAP and sent out a new 
patchset.

Best Regards,
Chen Qi

On 04/27/2017 10:44 PM, Martin Jansa wrote:
> And it still fails:
> http://errors.yoctoproject.org/Errors/Details/141368/
>
> On Thu, Apr 27, 2017 at 8:37 AM, <Qi.Chen@windriver.com 
> <mailto:Qi.Chen@windriver.com>> wrote:
>
>     From: Robert Yang <liezhi.yang@windriver.com
>     <mailto:liezhi.yang@windriver.com>>
>
>     The 3.1.4 doesn't work with xfsprogs 4.7:
>     | inv_files.o: In function `inv_dirpath':
>     |xfsdump-3.1.4/invutil/inv_files.c:53: undefined reference to `ASSERT'
>     | inv_files.o: In function `inv_fstab':
>     |xfsdump-3.1.4/invutil/inv_files.c:60: undefined reference to `ASSERT'
>     | inv_files.o: In function `inv_lockfile':
>     |xfsdump-3.1.4/invutil/inv_files.c:67: undefined reference to `ASSERT'
>     | inv_files.o: In function `inv_basepath':
>     |xfsdump-3.1.4/invutil/inv_files.c:74: undefined reference to `ASSERT'
>     | collect2: error: ld returned 1 exit status
>     | make[2]: *** [../include/buildrules:33: xfsinvutil] Error 1
>
>     Upgrade to 3.1.6, and remove it from blacklist.
>
>     Signed-off-by: Robert Yang <liezhi.yang@windriver.com
>     <mailto:liezhi.yang@windriver.com>>
>     ---
>      .../recipes-utils/xfsdump/{xfsdump_3.1.4.bb
>     <http://xfsdump_3.1.4.bb> => xfsdump_3.1.6.bb
>     <http://xfsdump_3.1.6.bb>} | 6 ++----
>      1 file changed, 2 insertions(+), 4 deletions(-)
>      rename meta-filesystems/recipes-utils/xfsdump/{xfsdump_3.1.4.bb
>     <http://xfsdump_3.1.4.bb> => xfsdump_3.1.6.bb
>     <http://xfsdump_3.1.6.bb>} (79%)
>
>     diff --git
>     a/meta-filesystems/recipes-utils/xfsdump/xfsdump_3.1.4.bb
>     <http://xfsdump_3.1.4.bb>
>     b/meta-filesystems/recipes-utils/xfsdump/xfsdump_3.1.6.bb
>     <http://xfsdump_3.1.6.bb>
>     similarity index 79%
>     rename from
>     meta-filesystems/recipes-utils/xfsdump/xfsdump_3.1.4.bb
>     <http://xfsdump_3.1.4.bb>
>     rename to meta-filesystems/recipes-utils/xfsdump/xfsdump_3.1.6.bb
>     <http://xfsdump_3.1.6.bb>
>     index d5ad0b0b2..fac9d47e8 100644
>     --- a/meta-filesystems/recipes-utils/xfsdump/xfsdump_3.1.4.bb
>     <http://xfsdump_3.1.4.bb>
>     +++ b/meta-filesystems/recipes-utils/xfsdump/xfsdump_3.1.6.bb
>     <http://xfsdump_3.1.6.bb>
>     @@ -13,8 +13,8 @@ DEPENDS = "xfsprogs attr"
>      SRC_URI =
>     "ftp://oss.sgi.com/projects/xfs/cmd_tars/${BPN}-${PV}.tar.gz
>     <ftp://oss.sgi.com/projects/xfs/cmd_tars/$%7BBPN%7D-$%7BPV%7D.tar.gz>
>     \
>          file://remove-install-as-user.patch \
>      "
>     -SRC_URI[md5sum] = "a8b1761be5feb363131e7b506639ad4c"
>     -SRC_URI[sha256sum] =
>     "570eafd0721515bdd79cb0e295b701d49cdf81e71a0a0ff0df6d4c5cc1960943"
>     +SRC_URI[md5sum] = "50353cd4f4b435685955363e6044f4d1"
>     +SRC_URI[sha256sum] =
>     "7f78c11ca527477d90e5e62b0778f3ad96f2b71c19173044e9aca9515fff42d0"
>
>      inherit autotools-brokensep
>
>     @@ -34,5 +34,3 @@ do_install () {
>          oe_runmake install
>          oe_runmake install-dev
>      }
>     -
>     -PNBLACKLIST[xfsdump] ?= "Depends on broken xfsprogs - the recipe
>     will be removed on 2017-09-01 unless the issue is fixed"
>     --
>     2.11.0
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


