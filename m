Return-Path: <Changqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 9AFD378560
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Jul 2018 07:08:23 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w6278M4T029021
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 2 Jul 2018 00:08:22 -0700 (PDT)
Received: from [128.224.162.228] (128.224.162.228) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.399.0;
	Mon, 2 Jul 2018 00:08:22 -0700
To: Khem Raj <raj.khem@gmail.com>
References: <1530498665-132100-1-git-send-email-changqing.li@windriver.com>
	<CAMKF1spEavbzFD9JN8UDERdcawBZfjC_MkAwbc_j8d-r=nSCcQ@mail.gmail.com>
From: Changqing Li <changqing.li@windriver.com>
Message-ID: <53d5e3d6-aaa1-c5ed-d344-de4b908c39c7@windriver.com>
Date: Mon, 2 Jul 2018 15:08:18 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1spEavbzFD9JN8UDERdcawBZfjC_MkAwbc_j8d-r=nSCcQ@mail.gmail.com>
X-Originating-IP: [128.224.162.228]
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH][meta-oe] crash: fix do_compile relocation error
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
X-List-Received-Date: Mon, 02 Jul 2018 07:08:23 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 07/02/2018 02:09 PM, Khem Raj wrote:
> On Sun, Jul 1, 2018 at 7:31 PM Changqing Li <changqing.li@windriver.com> wrote:
>> error info:
>>
>> id: relocation error: /lib/x86_64-linux-gnu/libnss_nis.so.2:
>> symbol _nsl_default_nss version GLIBC_PRIVATE not defined in
>> file libnsl.so.1 with link time reference
>>
>> Recent glibc change removed libnss-nis module from glibc and
>> a new recipe libnss-nis.bb was added. After this change,
>> we need to include native libnss_nis in crash. otherwise,
>> with "nis" in /etc/nssswitch.conf, we will met above error．
>>
>> Signed-off-by: Changqing Li <changqing.li@windriver.com>
>> ---
>>   meta-oe/recipes-kernel/crash/crash_7.2.0.bb | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/meta-oe/recipes-kernel/crash/crash_7.2.0.bb b/meta-oe/recipes-kernel/crash/crash_7.2.0.bb
>> index 440a69d..09fe50d 100644
>> --- a/meta-oe/recipes-kernel/crash/crash_7.2.0.bb
>> +++ b/meta-oe/recipes-kernel/crash/crash_7.2.0.bb
>> @@ -11,6 +11,7 @@ LICENSE = "GPLv3"
>>   LIC_FILES_CHKSUM = "file://COPYING3;md5=d32239bcb673463ab874e80d47fae504"
>>
>>   DEPENDS = "zlib readline coreutils-native"
>> +DEPENDS_append_libc-glibc = " libnss-nis-native"
> A native dependency which is specific to a target libc seems not
> right. It should depend on
> build host libc which in this case is always glibc so please drop the override.

Hi,  according  to below content of recipe libnss-nis,  only for glibc,  
we will DEPNDS
libnss-nis-native, so I add this override.

# We will skip parsing this packagegeoup for non-glibc systems
#
python __anonymous () {
     if d.getVar('TCLIBC') != "glibc":
         raise bb.parse.SkipRecipe("incompatible with %s C library" %
                                    d.getVar('TCLIBC'))
}

//changqing
>>   SRC_URI = "https://github.com/crash-utility/${BPN}/archive/${PV}.tar.gz;downloadfilename=${BP}.tar.gz \
>>              http://ftp.gnu.org/gnu/gdb/gdb-7.6.tar.gz;name=gdb;subdir=${BP} \
>> --
>> 2.7.4
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

-- 
BRs

Sandy(Li Changqing)
+861084778653


