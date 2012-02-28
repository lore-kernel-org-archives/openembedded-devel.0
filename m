Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1S2Jub-0003Mz-Ae
	for openembedded-devel@lists.openembedded.org;
	Tue, 28 Feb 2012 11:04:01 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 28 Feb 2012 01:55:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="71248383"
Received: from unknown (HELO helios.localnet) ([10.252.123.68])
	by AZSMGA002.ch.intel.com with ESMTP; 28 Feb 2012 01:55:32 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Steffen Sledz <sledz@dresearch-fe.de>
Date: Tue, 28 Feb 2012 09:55:31 +0000
Message-ID: <1567078.cdBARgH5ks@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.0 (Linux/3.0.0-16-generic-pae; KDE/4.8.0; i686; ; )
In-Reply-To: <4F4C9DB8.5050203@dresearch-fe.de>
References: <4F4C9DB8.5050203@dresearch-fe.de>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Use python in variable assigment of a recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 28 Feb 2012 10:04:01 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 28 February 2012 10:26:16 Steffen Sledz wrote:
> According to the user manual it is possible to use python code in variable
> assignments by using ${@...}.
> 
> I like to use a function (subprocess.check_output) here which requires an
> import statement. Where do i have to place this import?

If you've got more than one line of Python then you should probably define a 
normal Python function (just use "def" as you would in a normal python script 
- there are plenty of examples of this) and then call this using ${@...}.
 
> And another question. Is it possible to determine the path to the recipe
> itself from with it?

I think you just need to get the value of the FILE variable e.g

 d.getVar('FILE', True)

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


