Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 6321877022
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Oct 2015 07:11:46 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP; 01 Oct 2015 00:11:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,616,1437462000"; d="scan'208";a="571909728"
Received: from tchin1-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.22.123])
	by FMSMGA003.fm.intel.com with ESMTP; 30 Sep 2015 23:54:07 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Ulf Samuelsson <ulf@emagii.com>
Date: Thu, 01 Oct 2015 07:54:05 +0100
Message-ID: <2092542.RsGTerxllR@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.9 (Linux/4.1.6-100.fc21.x86_64; KDE/4.14.9; x86_64; ; )
In-Reply-To: <06BF52C6-946E-4474-B7CB-7EEA269202D5@emagii.com>
References: <1443601616-25650-1-git-send-email-ulf@emagii.com>
	<6121338.U6CHxlbeKO@peggleto-mobl.ger.corp.intel.com>
	<06BF52C6-946E-4474-B7CB-7EEA269202D5@emagii.com>
MIME-Version: 1.0
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] Use GFDL-1.1 instead of GFDLv1.1
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
X-List-Received-Date: Thu, 01 Oct 2015 07:11:47 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Perhaps it wasn't clear, I was agreeing with you ;) I'm not even sure we need 
to add a mapping for this.

Cheers,
Paul

On Thursday 01 October 2015 00:08:00 Ulf Samuelsson wrote:
> Right now, it gives a warning during build.
> Just because some think we should support both, it does not mean we have to
> *use* both. Applying the patch should fix the warning message, which should
> be priority one.
> 
> 
> Best Regards
> Ulf Samuelsson
> 
> > 30 sep 2015 kl. 13:58 skrev Paul Eggleton <paul.eggleton@linux.intel.com>:
> > 
> > Yes I'm aware of that. What I was pointing out is that usually we have an
> > SPDXLICENSEMAP setting to map e.g. GPLv2 -> GPL-2.0; there is no such
> > mapping for GFDL; I guess the assumption was that there was.
> > 
> > Cheers,
> > Paul
> > 
> >> On Wednesday 30 September 2015 13:53:08 Ulf Samuelsson wrote:
> >> There is no GFDLv1.1 file in the license directory
> >> -------------------------------------------------------------------------
> >> --- ------ openembedded-core/meta/files/common-licenses$ ls GFDL*
> >> 
> >> GFDL-1.1  GFDL-1.2  GFDL-1.3
> >> -------------------------------------------------------------------------
> >> --- ------
> >> 
> >> It does not make sense to have a duplicate file.
> >> 
> >> Incidently, the GFDL-1.1 file contains the GFDL-1.2 license, not the 1.1
> >> license.
> >> 
> >> /Ulf
> >> 
> >>> Den 2015-09-30 kl. 13:05, skrev Paul Eggleton:
> >>>> On Wednesday 30 September 2015 03:10:56 Khem Raj wrote:
> >>>>> On Wed, Sep 30, 2015 at 1:26 AM, Ulf Samuelsson <ulf@emagii.com>
> >>>>> wrote:
> >>>>> -LICENSE = "GPLv2 & LGPLv2 & GFDLv1.1"
> >>>>> +LICENSE = "GPLv2 & LGPLv2 & GFDL-1.1"
> >>>> 
> >>>> IIRC both are correct
> >>> 
> >>> I don't think we have an SPDXLICENSEMAP entry for this though, so it
> >>> won't
> >>> be being mapped (unlike GPLv2 -> GPL-2.0).
> >>> 
> >>> Cheers,
> >>> Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

