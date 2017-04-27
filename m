Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4AEE077C72
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Apr 2017 01:45:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v3R1jJYf017300
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Apr 2017 18:45:20 -0700
Received: from [172.25.44.11] (172.25.44.11) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 26 Apr 2017 18:45:19 -0700
To: <openembedded-devel@lists.openembedded.org>
References: <20170427013329.7827-1-Randy.MacLeod@windriver.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <877a46e7-4b93-64ea-762b-40b00a552930@windriver.com>
Date: Wed, 26 Apr 2017 21:45:18 -0400
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
X-List-Received-Date: Thu, 27 Apr 2017 01:45:20 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 2017-04-26 09:33 PM, Randy MacLeod wrote:
> With opencv-3.2, the configuration detects if the target supports
> half-precision floating-point format. This fails to compile for some
> Intel targets such as skylake with an error such as:
>    error: '_mm_cvtph_ps' was not declared in this scope
>
> The configuration worked in opencv-3.1 so revert two commits to
> drop the FP16 detection even though it may make opencv slower.
> The only change in the configure log is:
> --- FP16: Compiler support is available
> +-- FP16: Compiler support is not available
>
> The patch should be dropped when a newer version of opencv that includes commit:
>    https://github.com/opencv/opencv/commit/e5d9b608c47d54e43496041595025fa282fa9de5
> is available. Backporting that fix was involved many files and
> a cherry-picking explosion so it's not worthwhile.
>
> Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
> ---

I'm not particularly happy with this patch but it does fix
a build problem and doesn't appear to break any arches.
It's probably best if I soak it on our build cluster and
that I take a more time to confirm that I haven't broken anything.

I'm off work until Monday now so I thought that some people on the list
might be interested in the patch or in pitching in. If not, I'll
follow up next week.

Btw, I'm pinging the opencv devs to see when the next release is
expected.

-- 
# Randy MacLeod. SMTS, Linux, Wind River
Direct: 613.963.1350 | 350 Terry Fox Drive, Suite 200, Ottawa, ON, 
Canada, K2K 2W5

