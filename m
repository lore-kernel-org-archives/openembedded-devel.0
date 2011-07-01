Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Qcalq-0006r6-L8 for openembedded-devel@lists.openembedded.org;
	Fri, 01 Jul 2011 12:16:22 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QcaiC-000106-Dy for openembedded-devel@lists.openembedded.org;
	Fri, 01 Jul 2011 12:12:36 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Jul 2011 12:12:36 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 01 Jul 2011 12:12:36 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Fri, 01 Jul 2011 12:12:25 +0200
Message-ID: <iuk6i9$b9t$1@dough.gmane.org>
References: <1309514330-26705-1-git-send-email-anders@chargestorm.se>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <1309514330-26705-1-git-send-email-anders@chargestorm.se>
X-Enigmail-Version: 1.0.1
Subject: Re: [meta-oe][PATCH] tzcode: Update tzdata version.
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
X-List-Received-Date: Fri, 01 Jul 2011 10:16:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Ah, the joys of tzdata. Applied!

On 01-07-11 11:58, Anders Darander wrote:
> Signed-off-by: Anders Darander <anders@chargestorm.se>
> ---
>  .../recipes-extended/tzcode/tzcode-native_2011g.bb |    8 ++++----
>  1 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/meta-oe/recipes-extended/tzcode/tzcode-native_2011g.bb b/meta-oe/recipes-extended/tzcode/tzcode-native_2011g.bb
> index d32ee33..651d1dd 100644
> --- a/meta-oe/recipes-extended/tzcode/tzcode-native_2011g.bb
> +++ b/meta-oe/recipes-extended/tzcode/tzcode-native_2011g.bb
> @@ -9,12 +9,12 @@ LIC_FILES_CHKSUM = "file://README;md5=3ae8198f82258417ce29066d3b034035"
>  # Also, tzdata (and it is needed to build tzcode) version can differ from
>  # tzcode version, thus this variable
>  
> -TZDATA_PV = "${PV}"
> +TZDATA_PV = "2011h"
>  
> -PR = "${INC_PR}.0"
> +PR = "${INC_PR}.1"
>  
>  SRC_URI[tzcode-2011g.md5sum] = "ecb564279b28c5b184421c525d997d6c"
>  SRC_URI[tzcode-2011g.sha256sum] = "636c735d8df1276cc8ab88bc31bb36a21f91ed34e26d181303ecd8fe48021bc2"
> -SRC_URI[tzdata-2011g.md5sum] = "a068c27e7e426fdb12ab0c88506df20d"
> -SRC_URI[tzdata-2011g.sha256sum] = "01a2a189eeda63baacc5e68e6c13afffc7edce182102fffc53acbf35e8703d3c"
> +SRC_URI[tzdata-2011h.md5sum] = "546d27b6c1e5e1097bd512651815017f"
> +SRC_URI[tzdata-2011h.sha256sum] = "c098786d053736dd18d4f1fbebdf41554c6fd702a36f75c18f1c66712d2abc24"
>  

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFODZ2JMkyGM64RGpERAo/2AJwPs4772fZ+UKJolUgeMaJRZx2PrgCfbZxu
mKjmm2oFOOSNh4VNmO1htNU=
=tnUK
-----END PGP SIGNATURE-----



