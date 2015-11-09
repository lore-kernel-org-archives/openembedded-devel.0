Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id BD2F260043
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Nov 2015 07:46:32 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id tA97kTwS017813
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 8 Nov 2015 23:46:29 -0800 (PST)
Received: from [128.224.162.231] (128.224.162.231) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Sun, 8 Nov 2015 23:46:28 -0800
To: <openembedded-devel@lists.openembedded.org>
References: <1446630396-14149-1-git-send-email-kai.kang@windriver.com>
	<20151106170516.GD2550@jama>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <56404F55.6090309@windriver.com>
Date: Mon, 9 Nov 2015 15:46:29 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <20151106170516.GD2550@jama>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCH] libsmi: add configure file
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 09 Nov 2015 07:46:36 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2015年11月07日 01:05, Martin Jansa wrote:
> On Wed, Nov 04, 2015 at 05:46:36PM +0800, kai.kang@windriver.com wrote:
>> From: Kai Kang <kai.kang@windriver.com>
>>
>> Add configure file duplicated from file smi.conf-example in source code
>> and replace paths with mibs files directories.
>>
>> Then set libsmi-mibs as runtime recommend package to provide mibs files.
>>
>> Add homepage and update SRC_URI as well.
>>
>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> ---
>>   meta-oe/recipes-support/libsmi/libsmi/smi.conf | 48 ++++++++++++++++++++++++++
>>   meta-oe/recipes-support/libsmi/libsmi_0.4.8.bb | 12 ++++++-
>>   2 files changed, 59 insertions(+), 1 deletion(-)
>>   create mode 100644 meta-oe/recipes-support/libsmi/libsmi/smi.conf
>>
>> diff --git a/meta-oe/recipes-support/libsmi/libsmi/smi.conf b/meta-oe/recipes-support/libsmi/libsmi/smi.conf
>> new file mode 100644
>> index 0000000..7e4da86
>> --- /dev/null
>> +++ b/meta-oe/recipes-support/libsmi/libsmi/smi.conf
>> @@ -0,0 +1,48 @@
>> +#
>> +# smi.conf - Global/User SMI configuration file. (EXAMPLE)
>> +#
>> +# Copyright (c) 2000 Frank Strauss, Technical University of Braunschweig.
>> +#
>> +# See the file "COPYING" for information on usage and redistribution
>> +# of this file, and for a DISCLAIMER OF ALL WARRANTIES.
>> +#
>> +# @(#) $Id: smi.conf-example 1134 2001-06-11 09:59:13Z strauss $
>> +#
>> +#
>> +# See smi_config(3) for detailed information on configuration files.
>> +#
>> +
>> +# Extend (note the semicolon) the libsmi default module search path.
>> +path :/usr/share/mibs/iana
>> +path :/usr/share/mibs/ietf
>> +path :/usr/share/mibs/irtf
>> +path :/usr/share/mibs/tubs
>> +
>> +# EXPERIMENTAL: Add a caching method (works only on UNIX systems).
>> +# NOTE: the cache directory must exist and permissions must be
>> +# handled appropriately. A simple but insecure way is to apply
>> +# a tmp flag to the directory (chmod 1777 /usr/local/share/mibs/cache).
>> +#cache /usr/local/share/mibs/cache /usr/local/bin/smicache -d /usr/local/share/mibs/cache -p http://www.ibr.cs.tu-bs.de/projects/libsmi/smicache/
>> +
>> +# Don't show any errors by default.
>> +level 0
>> +
>> +# Preload some basic SMIv2 modules.
>> +load SNMPv2-SMI
>> +load SNMPv2-TC
>> +load SNMPv2-CONF
>> +
>> +# Make smilint shout loud to report all errors and warnings.
>> +smilint: level 9
>> +
>> +# But please don't claim about any names longer than 32 chars.
>> +# (note: this is the prefix of errors `namelength-32-module,
>> +#  -type, -object, -enumeration, and -bit)
>> +smilint: hide namelength-32
>> +
>> +# Preloading some more modules for special applications.
>> +tcpdump: load DISMAN-SCRIPT-MIB
>> +tcpdump: load IF-MIB
>> +
>> +smiquery: load IF-MIB
>> +
>> diff --git a/meta-oe/recipes-support/libsmi/libsmi_0.4.8.bb b/meta-oe/recipes-support/libsmi/libsmi_0.4.8.bb
>> index 2b036f9..e1af636 100644
>> --- a/meta-oe/recipes-support/libsmi/libsmi_0.4.8.bb
>> +++ b/meta-oe/recipes-support/libsmi/libsmi_0.4.8.bb
>> @@ -1,16 +1,26 @@
>>   SUMMARY = "A Library to Access SMI MIB Information"
>> +HOMEPAGE = "https://www.ibr.cs.tu-bs.de/projects/libsmi"
>>   
>>   LICENSE = "BSD"
>>   LIC_FILES_CHKSUM = "file://COPYING;md5=3ad3076f9332343a21636cfd351f05b7"
>>   
>> -SRC_URI = "ftp://ftp.ibr.cs.tu-bs.de/pub/local/libsmi/${BP}.tar.gz"
>> +SRC_URI = "https://www.ibr.cs.tu-bs.de/projects/${BPN}/download/${BP}.tar.gz \
>> +           file://smi.conf \
> 4 spaces
>
>> +          "
> Closing quote should be first character.
>
>>   
>>   SRC_URI[md5sum] = "760b6b1070738158708649ed2c63425e"
>>   SRC_URI[sha256sum] = "f048a5270f41bc88b0c3b0a8fe70ca4d716a46b531a0ecaaa87c462f49d74849"
>>   
>>   inherit autotools
>>   
>> +do_install_append () {
>> +	install -d ${D}${sysconfdir}
>> +	install -m 0644 ${WORKDIR}/smi.conf ${D}${sysconfdir}/smi.conf
> Sane layers are using consistent indentation with 4 spaces.
>
> I've fixed this when cherry-picking to master.

Thanks. I'll follow the style next time.

--Kai

>
>> +}
>> +
>>   PACKAGES += "${PN}-mibs ${PN}-pibs"
>>   
>>   FILES_${PN}-mibs += "${datadir}/mibs"
>>   FILES_${PN}-pibs += "${datadir}/pibs"
>> +
>> +RRECOMMENDS_${PN} = "${BPN}-mibs"
>> -- 
>> 2.6.1
>>
>> -- 
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>


-- 
Regards,
Neil | Kai Kang


