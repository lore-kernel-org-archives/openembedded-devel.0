Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 4A56B60745
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Nov 2016 20:40:36 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga103.jf.intel.com with ESMTP; 20 Nov 2016 12:40:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,523,1473145200"; d="scan'208";a="788831090"
Received: from chtanx-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.128.138])
	by FMSMGA003.fm.intel.com with ESMTP; 20 Nov 2016 12:40:35 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 21 Nov 2016 09:40:32 +1300
Message-ID: <2870220.C6Do4WeeW0@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.10 (Linux/4.7.10-100.fc23.x86_64; KDE/4.14.20; x86_64; ;
	)
In-Reply-To: <696ebdcf-d08d-72cd-7ee8-50b2c11e63d8@windriver.com>
References: <1479351761-70393-1-git-send-email-wenzong.fan@windriver.com>
	<9e50d470-714e-1c5c-83a9-39691b7315f8@gmail.com>
	<696ebdcf-d08d-72cd-7ee8-50b2c11e63d8@windriver.com>
MIME-Version: 1.0
Subject: Re: [meta-oe][PATCH] opencv: remove DEFAULT_PREFERENCE = "-1" for 3.1
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
X-List-Received-Date: Sun, 20 Nov 2016 20:40:38 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Fri, 18 Nov 2016 10:38:38 wenzong fan wrote:
> On 11/18/2016 02:11 AM, Khem Raj wrote:
> > On 11/16/16 7:02 PM, wenzong.fan@windriver.com wrote:
> >> From: Wenzong Fan <wenzong.fan@windriver.com>
> >> 
> >> The opencv 2.4 has been blacklisted, 3.1 should be the default choice
> >> for both opencv and lib32-opencv.
> > 
> > blacklisting does not change the norms. Is it possible to fix the reason
> > for blacklisting 2.x
> 
> The reason is "Not compatible with currently used ffmpeg 3", I can try
> to fix it but I can't promise it could be fixed definitely.

That honestly sounds like something we really should upgrade in order to fix 
rather than fixing the old version (unless it's the case that nobody is using 
opencv 3 and won't any time soon).

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

