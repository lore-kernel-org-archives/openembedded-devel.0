Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1A9F772732
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Dec 2014 08:59:26 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sBN8xQoB007635
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL);
	Tue, 23 Dec 2014 00:59:26 -0800 (PST)
Received: from [128.224.162.167] (128.224.162.167) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 23 Dec 2014 00:59:25 -0800
Message-ID: <54992EEC.8050701@windriver.com>
Date: Tue, 23 Dec 2014 16:59:24 +0800
From: wenzong fan <wenzong.fan@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <1418695179-32300-1-git-send-email-wenzong.fan@windriver.com>
	<20141216104659.GA2466@jama>
In-Reply-To: <20141216104659.GA2466@jama>
Subject: Re: [PATCH][meta-oe] collectd: add PACKAGECONFIG for libvirt
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
X-List-Received-Date: Tue, 23 Dec 2014 08:59:34 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 12/16/2014 06:46 PM, Martin Jansa wrote:
> On Tue, Dec 16, 2014 at 09:59:39AM +0800, wenzong.fan@windriver.com wrote:
>> From: Wenzong Fan <wenzong.fan@windriver.com>
>>
>> Add PACKAGECONFIG for 'libvirt', otherwise there would be warnings
>> like below:
>>
>> WARN: collectd: collectd rdepends on libvirt, but it isn't a build
>> dependency?
>
> What about other floating dependencies reported in test-dependencies
> e-mail?
>
> WARN: collectd: collectd rdepends on libcrypto, but it isn't a build
> dependency?
> WARN: collectd: collectd rdepends on libesmtp, but it isn't a build
> dependency?
> WARN: collectd: collectd rdepends on libssl, but it isn't a build
> dependency?
>

They are caused by floating dependencies to "libesmtp", I have sent 
Patch v2 for fixing them.

Thanks
Wenzong

>>
>> Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
>> ---
>>   meta-oe/recipes-extended/collectd/collectd_5.4.1.bb |    3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta-oe/recipes-extended/collectd/collectd_5.4.1.bb b/meta-oe/recipes-extended/collectd/collectd_5.4.1.bb
>> index 46752c8..6e82bbc 100644
>> --- a/meta-oe/recipes-extended/collectd/collectd_5.4.1.bb
>> +++ b/meta-oe/recipes-extended/collectd/collectd_5.4.1.bb
>> @@ -35,8 +35,9 @@ PACKAGECONFIG[sensors] = "--enable-sensors --with-libsensors=yes, \
>>           --disable-sensors --with-libsensors=no,lmsensors"
>>   PACKAGECONFIG[amqp] = "--enable-amqp --with-librabbitmq=yes, \
>>           --disable-amqp --with-librabbitmq=no,rabbitmq-c"
>> -# protobuf-c that is currently only available in meta-virtualization layer
>> +# protobuf-c, libvirt that are currently only available in meta-virtualization layer
>>   PACKAGECONFIG[pinba] = "--enable-pinba,--disable-pinba,protobuf-c-native protobuf-c"
>> +PACKAGECONFIG[libvirt] = "--enable-libvirt,--disable-libvirt,libvirt"
>>
>>   EXTRA_OECONF = " \
>>                   ${FPLAYOUT} \
>> --
>> 1.7.10.4
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>
>

