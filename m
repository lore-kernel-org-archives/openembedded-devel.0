Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id B9CBE65E08
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Aug 2014 09:37:42 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 01 Aug 2014 02:37:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,862,1389772800"; d="scan'208";a="366644064"
Received: from pwarusav-mobl.gar.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.122.170])
	by FMSMGA003.fm.intel.com with ESMTP; 01 Aug 2014 02:34:32 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Journeyer J. Joh" <oosaprogrammer@gmail.com>
Date: Fri, 01 Aug 2014 10:37:41 +0100
Message-ID: <3353440.oUBJEHypqt@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.13.3 (Linux/3.15.6-200.fc20.x86_64; KDE/4.13.3; x86_64; ; )
In-Reply-To: <CALYKT1jXkq-Ci_gpLs4v4rn50P6UsVRQUL7pO2BrWd9V-==eaA@mail.gmail.com>
References: <CALYKT1jXkq-Ci_gpLs4v4rn50P6UsVRQUL7pO2BrWd9V-==eaA@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [boost]How can I develop a daemon which depends on boost?
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
X-List-Received-Date: Fri, 01 Aug 2014 09:37:43 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Journeyer,

On Friday 01 August 2014 16:55:24 Journeyer J. Joh wrote:
> I just submitted a question about how to include boost. Now I'd like to ask
> another question - How can I develop a daemon which depends on boost?
> 
> I believe firstly, I need to make boost be included into my binary image.
> Secondly I believe that I need to develop a daemon which compiles with
> boost library. Then how can I compile this daemon with boost library? The
> boost library doesn't exist when the compile is executed.

This would be a build dependency, so simply add boost to DEPENDS. To help
answer your other question, since this will be (presumably) dynamically linked
to your application, you don't need to do anything else because we detect
dynamic links between files within packages and add a runtime dependency
between the packages.

As for generally how to add packages to an image, please see:

http://www.yoctoproject.org/docs/current/dev-manual/dev-manual.html#usingpoky-extend-customimage

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

