Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 24B0F73236
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 May 2015 14:02:20 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 21 May 2015 07:02:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,469,1427785200"; d="scan'208";a="496560435"
Received: from linux-8hqz.fi.intel.com (HELO linux-8hqz.site) ([10.237.68.142])
	by FMSMGA003.fm.intel.com with ESMTP; 21 May 2015 07:01:59 -0700
Message-ID: <555DE57B.1050706@linux.intel.com>
Date: Thu, 21 May 2015 17:02:35 +0300
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1431958369-14668-1-git-send-email-alexander.kanavin@linux.intel.com>	<20150521110638.GB2377@jama>
	<555DDEB7.7040909@linux.intel.com> <20150521134835.GF2377@jama>
In-Reply-To: <20150521134835.GF2377@jama>
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
X-List-Received-Date: Thu, 21 May 2015 14:02:23 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 05/21/2015 04:48 PM, Martin Jansa wrote:
> No you don't need to copy it, just use path to it, I've already fixed 
> it for my jenkins builds, you don't need to resend just because of this..

I wanted to send an updated set, because also this recipe requires a 
file with a path, so that will break after the directory rename (to 
gstreamer-0.10) patch is applied:

gst-plugins-gl_0.10.3.bb:require 
recipes-multimedia/gstreamer/gst-plugins.inc


Here the path should be removed instead.


Alex

