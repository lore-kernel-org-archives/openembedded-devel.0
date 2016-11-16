Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 1254E719B4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Nov 2016 15:28:27 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga103.jf.intel.com with ESMTP; 16 Nov 2016 07:27:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,500,1473145200"; d="scan'208";a="902104961"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 16 Nov 2016 07:27:58 -0800
To: openembedded-devel@lists.openembedded.org
References: <20161116102307.7678-1-thilo.cestonaro@ts.fujitsu.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <e098613f-6906-c91c-41cf-721df6a03f49@linux.intel.com>
Date: Wed, 16 Nov 2016 17:27:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <20161116102307.7678-1-thilo.cestonaro@ts.fujitsu.com>
Subject: Re: [meta-oe][PATCH] libdbus-c++: added recipe for it
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
X-List-Received-Date: Wed, 16 Nov 2016 15:28:29 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 11/16/2016 12:23 PM, Thilo Cestonaro wrote:
> to fix the build, two patches where needed.
>
> One which just adds an include of unistd.h, as the functions pipe, write and
> close defined by this include, weren't defined.
>
> The other patch enables the build to build the tools of libdbus-c++ for the
> target, which, without the patch, will always be build for the host, even when
> cross compiling.

You need to include this information on top of the patch files 
themselves. So that when people look at the patches, they can 
immediately see what they are for, without digging through commit 
history. And also patches are still missing Upstream-Status, and 
Signed-off-by lines (I asked you about it earlier). Have a look at any 
other recipe patch in oe-core to see how it should look like.

Do read http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines 
please.

Alex


