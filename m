Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 102FB6FFE2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Jun 2016 13:16:51 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga103.jf.intel.com with ESMTP; 10 Jun 2016 06:16:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,449,1459839600"; d="scan'208";a="999286822"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 10 Jun 2016 06:16:44 -0700
To: openembedded-devel@lists.openembedded.org
References: <cfce0a18-6762-9da4-1f4a-1969a912bf50@linux.intel.com>
	<c487579e-eb43-81b5-b888-da9ad493102a@balister.org>
	<CAJTo0LZnh1+tvznjgKKFrSoP-ie0vMD0m_5AtTEi0DcrpFjX6g@mail.gmail.com>
	<33320.10.7.198.51.1465487815.squirrel@linux.intel.com>
	<CAHPquwP2RDW3T5hiizow6=1xJzwgCPDDs=z+OHgaEedcXTh6bg@mail.gmail.com>
	<CAJTo0LZhrKJvg=m05_SUPktikELaDRq8gTvvtjfhaj_9Uq+vPw@mail.gmail.com>
	<20160609181613.GB2586@jama>
	<CAHPquwPKh0hgOuvHvB0KYVfU0PhtR_sZ8vKO8EgH_YgsZrwtkA@mail.gmail.com>
	<575A7BEB.1060808@mlbassoc.com>
	<CA+chaQemhEo7Y2o3AfAO6CG6nxtH80bw6qFm-YwPS=CbtzxkHQ@mail.gmail.com>
	<575A9212.90806@mlbassoc.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <662beb0d-4193-6d17-7df7-620b679fee37@linux.intel.com>
Date: Fri, 10 Jun 2016 16:16:22 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.1.0
MIME-Version: 1.0
In-Reply-To: <575A9212.90806@mlbassoc.com>
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
X-List-Received-Date: Fri, 10 Jun 2016 13:16:52 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 06/10/2016 01:10 PM, Gary Thomas wrote:

>
> Yes, I realized that :-(
>
> The actual list is smaller, but still important:
> "gcr" -> "vala-native" [style=solid]
> "gcr" -> "vala" [style=solid]
> "libsecret" -> "vala-native" [style=solid]
> "libsecret" -> "vala" [style=solid]
>
> Both of those packages are in OE-core (meta/recipes-gnome)

These packages are libraries, and need vala only for generating vala 
bindings for their library APIs. If there are no users of those 
bindings, then vala dependencies could be easily disabled.

The actual things in oe-core and meta-oe that truly need vala are Rygel 
and vala-terminal.


Alex

