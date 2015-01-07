Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id DDCFD65D40
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Jan 2015 09:27:48 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 07 Jan 2015 01:25:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,713,1413270000"; d="scan'208";a="647474064"
Received: from unknown (HELO peggleto-mobl5.ger.corp.intel.com)
	([10.252.3.155])
	by fmsmga001.fm.intel.com with ESMTP; 07 Jan 2015 01:27:47 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Armin Kuster <akuster808@gmail.com>,
	openembedded-devel@lists.openembedded.org,
	Bian Naimeng <biannm@cn.fujitsu.com>
Date: Wed, 07 Jan 2015 09:27:46 +0000
Message-ID: <2220709.jFTZT0BvCv@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.3 (Linux/3.17.7-200.fc20.x86_64; KDE/4.14.3; x86_64; ; )
In-Reply-To: <B851B2EA-9E81-40E6-A1E9-B8C30DD9E194@gmail.com>
References: <54A97D15.4080801@gmail.com>
	<B851B2EA-9E81-40E6-A1E9-B8C30DD9E194@gmail.com>
MIME-Version: 1.0
Subject: Re: recent addition of libgxim depends issue
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
X-List-Received-Date: Wed, 07 Jan 2015 09:27:51 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 06 January 2015 16:41:52 Khem Raj wrote:
> > On Jan 4, 2015, at 9:49 AM, akuster808 <akuster808@gmail.com> wrote:
> > While building world I found and issue with libgxim.
> > 
> > libgxim depends on ruby-native. meta-ruby is not a layer depends for
> > meta-oe.
> > 
> > Can meta-oe have layer depends other then 'core' ? if so, this is an easy
> > fix.
>
> I would not like to have such a dependency. May be move this recipe to
> meta-ruby

If it's not specifically a ruby-related piece of software (which it doesn't 
seem to be, at a glance) then that wouldn't seem right. Can the ruby 
dependency be disabled by default using PACKAGECONFIG perhaps?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

