Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 41FE871AB9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Sep 2017 16:23:55 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v8FGNv8s011632
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Sep 2017 09:23:57 -0700 (PDT)
Received: from [172.25.44.7] (172.25.44.7) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Fri, 15 Sep 2017 09:23:55 -0700
To: <openembedded-devel@lists.openembedded.org>
References: <1505489005-4115-1-git-send-email-Randy.MacLeod@windriver.com>
	<1505489005-4115-2-git-send-email-Randy.MacLeod@windriver.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <da53b2a2-1a93-8dea-55b8-2e29afd93b03@windriver.com>
Date: Fri, 15 Sep 2017 12:23:55 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1505489005-4115-2-git-send-email-Randy.MacLeod@windriver.com>
X-Originating-IP: [172.25.44.7]
Subject: Re: [PATCH 2/2] rsyslog: update from 8.22 to 8.29
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
X-List-Received-Date: Fri, 15 Sep 2017 16:23:56 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 2017-09-15 11:23 AM, Randy MacLeod wrote:
> Drop two patches:
>      CVE-2017-12588.patch
>      0001-core-bugfix-segfault-after-configuration-errors.patch
> since they are included in 8.29.
> 
> Update the testbench configuration flags.
> 
> Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>

...
rsyslog-8.29 builds for all arches and for qemux86-64/arm64 using musl.
basic testing with systemd works and I can restart rsyslog.

On qemux86-64 ptest runs but encounters 5 failures:

============================================================================
Testsuite summary for rsyslog 8.29.0
============================================================================
# TOTAL: 265
# PASS:  246
# SKIP:  14
# XFAIL: 0
# FAIL:  5
# XPASS: 0
# ERROR: 0


# systemd-related problems I think.
FAIL: omfile-read-only-errmsg.sh
FAIL: omfile-read-only.sh
...
# these two are related to the testbench user mgmt
FAIL: privdropuser.sh
FAIL: privdropuserid.sh
...
# this test assumes that there's a 'service' command
FAIL: imklog_permitnonkernelfacility_root.sh


I don't see anything that would prevent us from taking the upgrade
into master.

I might fix these ptests failures or just skip them but not for a while.

-- 
# Randy MacLeod.  WR Linux
# Wind River an Intel Company

