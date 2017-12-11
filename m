Return-Path: <raphael.kubo.da.costa@intel.com>
X-Greylist: delayed 571 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 11 Dec 2017 11:40:02 UTC
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	by mail.openembedded.org (Postfix) with ESMTP id DD73178709
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Dec 2017 11:40:02 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 Dec 2017 03:30:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,391,1508828400"; 
   d="scan'208";a="1842496"
Received: from rkubodac-desk.ger.corp.intel.com ([10.252.1.154])
	by orsmga008.jf.intel.com with ESMTP; 11 Dec 2017 03:30:32 -0800
From: Raphael Kubo da Costa <raphael.kubo.da.costa@intel.com>
To: Ayoub Zaki <ayoub.zaki@googlemail.com>
In-Reply-To: <CA+-BmJYi0W7whu3T5BneZGdt2me2J7iJBDXMy9FsoaKrnJvF3A@mail.gmail.com>
	(Ayoub Zaki's message of "Thu, 23 Nov 2017 11:22:11 +0100")
Organization: Intel International BV - KvK 34098535 - Capronilaan 37 1119NG
	Amsterdam
References: <877euzbem2.fsf@rkubodac-desk.ger.corp.intel.com>
	<87h8tv21fw.fsf@rkubodac-desk.ger.corp.intel.com>
	<CA+chaQd9i+Hn_7E0F5zVxP4AY5d3s5gaEJcnBUGF4+y_ghkxYQ@mail.gmail.com>
	<877eur1nby.fsf@rkubodac-desk.ger.corp.intel.com>
	<20171115174136.GA4530@jama>
	<CAMKF1soYSpfBApFPmBa1zj1U6nkqJ9+nqPckRser8Y3eWPmRmg@mail.gmail.com>
	<CA+-BmJYi0W7whu3T5BneZGdt2me2J7iJBDXMy9FsoaKrnJvF3A@mail.gmail.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.3 (gnu/linux)
Date: Mon, 11 Dec 2017 12:30:31 +0100
Message-ID: <87o9n5a4dk.fsf@rkubodac-desk.ger.corp.intel.com>
MIME-Version: 1.0
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-browser] CFT: Chromium 62 in meta-browser
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
X-List-Received-Date: Mon, 11 Dec 2017 11:40:03 -0000
Content-Type: text/plain

Ayoub Zaki <ayoub.zaki@googlemail.com> writes:

> Hello all,
>
> I'm trying to build from the latest commit meta-browser:
> a8bb1e779bc3565beacceadc4414816670f33475 with an imx6 using yocto pyro
> branch with meta-freescale, however the build fails :

FWIW, the errors reported below seem to be coming from Node. I guess the
node.js version in your pyro branch is too old and does not support all
the JS features present in the Chromium code.

