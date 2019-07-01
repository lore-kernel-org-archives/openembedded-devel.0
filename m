Return-Path: <Changqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 6315A7E79F
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  1 Jul 2019 02:29:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x612TJsM026605
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 30 Jun 2019 19:29:19 -0700 (PDT)
Received: from [128.224.162.186] (128.224.162.186) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.439.0;
	Sun, 30 Jun 2019 19:29:17 -0700
To: Adrian Bunk <bunk@stusta.de>
References: <1561686490-12445-1-git-send-email-changqing.li@windriver.com>
	<20190628094332.GA18526@localhost>
From: Changqing Li <changqing.li@windriver.com>
Message-ID: <2d0ef380-ec48-eadc-a4e0-84ddb90ac254@windriver.com>
Date: Mon, 1 Jul 2019 10:29:14 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190628094332.GA18526@localhost>
X-Originating-IP: [128.224.162.186]
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 0/6] Upgrade 5 packages build with waf
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
X-List-Received-Date: Mon, 01 Jul 2019 02:29:19 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 6/28/19 5:43 PM, Adrian Bunk wrote:
> On Fri, Jun 28, 2019 at 09:48:04AM +0800, changqing.li@windriver.com wrote:
>> ...
>> Changqing Li (6):
>> ...
>>    libldb: upgrade 1.4.1 -> 1.6.3
>> ...
>>    samba: upgrade 4.8.12 -> 4.10.5
>> ...
> It was a mistake that required workarounds in both libldb and samba
> when libldb was upgraded to 1.4.1 (which doesn't work with samba 4.8).
>
> Now that samba gets upgraded, all these workarounds should be removed
> and samba should use the external libldb again.
>
> For samba 4.10 this also means that libldb has to be upgraded to 1.5,
> not to 1.6.
>
> cu
> Adrian
Thanks,  I will check this.
>
-- 
BRs

Sandy(Li Changqing)


