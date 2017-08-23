Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id CCAB0782DA
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Aug 2017 01:50:06 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v7N1o6Hq002173
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Tue, 22 Aug 2017 18:50:07 -0700
Received: from [128.224.162.212] (128.224.162.212) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Tue, 22 Aug 2017 18:50:06 -0700
To: Martin Jansa <martin.jansa@gmail.com>
References: <20170817092828.3629-1-kai.kang@windriver.com>
	<5ff3ea2b-e7e2-5a68-563b-5786ad038e4d@windriver.com>
	<CA+chaQeZAssT0CUJPQREUZqx0ti0OycLPsGSFcXg2Y96R8PC4Q@mail.gmail.com>
	<515b5bdf-dd12-05fc-8585-0193e7dadbd1@windriver.com>
	<CA+chaQeoFXxW7NomAOsT4U47nTo9cZgCwjmqTa-ciaUYv3oJ3Q@mail.gmail.com>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <8abc7fa7-1a83-e970-1b8e-b174e5e98a24@windriver.com>
Date: Wed, 23 Aug 2017 09:50:00 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <CA+chaQeoFXxW7NomAOsT4U47nTo9cZgCwjmqTa-ciaUYv3oJ3Q@mail.gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] mariadb: 5.5.55 -> 5.5.57
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
X-List-Received-Date: Wed, 23 Aug 2017 01:50:07 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2017年08月21日 12:46, Martin Jansa wrote:
> Hi,
>
> the security_flags.inc:
>
> require conf/distro/include/security_flags.inc
>
> and if still doesn't reproduce than last bit is thumb:
>
> PREFERRED_ARM_INSTRUCTION_SET              ?= "thumb"
> ARM_INSTRUCTION_SET = "${PREFERRED_ARM_INSTRUCTION_SET}"

Hi Martin,

Thanks. I can reproduce the failure and I'll try to figure out the root 
cause.


--Kai


>
> Regards,
>
> On Mon, Aug 21, 2017 at 6:08 AM, Kang Kai <Kai.Kang@windriver.com 
> <mailto:Kai.Kang@windriver.com>> wrote:
>
>     On 2017年08月21日 07:48, Martin Jansa wrote:
>>     Like the previous version this one fails to build for qemuarm
>>     when security_flags.inc are enabled (maybe only in combination
>>     with gold and thumb), can you please look into it?
>>
>>     http://errors.yoctoproject.org/Errors/Details/152655/
>>     <http://errors.yoctoproject.org/Errors/Details/152655/>
>
>     I built qemuarm with following configures in local.conf and no
>     failure.
>
>     require conf/distro/include/security_flags.inc
>
>     DISTRO_FEATURES_append = " ld-is-gold"
>
>
>     Any other configure did I miss? Thanks.
>
>
>     Regards,
>     Kai
>
>
>>
>>     On Fri, Aug 18, 2017 at 4:51 AM, Kang Kai <Kai.Kang@windriver.com
>>     <mailto:Kai.Kang@windriver.com>> wrote:
>>
>>         On 2017年08月17日 17:28, kai.kang@windriver.com
>>         <mailto:kai.kang@windriver.com> wrote:
>>
>>             From: Kai Kang <kai.kang@windriver.com
>>             <mailto:kai.kang@windriver.com>>
>>
>>             Upgrade mariadb from 5.5.55 to 5.5.57.
>>
>>
>>         Forgot [meta-oe] in title. Sorry for inconvenience.
>>
>>         --Kai
>>
>>
>>
>>             * update SRC_URI that mariadb.com <http://mariadb.com>
>>             doesn't provides source tarball of 5.5.57
>>             * remove gcc7.patch which is not needed any more
>>
>>             Signed-off-by: Kai Kang <kai.kang@windriver.com
>>             <mailto:kai.kang@windriver.com>>
>>             ---
>>               .../{mariadb-native_5.5.55.bb
>>             <http://mariadb-native_5.5.55.bb> =>
>>             mariadb-native_5.5.57.bb
>>             <http://mariadb-native_5.5.57.bb>} |  0
>>               meta-oe/recipes-support/mysql/mariadb.inc              
>>                |  8 ++++----
>>               meta-oe/recipes-support/mysql/mariadb/gcc7.patch      
>>                 | 13 -------------
>>               .../mysql/{mariadb_5.5.55.bb <http://mariadb_5.5.55.bb>
>>             => mariadb_5.5.57.bb <http://mariadb_5.5.57.bb>}         |  0
>>               4 files changed, 4 insertions(+), 17 deletions(-)
>>               rename
>>             meta-oe/recipes-support/mysql/{mariadb-native_5.5.55.bb
>>             <http://mariadb-native_5.5.55.bb> =>
>>             mariadb-native_5.5.57.bb
>>             <http://mariadb-native_5.5.57.bb>} (100%)
>>               delete mode 100644
>>             meta-oe/recipes-support/mysql/mariadb/gcc7.patch
>>               rename meta-oe/recipes-support/mysql/{mariadb_5.5.55.bb
>>             <http://mariadb_5.5.55.bb> => mariadb_5.5.57.bb
>>             <http://mariadb_5.5.57.bb>} (100%)
>>
>>             diff --git
>>             a/meta-oe/recipes-support/mysql/mariadb-native_5.5.55.bb
>>             <http://mariadb-native_5.5.55.bb>
>>             b/meta-oe/recipes-support/mysql/mariadb-native_5.5.57.bb
>>             <http://mariadb-native_5.5.57.bb>
>>             similarity index 100%
>>             rename from
>>             meta-oe/recipes-support/mysql/mariadb-native_5.5.55.bb
>>             <http://mariadb-native_5.5.55.bb>
>>             rename to
>>             meta-oe/recipes-support/mysql/mariadb-native_5.5.57.bb
>>             <http://mariadb-native_5.5.57.bb>
>>             diff --git a/meta-oe/recipes-support/mysql/mariadb.inc
>>             b/meta-oe/recipes-support/mysql/mariadb.inc
>>             index fd9dcbd..32e3eaa 100644
>>             --- a/meta-oe/recipes-support/mysql/mariadb.inc
>>             +++ b/meta-oe/recipes-support/mysql/mariadb.inc
>>             @@ -4,7 +4,7 @@ SECTION = "libs"
>>               LICENSE = "GPLv2"
>>               LIC_FILES_CHKSUM =
>>             "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
>>               -SRC_URI =
>>             "http://downloads.mariadb.com/MariaDB/mariadb-${PV}/source/mariadb-${PV}.tar.gz
>>             <http://downloads.mariadb.com/MariaDB/mariadb-$%7BPV%7D/source/mariadb-$%7BPV%7D.tar.gz>
>>             \
>>             +SRC_URI =
>>             "https://downloads.mariadb.org/f/${BP}/source/${BP}.tar.gz
>>             <https://downloads.mariadb.org/f/$%7BBP%7D/source/$%7BBP%7D.tar.gz>
>>             \
>>             file://fix-cmake-module-path.patch \
>>             file://remove-bad-path.patch \
>>             file://fix-mysqlclient-r-version.patch \
>>             @@ -17,10 +17,10 @@ SRC_URI =
>>             "http://downloads.mariadb.com/MariaDB/mariadb-${PV}/source/mariadb-${P
>>             <http://downloads.mariadb.com/MariaDB/mariadb-$%7BPV%7D/source/mariadb-$%7BP>
>>             file://fix-a-building-failure.patch \
>>             file://change-cc-to-cc-version.patch \
>>             file://0001-disable-ucontext-on-musl.patch \
>>             - file://gcc7.patch \
>>                         "
>>             -SRC_URI[md5sum] = "54a0bbbc9b67308e7c076622d02f0fcd"
>>             -SRC_URI[sha256sum] =
>>             "cb94e315d0fc90c62db5a6c7829c9966f674285d99b3ba3ffa575fb4a26edc86"
>>             +
>>             +SRC_URI[md5sum] = "2d4104aae0b9e5efa8878918bd329cb4"
>>             +SRC_URI[sha256sum] =
>>             "5dbde98d7e4a5a1721b6cbed7898b2549a88866247951cf586057975c6cea641"
>>                 S = "${WORKDIR}/mariadb-${PV}"
>>               diff --git
>>             a/meta-oe/recipes-support/mysql/mariadb/gcc7.patch
>>             b/meta-oe/recipes-support/mysql/mariadb/gcc7.patch
>>             deleted file mode 100644
>>             index 3e75b26..0000000
>>             --- a/meta-oe/recipes-support/mysql/mariadb/gcc7.patch
>>             +++ /dev/null
>>             @@ -1,13 +0,0 @@
>>             -Index: mariadb-5.5.55/client/mysql.cc
>>             -===================================================================
>>             ---- mariadb-5.5.55.orig/client/mysql.cc
>>             -+++ mariadb-5.5.55/client/mysql.cc
>>             -@@ -2850,7 +2850,7 @@ You can turn off this feature to
>>             get a q
>>             -         mysql_free_result(fields);
>>             -         break;
>>             -       }
>>             --      field_names[i][num_fields*2]= '\0';
>>             -+      field_names[i][num_fields*2][0]= '\0';
>>             -       j=0;
>>             -       while ((sql_field=mysql_fetch_field(fields)))
>>             -       {
>>             diff --git
>>             a/meta-oe/recipes-support/mysql/mariadb_5.5.55.bb
>>             <http://mariadb_5.5.55.bb>
>>             b/meta-oe/recipes-support/mysql/mariadb_5.5.57.bb
>>             <http://mariadb_5.5.57.bb>
>>             similarity index 100%
>>             rename from
>>             meta-oe/recipes-support/mysql/mariadb_5.5.55.bb
>>             <http://mariadb_5.5.55.bb>
>>             rename to meta-oe/recipes-support/mysql/mariadb_5.5.57.bb
>>             <http://mariadb_5.5.57.bb>
>>
>>
>>
>>         -- 
>>         Regards,
>>         Neil | Kai Kang
>>
>>
>>         -- 
>>         _______________________________________________
>>         Openembedded-devel mailing list
>>         Openembedded-devel@lists.openembedded.org
>>         <mailto:Openembedded-devel@lists.openembedded.org>
>>         http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>         <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>
>>
>>
>
>     -- 
>     Regards,
>     Neil | Kai Kang
>
>

-- 
Regards,
Neil | Kai Kang


