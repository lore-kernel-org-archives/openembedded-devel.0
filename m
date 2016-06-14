Return-Path: <ray.kinsella@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 65CA660111
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Jun 2016 14:26:17 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga102.jf.intel.com with ESMTP; 14 Jun 2016 07:26:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,470,1459839600"; d="scan'208";a="718885672"
Received: from rkinsell-mobl.ger.corp.intel.com (HELO [10.237.220.97])
	([10.237.220.97])
	by FMSMGA003.fm.intel.com with ESMTP; 14 Jun 2016 07:26:17 -0700
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>, martin.jansa@gmail.com
References: <1462542559-10941-1-git-send-email-ray.kinsella@intel.com>
From: "Kinsella, Ray" <ray.kinsella@intel.com>
Message-ID: <3b5ca19a-01b1-9c67-0736-21fd7163c1da@intel.com>
Date: Tue, 14 Jun 2016 15:26:16 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64; rv:45.0) Gecko/20100101
	Thunderbird/45.1.1
MIME-Version: 1.0
In-Reply-To: <1462542559-10941-1-git-send-email-ray.kinsella@intel.com>
Subject: Re: [meta-oe][PATCH] wvstreams: fixing segfault with new gcc optimizations
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
X-List-Received-Date: Tue, 14 Jun 2016 14:26:20 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Hi Martin,

What should I do to progress this?

Ray K

On 06/05/2016 14:49, Kinsella, Ray wrote:
> Recent GCC optimizations -ftree-dce and -foptimize-sibling-calls are causing
> a segfault in the wvstream stackmaster. Fedora had the same problem and
> resolved the issue by removing these optimizations.
>
> See: https://bugzilla.redhat.com/show_bug.cgi?id=812651
>
> Signed-off-by: Ray Kinsella <ray.kinsella@intel.com>
> ---
>  meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb b/meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb
> index 73cfb03..6199a2f 100644
> --- a/meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb
> +++ b/meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb
> @@ -20,6 +20,8 @@ inherit autotools-brokensep pkgconfig
>
>  PARALLEL_MAKE = ""
>
> +TARGET_CFLAGS_append = " -fno-tree-dce -fno-optimize-sibling-calls"
> +
>  LDFLAGS_append = " -Wl,-rpath-link,${CROSS_DIR}/${TARGET_SYS}/lib"
>
>  EXTRA_OECONF = " --without-tcl --without-qt --without-pam --without-valgrind"
>

