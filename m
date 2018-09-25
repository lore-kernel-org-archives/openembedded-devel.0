Return-Path: <paul.eggleton@linux.intel.com>
X-Greylist: delayed 567 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 25 Sep 2018 10:29:07 UTC
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id B1EB8744AC
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Sep 2018 10:29:07 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	25 Sep 2018 03:19:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.54,301,1534834800"; d="scan'208";a="89138199"
Received: from yoongsia-mobl.gar.corp.intel.com (HELO localhost.localdomain)
	([10.255.174.62])
	by fmsmga002.fm.intel.com with ESMTP; 25 Sep 2018 03:19:37 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Tue, 25 Sep 2018 22:19:34 +1200
Message-ID: <13146483.nmZ70cjRe6@localhost.localdomain>
Organization: Intel Corporation
In-Reply-To: <CAP71WjzB-xkVAnLOBd0jLdKXTh8B87dpHiQUvGhhzm8Q2fNzXQ@mail.gmail.com>
References: <CAP71Wjxwv3i2=UtbzNai79h-f83xcL6G1R8+kY-C-jA==VFy9Q@mail.gmail.com>
	<CAP71WjyhuQ06BzuYgNDvGDLFo18jyYY4KkFfE0_GFKxWJ7Poyw@mail.gmail.com>
	<CAP71WjzB-xkVAnLOBd0jLdKXTh8B87dpHiQUvGhhzm8Q2fNzXQ@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: meta-oe and yocto-check-layer
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
X-List-Received-Date: Tue, 25 Sep 2018 10:29:07 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday, 25 September 2018 9:43:43 PM NZST Nicolas Dechesne wrote:
> Running the compliance script on meta-oe turned out to be an
> interesting exercise ;)
> 
> I have found several issues, which I have mentioned in a few different
> threads, so I will summary here.
> 
> * oe-core: fix the yocto-check-layer for dependency loop
> * I have the following local commits in meta-oe:
> meta-oe: add meta-python in LAYERDEPENDS (needed for protobuf)

Right, yeah, I noticed that one too a week or so ago and forgot to raise it. I 
actually think this needs to be fixed - meta-oe (at least by previous design) 
is not supposed to depend upon any other layer than OE-Core. I believe the 
dependency is optional though so we should be able to add a PACKAGECONFIG for 
it and default it to disabled. Assuming there is no violent objection and 
nobody else gets there first, I'll volunteer to make this fix.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre



