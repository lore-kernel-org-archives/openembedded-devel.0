Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 06D517822D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 May 2017 01:27:59 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v4Q1Rx4A022152
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 May 2017 18:28:00 -0700
Received: from [128.224.162.212] (128.224.162.212) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 25 May 2017 18:27:59 -0700
To: <openembedded-devel@lists.openembedded.org>
References: <20170524093853.12828-1-kai.kang@windriver.com>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <e5b4bad4-56a8-114b-cd8c-0c28da332b94@windriver.com>
Date: Fri, 26 May 2017 09:26:26 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.1
MIME-Version: 1.0
In-Reply-To: <20170524093853.12828-1-kai.kang@windriver.com>
Subject: Re: [meta-networking][PATCH] Fix snort start error
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
X-List-Received-Date: Fri, 26 May 2017 01:28:01 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2017年05月24日 17:38, kai.kang@windriver.com wrote:
> From: Kai Kang <kai.kang@windriver.com>
>
> Please merge the patch after commit for oe-core "libpcap: add native package" is merged. Thanks.

The patch for oe-core has been merged. Please help to review this 
commit, thanks.


Regards,
Kai

>
> Kai Kang (1):
>    snort: enable static daq
>
>   .../recipes-connectivity/daq/daq_2.0.6.bb           |  4 ++++
>   .../recipes-connectivity/libdnet/libdnet_1.12.bb    |  1 +
>   ...-host-contamination-when-enable-static-daq.patch | 21 +++++++++++++++++++++
>   .../recipes-connectivity/snort/snort_2.9.7.5.bb     |  5 +++--
>   4 files changed, 29 insertions(+), 2 deletions(-)
>   create mode 100644 meta-networking/recipes-connectivity/snort/snort/fix-host-contamination-when-enable-static-daq.patch
>

-- 
Regards,
Neil | Kai Kang


