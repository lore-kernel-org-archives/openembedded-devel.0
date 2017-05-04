Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id DB40477AB5
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 May 2017 10:00:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v44A0LdL013386
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 4 May 2017 03:00:21 -0700 (PDT)
Received: from [128.224.162.201] (128.224.162.201) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.294.0;
	Thu, 4 May 2017 03:00:20 -0700
To: Martin Jansa <martin.jansa@gmail.com>
References: <20170504093205.19594-1-Qi.Chen@windriver.com>
	<CA+chaQcDd5OenuP2-imDks4ykRK6a8a4Vmu1F0WodbFas74okQ@mail.gmail.com>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <86d70cb6-e85b-433d-dda0-170660a9d57a@windriver.com>
Date: Thu, 4 May 2017 18:02:29 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CA+chaQcDd5OenuP2-imDks4ykRK6a8a4Vmu1F0WodbFas74okQ@mail.gmail.com>
X-Originating-IP: [128.224.162.201]
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-filesystems][PATCH 1/2] xfsdump: 3.1.4 -> 3.1.6
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
X-List-Received-Date: Thu, 04 May 2017 10:00:22 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 05/04/2017 05:55 PM, Martin Jansa wrote:
> Have you kept the old version intentionally?
>

NO. That's a mistake when using 'git format-patch', I'll send out V2.
Thanks for reminding me about this.

Best Regards,
Chen Qi

> On Thu, May 4, 2017 at 11:32 AM, Chen Qi <Qi.Chen@windriver.com 
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
>     Signed-off-by: Robert Yang <liezhi.yang@windriver.com
>     <mailto:liezhi.yang@windriver.com>>
>     ---
>      .../recipes-utils/xfsdump/xfsdump_3.1.6.bb
>     <http://xfsdump_3.1.6.bb>         | 38 ++++++++++++++++++++++
>      1 file changed, 38 insertions(+)
>      create mode 100644
>     meta-filesystems/recipes-utils/xfsdump/xfsdump_3.1.6.bb
>     <http://xfsdump_3.1.6.bb>
>
>     diff --git
>     a/meta-filesystems/recipes-utils/xfsdump/xfsdump_3.1.6.bb
>     <http://xfsdump_3.1.6.bb>
>     b/meta-filesystems/recipes-utils/xfsdump/xfsdump_3.1.6.bb
>     <http://xfsdump_3.1.6.bb>
>     new file mode 100644
>     index 000000000..8f942ba7c
>     --- /dev/null
>     +++ b/meta-filesystems/recipes-utils/xfsdump/xfsdump_3.1.6.bb
>     <http://xfsdump_3.1.6.bb>
>     @@ -0,0 +1,38 @@
>     +SUMMARY = "XFS Filesystem Dump Utility"
>     +DESCRIPTION = "The xfsdump package contains xfsdump, xfsrestore
>     and a \
>     +               number of other utilities for administering XFS
>     filesystems.\
>     +               xfsdump examines files in a filesystem, determines
>     which \
>     +               need to be backed up, and copies those files to a \
>     +               specified disk, tape or other storage medium."
>     +HOMEPAGE = "http://oss.sgi.com/projects/xfs
>     <http://oss.sgi.com/projects/xfs>"
>     +SECTION = "base"
>     +LICENSE = "GPLv2"
>     +LIC_FILES_CHKSUM =
>     "file://doc/COPYING;md5=15c832894d10ddd00dfcf57bee490ecc"
>     +DEPENDS = "xfsprogs attr"
>     +
>     +SRC_URI =
>     "ftp://oss.sgi.com/projects/xfs/cmd_tars/${BPN}-${PV}.tar.gz
>     <ftp://oss.sgi.com/projects/xfs/cmd_tars/$%7BBPN%7D-$%7BPV%7D.tar.gz>
>     \
>     +    file://remove-install-as-user.patch \
>     +"
>     +SRC_URI[md5sum] = "50353cd4f4b435685955363e6044f4d1"
>     +SRC_URI[sha256sum] =
>     "7f78c11ca527477d90e5e62b0778f3ad96f2b71c19173044e9aca9515fff42d0"
>     +
>     +inherit autotools-brokensep
>     +
>     +PARALLEL_MAKE = ""
>     +PACKAGECONFIG ??= ""
>     +PACKAGECONFIG[gettext] =
>     "--enable-gettext=yes,--enable-gettext=no,gettext"
>     +
>     +EXTRA_OEMAKE += "'LIBTOOL=${HOST_SYS}-libtool' V=1"
>     +
>     +do_configure () {
>     +    export DEBUG="-DNDEBUG"
>     +    oe_runconf
>     +}
>     +
>     +do_install () {
>     +    export DIST_ROOT=${D}
>     +    oe_runmake install
>     +    oe_runmake install-dev
>     +}
>     +
>     +PNBLACKLIST[xfsdump] ?= "Depends on broken xfsprogs - the recipe
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


