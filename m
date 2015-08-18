Return-Path: <Maxin.John@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id 31F9660043
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Aug 2015 13:07:52 +0000 (UTC)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 18 Aug 2015 15:07:50 +0200
Received: by sestofb10.enea.se (Postfix, from userid 4454)	id 6D31928BA20;
	Tue, 18 Aug 2015 15:07:50 +0200 (CEST)
Date: Tue, 18 Aug 2015 15:07:50 +0200
From: "Maxin B. John" <maxin.john@enea.com>
To: <openembedded-devel@lists.openembedded.org>
Message-ID: <20150818130749.GB17448@sestofb10.enea.se>
References: <1439580922-32345-1-git-send-email-vinay.k.awasthi@intel.com>
MIME-Version: 1.0
In-Reply-To: <1439580922-32345-1-git-send-email-vinay.k.awasthi@intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Received-SPF: None (SESTOEX03.enea.se: maxin.john@enea.com does not
	designate permitted sender hosts)
Subject: Re: [meta-java][PATCH 2/2] Openjdk-8u: Added bootstrap JDK option
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
X-List-Received-Date: Tue, 18 Aug 2015 13:07:54 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Hi,

On Fri, Aug 14, 2015 at 12:35:22PM -0700, Vinay K. Awasthi wrote:
> From: "Vinay K. Awasthi" <vinay.k.awasthi@intel.com>
> 
> Added --with-boot-jdk option that allows icedtea7-native to be used as bootstrap jdk.
> 
> Signed-off-by: Vinay K. Awasthi <vinay.k.awasthi@intel.com>
> ---
>  recipes-core/openjdk/openjdk-8u_40b27-2.5.4.bb | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/recipes-core/openjdk/openjdk-8u_40b27-2.5.4.bb b/recipes-core/openjdk/openjdk-8u_40b27-2.5.4.bb
> index 594a6b4..c9af1a4 100644
> --- a/recipes-core/openjdk/openjdk-8u_40b27-2.5.4.bb
> +++ b/recipes-core/openjdk/openjdk-8u_40b27-2.5.4.bb
> @@ -179,6 +179,7 @@ OPENJDK_OECONF = " \
>       --mandir=/usr/share/man        \
>       --disable-headful              \
>       --with-sys-root=${STAGING_DIR_TARGET} \
> +     --with-boot-jdk=${STAGING_LIBDIR_JVM_NATIVE}/icedtea7-native \
>       CFLAGS="--sysroot=${STAGING_DIR_TARGET} " \
>       CXXFLAGS="--sysroot=${STAGING_DIR_TARGET} " \
>       LDFLAGS="--sysroot=${STAGING_DIR_TARGET} " \
> -- 

Also please squash this with the previous openjdk version-up patch and send it as a
single patch.

Best Regards,
Maxin



