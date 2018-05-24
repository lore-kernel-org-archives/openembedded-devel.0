Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5015274623
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 May 2018 14:38:39 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w4OEbxfh009137
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 24 May 2018 07:38:14 -0700
Received: from [172.25.44.2] (172.25.44.2) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Thu, 24 May 2018 07:37:48 -0700
To: Joe Slater <joe.slater@windriver.com>,
	<openembedded-devel@lists.openembedded.org>, Khem Raj <raj.khem@gmail.com>
References: <20180504220433.47694-1-joe.slater@windriver.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <47b17627-cedd-6c4e-32a9-01f2ede4280d@windriver.com>
Date: Thu, 24 May 2018 10:37:47 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180504220433.47694-1-joe.slater@windriver.com>
X-Originating-IP: [172.25.44.2]
Subject: Re: [meta-networking][morty][PATCH 1/1] dnsmasq: backport CVE fixes from dnsmasq 2.78
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
X-List-Received-Date: Thu, 24 May 2018 14:38:40 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit


Khem,

Are you handling backports for morty as well?
This _is_ in patchworks so it might reduce your ping emails
if you state that you'll get to the backlog over the
coming month or so.

Thanks,
../Randy


On 05/04/2018 06:04 PM, Joe Slater wrote:
> From: Zhang Xiao <xiao.zhang@windriver.com>
> 
> CVE-2017-1449{1-6}
> 
> Signed-off-by: Zhang Xiao <xiao.zhang@windriver.com>
> Signed-off-by: Joe Slater <joe.slater@windriver.com>
> ---
>   .../dnsmasq/dnsmasq-CVE-2017-14491-02.patch        |  75 ++++++
>   .../dnsmasq/dnsmasq/dnsmasq-CVE-2017-14491.patch   | 268 +++++++++++++++++++++
>   .../dnsmasq/dnsmasq/dnsmasq-CVE-2017-14492.patch   |  37 +++
>   .../dnsmasq/dnsmasq/dnsmasq-CVE-2017-14493.patch   |  37 +++
>   .../dnsmasq/dnsmasq/dnsmasq-CVE-2017-14494.patch   |  37 +++
>   .../dnsmasq/dnsmasq/dnsmasq-CVE-2017-14495.patch   |  48 ++++
>   .../dnsmasq/dnsmasq/dnsmasq-CVE-2017-14496.patch   |  73 ++++++
>   .../recipes-support/dnsmasq/dnsmasq_2.76.bb        |   7 +
>   8 files changed, 582 insertions(+)
>   create mode 100644 meta-networking/recipes-support/dnsmasq/dnsmasq/dnsmasq-CVE-2017-14491-02.patch
>   create mode 100644 meta-networking/recipes-support/dnsmasq/dnsmasq/dnsmasq-CVE-2017-14491.patch
>   create mode 100644 meta-networking/recipes-support/dnsmasq/dnsmasq/dnsmasq-CVE-2017-14492.patch
>   create mode 100644 meta-networking/recipes-support/dnsmasq/dnsmasq/dnsmasq-CVE-2017-14493.patch
>   create mode 100644 meta-networking/recipes-support/dnsmasq/dnsmasq/dnsmasq-CVE-2017-14494.patch
>   create mode 100644 meta-networking/recipes-support/dnsmasq/dnsmasq/dnsmasq-CVE-2017-14495.patch
>   create mode 100644 meta-networking/recipes-support/dnsmasq/dnsmasq/dnsmasq-CVE-2017-14496.patch
> 

-- 
# Randy MacLeod
# Wind River Linux

