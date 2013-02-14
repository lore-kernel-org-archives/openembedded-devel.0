Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Aws.Ismail@windriver.com>) id 1U627K-00057G-QY
	for openembedded-devel@lists.openembedded.org;
	Thu, 14 Feb 2013 17:57:25 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r1EGewvU011652
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Feb 2013 08:40:58 -0800 (PST)
Received: from [128.224.147.212] (128.224.147.212) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.318.4;
	Thu, 14 Feb 2013 08:40:58 -0800
Message-ID: <511D1213.4080905@windriver.com>
Date: Thu, 14 Feb 2013 11:34:27 -0500
From: Aws Ismail <aws.ismail@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Joe MacDonald <Joe.MacDonald@windriver.com>
References: <1360606580-27697-1-git-send-email-aws.ismail@windriver.com>
	<1360606580-27697-2-git-send-email-aws.ismail@windriver.com>
	<20130214033444.GD3156@windriver.com>
In-Reply-To: <20130214033444.GD3156@windriver.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH 1/3] traceroute: resolve multilib issues
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 14 Feb 2013 16:57:26 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 02/13/2013 10:34 PM, Joe MacDonald wrote:
> [[meta-networking][PATCH  1/3] traceroute: resolve multilib issues] On 13.02.11 (Mon 13:16) Aws Ismail wrote:
>
>> Make recipe changes to enable successfull building
>> when multilib is being used.
>>
>> Signed-off-by: Aws Ismail <aws.ismail@windriver.com>
>> ---
>>   .../traceroute/traceroute_2.0.18.bb                |    8 +++++---
>>   1 files changed, 5 insertions(+), 3 deletions(-)
>>
>> diff --git a/meta-networking/recipes-support/traceroute/traceroute_2.0.18.bb b/meta-networking/recipes-support/traceroute/traceroute_2.0.18.bb
>> index 6eca731..f5f96b2 100644
>> --- a/meta-networking/recipes-support/traceroute/traceroute_2.0.18.bb
>> +++ b/meta-networking/recipes-support/traceroute/traceroute_2.0.18.bb
>> @@ -11,6 +11,8 @@ LICENSE = "GPL-2.0 LGPL-2.1"
>>   LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
>>                       file://COPYING.LIB;md5=bbb461211a33b134d42ed5ee802b37ff"
>>   
>> +PR = "r1"
>> +
>>   inherit update-alternatives
>>   
>>   SRC_URI = "${SOURCEFORGE_MIRROR}/traceroute/traceroute/traceroute-2.0.18/traceroute-2.0.18.tar.gz \
>> @@ -26,13 +28,13 @@ do_compile() {
>>   
>>   do_install() {
>>       install -d ${D}${bindir}
>> -    install -m755 ${PN}/${PN} ${D}${bindir}
>> +    install -m755 ${BPN}/${BPN} ${D}${bindir}
>>   
>>       install -m755 wrappers/tcptraceroute ${D}${bindir}
>>   
>>       install -d ${D}${mandir}
>> -    install -p -m644 ${PN}/${PN}.8 ${D}${mandir}
>> -    ln -s ${PN}.8 ${D}${mandir}/${PN}6.8
>> +    install -p -m644 ${BPN}/${BPN}.8 ${D}${mandir}
>> +    ln -s ${PN}.8 ${D}${mandir}/${BPN}6.8
>>       ln -s ${PN}.8 ${D}${mandir}/tcptraceroute.8
> Are the targets actually installed as ${PN}.8 and not ${BPN}.8 in a
> multilib build scenario?  What I'm asking is should the above be changed
> to this instead:
>
>      ln -s ${BPN}.8 ${D}${mandir}/${BPN}6.8
>      ln -s ${BPN}.8 ${D}${mandir}/tcptraceroute.8
>
I think you're right. It should be like that but the odd
thing is that even with ln -s ${PN}.8 no errors were
seen.

Aws\

-- 



