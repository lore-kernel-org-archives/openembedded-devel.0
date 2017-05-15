Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 30DAC71CBF
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 May 2017 12:00:38 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	15 May 2017 05:00:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,344,1491289200"; d="scan'208";a="100749795"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga005.jf.intel.com with ESMTP; 15 May 2017 05:00:38 -0700
To: "S. Lockwood-Childs" <sjl@vctlabs.com>,
	openembedded-devel@lists.openembedded.org
References: <20170513063415.GQ9767@vctlabs.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <4bbb34e6-8970-8b4e-7d2f-03d0b9a7b549@linux.intel.com>
Date: Mon, 15 May 2017 14:58:33 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20170513063415.GQ9767@vctlabs.com>
Subject: Re: meta-python: outrageously long cython shebang with pyro
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
X-List-Received-Date: Mon, 15 May 2017 12:00:45 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 05/13/2017 09:34 AM, S. Lockwood-Childs wrote:
> The cython recipe builds fine -- this is runtime breakage from recipes that
> depend on cython. This was always a danger when using lengthy toplevel
> directory names (e.g. as tends to happen in jenkins auto-builds), but
> now I managed to get the dreaded "bad interpreter: No such file or directory"
> failure from cython despite a not-ridiculously-long toplevel path:
>
> #!/var/data/sjl/poky/build/tmp/work/armv7a-neon-oe-linux-gnueabi/libplist/git-r0/recipe-sysroot-native/usr/bin/python-native/python

We typically patch the upstream code to use

#!/usr/bin/env python

There is some PATH environment variable magic that will ensure that the 
correct version of python will come first in the PATH, so it should be 
safe to do. There's a ton of examples in oe-core.


Alex


