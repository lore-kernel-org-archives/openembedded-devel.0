Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Rfx26-0001or-Fo
	for openembedded-devel@lists.openembedded.org;
	Wed, 28 Dec 2011 18:11:18 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 28 Dec 2011 09:04:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="51334444"
Received: from unknown (HELO helios.localnet) ([10.252.122.71])
	by AZSMGA002.ch.intel.com with ESMTP; 28 Dec 2011 09:04:02 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Giuseppe Condorelli <giuseppe.condorelli@gmail.com>
Date: Wed, 28 Dec 2011 17:04 +0000
Message-ID: <1467608.7NT73FzDoG@helios>
Organization: Intel Corporation
User-Agent: KMail/4.7.3 (Linux/3.0.0-14-generic-pae; KDE/4.7.4; i686; ; )
In-Reply-To: <CAOHjBZtAzdpynVMt6m=ofp6P+Xy9i7=NXaBU2mgT-4uR8MXf4Q@mail.gmail.com>
References: <CAOHjBZuETnOuVQkfC9hmoS9X8vRVQCnLUPtqF6g5+JLjT4+DQA@mail.gmail.com>
	<1535311.D6ZbQ8u8yE@helios>
	<CAOHjBZtAzdpynVMt6m=ofp6P+Xy9i7=NXaBU2mgT-4uR8MXf4Q@mail.gmail.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Python2.7.2 compatibility
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
X-List-Received-Date: Wed, 28 Dec 2011 17:11:18 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 28 December 2011 17:57:33 Giuseppe Condorelli wrote:
> This is the log error I catch, I can think it is due to python but maybe
> I'm wrong.
> 
> ---------------------------------
> bitbake base-image
> ERROR: There is a comment on line 24 of file
> /home/condorg/work/openembedded/recipes/ekiga/ekiga_git.bb (#
> --enable-static-libs \) which is in the middle of a multiline expression.
> Bitbake used to ignore these but no longer does so, please fix your
> metadata as errors are likely as a result of this change.

OK, this has nothing to do with Python version - you're using a new BitBake 
version with the OE classic metadata and the two are not compatible for the 
reason shown in the error - comments are no longer allowed within multi-line 
expressions.

There are three choices:

a) Switch back to an earlier version of BitBake (e.g. 1.12.x)
b) Move up to OE-Core [1]
c) Go through and fix all of these comments

Cheers,
Paul

[1] http://www.openembedded.org/wiki/OpenEmbedded-Core

-- 

Paul Eggleton
Intel Open Source Technology Centre


