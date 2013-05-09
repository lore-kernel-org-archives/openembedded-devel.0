Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1UaYG8-0003Rl-S0
	for openembedded-devel@lists.openembedded.org;
	Thu, 09 May 2013 23:20:47 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r49L2Bfg001587
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 9 May 2013 14:02:11 -0700 (PDT)
Received: from msp-dhcp6.wrs.com (172.25.34.6) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 9 May 2013 14:02:11 -0700
Message-ID: <518C0ED2.5060007@windriver.com>
Date: Thu, 9 May 2013 16:02:10 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130328 Thunderbird/17.0.5
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <1368129805-5889-1-git-send-email-mark.hatle@windriver.com>
	<20130509201735.GG3188@jama>
In-Reply-To: <20130509201735.GG3188@jama>
Subject: Re: [PATCH 1/3] macchanger: Fix SRC_URI for multilibs
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
X-List-Received-Date: Thu, 09 May 2013 21:20:49 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 5/9/13 3:17 PM, Martin Jansa wrote:
> For which layer is this? no tag in Subject and path to recipe doesn't even start
> with meta-networking
>
> ./meta-networking/recipes-support/macchanger/macchanger_1.5.0.bb

all three patches, meta-openembedded/meta-networking

--Mark

> On Thu, May 09, 2013 at 03:03:23PM -0500, Mark Hatle wrote:
>> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
>> ---
>>   recipes-support/macchanger/macchanger_1.5.0.bb | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/recipes-support/macchanger/macchanger_1.5.0.bb b/recipes-support/macchanger/macchanger_1.5.0.bb
>> index ff30558..2ecfab2 100644
>> --- a/recipes-support/macchanger/macchanger_1.5.0.bb
>> +++ b/recipes-support/macchanger/macchanger_1.5.0.bb
>> @@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
>>
>>   PR = "r0"
>>
>> -SRC_URI  = "${GNU_MIRROR}/macchanger/${PN}-${PV}.tar.gz"
>> +SRC_URI  = "${GNU_MIRROR}/macchanger/${BPN}-${PV}.tar.gz"
>>
>>   SRC_URI[md5sum] = "79b7cdaeca3d8ebafa764c4b0dd03ab7"
>>   SRC_URI[sha256sum] = "d44bfa27cb29c5a718627cb3ef3aa42eb5130426545eb2031120826cd73fa8fe"
>> --
>> 1.8.3.rc1.25.g423ecb0
>>
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



