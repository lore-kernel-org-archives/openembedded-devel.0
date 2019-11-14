Return-Path: <ross.burton@intel.com>
X-Greylist: delayed 426 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 14 Nov 2019 23:29:54 UTC
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 5206B7FB36
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Nov 2019 23:29:54 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	14 Nov 2019 15:22:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,306,1569308400"; d="scan'208";a="288384190"
Received: from bhatavin-mobl1.ger.corp.intel.com (HELO blackadder.local)
	([10.249.42.178])
	by orsmga001.jf.intel.com with ESMTP; 14 Nov 2019 15:22:48 -0800
To: Leon Anavi <leon.anavi@konsulko.com>
References: <1573752010-26608-1-git-send-email-leon.anavi@konsulko.com>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <f88b8bfe-e3d9-d45c-8187-ad039df89cc0@intel.com>
Date: Thu, 14 Nov 2019 23:22:47 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:60.0)
	Gecko/20100101 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <1573752010-26608-1-git-send-email-leon.anavi@konsulko.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] surf: Add simple web browser
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
X-List-Received-Date: Thu, 14 Nov 2019 23:29:54 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 14/11/2019 17:20, Leon Anavi wrote:
> +DEPENDS = "webkitgtk gtk+ gtk+3 glib-2.0 xserver-nodm-init"

Are you sure it *build* depends on the X init scripts?

> +INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
> +INHIBIT_PACKAGE_STRIP = "1"

Why?

Ross


