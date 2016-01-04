Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 6A505731BD;
	Mon,  4 Jan 2016 18:25:34 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 04 Jan 2016 10:25:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,521,1444719600"; 
	d="scan'208,217";a="883606235"
Received: from mlopezva-mobl2.zpn.intel.com (HELO [10.219.16.32])
	([10.219.16.32])
	by orsmga002.jf.intel.com with ESMTP; 04 Jan 2016 10:25:34 -0800
To: "Burton, Ross" <ross.burton@intel.com>,
	Sona Sarmadi <sona.sarmadi@enea.com>
References: <567039E1.5000205@linux.intel.com>
	<3230301C09DEF9499B442BBE162C5E48ABABDD6C@SESTOEX04.enea.se>
	<CAJTo0LYO9ptJ4PDmR49N-Yw9TbTFGsuyCUBUc4zW2FLk2CNoWQ@mail.gmail.com>
From: Mariano Lopez <mariano.lopez@linux.intel.com>
Message-ID: <568AB923.6080605@linux.intel.com>
Date: Mon, 4 Jan 2016 12:25:39 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LYO9ptJ4PDmR49N-Yw9TbTFGsuyCUBUc4zW2FLk2CNoWQ@mail.gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [RFC] Mark of upstream CVE patches
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
X-List-Received-Date: Mon, 04 Jan 2016 18:25:34 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit



On 12/16/2015 03:21 AM, Burton, Ross wrote:
>
> On 16 December 2015 at 09:03, Sona Sarmadi <sona.sarmadi@enea.com 
> <mailto:sona.sarmadi@enea.com>> wrote:
>
>     We are supposed to have reference to the CVE identifier both in
>     the patch file/s
>      and the commit message(e.g.  xxx- CVE-2013-6435.pacth) according
>     to the guidelines
>     for "Patch name convention and commit message" in the Yocto
>     Wiki https://wiki.yoctoproject.org/wiki/Security.
>
>     If a patch address multiple CVEs, perhaps we should name the patch:
>     Fix-for-multiple-CVEs.patch and list all CVEs in the patch file.
>
>     Will this not solve the problem? Do you think there is still need
>     for a new tag "CVE"?
>
>
> I'd say a new tag is essential if we want to automate tooling, to 
> reduce the chance of false-positives from simply searching the patch 
> for something that looks like a CVE reference.
>
> Ross

The conclusion of this thread is to add the tag "CVE" to the metadata of 
submitted CVE patches. I will edit the wiki to show this requirement.

Mariano

