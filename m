Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3486572F5E
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  2 May 2017 14:57:39 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v42EvdmJ029795
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Tue, 2 May 2017 07:57:39 -0700
Received: from [172.25.44.11] (172.25.44.11) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 2 May 2017 07:57:38 -0700
To: <openembedded-devel@lists.openembedded.org>, Martin Jansa
	<martin.jansa@gmail.com>
References: <20170427013329.7827-1-Randy.MacLeod@windriver.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <d7748196-b2a1-c5fd-c350-315ee1628c66@windriver.com>
Date: Tue, 2 May 2017 10:57:37 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20170427013329.7827-1-Randy.MacLeod@windriver.com>
X-Originating-IP: [172.25.44.11]
Subject: Re: [meta-oe][PATCH] opencv: disable broken Intel FP16 detection
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
X-List-Received-Date: Tue, 02 May 2017 14:57:42 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 2017-04-26 09:33 PM, Randy MacLeod wrote:
> The configuration worked in opencv-3.1 so revert two commits to
> drop the FP16 detection even though it may make opencv slower.
> The only change in the configure log is:
> --- FP16: Compiler support is available
> +-- FP16: Compiler support is not available
 > ...

Martin,

Thanks for merging this fix.

My long log was truncated by the line beginning with "---" above
but the code changes are fine.

It seems that either I need to learn how to format my email
or you have a bug in your patch handling tools or both. :)
I suspect that indenting those lines would work-around
the problem.

Should I send a fix that reverts the truncated commit log
and then modifies the log formatting?
-- 
# Randy MacLeod. SMTS, Linux, Wind River
Direct: 613.963.1350 | 350 Terry Fox Drive, Suite 200, Ottawa, ON, 
Canada, K2K 2W5

