Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 4B1296FF56
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Jun 2016 13:09:26 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga104.fm.intel.com with ESMTP; 10 Jun 2016 06:09:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,449,1459839600"; d="scan'208";a="119575570"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga004.fm.intel.com with ESMTP; 10 Jun 2016 06:09:27 -0700
To: openembedded-devel@lists.openembedded.org
References: <cfce0a18-6762-9da4-1f4a-1969a912bf50@linux.intel.com>
	<c487579e-eb43-81b5-b888-da9ad493102a@balister.org>
	<CAJTo0LZnh1+tvznjgKKFrSoP-ie0vMD0m_5AtTEi0DcrpFjX6g@mail.gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <d4673c93-772d-fd5a-7a62-81bdc54dcb93@linux.intel.com>
Date: Fri, 10 Jun 2016 16:09:05 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.1.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZnh1+tvznjgKKFrSoP-ie0vMD0m_5AtTEi0DcrpFjX6g@mail.gmail.com>
Subject: Re: [OE-core] the fate of Vala in OE
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
X-List-Received-Date: Fri, 10 Jun 2016 13:09:27 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 06/09/2016 05:37 PM, Burton, Ross wrote:

>> That said, what other layers use vala? If it leaves core, is there a
>> layer that can host it and support other layers using it without to much
>> trouble?
>>
>
> That's the key question really - can the support be extracted and added to
> eg meta-vala in some way?

The problem with such extraction is that for recipes in oe-core support 
for generating their vala bindings still has to be provided. I don't see 
a way to do that that is not overly complicated (in 'opaque side 
effects' kind of way) and difficult to grasp for humans.


Alex


