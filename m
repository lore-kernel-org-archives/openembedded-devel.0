Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 341E565D03
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jun 2014 07:46:09 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 25 Jun 2014 00:46:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,544,1400050800"; d="scan'208";a="563070145"
Received: from unknown (HELO peggleto-mobl5.ger.corp.intel.com)
	([10.252.121.119])
	by orsmga002.jf.intel.com with ESMTP; 25 Jun 2014 00:45:57 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Anders Darander <anders@chargestorm.se>,
	Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 25 Jun 2014 08:45:55 +0100
Message-ID: <2430004.5QNcodJTid@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.12.5 (Linux/3.14.8-200.fc20.x86_64; KDE/4.12.5; x86_64; ; )
In-Reply-To: <1b5c27f39444bed435c8c050b2fb6def74a5adb8.1403596416.git.anders@chargestorm.se>
References: <cover.1403596416.git.anders@chargestorm.se>
	<1b5c27f39444bed435c8c050b2fb6def74a5adb8.1403596416.git.anders@chargestorm.se>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-webserver][PATCH 1/1] webmin: drop allarch
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
X-List-Received-Date: Wed, 25 Jun 2014 07:46:13 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 24 June 2014 09:54:12 Anders Darander wrote:
> * runtime dependencies are TUNE_PKGARCH causing do_package_write_*
>   task to have different signature for MACHINEs with different
>   TUNE_PKGARCH
> 
> Signed-off-by: Anders Darander <anders@chargestorm.se>
> ---
>  meta-webserver/recipes-webadmin/webmin/webmin_1.620.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-webserver/recipes-webadmin/webmin/webmin_1.620.bb
> b/meta-webserver/recipes-webadmin/webmin/webmin_1.620.bb index
> 7eb1d63..0f8781f 100644
> --- a/meta-webserver/recipes-webadmin/webmin/webmin_1.620.bb
> +++ b/meta-webserver/recipes-webadmin/webmin/webmin_1.620.bb
> @@ -20,7 +20,7 @@ SRC_URI =
> "${SOURCEFORGE_MIRROR}/webadmin/webmin-${PV}.tar.gz \ SRC_URI[md5sum] =
> "e93bc5057a5b7d7e31ecb2bb228d7044"
>  SRC_URI[sha256sum] =
> "3d36153406d8e5d3dcaeadba34dfb5cdbc4060b75c38339174ac97b2277f284b"
> 
> -inherit allarch perlnative update-rc.d
> +inherit perlnative update-rc.d
> 
>  do_configure() {
>      # Remove binaries and plugins for other platforms

So apart from me being reticent to make this change at all (for reasons that 
we've discussed before), there is another issue - allarch.bbclass does more 
than just setting PACKAGE_ARCH, it also disables certain other functionality 
such as debug symbol splitting which is superfluous for these kinds of recipes; 
in my testing when I originally wrote the webmin recipe this significantly 
reduced the time required to build the recipe. We can't just drop this inherit 
without regard to that. (I'm sure the same applies elsewhere, it's just that 
the size of webmin makes the impact significant.)

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

