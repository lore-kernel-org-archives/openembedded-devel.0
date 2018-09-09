Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id CF689793E6
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  9 Sep 2018 07:22:14 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w897LNSf000985
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 9 Sep 2018 00:21:48 -0700
Received: from [128.224.162.202] (128.224.162.202) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.408.0;
	Sun, 9 Sep 2018 00:21:16 -0700
To: Khem Raj <raj.khem@gmail.com>
References: <1536417214-146096-1-git-send-email-hongxu.jia@windriver.com>
	<CAMKF1soJdQnygZD9sbmKZazJFm=G_ugjogz_jnfAppd5q7oT1A@mail.gmail.com>
From: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <b316249f-438a-c1a1-c562-bfce8b565df0@windriver.com>
Date: Sun, 9 Sep 2018 15:21:15 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CAMKF1soJdQnygZD9sbmKZazJFm=G_ugjogz_jnfAppd5q7oT1A@mail.gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] sanlock: add version 3.6.0
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
X-List-Received-Date: Sun, 09 Sep 2018 07:22:15 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2018年09月09日 04:31, Khem Raj wrote:
> fails to build with musl and may be clang
>
> http://errors.yoctoproject.org/Errors/Details/192148/

OK, I will fix it, v2 incoming

//Hongxu


> On Sat, Sep 8, 2018 at 7:34 AM Hongxu Jia <hongxu.jia@windriver.com> wrote:
>> A shared storage lock manager.
>>
>> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>> ---
>>   meta-oe/recipes-extended/sanlock/sanlock_3.6.0.bb | 35 +++++++++++++++++++++++
>>   1 file changed, 35 insertions(+)
>>   create mode 100644 meta-oe/recipes-extended/sanlock/sanlock_3.6.0.bb
>>
>> diff --git a/meta-oe/recipes-extended/sanlock/sanlock_3.6.0.bb b/meta-oe/recipes-extended/sanlock/sanlock_3.6.0.bb
>> new file mode 100644
>> index 0000000..e9a5792
>> --- /dev/null
>> +++ b/meta-oe/recipes-extended/sanlock/sanlock_3.6.0.bb
>> @@ -0,0 +1,35 @@
>> +SUMMARY = "A shared storage lock manager"
>> +DESCRIPTION = "sanlock  is  a lock manager built on shared storage.  Hosts with access \
>> +to the storage can perform locking.   An  application  running  on  the \
>> +hosts  is  given  a small amount of space on the shared block device or \
>> +file, and uses sanlock for its  own  application-specific  synchronization. \
>> +Internally,  the  sanlock  daemon manages locks using two disk-based \
>> +lease algorithms: delta leases and paxos leases."
>> +HOMEPAGE = "https://pagure.io/sanlock"
>> +SECTION = "utils"
>> +
>> +LICENSE = "LGPLv2+ & GPLv2 & GPLv2+"
>> +LIC_FILES_CHKSUM = "file://README.license;md5=60487bf0bf429d6b5aa72b6d37a0eb22"
>> +
>> +SRC_URI = "git://pagure.io/sanlock.git;protocol=http \
>> +          "
>> +SRCREV = "90b2ffa77edd46bea007b7bb39bfd4d2db2ff7af"
>> +S = "${WORKDIR}/git"
>> +
>> +DEPENDS = "libaio util-linux"
>> +
>> +inherit distutils
>> +
>> +do_configure[noexec] = "1"
>> +
>> +do_compile_prepend () {
>> +    oe_runmake -C wdmd CMD_LDFLAGS="${LDFLAGS}" LIB_LDFLAGS="${LDFLAGS}"
>> +    oe_runmake -C src CMD_LDFLAGS="${LDFLAGS}" LIB_ENTIRE_LDFLAGS="${LDFLAGS}" LIB_CLIENT_LDFLAGS="${LDFLAGS}"
>> +    cd ${S}/python
>> +}
>> +
>> +do_install_prepend () {
>> +    oe_runmake -C wdmd DESTDIR=${D} install
>> +    oe_runmake -C src DESTDIR=${D} install
>> +    cd ${S}/python
>> +}
>> --
>> 2.8.1
>>


