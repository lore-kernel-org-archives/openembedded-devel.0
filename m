Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 86C1165C9C
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 May 2015 14:24:18 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 18 May 2015 07:24:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,453,1427785200"; 
	d="scan'208,217";a="731161932"
Received: from linux-8hqz.fi.intel.com (HELO linux-8hqz.site) ([10.237.68.142])
	by orsmga002.jf.intel.com with ESMTP; 18 May 2015 07:24:13 -0700
Message-ID: <5559F629.2010602@linux.intel.com>
Date: Mon, 18 May 2015 17:24:41 +0300
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1431958369-14668-1-git-send-email-alexander.kanavin@linux.intel.com>	<1431958369-14668-5-git-send-email-alexander.kanavin@linux.intel.com>
	<5559F424.3060607@pseudoterminal.org>
In-Reply-To: <5559F424.3060607@pseudoterminal.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [PATCH 4/4] Rename gstreamer directory to gstreamer-0.10
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
X-List-Received-Date: Mon, 18 May 2015 14:24:23 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05/18/2015 05:16 PM, Carlos Rafael Giani wrote:
> Would it be possible to rename  the recipes to match the naming
 > convention of the 1.0 ones? For example, instead of
 > "gst-plugins-bad", it would be "gstreamer0.10-plugins-bad". Is such
 > a backwards compatibility break tolerable between major OE releases?
 >

Uhm, I wouldn't want to do it:

1) The rename would break all the 3rd party BSP/application recipes.

2) GStreamer 0.10 is explicitly obsolete and unsupported, and as of 
today, provided only to ease the transition to 1.0. The 0.10 recipes 
won't be updated anymore, unless someone in the community wants to do it.


Alex


