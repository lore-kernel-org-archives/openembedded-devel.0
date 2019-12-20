Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id D58C57E091
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Dec 2019 01:41:14 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id xBK1ecQw017533
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL);
	Thu, 19 Dec 2019 17:40:48 -0800
Received: from [128.224.162.183] (128.224.162.183) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Thu, 19 Dec 2019 17:40:27 -0800
To: Jon Mason <jdmason@kudzu.us>, OpenEmbedded Devel List
	<openembedded-devel@lists.openembedded.org>
References: <CAPoiz9yiD_BHeqZ_M42vyf7bcs9RLM-91Ba=+iX87_nqnMffQg@mail.gmail.com>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <92e7af67-ff33-3704-5da3-55af37ec6835@windriver.com>
Date: Fri, 20 Dec 2019 09:40:23 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <CAPoiz9yiD_BHeqZ_M42vyf7bcs9RLM-91Ba=+iX87_nqnMffQg@mail.gmail.com>
Subject: Re: lmsensors recipe broken
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
X-List-Received-Date: Fri, 20 Dec 2019 01:41:15 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2019/12/20 上午1:21, Jon Mason wrote:
> I'm seeing the following when I add lmsensors to my build
> --> Finished dependency resolution
> Error:
>   Problem: conflicting requests
>    - nothing provides lmsensors-isatools needed by lmsensors-3.5.0-r0.aarch64
> (try to add '--skip-broken' to skip uninstallable packages or
> '--nobest' to use not only best candidate packages)
>
> I have not been able to find anything that provides that (and if not,
> should it be a dep?).  I simply removed the line, and it built and
> worked (for my limited testing).  Am I missing something or should I
> just send a patch to remove that line?
>
> Thanks,
> Jon

Hi Jon,

How did you add lmsensors to build? Because lmsensors-isatools is a 
sub-package of recipe lmsensors, it should not have dependency issue.
Did you see any warning when build lmsensors?

Regards,
Kai

-- 
Kai Kang


