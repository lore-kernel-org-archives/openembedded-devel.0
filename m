Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 88B44734B8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Aug 2015 10:57:38 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 26 Aug 2015 03:57:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,415,1437462000"; d="scan'208";a="791208239"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.143])
	([10.237.68.143])
	by orsmga002.jf.intel.com with ESMTP; 26 Aug 2015 03:57:37 -0700
Message-ID: <55DD9BFE.6050807@linux.intel.com>
Date: Wed, 26 Aug 2015 13:59:10 +0300
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.7.0
MIME-Version: 1.0
To: Tanu Kaskinen <tanuk@iki.fi>, 
 openembedded-devel@lists.openembedded.org
References: <1440583622-11664-1-git-send-email-alexander.kanavin@linux.intel.com>
	<1440585604.1644.17.camel@iki.fi>
In-Reply-To: <1440585604.1644.17.camel@iki.fi>
Subject: Re: [PATCH 1/3] libnotify3: remove the recipe
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
X-List-Received-Date: Wed, 26 Aug 2015 10:57:38 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/26/2015 01:40 PM, Tanu Kaskinen wrote:
>>   # needs libnotify3 which conflicts with libnotify, mixing them in build breaks couple of packages
>
>
> This last comment seems to be out of date after this patch.

Actually, this whole thing can be removed:

# needs libnotify3 which conflicts with libnotify, mixing them in build 
breaks couple of packages
EXCLUDE_FROM_WORLD = "1"

Whoever applies this patch, please amend it accordingly.


Alex



