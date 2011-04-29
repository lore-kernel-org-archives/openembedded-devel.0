Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QFhdz-0000Mr-UB for openembedded-devel@lists.openembedded.org;
	Fri, 29 Apr 2011 08:57:40 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QFhbW-0006TA-4s for openembedded-devel@lists.openembedded.org;
	Fri, 29 Apr 2011 08:55:06 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Apr 2011 08:55:06 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Apr 2011 08:55:06 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Fri, 29 Apr 2011 08:50:44 +0200
Message-ID: <ipdn44$d51$2@dough.gmane.org>
References: <1304035036-10111-1-git-send-email-raj.khem@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <1304035036-10111-1-git-send-email-raj.khem@gmail.com>
X-Enigmail-Version: 1.0.1
Subject: Re: [meta-oe][PATCH] tzdata, tzcode: Update 2011e -> 2011g
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
X-List-Received-Date: Fri, 29 Apr 2011 06:57:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 29-04-11 01:57, raj.khem@gmail.com wrote:
> From: Khem Raj <raj.khem@gmail.com>
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

Thanks, applied.

> ---
>  ...code-native_2011e.bb => tzcode-native_2011g.bb} |   11 ++++++-----
>  .../tzdata/{tzdata_2011e.bb => tzdata_2011g.bb}    |    5 ++---
>  2 files changed, 8 insertions(+), 8 deletions(-)
>  rename meta-oe/recipes-extended/tzcode/{tzcode-native_2011e.bb => tzcode-native_2011g.bb} (56%)
>  rename meta-oe/recipes-extended/tzdata/{tzdata_2011e.bb => tzdata_2011g.bb} (71%)
> 
> diff --git a/meta-oe/recipes-extended/tzcode/tzcode-native_2011e.bb b/meta-oe/recipes-extended/tzcode/tzcode-native_2011g.bb
> similarity index 56%
> rename from meta-oe/recipes-extended/tzcode/tzcode-native_2011e.bb
> rename to meta-oe/recipes-extended/tzcode/tzcode-native_2011g.bb
> index 280840c..d32ee33 100644
> --- a/meta-oe/recipes-extended/tzcode/tzcode-native_2011e.bb
> +++ b/meta-oe/recipes-extended/tzcode/tzcode-native_2011g.bb
> @@ -9,11 +9,12 @@ LIC_FILES_CHKSUM = "file://README;md5=3ae8198f82258417ce29066d3b034035"
>  # Also, tzdata (and it is needed to build tzcode) version can differ from
>  # tzcode version, thus this variable
>  
> -TZDATA_PV = "2011e"
> +TZDATA_PV = "${PV}"
>  
>  PR = "${INC_PR}.0"
>  
> -SRC_URI[tzcode-2011e.md5sum] = "fbfc05dbf9ebcfe7c4bba18549870173"
> -SRC_URI[tzcode-2011e.sha256sum] = "8fb00f8763aa51d83d6f3190d144124bb7176ca829fc08823d6205297bf0426b"
> -SRC_URI[tzdata-2011e.md5sum] = "044a07072300a0ee72b046e5a9a4ec90"
> -SRC_URI[tzdata-2011e.sha256sum] = "44fef01de4589a4979eb6b5fdbbfd21a3b135852af1ecbfb9e0368ae47392c79"
> +SRC_URI[tzcode-2011g.md5sum] = "ecb564279b28c5b184421c525d997d6c"
> +SRC_URI[tzcode-2011g.sha256sum] = "636c735d8df1276cc8ab88bc31bb36a21f91ed34e26d181303ecd8fe48021bc2"
> +SRC_URI[tzdata-2011g.md5sum] = "a068c27e7e426fdb12ab0c88506df20d"
> +SRC_URI[tzdata-2011g.sha256sum] = "01a2a189eeda63baacc5e68e6c13afffc7edce182102fffc53acbf35e8703d3c"
> +
> diff --git a/meta-oe/recipes-extended/tzdata/tzdata_2011e.bb b/meta-oe/recipes-extended/tzdata/tzdata_2011g.bb
> similarity index 71%
> rename from meta-oe/recipes-extended/tzdata/tzdata_2011e.bb
> rename to meta-oe/recipes-extended/tzdata/tzdata_2011g.bb
> index c0f5291..6863b5a 100644
> --- a/meta-oe/recipes-extended/tzdata/tzdata_2011e.bb
> +++ b/meta-oe/recipes-extended/tzdata/tzdata_2011g.bb
> @@ -8,6 +8,5 @@ LIC_FILES_CHKSUM = "file://asia;beginline=2;endline=3;md5=06468c0e84ef4d4c97045a
>  # just bump it to the latest available version, removing the old one
>  
>  PR = "${INC_PR}.0"
> -
> -SRC_URI[md5sum] = "044a07072300a0ee72b046e5a9a4ec90"
> -SRC_URI[sha256sum] = "44fef01de4589a4979eb6b5fdbbfd21a3b135852af1ecbfb9e0368ae47392c79"
> +SRC_URI[md5sum] = "a068c27e7e426fdb12ab0c88506df20d"
> +SRC_URI[sha256sum] = "01a2a189eeda63baacc5e68e6c13afffc7edce182102fffc53acbf35e8703d3c"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNul/EMkyGM64RGpERAk+aAKC2MKtOS+13X6kQYcR96G81MhB3pACgjIXF
p+OGI7P8ts1J0TqAAGAc6xs=
=+bqg
-----END PGP SIGNATURE-----



