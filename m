Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 9793378524
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Nov 2017 10:05:30 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	15 Nov 2017 02:05:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,398,1505804400"; 
   d="scan'208";a="5181254"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 15 Nov 2017 02:05:30 -0800
To: Martin Kelly <mkelly@xevo.com>, openembedded-devel@lists.openembedded.org
References: <20171113192711.12926-1-mkelly@xevo.com>
	<ed834096-8445-261d-3989-d97746c53ddc@linux.intel.com>
	<a07f0309-e598-0188-58a6-8592fdf036a0@xevo.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <4f3b5824-0625-ad62-95fa-8b1fae4a9c24@linux.intel.com>
Date: Wed, 15 Nov 2017 12:05:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <a07f0309-e598-0188-58a6-8592fdf036a0@xevo.com>
Subject: Re: [meta-oe][PATCH] meson: export native env only for native build
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
X-List-Received-Date: Wed, 15 Nov 2017 10:05:30 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 11/14/2017 08:23 PM, Martin Kelly wrote:

> For native builds:
> - Keep the defaults (which use native tools), but export 
> PKG_CONFIG=pkg-config-native instead of pkg-config.
> 
> For target builds:
> - Set CC, CXX, LD, and AR, but *not* CFLAGS, CXXFLAGS, LDFLAGS etc. We 
> need CC, CXX etc. so meson finds the native tools for its build sanity 
> tests, but we don't want to set the flags, as meson will slurp them in 
> and apply them to the cross build. Note that even though we set CC, etc. 
> meson will correctly override them in the cross file for the actual 
> target build.

Thanks for looking - can you make a patch for these things against my 
branch in poky-contrib, and send it to oe-core list? I will send the 
patchset any day now, and there will be a corresponding patch to remove 
meson recipe and class from meta-oe. So now is the good point to have it 
all fixed so that the transition is smooth.


Alex

