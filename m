Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 11A90609B2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 May 2015 14:18:41 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 21 May 2015 07:18:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,469,1427785200"; d="scan'208";a="496567506"
Received: from linux-8hqz.fi.intel.com (HELO linux-8hqz.site) ([10.237.68.142])
	by FMSMGA003.fm.intel.com with ESMTP; 21 May 2015 07:18:43 -0700
Message-ID: <555DE966.1060208@linux.intel.com>
Date: Thu, 21 May 2015 17:19:18 +0300
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1431958369-14668-1-git-send-email-alexander.kanavin@linux.intel.com>	<20150521110638.GB2377@jama>
	<555DDEB7.7040909@linux.intel.com>	<20150521134835.GF2377@jama>
	<555DE57B.1050706@linux.intel.com> <20150521141144.GG2377@jama>
In-Reply-To: <20150521141144.GG2377@jama>
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
X-List-Received-Date: Thu, 21 May 2015 14:18:42 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 05/21/2015 05:11 PM, Martin Jansa wrote:
> Are you going to rename gstreamer to gstreamer-0.10 in oe-core? I don't
> think so or I misunderstood what you meant, these 2 lines look correct
> to me:
> $ git grep gst-plugins-package.inc
> meta-multimedia/recipes-multimedia/gstreamer/gst-plugins.inc:require recipes-multimedia/gstreamer/gst-plugins-package.inc
> meta-oe/recipes-connectivity/bluez/gst-plugin-bluetooth_4.101.bb:require recipes-multimedia/gstreamer/gst-plugins-package.inc
>
> and renaming the directory in meta-multimedia doesn't have any impact on
> this.

These lines above are correct. They refer to a file in oe-core.

>> gst-plugins-gl_0.10.3.bb:require
>> recipes-multimedia/gstreamer/gst-plugins.inc

This line will not be correct after the directory rename, because it 
refers to a file in meta-multimedia, and not in oe-core. This is a 
separate problem that should only show up after the directory rename 
patch is applied. The way to fix it is to remove the path to the file 
because it's in the same dir as the recipe.

Alex

