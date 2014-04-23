Return-Path: <changhyeok.bae@lge.com>
Received: from lgemrelse6q.lge.com (LGEMRELSE6Q.lge.com [156.147.1.121])
	by mail.openembedded.org (Postfix) with ESMTP id 8CFEA65D71
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Apr 2014 23:45:18 +0000 (UTC)
Received: from unknown (HELO CHBae0915) (10.177.232.191)
	by 156.147.1.121 with ESMTP; 24 Apr 2014 08:45:18 +0900
X-Original-SENDERIP: 10.177.232.191
X-Original-MAILFROM: changhyeok.bae@lge.com
From: "Changhyeok Bae" <changhyeok.bae@lge.com>
To: "'Paul Eggleton'" <paul.eggleton@linux.intel.com>
References: <1398251928-6841-1-git-send-email-changhyeok.bae@lge.com>
	<1398251928-6841-2-git-send-email-changhyeok.bae@lge.com>
	<10136853.rufA1YCh4D@peggleto-mobl5.ger.corp.intel.com>
In-Reply-To: <10136853.rufA1YCh4D@peggleto-mobl5.ger.corp.intel.com>
Date: Thu, 24 Apr 2014 08:45:35 +0900
Message-ID: <007501cf5f4e$1f74a660$5e5df320$@lge.com>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 14.0
Thread-Index: AQKUhjvRjrRtWj6UivVHcYzCnB5QuAHnsrFPAY/DA2mZedOMEA==
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
X-List-Received-Date: Wed, 23 Apr 2014 23:45:22 -0000
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Language: ko

Hi,

1. There is space between the source and target in the value.
2. Sorry, I should remove the leading +.
    However, need to ignore these patches because of martin's comment.

-----Original Message-----
From: Paul Eggleton [mailto:paul.eggleton@linux.intel.com] 
Sent: Wednesday, April 23, 2014 11:37 PM
To: Changhyeok Bae
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] [meta-oe][PATCH 2/3] gpsd: Add mirror site

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
> b/meta-oe/recipes-navigation/gpsd/gpsd_3.7.bb index 97f3354..c1b7525 
> 100644
> --- a/meta-oe/recipes-navigation/gpsd/gpsd_3.7.bb
> +++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.7.bb
> @@ -22,6 +22,8 @@ SRC_URI =
> "http://download.savannah.gnu.org/releases/${PN}/${P}.tar.gz \ 
> SRC_URI[md5sum] = "52d9785eaf1a51298bb8900dbde88f98"
>  SRC_URI[sha256sum] =
> "7800c478ee9d7ca7a502b0f892828561b1fbf7bc69d9d38c447c82c3628302ac"
> 
> ++MIRRORS += "http://download.savannah.gnu.org/releases/
> http://download-mirror.savannah.gnu.org/releases/ \n" +  inherit scons 
> update-rc.d python-dir pythonnative systemd
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


