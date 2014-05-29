Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (unknown [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id B34826FC88
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 May 2014 17:01:55 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 29 May 2014 10:01:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.98,935,1392192000"; d="scan'208";a="539605472"
Received: from acdivito-mobl2.gar.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.123.240])
	by fmsmga001.fm.intel.com with ESMTP; 29 May 2014 10:01:55 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Dave Hylands <dhylands@gmail.com>
Date: Thu, 29 May 2014 18:01:54 +0100
Message-ID: <3076920.GIcPHFYYDY@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.12.5 (Linux/3.14.4-200.fc20.x86_64; KDE/4.12.5; x86_64; ; )
In-Reply-To: <CABi1daHuRYWXAy629iwuUJfUwsQxDWaS3B8zdUO+sks4_fL8BQ@mail.gmail.com>
References: <CABi1daHuRYWXAy629iwuUJfUwsQxDWaS3B8zdUO+sks4_fL8BQ@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Issue with x264_git.bb
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
X-List-Received-Date: Thu, 29 May 2014 17:02:03 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Dave,

On Thursday 29 May 2014 07:21:19 Dave Hylands wrote:
> I've been working with the Intel Galileo, which I think is using the dylan
> branch.
> 
> The meta-oe/recipes-multimedia/x264/x264_git.bb file contains:
> 
> SRCREV = "1cffe9f406cc54f4759fc9eeb85598fb8cae66c7"
> 
> which appears to no longer exist in the git.videolan.org repository. I
> found this tree on gitorious:
> https://gitorious.org/gxk-media/x264/commits/1cffe9f406cc54f4759fc9eeb85598f
> b8cae66c7 which has the correct hash, and by comparing the description, I
> was able to determine that the corresponding hash in the current
> git.videolan.org repository is c6bfcec47c9d1fff0489a30215501babea29f59c
> 
> I wasn't quite sure what the development procedure for this repo was, so I
> thought I would raise the issue and ask how to proceed.
> 
> I'm happy to do a pull request. I noticed that x264 doesn't seem to exist
> in the master branch, and I wasn't sure of the significance of that either.

We just noticed this yesterday too. The story with the recipe is that after 
dylan it got moved to the OE-Core repository, but it's just as broken there so 
we'll need to fix it in dylan in meta-oe and in master of OE-Core, and from 
there we can get it backported to daisy/dora branches of OE-Core as well. If 
you could send a patch that would be great.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

