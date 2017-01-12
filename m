Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 42D0B71C1A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Jan 2017 14:59:22 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga104.fm.intel.com with ESMTP; 12 Jan 2017 06:59:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,349,1477983600"; d="scan'208";a="808065482"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by FMSMGA003.fm.intel.com with ESMTP; 12 Jan 2017 06:59:22 -0800
To: openembedded-devel@lists.openembedded.org
References: <20170112144413.GA7854@linux-uys3>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <8801566a-4012-0323-dc60-6833ab0079a7@linux.intel.com>
Date: Thu, 12 Jan 2017 16:59:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <20170112144413.GA7854@linux-uys3>
Subject: Re: meta-browser duplicate patch
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
X-List-Received-Date: Thu, 12 Jan 2017 14:59:22 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 01/12/2017 04:44 PM, Trevor Woerner wrote:
> Does the do_patch logic now ignore the same patch being applied twice? I was
> quite sure this was a problem in the past (and if it isn't, maybe it should
> be?)
>
> In commit fb4e542079958b6afde324a1e9bfdd695842aeeb
> the patch recipes-browser/chromium/chromium/chromium/Do-not-depend-on-Linux-4.5.patch
>
> and in commit c6fc9da7be64af7cd08c2bbb026e4c3ffc760687
> the patch recipes-browser/chromium/chromium/chromium/unset-madv-free.patch
>
> are exactly the same. Yet they're both happily applied without so much as a
> warning, not even in temp/log.do_patch.

Can you inspect the resulting file? Are the changes being applied twice 
in two *different* locations in the file?

We have a bug to fix this issue:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=10450


Alex


