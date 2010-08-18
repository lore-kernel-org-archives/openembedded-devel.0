Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1OlXFW-0003X5-DG
	for openembedded-devel@lists.openembedded.org;
	Wed, 18 Aug 2010 03:15:28 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1OlXF7-00039n-Gi from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 Aug 2010 18:15:01 -0700
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Tue, 17 Aug 2010 18:15:01 -0700
Received: from [172.30.80.170] ([172.30.80.170]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Tue, 17 Aug 2010 19:14:59 -0600
Message-ID: <4C6B3412.7000700@mentor.com>
Date: Tue, 17 Aug 2010 18:14:58 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Thunderbird 2.0.0.24 (X11/20100411)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1282072782-11487-1-git-send-email-jkridner@beagleboard.org>
In-Reply-To: <1282072782-11487-1-git-send-email-jkridner@beagleboard.org>
X-OriginalArrivalTime: 18 Aug 2010 01:15:00.0138 (UTC)
	FILETIME=[C75150A0:01CB3E72]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] quilt: disable packaged staging on native builds
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 18 Aug 2010 01:15:28 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Jason Kridner wrote:
> Signed-off-by: Jason Kridner <jkridner@beagleboard.org>
> ---
>  recipes/quilt/quilt-native.inc |    3 +++
>  recipes/quilt/quilt_0.48.bb    |    2 +-
>  2 files changed, 4 insertions(+), 1 deletions(-)
> 
> diff --git a/recipes/quilt/quilt-native.inc b/recipes/quilt/quilt-native.inc
> index 10d8183..f422b63 100644
> --- a/recipes/quilt/quilt-native.inc
> +++ b/recipes/quilt/quilt-native.inc
> @@ -6,6 +6,9 @@ RDEPENDS_${PN} = "diffstat-native patch-native bzip2-native util-linux-native"
>  FILESPATHPKG =. quilt-${PV}
>  INHIBIT_AUTOTOOLS_DEPS = "1"
>  
> +# Several packages fail to patch when using quilt from packaged staging
> +PSTAGING_DISABLED_virtclass-native = "1"
> +
>  inherit autotools native
>  
>  PATCHTOOL = "patch"
> diff --git a/recipes/quilt/quilt_0.48.bb b/recipes/quilt/quilt_0.48.bb
> index 0a066df..99dc2a2 100644
> --- a/recipes/quilt/quilt_0.48.bb
> +++ b/recipes/quilt/quilt_0.48.bb
> @@ -1,6 +1,6 @@
>  require quilt-package.inc
>  
> -PR="r1"
> +PR="r2"
>  
>  SRC_URI[md5sum] = "f77adda60039ffa753f3c584a286f12b"
>  SRC_URI[sha256sum] = "73fd760d3b5cbf06417576591dc37d67380d189392db9000c21b7cbebee49ffc"

After some poking, testing and what I pushed recently, NAK.  What's 
going on here is that we didn't have a real non-legacy staging.  As seen 
in quilt-package.inc, the normal autotools install rules don't move the 
install around for us, so we ended up with, in some cases (No, I can't 
explain why off the top of my head, but yes, I've seen both what Jason 
saw and what Frans saw in the past) empty pstaging packages, which means 
no quilt, and a certain failure to apply patches.  To Chris' concern, 
I've gotten past the point of a patch being applied with quilt-native 
from pstaging from a TMPDIR named differently than what I extracted 
pstaging into.

-- 
Tom Rini
Mentor Graphics Corporation



