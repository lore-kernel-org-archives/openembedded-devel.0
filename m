Return-Path: <Dengke.Du@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0926A6FEE0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Oct 2016 08:47:09 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u9P8lAn9019757
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Oct 2016 01:47:10 -0700
Received: from [128.224.162.169] (128.224.162.169) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 25 Oct 2016 01:47:09 -0700
To: <openembedded-devel@lists.openembedded.org>
References: <1477370829-107070-1-git-send-email-dengke.du@windriver.com>
	<6e9aa1b0-86a3-b993-7c64-c96eeeab9a3c@windriver.com>
From: Dengke Du <dengke.du@windriver.com>
Message-ID: <2951b996-6e9d-e5ac-03bf-8b7b9dbba22e@windriver.com>
Date: Tue, 25 Oct 2016 16:47:06 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <6e9aa1b0-86a3-b993-7c64-c96eeeab9a3c@windriver.com>
Subject: Re: [PATCH] sdparm: 1.09 -> 1.10
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
X-List-Received-Date: Tue, 25 Oct 2016 08:47:11 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

OK, thanks for reminding, I will send V2.

// Dengke


On 2016年10月25日 16:28, Robert Yang wrote:
>
> Missing [meta-oe] in subject line, see:
>
> propriate prefix so that it is clear which layer the patch is intended 
> to be applied to:
>
> // Robert
>
> On 10/25/2016 12:47 PM, Dengke Du wrote:
>> Signed-off-by: Dengke Du <dengke.du@windriver.com>
>> ---
>>  .../sdparm/files/make-sysroot-work.patch           | 14 ++++++++-----
>>  meta-oe/recipes-support/sdparm/sdparm_1.09.bb      | 23 
>> ----------------------
>>  meta-oe/recipes-support/sdparm/sdparm_1.10.bb      | 23 
>> ++++++++++++++++++++++
>>  3 files changed, 32 insertions(+), 28 deletions(-)
>>  delete mode 100644 meta-oe/recipes-support/sdparm/sdparm_1.09.bb
>>  create mode 100644 meta-oe/recipes-support/sdparm/sdparm_1.10.bb
>>
>> diff --git 
>> a/meta-oe/recipes-support/sdparm/files/make-sysroot-work.patch 
>> b/meta-oe/recipes-support/sdparm/files/make-sysroot-work.patch
>> index 5405ed8..3fd85d9 100644
>> --- a/meta-oe/recipes-support/sdparm/files/make-sysroot-work.patch
>> +++ b/meta-oe/recipes-support/sdparm/files/make-sysroot-work.patch
>> @@ -1,27 +1,31 @@
>> -[PATCH] make sysroot work
>> +From 15f0722bc5481cca5ba92adceab8c769112e4ea6 Mon Sep 17 00:00:00 2001
>> +From: Dengke Du <dengke.du@windriver.com>
>> +Date: Mon, 24 Oct 2016 07:28:13 +0000
>> +Subject: [PATCH] sdparm: make sysroot work
>>
>>  Upstream-Status: Pending
>>
>>  Add = before the included dir to make sysroot work
>>
>>  Signed-off-by: Roy.Li <rongqing.li@windriver.com>
>> +Signed-off-by: Dengke Du <dengke.du@windriver.com>
>>  ---
>>   src/Makefile.am | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>>  diff --git a/src/Makefile.am b/src/Makefile.am
>> -index c83788c..9f62115 100644
>> +index 61dd9f8..42c911f 100644
>>  --- a/src/Makefile.am
>>  +++ b/src/Makefile.am
>> -@@ -32,7 +32,7 @@ sglib_SOURCES =        ../lib/sg_lib.c \
>> +@@ -41,7 +41,7 @@ sglib_SOURCES =        ../lib/sg_lib.c \
>>               ../lib/sg_pt_common.c
>>
>>   if HAVE_SGUTILS
>> --INCLUDES = -I/usr/include/scsi
>> +-INCLUDES = -I/scsi
>>  +INCLUDES = -I=@includedir@/scsi
>>   sdparm_LDADD = @GETOPT_O_FILES@ @os_libs@ @SGUTILS_LIBS@
>>   sdparm_DEPENDENCIES = @GETOPT_O_FILES@
>>   else
>>  --
>> -1.9.1
>> +2.7.4
>>
>> diff --git a/meta-oe/recipes-support/sdparm/sdparm_1.09.bb 
>> b/meta-oe/recipes-support/sdparm/sdparm_1.09.bb
>> deleted file mode 100644
>> index ca11ca4..0000000
>> --- a/meta-oe/recipes-support/sdparm/sdparm_1.09.bb
>> +++ /dev/null
>> @@ -1,23 +0,0 @@
>> -SUMMARY = "fetch and change SCSI mode pages"
>> -DESCRIPTION = "The sdparm utility accesses and optionally modifies \
>> -SCSI devices' mode page and inquiry data."
>> -HOMEPAGE = "http://sg.danny.cz/sg/sdparm.html"
>> -SECTION = "console/utils"
>> -LICENSE = "BSD"
>> -LIC_FILES_CHKSUM = 
>> "file://COPYING;md5=ecab6c36b7ba82c675581dd0afde36f7 \
>> - file://lib/BSD_LICENSE;md5=1d52f4a66f1e0ed96776bf354ab7a2ed"
>> -DEPENDS="sg3-utils"
>> -SRC_URI = "http://sg.danny.cz/sg/p/${BPN}-${PV}.tgz \
>> -           file://make-sysroot-work.patch \
>> -           "
>> -
>> -PACKAGES =+ "${PN}-scripts"
>> -RDEPENDS_${PN}-scripts += "bash ${PN}"
>> -
>> -SRC_URI[md5sum] = "e51b1fd41c3e4c9d1274a2e4f046eebf"
>> -SRC_URI[sha256sum] = 
>> "7294f44173ac0946f1de8af02b1bdb0bd648079245396589397a2b0d3abc42d3"
>> -
>> -inherit autotools
>> -
>> -# Put the bash scripts to ${PN}-scripts
>> -FILES_${PN}-scripts = "${bindir}/sas_disk_blink ${bindir}/scsi_ch_swp"
>> diff --git a/meta-oe/recipes-support/sdparm/sdparm_1.10.bb 
>> b/meta-oe/recipes-support/sdparm/sdparm_1.10.bb
>> new file mode 100644
>> index 0000000..8ab2819
>> --- /dev/null
>> +++ b/meta-oe/recipes-support/sdparm/sdparm_1.10.bb
>> @@ -0,0 +1,23 @@
>> +SUMMARY = "fetch and change SCSI mode pages"
>> +DESCRIPTION = "The sdparm utility accesses and optionally modifies \
>> +SCSI devices' mode page and inquiry data."
>> +HOMEPAGE = "http://sg.danny.cz/sg/sdparm.html"
>> +SECTION = "console/utils"
>> +LICENSE = "BSD"
>> +LIC_FILES_CHKSUM = 
>> "file://COPYING;md5=ecab6c36b7ba82c675581dd0afde36f7 \
>> + file://lib/BSD_LICENSE;md5=1d52f4a66f1e0ed96776bf354ab7a2ed"
>> +DEPENDS="sg3-utils"
>> +SRC_URI = "http://sg.danny.cz/sg/p/${BPN}-${PV}.tgz \
>> +           file://make-sysroot-work.patch \
>> +           "
>> +
>> +PACKAGES =+ "${PN}-scripts"
>> +RDEPENDS_${PN}-scripts += "bash ${PN}"
>> +
>> +SRC_URI[md5sum] = "bdae64375376ce8fe4bf9521c1db858f"
>> +SRC_URI[sha256sum] = 
>> "1ea1ed1bb1ee2aef62392618fa42da9ed027d5e655f174525c39235778292ab3"
>> +
>> +inherit autotools
>> +
>> +# Put the bash scripts to ${PN}-scripts
>> +FILES_${PN}-scripts = "${bindir}/sas_disk_blink ${bindir}/scsi_ch_swp"
>>


