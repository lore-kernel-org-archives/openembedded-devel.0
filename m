Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 063FC77242
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Feb 2016 13:28:02 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 24 Feb 2016 05:28:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,493,1449561600"; d="scan'208";a="910234555"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga001.fm.intel.com with ESMTP; 24 Feb 2016 05:28:03 -0800
To: openembedded-devel@lists.openembedded.org
References: <1456319258-20502-1-git-send-email-Martin.Jansa@gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <56CDAF3F.1020307@linux.intel.com>
Date: Wed, 24 Feb 2016 15:25:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Icedove/38.5.0
MIME-Version: 1.0
In-Reply-To: <1456319258-20502-1-git-send-email-Martin.Jansa@gmail.com>
Subject: Re: [PATCH][meta-gnome] tracker: Blacklist because of packaging issues
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
X-List-Received-Date: Wed, 24 Feb 2016 13:28:03 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 02/24/2016 03:07 PM, Martin Jansa wrote:

> +
> +# writeback-modules and extract-modules are packaged in ${PN}-dev
> +PNBLACKLIST[tracker] ?= "BROKEN: QA Issue: -dev package contains non-symlink .so: tracker-dev"

This one is fixed in the introspection patchset (although I bundled it 
with the introspection fix, so you'd have to amend the commit).

Alex



