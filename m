Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A5A3D796A4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Sep 2018 16:19:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w8HGJRLj019429
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 17 Sep 2018 09:19:28 -0700 (PDT)
Received: from [128.224.162.202] (128.224.162.202) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.408.0;
	Mon, 17 Sep 2018 09:19:27 -0700
To: Martin Jansa <martin.jansa@gmail.com>
References: <cover.1537199591.git.hongxu.jia@windriver.com>
	<CA+chaQdzPyhGSR=2yr6y6OvC8yKMq80nOX=WWnqdgqZkeN4Pow@mail.gmail.com>
From: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <362229a8-d5aa-e0eb-a1b6-fa3d71ff68c4@windriver.com>
Date: Tue, 18 Sep 2018 00:19:25 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CA+chaQdzPyhGSR=2yr6y6OvC8yKMq80nOX=WWnqdgqZkeN4Pow@mail.gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 00/19] 19 recipes to split one dpg package only
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
X-List-Received-Date: Mon, 17 Sep 2018 16:19:27 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2018年09月18日 00:02, Martin Jansa wrote:
> Would it make sense to do the same for -dev packages while you're at 
> it? I guess that in most cases it will be used in the same recipes.

The reason why focusing on *-dbg packages is
[reason]
Since `da5ec06 package: Add auto package splitting
of .debug files' applied in oe-core, the first dbg
package will have all debug files automatically.

If there are several sub dbg packages, except the
first one, the others are empty.
[reason]

While a sub `empty' dbg package installed, `gdb ***'
could not finding debug symbol

But dev packages do not have the similar problem.

BTW, RP rethinks to improve debug package dependency
handling in 2.7, so use one dbg package per recipe to align
with oe-core could reduce further improvement risk.

//Hongxu

>
> On Mon, Sep 17, 2018 at 5:55 PM Hongxu Jia <hongxu.jia@windriver.com 
> <mailto:hongxu.jia@windriver.com>> wrote:
>
>     Hi Khem,
>
>     As RP replied in previously oe-core mailing, one dbg package is
>     recommended, so I tweak them in oe one by one.
>
>     This pull request is one patch per recipe rather than merge them as
>     a large one, it may add your merging burden, but it is helpful for
>     reviewing
>     and rework any of them without resend all.
>
>     But if you prefer one patch, I could resend V2.
>
>     //Hongxu
>     The following changes since commit
>     a06c29be2f5bc204f965ee07298c34232c5c39fc:
>
>       klibc: fix build with GCC and -pie for mips, mips64, aarch64
>     (2018-09-15 07:37:11 -0700)
>
>     are available in the git repository at:
>
>       git://git.openembedded.org/openembedded-core-contrib
>     <http://git.openembedded.org/openembedded-core-contrib>
>     hongxu/dbg-split
>     http://cgit.openembedded.org/openembedded-core-contrib/log/?h=hongxu/dbg-split
>
>     Hongxu Jia (19):
>       fuse: split one dpg package only
>       libtevent: split one dpg package
>       libtdb: split one dpg package
>       libtalloc: split one dpg package
>       isomd5sum: split one dpg package
>       gnuplot: split one dpg package
>       scsirastools: split one dpg package
>       konkretcmpi: split one dpg package
>       gpsd: split one dpg package
>       wvstreams: split one dpg package
>       fontforge: split one dpg package
>       xerces-c: split one dpg package
>       v4l-utils: split one dpg package
>       lmsensors: split one dpg package
>       dbench: split one dpg package
>       postgresql: split one dpg package
>       mariadb: split one dpg package
>       pidgin: split one dpg package
>       syslog-ng: split one dpg package
>
>      .../recipes-support/fuse/fuse_2.9.8.bb <http://fuse_2.9.8.bb>    
>            |  8 +--
>      .../recipes-support/libtalloc/libtalloc_2.1.14.bb
>     <http://libtalloc_2.1.14.bb> |  6 +-
>      .../recipes-support/libtdb/libtdb_1.3.16.bb
>     <http://libtdb_1.3.16.bb>       |  5 +-
>      .../recipes-support/libtevent/libtevent_0.9.37.bb
>     <http://libtevent_0.9.37.bb> |  5 +-
>      meta-oe/recipes-benchmark/dbench/dbench_4.0.bb
>     <http://dbench_4.0.bb>     |  5 +-
>      meta-oe/recipes-bsp/lm_sensors/lmsensors_3.4.0.bb
>     <http://lmsensors_3.4.0.bb> | 15 ++---
>      .../recipes-connectivity/wvdial/wvstreams_4.6.1.bb
>     <http://wvstreams_4.6.1.bb> | 14 ++--
>      meta-oe/recipes-dbs/mysql/mariadb.inc              |  9 ++-
>      meta-oe/recipes-dbs/postgresql/postgresql.inc      | 74
>     ++++++----------------
>      .../recipes-devtools/xerces-c/xerces-c_3.1.4.bb
>     <http://xerces-c_3.1.4.bb>   |  8 +--
>      meta-oe/recipes-extended/gnuplot/gnuplot_5.2.2.bb
>     <http://gnuplot_5.2.2.bb> |  6 +-
>      .../recipes-extended/isomd5sum/isomd5sum_1.2.3.bb
>     <http://isomd5sum_1.2.3.bb> |  5 +-
>      .../konkretcmpi/konkretcmpi_0.9.2.bb
>     <http://konkretcmpi_0.9.2.bb>              |  5 +-
>      .../scsirastools/scsirastools_1.6.6.bb
>     <http://scsirastools_1.6.6.bb>            |  8 +--
>      .../fontforge/fontforge_20170731.bb
>     <http://fontforge_20170731.bb>               |  5 +-
>      .../v4l2apps/v4l-utils_1.12.3.bb <http://v4l-utils_1.12.3.bb>    
>                  |  5 +-
>      meta-oe/recipes-navigation/gpsd/gpsd_3.17.bb
>     <http://gpsd_3.17.bb>      |  6 +-
>      meta-oe/recipes-support/pidgin/pidgin_2.12.0.bb
>     <http://pidgin_2.12.0.bb>   |  9 +--
>      meta-oe/recipes-support/syslog-ng/syslog-ng.inc    |  4 +-
>      19 files changed, 81 insertions(+), 121 deletions(-)
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


