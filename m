Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id A71816FF6B
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Mar 2016 12:46:43 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga101.fm.intel.com with ESMTP; 21 Mar 2016 05:46:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,372,1455004800"; d="scan'208";a="70366987"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga004.fm.intel.com with ESMTP; 21 Mar 2016 05:46:45 -0700
To: openembedded-devel@lists.openembedded.org
References: <1458166402-10786-1-git-send-email-schnitzeltony@googlemail.com>
	<51386.10.252.7.138.1458328003.squirrel@linux.intel.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <56EFEC56.3090406@linux.intel.com>
Date: Mon, 21 Mar 2016 14:43:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Icedove/38.6.0
MIME-Version: 1.0
In-Reply-To: <51386.10.252.7.138.1458328003.squirrel@linux.intel.com>
Subject: Re: [PATCH 1/2] gnome-bluetooth: fix compile
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
X-List-Received-Date: Mon, 21 Mar 2016 12:46:45 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 03/18/2016 09:06 PM, alexander.kanavin@linux.intel.com wrote:
>> fixes error series starting with
>> | Caught exception: <type 'exceptions.TypeError'> TypeError('expected a
>> string or other character buffer object',)
>> | >
>> /home/superandy/tmp/oe-core-glibc/sysroots/x86_64-linux/usr/lib/python2.7/distutils/sysconfig.py(22)<module>()
>> | -> PREFIX = os.path.normpath(sys.prefix).replace(
>> os.getenv("BUILD_SYS"), os.getenv("HOST_SYS") )
>
> Both this patch and the second one should be replaced with a patch that
> simply adds
>
> inherit gobject-introspection
>
> to the recipe. For some reason I forgot to do that in my g-i fixes patchset.

Martin, can you drop these patches from master-next please? Just want to 
make sure they don't make it to the master branch.


Alex


