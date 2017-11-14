Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 4B98E78532
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Nov 2017 12:36:23 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	14 Nov 2017 04:36:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,393,1505804400"; 
   d="scan'208";a="7464870"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga002.jf.intel.com with ESMTP; 14 Nov 2017 04:36:23 -0800
To: Martin Kelly <mkelly@xevo.com>, openembedded-devel@lists.openembedded.org
References: <20171113192711.12926-1-mkelly@xevo.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <ed834096-8445-261d-3989-d97746c53ddc@linux.intel.com>
Date: Tue, 14 Nov 2017 14:36:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <20171113192711.12926-1-mkelly@xevo.com>
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
X-List-Received-Date: Tue, 14 Nov 2017 12:36:23 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 11/13/2017 09:27 PM, Martin Kelly wrote:
> Although the meson crossfile should take care of setting the right cross
> environment for a target build, meson slurps any set CFLAGS, CXXFLAGS,
> LDFLAGS, and CPPFLAGS from the environment and injects them into the
> build (see mesonbuild/environment.py:get_args_from_envvars for details).
> 
> This means that we are seeing native CFLAGS, CXXFLAGS, LDFLAGS, and
> CPPFLAGS in the target build, which is wrong and causes build failures
> when target and native have libraries in common (the linker gets
> confused and bails).
> 
> That said, we *do* need to set certain vars for all builds so that meson
> can find the right build tools. Without this, meson will fail during its
> sanity checking step because it will determine the build tools to be
> unrunnable since they output target instead of native artifacts.
> 
> The solution to all of this is to set CC, CXX, LD, and AR globally to
> the native tools while setting the other native vars *only* for the
> native build. For target builds, these vars will get overridden by the
> cross file as we expect.

Hello Martin,

meson support will land in oe-core shortly (and will be removed from 
meta-oe), so can you please check if my patchset is doing the right thing?
http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=akanavin/meson

Alex

