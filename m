Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 62AA260E07
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Apr 2014 14:37:00 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 23 Apr 2014 07:37:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,912,1389772800"; d="scan'208";a="422529983"
Received: from unknown (HELO peggleto-mobl5.ger.corp.intel.com)
	([10.252.121.203])
	by azsmga001.ch.intel.com with ESMTP; 23 Apr 2014 07:36:59 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Changhyeok Bae <changhyeok.bae@lge.com>
Date: Wed, 23 Apr 2014 15:36:58 +0100
Message-ID: <10136853.rufA1YCh4D@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.12.4 (Linux/3.13.9-200.fc20.x86_64; KDE/4.12.4; x86_64; ; )
In-Reply-To: <1398251928-6841-2-git-send-email-changhyeok.bae@lge.com>
References: <1398251928-6841-1-git-send-email-changhyeok.bae@lge.com>
	<1398251928-6841-2-git-send-email-changhyeok.bae@lge.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH 2/3] gpsd: Add mirror site
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
X-List-Received-Date: Wed, 23 Apr 2014 14:37:02 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi there,

On Wednesday 23 April 2014 20:18:47 Changhyeok Bae wrote:
> * The SRC_URI is not accessible.
>   So need to add mirror site referred by the original site.
> * The problem is that
>   http://download.savannah.nongnu.org/releases redirects to closest mirror
>   and few mirrors (e.g. .jp) weren't working correctly while
>   http://download-mirror.savannah.gnu.org/releases/ seems to be reliable.
> 
> Signed-off-by: Changhyeok Bae <changhyeok.bae@lge.com>
> ---
>  meta-oe/recipes-navigation/gpsd/gpsd_3.7.bb |    2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.7.bb
> b/meta-oe/recipes-navigation/gpsd/gpsd_3.7.bb index 97f3354..c1b7525 100644
> --- a/meta-oe/recipes-navigation/gpsd/gpsd_3.7.bb
> +++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.7.bb
> @@ -22,6 +22,8 @@ SRC_URI =
> "http://download.savannah.gnu.org/releases/${PN}/${P}.tar.gz \
> SRC_URI[md5sum] = "52d9785eaf1a51298bb8900dbde88f98"
>  SRC_URI[sha256sum] =
> "7800c478ee9d7ca7a502b0f892828561b1fbf7bc69d9d38c447c82c3628302ac"
> 
> ++MIRRORS += "http://download.savannah.gnu.org/releases/
> http://download-mirror.savannah.gnu.org/releases/ \n" +
>  inherit scons update-rc.d python-dir pythonnative systemd
> 
>  INITSCRIPT_NAME = "gpsd"

Sorry, but did you test these patches? For all three there seems to be no 
space between the source and target in the MIRROR value, and this one has an 
additional leading + that should not be there.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

