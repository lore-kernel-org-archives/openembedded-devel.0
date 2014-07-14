Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 7DA3E65DB1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Jul 2014 10:38:08 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 14 Jul 2014 03:38:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,657,1400050800"; d="scan'208";a="572747105"
Received: from snaufer-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.121.80])
	by orsmga002.jf.intel.com with ESMTP; 14 Jul 2014 03:38:08 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Jate S <jatedev@gmail.com>
Date: Mon, 14 Jul 2014 11:38:07 +0100
Message-ID: <3099943.1ZXLqn7vZv@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.13.2 (Linux/3.15.4-200.fc20.x86_64; KDE/4.13.2; x86_64; ; )
In-Reply-To: <CAPphmgaa8uhXjwDq+c-GUgyyqhcPB-gdsHmAxq4_c_x1acBooQ@mail.gmail.com>
References: <CAPphmgZ+ivQYXuYHLWfzQF9QySVnd=YtbM=fEjfA_7hp3iFq1A@mail.gmail.com>
	<53B39DCE.9060705@freenet.de>
	<CAPphmgaa8uhXjwDq+c-GUgyyqhcPB-gdsHmAxq4_c_x1acBooQ@mail.gmail.com>
MIME-Version: 1.0
Cc: yocto@yoctoproject.org, Jens Lucius <jenslucius@freenet.de>,
	openembedded-devel@lists.openembedded.org
Subject: Re: [yocto] python tkinter dependencies
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
X-List-Received-Date: Mon, 14 Jul 2014 10:38:14 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 10 July 2014 16:11:29 Jate S wrote:
> - Python-tkinter requires the tk recipe in meta-oe, so you must add
> this layer for your build.
> - I am on dora. I found that I needed commit "tk: make multilib build
> compatible and fix library install" made on 12/5/2013
> (1ca29d1cda0d007c4e6a28fe1a4037b4029ad7ae).
> - I created a bbappend for python. In this I added
> DEPENDS_class-target on tk, and RDEPENDS_class-target on tk and
> tk-lib. Also, I did a SRC_URI replace to eliminate the
> avoid_warning_about_tkinter.patch file.
> 
> I was able to build and use python-tkinter successfully.
> 
> The question now is if this should go into meta-oe or oe-core. And how.
> 
> The tcl recipe is in oe-core, but not tk. I'm not yet sure why this
> is. Does anybody know?

I think the answer is that we have some things in OE-Core that depend on tcl 
(e.g. expect) but nothing in OE-Core requires tk.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

