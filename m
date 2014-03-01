Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id B390E6F173
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  1 Mar 2014 09:59:08 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 01 Mar 2014 01:59:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,567,1389772800"; d="scan'208";a="484084150"
Received: from pauljbro-mobl1.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.123.203])
	by fmsmga001.fm.intel.com with ESMTP; 01 Mar 2014 01:59:09 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Stephen Arnold <stephen.arnold42@gmail.com>
Date: Sat, 01 Mar 2014 09:59:07 +0000
Message-ID: <5362182.lGPryEyDJx@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.12.2 (Linux/3.13.4-200.fc20.x86_64; KDE/4.12.2; x86_64; ; )
In-Reply-To: <CAOLEWZWHfoUz0c+GW+MFqx-u=9NM9VJnANAB6YP9Wh56grtEaA@mail.gmail.com>
References: <1369981125-9597-1-git-send-email-xufeng.zhang@windriver.com>
	<53103D8E.4070105@windriver.com>
	<CAOLEWZWHfoUz0c+GW+MFqx-u=9NM9VJnANAB6YP9Wh56grtEaA@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [OE-devel] [PATCH] ntp: Resolve some abnormal behaviors
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
X-List-Received-Date: Sat, 01 Mar 2014 09:59:12 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Stephen,

On Friday 28 February 2014 20:33:55 Stephen Arnold wrote:
> Lastly, what about using pool.ntp.org as the default server for both ntpd
> and ntpdate?  That way everything works out of the box (as long as there's
> a net connection) and users can customize from there.  I have a bbappend
> for ntp right now, so maybe I should look at the default config again...

That would be nice, but since you can't actually distribute a product that 
connects to the main pool.ntp.org server (you need to register your own NTP 
pool [1]) we've elected not to set any default so that you are encouraged to 
do the right thing and explicitly set your own.

Cheers,
Paul

[1] http://www.pool.ntp.org/en/vendors.html#basic-guidelines

-- 

Paul Eggleton
Intel Open Source Technology Centre

