Return-Path: <Changqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 128E07DF1C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 May 2019 05:24:14 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x4U5OEVb015939
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 29 May 2019 22:24:14 -0700 (PDT)
Received: from [128.224.162.186] (128.224.162.186) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.439.0;
	Wed, 29 May 2019 22:24:13 -0700
To: akuster808 <akuster808@gmail.com>,
	<openembedded-devel@lists.openembedded.org>
References: <1559116039-168682-1-git-send-email-changqing.li@windriver.com>
	<8cd345b4-c098-d25b-9222-2d1a750989d1@gmail.com>
From: Changqing Li <changqing.li@windriver.com>
Message-ID: <38071c1b-2664-b123-e72e-6ce29ac20bd3@windriver.com>
Date: Thu, 30 May 2019 13:24:11 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <8cd345b4-c098-d25b-9222-2d1a750989d1@gmail.com>
X-Originating-IP: [128.224.162.186]
Subject: Re: [meta-networking][PATCH] netkit-telnet: add rconflicts
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
X-List-Received-Date: Thu, 30 May 2019 05:24:15 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 5/30/19 5:19 AM, akuster808 wrote:
>
> On 5/29/19 12:47 AM, changqing.li@windriver.com wrote:
>> From: Changqing Li <changqing.li@windriver.com>
>>
>> fix below error:
>>
>> file /etc/xinetd.d/telnet conflicts between attempted installs of netkit-telnet-0.17-r0.i586 and inetutils-telnetd-1.9.4-r0.i586
>> file /usr/sbin/in.telnetd conflicts between attempted installs of netkit-telnet-0.17-r0.i586 and inetutils-telnetd-1.9.4-r0.i586
> with backport?
>
> - armin
sorry,  I don't get your mean,  can you explain more? Thanks.
>> Signed-off-by: Changqing Li <changqing.li@windriver.com>
>> ---
>>   meta-networking/recipes-netkit/netkit-telnet/netkit-telnet_0.17.bb | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/meta-networking/recipes-netkit/netkit-telnet/netkit-telnet_0.17.bb b/meta-networking/recipes-netkit/netkit-telnet/netkit-telnet_0.17.bb
>> index db4b1c9..4b035af 100644
>> --- a/meta-networking/recipes-netkit/netkit-telnet/netkit-telnet_0.17.bb
>> +++ b/meta-networking/recipes-netkit/netkit-telnet/netkit-telnet_0.17.bb
>> @@ -63,3 +63,4 @@ FILES_${PN} += "${sbindir}/in.* ${libdir}/* ${sysconfdir}/xinetd.d/*"
>>   
>>   # http://errors.yoctoproject.org/Errors/Details/186954/
>>   EXCLUDE_FROM_WORLD_libc-musl = "1"
>> +RCONFLICTS_${PN} = "inetutils-telnetd"
>
-- 
BRs

Sandy(Li Changqing)


