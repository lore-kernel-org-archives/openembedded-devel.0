Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 22A987BF70
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Mar 2019 12:08:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x2MC8DUP016763
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Mar 2019 05:08:14 -0700 (PDT)
Received: from [172.25.44.10] (172.25.44.10) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.439.0;
	Fri, 22 Mar 2019 05:08:13 -0700
To: <openembedded-devel@lists.openembedded.org>
References: <20190322011613.32505-1-Randy.MacLeod@windriver.com>
	<20190322011613.32505-2-Randy.MacLeod@windriver.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <e78add27-7b27-8cd5-c28c-16ecbcb0bd71@windriver.com>
Date: Fri, 22 Mar 2019 08:08:12 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <20190322011613.32505-2-Randy.MacLeod@windriver.com>
X-Originating-IP: [172.25.44.10]
Subject: Re: [PATCH 2/2] rsyslog: Update from 8.37.0 to 8.1903.0
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
X-List-Received-Date: Fri, 22 Mar 2019 12:08:13 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 3/21/19 9:16 PM, Randy MacLeod wrote:
> Remove obsoleted fix-ptest-not-finish patch which is
> no longer required after rsyslog commit:
>     a5b9fbc02 testbench: remove no longer needed .conf files
> 
> Add libgcc and python dependencies for ptest:
>    Testsuite summary for rsyslog 8.1903.0
>    ========================================================================
>    # TOTAL: 351
>    # PASS:  309
>    # SKIP:  38
>    # XFAIL: 0
>    # FAIL:  4
>    # XPASS: 0
>    # ERROR: 0
> for qemux86[-64] when run with ptest-runner -t 800 since some tests
> are stress tests and take quite a while to complete.

I added libgcc and python* to my local.conf file and
ran ptests on 8.37 last night:
============================================================================
Testsuite summary for rsyslog 8.37.0
============================================================================
# TOTAL: 309
# PASS:  257
# SKIP:  29
# XFAIL: 0
# FAIL:  23
# XPASS: 0
# ERROR: 0

I'll look at the 4 failures on 8.1903.0 but things are better.
1904 is rumoured to be in the works so I may wait until then.

../Randy

-- 
# Randy MacLeod
# Wind River Linux

