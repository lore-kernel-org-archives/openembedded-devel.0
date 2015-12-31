Return-Path: <Rongqing.Li@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4E3E360721
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Dec 2015 06:52:43 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id tBV6qhmf018256
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Dec 2015 22:52:43 -0800
Received: from [128.224.162.134] (128.224.162.134) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 30 Dec 2015 22:52:42 -0800
To: <openembedded-devel@lists.openembedded.org>
References: <1451525180-15429-1-git-send-email-rongqing.li@windriver.com>
	<CAMKF1srP1Mx9GWzfJzaMFpCtTyMbF0wKcpLnWVKedk99+0nMNg@mail.gmail.com>
From: Rongqing Li <rongqing.li@windriver.com>
Message-ID: <5684D0B9.1070704@windriver.com>
Date: Thu, 31 Dec 2015 14:52:41 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1srP1Mx9GWzfJzaMFpCtTyMbF0wKcpLnWVKedk99+0nMNg@mail.gmail.com>
Subject: Re: [meta-networking][PATCH 1/1] net-snmp: fix the replacement in net-snmp-config
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
X-List-Received-Date: Thu, 31 Dec 2015 06:52:47 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit



On 2015年12月31日 14:17, Khem Raj wrote:
> On Wed, Dec 30, 2015 at 5:26 PM,  <rongqing.li@windriver.com> wrote:
>> -    sed -e "s@-I/usr/include@@g" \
>> +    sed -e "s@-I/usr/include@-I=/usr/include@g" \
>
> Can you rather replace it with ${STAGING_INCDIR} -I= is too gcc
> specific, wont work with Clang e.g.
>

Ok

thanks

-- 
Best Reagrds,
Roy | RongQing Li

