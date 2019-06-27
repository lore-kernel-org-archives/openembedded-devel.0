Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8CA0760807
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Jun 2019 01:31:39 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x5R1Vdw5023288
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 26 Jun 2019 18:31:39 -0700 (PDT)
Received: from [128.224.162.157] (128.224.162.157) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.439.0;
	Wed, 26 Jun 2019 18:31:39 -0700
To: Khem Raj <raj.khem@gmail.com>
References: <1561479240-36337-1-git-send-email-hongxu.jia@windriver.com>
	<CAMKF1sqp5DgFKxh3N+GyP8xmv8KFZs4vLfs2TBNd-T5NiNfwMw@mail.gmail.com>
From: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <6fe55a0a-54a5-23cd-c3d2-2784ab214cb7@windriver.com>
Date: Thu, 27 Jun 2019 09:31:38 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1sqp5DgFKxh3N+GyP8xmv8KFZs4vLfs2TBNd-T5NiNfwMw@mail.gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-multimedia][PATCH 1/4] meta-multimedia: add layer depends on meta-oe
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
X-List-Received-Date: Thu, 27 Jun 2019 01:31:39 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 6/26/19 2:58 AM, Khem Raj wrote:
> Do we have a way to not use gitpkg dependency
>
I am not sure, our Wind River Linux does not support recipe tvheadend,

the issue is reported by `yocto-check-layer-wrapper meta-multimedia'

and I try to resolve it without taking too much time

//Hongxu

> On Tue, Jun 25, 2019 at 9:14 AM Hongxu Jia <hongxu.jia@windriver.com 
> <mailto:hongxu.jia@windriver.com>> wrote:
>
>     Since tvheadend of meta-multimedia inherit gitpkgv bbclass
>     which comes from meta-oe, add missing layer depends back
>
>     Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com
>     <mailto:hongxu.jia@windriver.com>>
>     ---
>      meta-multimedia/conf/layer.conf | 5 ++++-
>      1 file changed, 4 insertions(+), 1 deletion(-)
>
>     diff --git a/meta-multimedia/conf/layer.conf
>     b/meta-multimedia/conf/layer.conf
>     index e05a652..89ed163 100644
>     --- a/meta-multimedia/conf/layer.conf
>     +++ b/meta-multimedia/conf/layer.conf
>     @@ -29,6 +29,9 @@ BBFILE_PRIORITY_multimedia-layer = "6"
>      # cause compatibility issues with other layers
>      LAYERVERSION_multimedia-layer = "1"
>
>     -LAYERDEPENDS_multimedia-layer = "core"
>     +LAYERDEPENDS_multimedia-layer = " \
>     +    core \
>     +    openembedded-layer \
>     +"
>
>      LAYERSERIES_COMPAT_multimedia-layer = "thud warrior"
>     -- 
>     2.7.4
>


