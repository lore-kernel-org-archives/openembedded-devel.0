Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5BFC67FDB9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Dec 2019 03:25:35 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id xBJ3OxJ2015816
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL);
	Wed, 18 Dec 2019 19:25:10 -0800
Received: from [128.224.162.183] (128.224.162.183) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Wed, 18 Dec 2019 19:24:49 -0800
To: Khem Raj <raj.khem@gmail.com>
References: <20191219031617.8339-1-kai.kang@windriver.com>
	<CAMKF1spBRVYnnQLVXnN5ciT1SwXEvhQn1pV-rQbRUcorRKLBTA@mail.gmail.com>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <b05af1f6-1e49-1529-7f19-00869180b0fb@windriver.com>
Date: Thu, 19 Dec 2019 11:23:32 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <CAMKF1spBRVYnnQLVXnN5ciT1SwXEvhQn1pV-rQbRUcorRKLBTA@mail.gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] openl2tp: update systemd service file
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
X-List-Received-Date: Thu, 19 Dec 2019 03:25:35 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2019/12/19 上午11:23, Khem Raj wrote:
> On Wed, Dec 18, 2019 at 7:16 PM <kai.kang@windriver.com> wrote:
>> From: Kai Kang <kai.kang@windriver.com>
>>
>> It shows an warning of openl2tp in systemd log:
>>
>> | /lib/systemd/system/openl2tpd.service:8: PIDFile= references a path
>> | below legacy directory /var/run/, updating /var/run/openl2tpd.pid →
>> | /run/openl2tpd.pid; please update the unit file accordingly.
>>
>> Update the systemd service file to fix the warning.
>>
>> Update SRC_URI as well that the homepage openl2tp.org has been closed.
>> Use archived file on sourceforge instead.
>>
>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> ---
>>   .../recipes-protocols/openl2tp/openl2tp/openl2tpd.service       | 2 +-
>>   meta-networking/recipes-protocols/openl2tp/openl2tp_1.8.bb      | 2 +-
>>   2 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta-networking/recipes-protocols/openl2tp/openl2tp/openl2tpd.service b/meta-networking/recipes-protocols/openl2tp/openl2tp/openl2tpd.service
>> index 7b3faf672..d02d0ff7e 100644
>> --- a/meta-networking/recipes-protocols/openl2tp/openl2tp/openl2tpd.service
>> +++ b/meta-networking/recipes-protocols/openl2tp/openl2tp/openl2tpd.service
>> @@ -5,7 +5,7 @@ Requires=rpcbind.service
>>
>>   [Service]
>>   Type=forking
>> -PIDFile=@STATEDIR@/run/openl2tpd.pid
>> +PIDFile=/run/openl2tpd.pid
>>   EnvironmentFile=@SYSCONFDIR@/default/openl2tpd
>>   ExecStartPre=@BASE_BINDIR@/sh -c "@BASE_SBINDIR@/modprobe -sq l2tp_ppp || @BASE_SBINDIR@/modprobe -sq pppol2tp"
>>   ExecStart=@SBINDIR@/openl2tpd $OPENL2TPDARGS
>> diff --git a/meta-networking/recipes-protocols/openl2tp/openl2tp_1.8.bb b/meta-networking/recipes-protocols/openl2tp/openl2tp_1.8.bb
>> index 90e8b111d..38d0554e1 100644
>> --- a/meta-networking/recipes-protocols/openl2tp/openl2tp_1.8.bb
>> +++ b/meta-networking/recipes-protocols/openl2tp/openl2tp_1.8.bb
>> @@ -18,7 +18,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=e9d9259cbbf00945adc25a470c1d3585 \
>>
>>   DEPENDS = "popt flex readline rpcsvc-proto-native bison-native"
>>
>> -SRC_URI = "ftp://ftp.openl2tp.org/releases/${BP}/${BP}.tar.gz \
>> +SRC_URI = "https://sourceforge.net/projects/openl2tp/files/openl2tp/${PV}/${BP}.tar.gz \
> Can we use SOURCEFORGE_MIRROR

I'll try it.

Regards,
Kai


>
>>              file://Makefile-modify-CFLAGS-to-aviod-build-error.patch \
>>              file://openl2tp-simplify-gcc-warning-hack.patch \
>>              file://Makefile-obey-LDFLAGS.patch \
>> --
>> 2.17.1
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


-- 
Kai Kang


