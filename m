Return-Path: <maxin.john@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 6C8257719D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Aug 2016 13:08:25 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga104.fm.intel.com with ESMTP; 12 Aug 2016 06:08:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,510,1464678000"; d="scan'208";a="864322826"
Received: from mbabyjoh-desk.fi.intel.com (HELO
	mbabyjoh-desk.ger.corp.intel.com) ([10.237.72.71])
	by orsmga003.jf.intel.com with ESMTP; 12 Aug 2016 06:08:25 -0700
Date: Fri, 12 Aug 2016 16:09:37 +0300
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160812130937.GB28597@mbabyjoh-desk.ger.corp.intel.com>
References: <1470727937-18826-1-git-send-email-erkka.kaaria@intel.com>
MIME-Version: 1.0
In-Reply-To: <1470727937-18826-1-git-send-email-erkka.kaaria@intel.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-java][PATCH] openjdk-8: Upgrade from u72 to u102y
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
X-List-Received-Date: Fri, 12 Aug 2016 13:08:26 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Erkka,

On Tue, Aug 09, 2016 at 10:32:17AM +0300, Erkka K‰‰ri‰ wrote:
> Openjdk is upgraded from u72 to u102. Two patches are dropped, as these
> were backports and the fixes are present in the current version. One
> patch was refreshed. One patch was backported from the upcoming u112 to
> fix a zero mode crash.
> 
> Signed-off-by: Erkka K‰‰ri‰ <erkka.kaaria@intel.com>
> ---
>  recipes-core/openjdk/openjdk-8-native_102b14.bb    |    2 +
>  recipes-core/openjdk/openjdk-8-native_72b05.bb     |    2 -
>  ...ease-72b05.inc => openjdk-8-release-102b14.inc} |   51 +-
>  .../{openjdk-8_72b05.bb => openjdk-8_102b14.bb}    |    4 +-
>  .../{openjre-8_72b05.bb => openjre-8_102b14.bb}    |    4 +-
>  .../openjdk8-avoid-early-ldflags-expansion.patch   |   53 -
>  .../openjdk8-fix-shark-stdc++11.patch              | 2623 ++++++++++----------
>  .../openjdk8-fix-zero-mode-crash.patch             |   49 +
>  ..._than_returning_address_of_local_variable.patch |   23 -
<snip>

openjdk-8 build fails with the following error now:

| /media/poky/build/tmp/work/core2-64-poky-linux/openjdk-8/102b14-r0/jdk8u-bf0932d3e0f8/hotspot/src/os/linux/vm/os_linux.inline.hpp:127:42: error: 'int readdir_r(DIR*, dirent*, dirent**)' is deprecated [-Werror=deprecated-declarations]
|    if((status = ::readdir_r(dirp, dbuf, &p)) != 0) {
|                                           ^
| In file included from /media/poky/build/tmp/work/core2-64-poky-linux/openjdk-8/102b14-r0/jdk8u-bf0932d3e0f8/hotspot/src/os/linux/vm/jvm_linux.h:44:0,
|                  from /media/poky/build/tmp/work/core2-64-poky-linux/openjdk-8/102b14-r0/jdk8u-bf0932d3e0f8/hotspot/src/share/vm/prims/jvm.h:30,
|                  from /media/poky/build/tmp/work/core2-64-poky-linux/openjdk-8/102b14-r0/jdk8u-bf0932d3e0f8/hotspot/src/share/vm/utilities/debug.hpp:29,
|                  from /media/poky/build/tmp/work/core2-64-poky-linux/openjdk-8/102b14-r0/jdk8u-bf0932d3e0f8/hotspot/src/share/vm/runtime/globals.hpp:28,
|                  from /media/poky/build/tmp/work/core2-64-poky-linux/openjdk-8/102b14-r0/jdk8u-bf0932d3e0f8/hotspot/src/share/vm/memory/allocation.hpp:28,
|                  from /media/poky/build/tmp/work/core2-64-poky-linux/openjdk-8/102b14-r0/jdk8u-bf0932d3e0f8/hotspot/src/share/vm/memory/iterator.hpp:28,
|                  from /media/poky/build/tmp/work/core2-64-poky-linux/openjdk-8/102b14-r0/jdk8u-bf0932d3e0f8/hotspot/src/share/vm/memory/genOopClosures.hpp:28,
|                  from /media/poky/build/tmp/work/core2-64-poky-linux/openjdk-8/102b14-r0/jdk8u-bf0932d3e0f8/hotspot/src/share/vm/oops/klass.hpp:28,
|                  from /media/poky/build/tmp/work/core2-64-poky-linux/openjdk-8/102b14-r0/jdk8u-bf0932d3e0f8/hotspot/src/share/vm/runtime/handles.hpp:28,
|                  from /media/poky/build/tmp/work/core2-64-poky-linux/openjdk-8/102b14-r0/jdk8u-bf0932d3e0f8/hotspot/src/share/vm/memory/universe.hpp:28,
|                  from /media/poky/build/tmp/work/core2-64-poky-linux/openjdk-8/102b14-r0/jdk8u-bf0932d3e0f8/hotspot/src/share/vm/code/oopRecorder.hpp:28,
|                  from /media/poky/build/tmp/work/core2-64-poky-linux/openjdk-8/102b14-r0/jdk8u-bf0932d3e0f8/hotspot/src/share/vm/asm/codeBuffer.hpp:28,
|                  from /media/poky/build/tmp/work/core2-64-poky-linux/openjdk-8/102b14-r0/jdk8u-bf0932d3e0f8/hotspot/src/share/vm/code/codeBlob.hpp:28,
|                  from /media/poky/build/tmp/work/core2-64-poky-linux/openjdk-8/102b14-r0/jdk8u-bf0932d3e0f8/hotspot/src/share/vm/code/nmethod.hpp:28,
|                  from /media/poky/build/tmp/work/core2-64-poky-linux/openjdk-8/102b14-r0/jdk8u-bf0932d3e0f8/hotspot/src/share/vm/runtime/simpleThresholdPolicy.hpp:28,
|                  from /media/poky/build/tmp/work/core2-64-poky-linux/openjdk-8/102b14-r0/jdk8u-bf0932d3e0f8/hotspot/src/share/vm/runtime/advancedThresholdPolicy.hpp:28,
|                  from /media/poky/build/tmp/work/core2-64-poky-linux/openjdk-8/102b14-r0/jdk8u-bf0932d3e0f8/hotspot/src/share/vm/runtime/advancedThresholdPolicy.cpp:26:
| /media/poky/build/tmp/sysroots/qemux86-64/usr/include/dirent.h:183:12: note: declared here
|  extern int readdir_r (DIR *__restrict __dirp,
|             ^~~~~~~~~
| cc1plus: all warnings being treated as errors

Best Regards,
Maxin

