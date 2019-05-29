Return-Path: <Changqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C5BD77CBE7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 May 2019 02:51:54 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x4T2pr4s005078
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 28 May 2019 19:51:54 -0700 (PDT)
Received: from [128.224.162.186] (128.224.162.186) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.439.0;
	Tue, 28 May 2019 19:51:53 -0700
To: Adrian Bunk <bunk@stusta.de>
References: <1559011919-113581-1-git-send-email-changqing.li@windriver.com>
	<20190528193734.GA18778@localhost>
From: Changqing Li <changqing.li@windriver.com>
Message-ID: <30bbbc31-4f2d-771c-bb83-a09407a13489@windriver.com>
Date: Wed, 29 May 2019 10:51:50 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20190528193734.GA18778@localhost>
X-Originating-IP: [128.224.162.186]
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 1/2] phoronix-test-suite: add rconflict
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
X-List-Received-Date: Wed, 29 May 2019 02:51:54 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 5/29/19 3:37 AM, Adrian Bunk wrote:
> On Tue, May 28, 2019 at 10:51:58AM +0800, changqing.li@windriver.com wrote:
>> From: Changqing Li <changqing.li@windriver.com>
>>
>> phoronix-test-suite rdepend on lsb, lsb rdepend on lsbinitscripts,
>> lsbinitscripts rconflict with initscripts-functions. so also add
>> rconflict for this one.
>> ...
> In what situation is this needed?
>
> It sounds wrong if rconflict from lower-level packages have to be
> replicated in higher-level packages, and is likely to break in the
> future.
>
> cu
> Adrian

My original idea is that,  by add this info,  we can get the rconflict  
info when parse recipe.

But, you are right,  this  is not good for an indirect rconflicts.


@Khem,  I noticed this is on master-next,  so maybe this patch 1/2 
needed to be reverted.  Sorry for the inconvenience.

-- 
BRs

Sandy(Li Changqing)


