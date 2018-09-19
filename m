Return-Path: <raphael.kubo.da.costa@intel.com>
X-Greylist: delayed 571 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 19 Sep 2018 11:26:30 UTC
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 4255B78DFE
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Sep 2018 11:26:30 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 Sep 2018 04:17:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.53,393,1531810800"; d="scan'208";a="72048336"
Received: from rkubodac-desk.ger.corp.intel.com ([10.252.28.67])
	by fmsmga008.fm.intel.com with ESMTP; 19 Sep 2018 04:15:32 -0700
From: Raphael Kubo da Costa <raphael.kubo.da.costa@intel.com>
To: openembedded-devel@lists.openembedded.org
Organization: Intel Corporation
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.3 (gnu/linux)
Date: Wed, 19 Sep 2018 13:15:32 +0200
Message-ID: <87sh25viuj.fsf@rkubodac-desk.ger.corp.intel.com>
MIME-Version: 1.0
Subject: [meta-oe] nodejs: no internationalization support
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
X-List-Received-Date: Wed, 19 Sep 2018 11:26:30 -0000
Content-Type: text/plain

I originally filed
https://github.com/openembedded/meta-openembedded/issues/93 about this
but was told it's probably better to discuss it on the list.

The nodejs recipe currently builds node with --without-intl. That means
there's no internationalization support. One of the consequences of that
is is that the inspector module is not built at all.

Recent (at least M71 onwards) Chromium releases need the inspector
module as part of the build, so I wonder if the recipe can start
depending on ICU and pass --with-intl=system-icu to configure.py.

Using --with-intl=system-icu might require checking if the ICU version
provided in a branch matches the one Node expects; in the worst case, I
guess --with-intl=small-icu should work).

Is there any specific reason why --without-intl is being passed in the
first place?

