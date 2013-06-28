Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 511756007C
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Jun 2013 10:50:50 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 28 Jun 2013 03:50:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,958,1363158000"; d="scan'208";a="361012562"
Received: from unknown (HELO helios.localnet) ([10.252.122.97])
	by orsmga002.jf.intel.com with ESMTP; 28 Jun 2013 03:50:50 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Date: Fri, 28 Jun 2013 11:50:49 +0100
Message-ID: <2693732.0LEd3dIQS8@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.3 (Linux/3.8.0-25-generic; KDE/4.10.3; i686; ; )
In-Reply-To: <702dd5ac09c4e06fcad0b1831217ea3416d6c764.1372213028.git.hongxu.jia@windriver.com>
References: <cover.1372213028.git.hongxu.jia@windriver.com>
	<702dd5ac09c4e06fcad0b1831217ea3416d6c764.1372213028.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 1/1] qt-x11-free: add missing DEPENDS on libglu for LSB Library Check
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
X-List-Received-Date: Fri, 28 Jun 2013 10:50:50 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Hongxu,

On Wednesday 26 June 2013 10:38:52 Hongxu Jia wrote:
> When libglu is missing in qt-x11-free's DEPENDS, the LSB 4.1 Library
> Check will fail:
> ...
> Checking library symbols (libqt-mt.so.3)
> Did not find _ZN10QGLContext10currentCtxE (unversioned) in libqt-mt.so.3
> Unmangled symbol name: QGLContext::currentCtx
> ...
> 
> [YOCTO #4016]
> 
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  recipes-qt3/qt3/qt-x11-free_3.3.7.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/recipes-qt3/qt3/qt-x11-free_3.3.7.bb
> b/recipes-qt3/qt3/qt-x11-free_3.3.7.bb index a67dd63..af4fc01 100644
> --- a/recipes-qt3/qt3/qt-x11-free_3.3.7.bb
> +++ b/recipes-qt3/qt3/qt-x11-free_3.3.7.bb
> @@ -1,4 +1,4 @@
> -DEPENDS = "qt-x11-free-native freetype virtual/libx11 libxmu libxft libxext
> libxrender libxrandr libxcursor  virtual/libgl" +DEPENDS =
> "qt-x11-free-native freetype virtual/libx11 libxmu libxft libxext
> libxrender libxrandr libxcursor  virtual/libgl libglu" PROVIDES = "qt3x11"
>  PR = "${INC_PR}.1"

Merged to meta-qt3, thanks.

I noticed we didn't actually specify in the README in meta-qt3 where patches 
should be sent, I have now fixed this. In future if you have any patches for 
this layer could you please send them to the yocto@yoctoproject.org mailing 
list.

Thanks,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

