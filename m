Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 35145607BB
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 May 2015 13:33:06 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 21 May 2015 06:33:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,469,1427785200"; d="scan'208";a="698323266"
Received: from linux-8hqz.fi.intel.com (HELO linux-8hqz.site) ([10.237.68.142])
	by orsmga001.jf.intel.com with ESMTP; 21 May 2015 06:33:07 -0700
Message-ID: <555DDEB7.7040909@linux.intel.com>
Date: Thu, 21 May 2015 16:33:43 +0300
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1431958369-14668-1-git-send-email-alexander.kanavin@linux.intel.com>
	<20150521110638.GB2377@jama>
In-Reply-To: <20150521110638.GB2377@jama>
Subject: Re: [PATCH 0/4] Add GStreamer 0.10 and things that depend on it from oe-core
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 21 May 2015 13:33:07 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 05/21/2015 02:06 PM, Martin Jansa wrote:
> On Mon, May 18, 2015 at 05:12:44PM +0300, Alexander Kanavin wrote:
>> These patches add GStreamer 0.10, and things that depend on it from oe-core
>>
>> GStreamer 0.10 is now being removed from oe-core, but we would still like to
>> provide it through meta-openembedded.
>>
>> See: https://bugzilla.yoctoproject.org/show_bug.cgi?id=6294
> How was this tested? Are you just throwing recipes unwanted in oe-core
> to meta-oe without testing?
>
> ERROR: ParseError at
> /OE/build/shr-core/meta-openembedded/meta-multimedia/recipes-multimedia/gstreamer/gst-plugins.inc:17:
> Could not include required file gst-plugins-package.inc
>

My bad, it wasn't. The missing file is shared between gstreamer 1.0 and 
0.10 recipes, so it has to be copied over. I'll send updated patches.

Alex

