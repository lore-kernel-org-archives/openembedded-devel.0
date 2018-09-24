Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 428B279492
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Sep 2018 21:03:39 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	24 Sep 2018 14:03:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.54,299,1534834800"; d="scan'208";a="92878101"
Received: from hhooy-mobl.gar.corp.intel.com (HELO localhost.localdomain)
	([10.255.133.199])
	by fmsmga001.fm.intel.com with ESMTP; 24 Sep 2018 14:03:34 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Tue, 25 Sep 2018 09:03:32 +1200
Message-ID: <2100274.NFsm02Mysr@localhost.localdomain>
Organization: Intel Corporation
In-Reply-To: <CAP71Wjxwv3i2=UtbzNai79h-f83xcL6G1R8+kY-C-jA==VFy9Q@mail.gmail.com>
References: <CAP71Wjxwv3i2=UtbzNai79h-f83xcL6G1R8+kY-C-jA==VFy9Q@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: meta-oe and yocto-check-layer
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
X-List-Received-Date: Mon, 24 Sep 2018 21:03:39 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Nicolas,

On Monday, 24 September 2018 10:05:02 PM NZST Nicolas Dechesne wrote:
> hi Armin, Paul, Richard,
> 
> I was looking at getting the compliance report for meta-oe (sumo
> branch), and I have found a few issues.
> 
> * in meta-openembedded/sumo, grpc is in meta-oe layer, while it
> depends on meta-networking (c-ares). It was fixes in master, with
> 251878e8b6b9 (grpc: move it from oe to networking layer), so I think
> this fix needs to be backported to sumo as well if we want the YP 2.0
> compliance script to even work. If agreed, once merged, please let me
> know so that I can try again to generate a compliance report.

Is it appropriate to make such moves in a stable branch? I wouldn't have 
thought so.
 
> * in order to run the compliance report, i locally added
> networking-layer in meta-oe/conf/layer.conf, and it creates a
> dependency loop since meta-oe <-> meta-networking. I found out that
> yocto-check-layer doesn't like that too much, and brutally fails. The
> following patch makes yocto-check-layer work again even with
> dependency loop. I am going to do a few more tests and send that over
> as a patch.
> 
> diff --git a/scripts/lib/checklayer/__init__.py
> b/scripts/lib/checklayer/__init__.py
> index 2618416fab..0cc9bf3b6d 100644
> --- a/scripts/lib/checklayer/__init__.py
> +++ b/scripts/lib/checklayer/__init__.py
> @@ -151,11 +151,21 @@ def add_layer_dependencies(bblayersconf, layer,
> layers, logger):
>          logger.debug('Processing dependencies %s for layer %s.' % \
>                      (depends, layer['name']))
> 
> +        # To avoid never ending recursion, we keep track of layers while
> +        # they are being processed in this 'static' attribute.
> +        if not hasattr(recurse_dependencies, "layers"):
> +            recurse_dependencies.layers = []
> +
>          for depend in depends.split():
>              # core (oe-core) is suppose to be provided
>              if depend == 'core':
>                  continue
> 
> +            if depend in recurse_dependencies.layers:
> +                continue
> +
> +            recurse_dependencies.layers.append(depend)
> +
>              layer_depend = _find_layer_depends(depend, layers)
>              if not layer_depend:
>                  logger.error('Layer %s depends on %s and isn\'t found.' % \

Patch looks reasonable to me FWIW.

Cheers,
Paul


-- 

Paul Eggleton
Intel Open Source Technology Centre



