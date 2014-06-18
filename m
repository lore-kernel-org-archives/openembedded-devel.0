Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 65A8465FF6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Jun 2014 15:57:03 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 18 Jun 2014 08:57:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,501,1400050800"; d="scan'208";a="549896836"
Received: from tlankage-mobl.gar.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.120.87])
	by fmsmga001.fm.intel.com with ESMTP; 18 Jun 2014 08:57:02 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Andreas Wick <0x.andreas.wick@gmail.com>
Date: Wed, 18 Jun 2014 16:57:01 +0100
Message-ID: <1603606.1ItAG5HW5D@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.12.5 (Linux/3.14.7-200.fc20.x86_64; KDE/4.12.5; x86_64; ; )
In-Reply-To: <CAB2+j+hbLc==rmymFKW-=eS6CjtzjdPvhpJDWzfXJfHY4xGR6w@mail.gmail.com>
References: <CAB2+j+hbLc==rmymFKW-=eS6CjtzjdPvhpJDWzfXJfHY4xGR6w@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-opie] Avoid opie-image-16mb resulting in a 21 MB JFFS2 image
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
X-List-Received-Date: Wed, 18 Jun 2014 15:57:07 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Andreas,

On Wednesday 18 June 2014 16:09:13 Andreas Wick wrote:
> I currently try to build opie-image-16mb for simpad. Unfortunately the
> image is about 21 MB large whereas my available ROM is just 16MB.
> Is there any way to strip down the image such that it the image will be
> smaller than 16MB?

It has probably been quite some time since the 16mb image was built and used.
The first thing to do would be to look at its current contents and try to see
where space is being consumed - the information produced for the image with
buildhistory (in particular installed-package-sizes.txt) should be useful for
that - see:

http://www.yoctoproject.org/docs/current/ref-manual/ref-manual.html#maintaining-build-output-quality

If you could let me know what you find that would be great.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

