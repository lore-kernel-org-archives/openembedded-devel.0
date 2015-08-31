Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 51F9A76DE5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Aug 2015 13:46:26 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 31 Aug 2015 06:46:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,441,1437462000"; d="scan'208";a="552214965"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.143])
	([10.237.68.143])
	by FMSMGA003.fm.intel.com with ESMTP; 31 Aug 2015 06:46:26 -0700
Message-ID: <55E45B14.2080908@linux.intel.com>
Date: Mon, 31 Aug 2015 16:48:04 +0300
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.7.0
MIME-Version: 1.0
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
References: <20150831125632.GA2465@jama>
	<CALbNGRTScmFfjhAU+PY3Y5ZKdpk0vK9f67Kdq+7BYvPdnVv-Fg@mail.gmail.com>
In-Reply-To: <CALbNGRTScmFfjhAU+PY3Y5ZKdpk0vK9f67Kdq+7BYvPdnVv-Fg@mail.gmail.com>
Subject: Re: [OE-core] State of bitbake world, Failed tasks 2015-08-30
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
X-List-Received-Date: Mon, 31 Aug 2015 13:46:27 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit

On 08/31/2015 04:32 PM, Andreas Müller wrote:
>>      * /meta-openembedded/meta-gnome/recipes-gnome/epiphany/epiphany_2.30.6.bb, do_fetch

This recipe will be removed when the new epiphany shows up in oe-core.

>>      * /meta-openembedded/meta-gnome/recipes-gnome/gnome-power-manager/gnome-power-manager_2.32.0.bb, do_compile
>>      * /meta-openembedded/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_2.32.1.bb, do_compile

These are probably due to removal of libnotify 0.6.0.

>>      * /meta-openembedded/meta-gnome/recipes-gnome/nautilus/nautilus3_3.2.1.bb, do_fetch
> ^ how did this return to world?

It was previously excluded because it was not compatible with libnotify 
0.6.0. Now that it's gone, there is no reason to exclude it from world.

The fetch failure is because I somehow overlooked the recipe when fixing 
the default tarball compression in gnome recipes. It needs a checksum 
update.


Alex

