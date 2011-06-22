Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QZK3p-0003qT-M5 for openembedded-devel@lists.openembedded.org;
	Wed, 22 Jun 2011 11:49:25 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QZJip-0002lC-Lg for openembedded-devel@lists.openembedded.org;
	Wed, 22 Jun 2011 11:27:43 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jun 2011 11:27:43 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jun 2011 11:27:43 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 22 Jun 2011 11:27:27 +0200
Message-ID: <itschv$hfs$1@dough.gmane.org>
References: <1308733994-3571-1-git-send-email-paul.eggleton@linux.intel.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <1308733994-3571-1-git-send-email-paul.eggleton@linux.intel.com>
X-Enigmail-Version: 1.0.1
Subject: Re: [PATCH] classes/native*.bbclass: fix error during parse with bitbake master
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
X-List-Received-Date: Wed, 22 Jun 2011 09:49:25 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 22-06-11 11:13, Paul Eggleton wrote:
> Fixes "AttributeError: 'NoneType' object has no attribute 'split'" during
> parsing with bitbake master. We should not be calling explode_deps with
> None as the argument, so check for that before calling it.
> 
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>

Looks good to me:

Acked-by: Koen Kooi <koen@dominion.thruhere.net>


> ---
>  classes/native.bbclass    |    5 ++++-
>  classes/nativesdk.bbclass |    5 ++++-
>  2 files changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/classes/native.bbclass b/classes/native.bbclass
> index 1e7a6ec..e9d48a3 100644
> --- a/classes/native.bbclass
> +++ b/classes/native.bbclass
> @@ -116,7 +116,10 @@ python __anonymous () {
>      if "native" in (bb.data.getVar('BBCLASSEXTEND', d, True) or ""):
>          pn = bb.data.getVar("PN", d, True)
>          depends = bb.data.getVar("DEPENDS_virtclass-native", d, True)
> -        deps = bb.utils.explode_deps(depends)
> +        if depends:
> +            deps = bb.utils.explode_deps(depends)
> +        else:
> +            deps = []
>          newdeps = []
>          for dep in deps:
>              if dep.endswith("-cross"):
> diff --git a/classes/nativesdk.bbclass b/classes/nativesdk.bbclass
> index 6689399..7a8f385 100644
> --- a/classes/nativesdk.bbclass
> +++ b/classes/nativesdk.bbclass
> @@ -59,7 +59,10 @@ OVERRIDES =. "virtclass-nativesdk:"
>  python __anonymous () {
>      pn = bb.data.getVar("PN", d, True)
>      depends = bb.data.getVar("DEPENDS_virtclass-nativesdk", d, True)
> -    deps = bb.utils.explode_deps(depends)
> +    if depends:
> +        deps = bb.utils.explode_deps(depends)
> +    else:
> +        deps = []
>      newdeps = []
>      for dep in deps:
>          if dep.endswith("-native") or dep.endswith("-cross"):

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFOAbV/MkyGM64RGpERAmpPAJ9OxqPqnYkcACLshJHBf2B2ta1FQgCfRadV
O+QuQwiB6rHxDcDeUkwydew=
=fWJI
-----END PGP SIGNATURE-----



