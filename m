Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 160067029A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Jul 2014 08:47:16 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s6F8l9fm007789
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 15 Jul 2014 01:47:10 -0700 (PDT)
Received: from [128.224.162.159] (128.224.162.159) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.169.1;
	Tue, 15 Jul 2014 01:47:09 -0700
Message-ID: <53C4EA8C.9060308@windriver.com>
Date: Tue, 15 Jul 2014 16:47:08 +0800
From: Rongqing Li <rongqing.li@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <1404809042-10815-1-git-send-email-rongqing.li@windriver.com>
	<53BCAFF5.6080901@windriver.com>
	<8672BB614B4CCA40A6B3BDD6FD82050BA8B274A6@COSNADEXC13.usr.ingenico.loc>
In-Reply-To: <8672BB614B4CCA40A6B3BDD6FD82050BA8B274A6@COSNADEXC13.usr.ingenico.loc>
Subject: Re: [PATCH][meta-oe] memstat: add memstat recipe
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
X-List-Received-Date: Tue, 15 Jul 2014 08:47:17 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 8bit



On 07/15/2014 04:44 PM, Matthieu CRAPET wrote:
> Hi,
>
> A manpage is included in the sources but not installed. This would be nice to package it.
>
> Regards,
> Matthieu


Cc: HuangJie

-Roy
>
>
> -----Message d'origine-----
> De : openembedded-devel-bounces@lists.openembedded.org [mailto:openembedded-devel-bounces@lists.openembedded.org] De la part de Rongqing Li
> Envoyé : mercredi 9 juillet 2014 04:59
> À : openembedded-devel@lists.openembedded.org
> Objet : Re: [oe] [PATCH][meta-oe] memstat: add memstat recipe
>
> Drop this patch, HuangJ has sent out a similar patch
>
> -Roy
>
> On 07/08/2014 04:44 PM, rongqing.li@windriver.com wrote:
>> From: Roy Li <rongqing.li@windriver.com>
>>
>> Signed-off-by: Roy Li <rongqing.li@windriver.com>
>> ---
>>    meta-oe/recipes-devtools/memstat/memstat_1.0.bb |   24 +++++++++++++++++++++++
>>    1 file changed, 24 insertions(+)
>>    create mode 100644 meta-oe/recipes-devtools/memstat/memstat_1.0.bb
>>
>> diff --git a/meta-oe/recipes-devtools/memstat/memstat_1.0.bb
>> b/meta-oe/recipes-devtools/memstat/memstat_1.0.bb
>> new file mode 100644
>> index 0000000..8c8882e
>> --- /dev/null
>> +++ b/meta-oe/recipes-devtools/memstat/memstat_1.0.bb
>> @@ -0,0 +1,24 @@
>> +SUMMARY = "Display virtual memory allocation"
>> +DESCRIPTION = "Lists all the processes, executables, and shared
>> +libraries \ that are using up virtual memory. It's helpful to see how
>> +the shared memory \ is used and which 'old' libs are loaded. "
>> +HOMEPAGE = "http://memstattool.sourceforge.net/"
>> +SECTION = "devtool"
>> +
>> +LICENSE = "GPLv2"
>> +
>> +S = "${WORKDIR}/memstattool"
>> +
>> +LIC_FILES_CHKSUM = "file://debian/copyright;md5=87be186443b1ac2cfa466f475e1ee0cb"
>> +
>> +SRC_URI = "http://sourceforge.net/projects/memstattool/files/${BPN}_${PV}.tar.gz \
>> +          "
>> +SRC_URI[md5sum] = "2c3acc0c62b2a18f6601b84e54aa7462"
>> +SRC_URI[sha256sum] = "245d5fc7fb87bcfd14486cd34917cae2856e799559ac568434af12c4852bce94"
>> +
>> +do_install_append(){
>> +    install -d ${D}${bindir}
>> +    install -m 0755 memstat ${D}${bindir}
>> +    install -d ${D}/etc
>> +    install -m 0755 memstat.conf ${D}/etc }
>>
>
> --
> Best Reagrds,
> Roy | RongQing Li
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

-- 
Best Reagrds,
Roy | RongQing Li

