Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 6BAD3772D0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Feb 2017 09:21:17 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga105.fm.intel.com with ESMTP; 15 Feb 2017 01:21:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,165,1484035200"; d="scan'208";a="225525099"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga004.fm.intel.com with ESMTP; 15 Feb 2017 01:21:17 -0800
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.38])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 31EF56A4006;
	Wed, 15 Feb 2017 01:20:14 -0800 (PST)
Date: Wed, 15 Feb 2017 10:58:49 +0200
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: Martin Jansa <martin.jansa@gmail.com>
Message-ID: <20170215085849.GA6218@linux.intel.com>
Reply-To: ed.bartosh@linux.intel.com
References: <CA+chaQegXmqfE=3TmnYXvLdCW00QpinkXk=L27OQS5-1DnJYAQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CA+chaQegXmqfE=3TmnYXvLdCW00QpinkXk=L27OQS5-1DnJYAQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [OE-core] core-image-tiny-initramfs failing to parse because of WIC (WKS_FULL_PATH, )
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
X-List-Received-Date: Wed, 15 Feb 2017 09:21:22 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Martin,

Sorry for the delay. I missedd your message somehow.

I can't reproduce this. Tried with latest poky and latest oe-core +
bitbake. I built core-image-tiny-initramfs from scratch and bitbake -e
busybox works for me just fine.

Can you provide more details about your setup, please?

On Thu, Feb 09, 2017 at 09:39:30AM +0100, Martin Jansa wrote:
> Running e.g. bitbake -e busybox with latest oe-core triggers this badly
> looking exception:
> 
> Can we add some weak assignment for people who don't care about wic
> or core-image-tiny-initramfs to continue using oe-core?
> 
> ERROR: ExpansionError during parsing /OE/oe-core/meta/recipes-core/images/
> core-image-tiny-initramfs.bb
> Traceback (most recent call last):
>   File "/OE/bitbake/lib/bb/data_smart.py", line 412, in
> DataSmart.expandWithRefs(s='\tout="${IMGDEPLOYDIR}/${IMAGE_NAME}"\n\twks="${WKS_FULL_PATH}"\n\tif
> [ -z "$wks" ]; then\n\t\tbbfatal "No kickstart files from WKS_FILES were
> found: ${WKS_FILES}. Please set WKS_FILE or WKS_FILES
> appropriately."\n\tfi\n\n\tBUILDDIR="${TOPDIR}" wic create "$wks" --vars
> "${STAGING_DIR}/${MACHINE}/imgdata/" -e "${IMAGE_BASENAME}" -o "$out/"
> ${WIC_CREATE_EXTRA_ARGS}\n\tmv "$out/$(basename "${wks%.wks}")"*.direct
> "$out${IMAGE_NAME_SUFFIX}.wic"\n\trm -rf "$out/"\n', varname='IMAGE_CMD'):
>                  try:
>     >                s = __expand_var_regexp__.sub(varparse.var_sub, s)
>                      try:
>   File "/OE/bitbake/lib/bb/data_smart.py", line 111, in
> VariableParse.var_sub(match=<_sre.SRE_Match object; span=(43, 59),
> match='${WKS_FULL_PATH}'>):
>                  else:
>     >                var = self.d.getVarFlag(key, "_content")
>                  self.references.add(key)
>   File "/OE/bitbake/lib/bb/data_smart.py", line 773, in
> DataSmart.getVarFlag(var='WKS_FULL_PATH', flag='_content', expand=True,
> noweakdefault=False, parsing=False):
>                      cachename = var + "[" + flag + "]"
>     >            value = self.expand(value, cachename)
> 
>   File "/OE/bitbake/lib/bb/data_smart.py", line 436, in
> DataSmart.expand(s="${@wks_search('${WKS_FILES}'.split(),
> '${WKS_SEARCH_PATH}') or ''}", varname='WKS_FULL_PATH'):
>          def expand(self, s, varname = None):
>     >        return self.expandWithRefs(s, varname).value
> 
>   File "/OE/bitbake/lib/bb/data_smart.py", line 426, in
> DataSmart.expandWithRefs(s="${@wks_search('directdisk.wks
> core-image-tiny-initramfs.wks'.split(),
> '/OE/oe-core/meta/recipes-core/images:${@':'.join('%s/wic' % p for p in
> '/OE:${TMPDIR}:/OE/oe-core/meta'.split(':'))}:${@':'.join('%s/scripts/lib/wic/canned-wks'
> % l for l in '/OE:${TMPDIR}:/OE/oe-core/meta:/OE/oe-core'.split(':'))}') or
> ''}", varname='WKS_FULL_PATH'):
>                  except Exception as exc:
>     >                raise ExpansionError(varname, s, exc) from exc
> 
> bb.data_smart.ExpansionError: Failure expanding variable WKS_FULL_PATH,
> expression was ${@wks_search('directdisk.wks
> core-image-tiny-initramfs.wks'.split(),
> '/OE/oe-core/meta/recipes-core/images:${@':'.join('%s/wic' % p for p in
> '/OE:${TMPDIR}:/OE/oe-core/meta'.split(':'))}:${@':'.join('%s/scripts/lib/wic/canned-wks'
> % l for l in '/OE:${TMPDIR}:/OE/oe-core/meta:/OE/oe-core'.split(':'))}') or
> ''} which triggered exception SyntaxError: invalid syntax (WKS_FULL_PATH,
> line 1)

--
Regards,
Ed

