Return-Path: <maxin.john@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 77ED16E65F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Jul 2016 11:00:26 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP; 12 Jul 2016 04:00:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,351,1464678000"; d="scan'208";a="844763416"
Received: from mbabyjoh-desk.fi.intel.com (HELO
	mbabyjoh-desk.ger.corp.intel.com) ([10.237.72.71])
	by orsmga003.jf.intel.com with ESMTP; 12 Jul 2016 04:00:26 -0700
Date: Tue, 12 Jul 2016 14:00:48 +0300
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160712110048.GA26262@mbabyjoh-desk.ger.corp.intel.com>
References: <1467639953-22278-1-git-send-email-maxin.john@intel.com>
	<20160711143536.s6nx2scag4j7sffc@jama>
MIME-Version: 1.0
In-Reply-To: <20160711143536.s6nx2scag4j7sffc@jama>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [PATCH] directfb: move recipe to meta-oe
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
X-List-Received-Date: Tue, 12 Jul 2016 11:00:30 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Martin,

On Mon, Jul 11, 2016 at 04:35:37PM +0200, Martin Jansa wrote:
> On Mon, Jul 04, 2016 at 04:45:53PM +0300, Maxin B. John wrote:
> > directfb.org has been down for about a year now. Since there
> > are active users for this recipe, it makes sense to move this
> > from oe-core to meta-oe.
> 
> Fails to apply:
> 
> OE @ ~/meta-openembedded $ pwam 126087
> 2016-07-11 15:29:51 URL:https://patchwork.openembedded.org/patch/126087/mbox/ [33428] -> "pw-am-126087.patch" [1]
> Applying: directfb: move recipe to meta-oe
> .git/rebase-apply/patch:51: trailing whitespace.
>  
> .git/rebase-apply/patch:53: trailing whitespace.
>  
> .git/rebase-apply/patch:56: space before tab in indent.
>         AC_MSG_ERROR([$DIRECTFB_PKG_ERRORS
> .git/rebase-apply/patch:59: trailing whitespace.
> -- 
> .git/rebase-apply/patch:207: trailing whitespace.
>  
> fatal: corrupt patch at line 401
> Patch failed at 0001 directfb: move recipe to meta-oe
> The copy of the patch that failed is found in: .git/rebase-apply/patch
> When you have resolved this problem, run "git am --continue".
> If you prefer to skip this patch, run "git am --skip" instead.
> To restore the original branch and stop patching, run "git am --abort".
> OE @ ~/meta-openembedded $ patch -p1 < pw-am-126087.patch 
> patching file meta-oe/recipes-graphics/directfb/directfb-examples/configure.in-Fix-string-argument-syntax.patch
> patching file meta-oe/recipes-graphics/directfb/directfb-examples_1.7.0.bb
> patching file meta-oe/recipes-graphics/directfb/directfb.inc
> patching file meta-oe/recipes-graphics/directfb/directfb/0001-gfx-direct-Aboid-usng-VLAs-and-printf-formats.patch
> patching file meta-oe/recipes-graphics/directfb/directfb/bashism.patch
> patching file meta-oe/recipes-graphics/directfb/directfb/compar_fn_t.patch
> patching file meta-oe/recipes-graphics/directfb/directfb/configurefix.patch
> patch: **** malformed patch at line 360:  ages-split/directfb/usr/bin/dfbscreen contains probably-redundant RPATH /usr/libWARNING: QA Issue: directfb: /work/i586-poky-linux/directfb-1.4.15-r1/packages-split/directfb/usr/bin/mkdgiff contains probably-redundant RPATH /usr/libWARNING: QA Issue: directfb: /work/i586-poky-linux/directfb-1.4.15-r1/packages-split/directfb/usr/bin/dfbinspector contains probably-redundant RPATH /usr/lib
> 
> Because there is extra line feed in
> meta-oe/recipes-graphics/directfb/directfb/configurefix.patch
> (very long line), please check your sender configuration to prevent mangling the patches in future.

Sorry for that. I had to send the patch with "--no-validate" option because it
contained lines longer than 998 characters.

> This time I've fixed and applied it manually.

Thank you very much.

Best Regards,
Maxin

