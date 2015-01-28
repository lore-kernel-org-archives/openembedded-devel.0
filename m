Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id CDFDF72D87
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Jan 2015 10:12:38 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 28 Jan 2015 02:09:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,480,1418112000"; d="scan'208";a="657844583"
Received: from nnodonog-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.3.113])
	by fmsmga001.fm.intel.com with ESMTP; 28 Jan 2015 02:12:37 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Chong Lu <Chong.Lu@windriver.com>
Date: Wed, 28 Jan 2015 10:12:37 +0000
Message-ID: <1500154.AFRkDB49WV@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.3 (Linux/3.17.8-200.fc20.x86_64; KDE/4.14.3; x86_64; ; )
In-Reply-To: <54C8AC2B.4050407@windriver.com>
References: <1422415423-19807-1-git-send-email-Chong.Lu@windriver.com>
	<5351926.a74nUugD2W@peggleto-mobl5.ger.corp.intel.com>
	<54C8AC2B.4050407@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] samba: disable service by default
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
X-List-Received-Date: Wed, 28 Jan 2015 10:12:41 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 28 January 2015 17:30:19 Chong Lu wrote:
> On 01/28/2015 04:59 PM, Paul Eggleton wrote:
> > Hi Chong,
> > 
> > On Wednesday 28 January 2015 11:23:43 Chong Lu wrote:
> >> Disable smb, nmb, winbind service by default.
> > 
> > The commit message says what you are doing, but doesn't explain the reason
> > - why do you want to do this?
> > 
> 
> The config file need configure by user, else I think there is no meaning
> for enable samba by default.

Surely that's a distro decision though?

I'm just guessing, but if the problem you're trying to address is that the 
services get pulled into an image unexpectedly or where they aren't needed, 
then if at all practical it would be best to try to split the packaging such 
that the needed client/utility binaries are available without those services 
and thus the services should never be in an image they are explicitly 
requested.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

