Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3CFE66012C
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 22 Nov 2015 06:55:16 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id tAM6tGeg018748
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 Nov 2015 22:55:16 -0800 (PST)
Received: from [128.224.162.160] (128.224.162.160) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Sat, 21 Nov 2015 22:55:16 -0800
To: <openembedded-devel@lists.openembedded.org>
References: <cover.1448011904.git.liezhi.yang@windriver.com>
	<38e43117d054d710c263514f45aaa69c14b53d51.1448011904.git.liezhi.yang@windriver.com>
	<20151120094215.GC2241@jama>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <565166D2.3050904@windriver.com>
Date: Sun, 22 Nov 2015 14:55:14 +0800
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <20151120094215.GC2241@jama>
Subject: Re: [PATCH 5/8] cim-schema-exper: fix host-user-contaminated
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
X-List-Received-Date: Sun, 22 Nov 2015 06:55:18 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit



On 11/20/2015 05:42 PM, Martin Jansa wrote:
> On Fri, Nov 20, 2015 at 01:32:44AM -0800, Robert Yang wrote:
>> Issue: LIN8-1632
>>
>> Fixed:
>> cim-schema-exper-2.39.0: cim-schema-exper: /cim-schema-exper/usr/share/mof/cimv2.39.0/Network/CIM_IPAddressRange.mof is owned by uid 15220, which is the same as the user running bitbake. This may be due to host contamination [host-user-contaminated]
>> cim-schema-final-2.40.0: cim-schema-final: /cim-schema-final/usr/share/mof/cimv2.40.0/Network/CIM_IPAddressRange.mof is owned by uid 15220, which is the same as the user running bitbake. This may be due to host contamination [host-user-contaminated]
>> lib32-cim-schema-exper-2.39.0: lib32-cim-schema-exper: /lib32-cim-schema-exper/usr/share/mof/cimv2.39.0/Network/CIM_IPAddressRange.mof is owned by uid 15220, which is the same as the user running bitbake. This may be due to host contamination [host-user-contaminated]
>> lib32-cim-schema-final-2.40.0: lib32-cim-schema-final: /lib32-cim-schema-final/usr/share/mof/cimv2.40.0/Network/CIM_IPAddressRange.mof is owned by uid 15220, which is the same as the user running bitbake. This may be due to host contamination [host-user-contaminated]
>>
>> It uses cp -a to install the files, so fix the owner to root:root
>>
>> (LOCAL REV: NOT UPSTREAM) -- Sent to oe-devel on 20151120
>>
>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>> ---
>>   .../cim-schema/cim-schema-exper_2.39.0.bb          |    1 +
>>   .../cim-schema/cim-schema-final_2.40.0.bb          |    1 +
>>   2 files changed, 2 insertions(+)
>>
>> diff --git a/meta-networking/recipes-support/cim-schema/cim-schema-exper_2.39.0.bb b/meta-networking/recipes-support/cim-schema/cim-schema-exper_2.39.0.bb
>> index 62e50df..e4ed7b3 100644
>> --- a/meta-networking/recipes-support/cim-schema/cim-schema-exper_2.39.0.bb
>> +++ b/meta-networking/recipes-support/cim-schema/cim-schema-exper_2.39.0.bb
>> @@ -17,6 +17,7 @@ do_install() {
>>           install -m 644 ${WORKDIR}/LICENSE ${D}${datadir}/doc/cim-schema-${PV}
>>
>>           cp -a ${S}/* ${D}${datadir}/mof/cimv${PV}/	
>> +        chown -R root:root ${D}${datadir}/mof/cimv${PV}
>
> Why don't you fix it to use install instead of cp -a + chown?

Because there are a lot of files and directories:

$ find cim-schema-exper/image/usr/share/mof/cimv2.39.0/ -type f |wc -l
1816

$ find cim-schema-exper/image/usr/share/mof/cimv2.39.0/ -type d |wc -l
15

I think that's why it used cp -a before. And we did use chown to fix such
issues for several recipes in oe-core and meta-openembedded.

// Robert

>
>>           for i in `find ${D}${datadir}/mof/cimv${PV} -name "*.mof"`; do
>>                   sed -i -e 's/\r//g' $i
>>           done
>> diff --git a/meta-networking/recipes-support/cim-schema/cim-schema-final_2.40.0.bb b/meta-networking/recipes-support/cim-schema/cim-schema-final_2.40.0.bb
>> index 1694f31..7ab9c4d 100644
>> --- a/meta-networking/recipes-support/cim-schema/cim-schema-final_2.40.0.bb
>> +++ b/meta-networking/recipes-support/cim-schema/cim-schema-final_2.40.0.bb
>> @@ -22,6 +22,7 @@ do_install() {
>>           install -m 644 ${WORKDIR}/LICENSE ${D}${datadir}/doc/cim-schema-${PV}
>>
>>           cp -a ${S}/* ${D}${datadir}/mof/cimv${PV}/	
>> +        chown -R root:root ${D}${datadir}/mof/cimv${PV}/
>>           for i in `find ${D}${datadir}/mof/cimv${PV} -name "*.mof"`; do
>>                   sed -i -e 's/\r//g' $i
>>           done
>> --
>> 1.7.9.5
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>
>

