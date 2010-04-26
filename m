Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1O6LUE-0004pT-MN for openembedded-devel@lists.openembedded.org;
	Mon, 26 Apr 2010 12:24:34 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1O6LQY-0001Jb-5j for openembedded-devel@lists.openembedded.org;
	Mon, 26 Apr 2010 12:20:34 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Apr 2010 12:20:34 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Apr 2010 12:20:34 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
connect(): No such file or directory
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 26 Apr 2010 12:20:20 +0200
Message-ID: <hr3pd4$akp$1@dough.gmane.org>
References: <1272274382-1983-1-git-send-email-mchazaux@adeneo-embedded.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.9) Gecko/20100412 Shredder/3.0.5pre
In-Reply-To: <1272274382-1983-1-git-send-email-mchazaux@adeneo-embedded.com>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] Add error handling to read_cache in stage-manager
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
X-List-Received-Date: Mon, 26 Apr 2010 10:24:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Looks good to me,

Acked-By: Koen Kooi <koen@openembedded.org>

On 26-04-10 11:33, Mickaël Chazaux wrote:
> Sometimes stage-manager crashes with this message :
> Traceback (most recent call last):
>  File "/home/mchazaux/projet/OE/openembedded/recipes/stage-manager/files/stage-manager",
> line 79, in <module>
>    cache = read_cache(options.cachefile)
>  File "/home/mchazaux/projet/OE/openembedded/recipes/stage-manager/files/stage-manager",
> line 34, in read_cache
>    cache[data[0]]['ts'] = int(data[1])
> IndexError: list index out of range
> 
> This is due to a corrupted cache file. This patch adds an error message
> telling the cause of the crash to the user.
> ---
>  recipes/stage-manager/files/stage-manager          |   14 +++++++++-----
>  recipes/stage-manager/stagemanager-native_0.0.1.bb |    2 +-
>  2 files changed, 10 insertions(+), 6 deletions(-)
> 
> diff --git a/recipes/stage-manager/files/stage-manager b/recipes/stage-manager/files/stage-manager
> index 536d1af..93196ff 100755
> --- a/recipes/stage-manager/files/stage-manager
> +++ b/recipes/stage-manager/files/stage-manager
> @@ -29,11 +29,15 @@ def read_cache(cachefile):
>      lines = f.readlines()
>      f.close()
>      for l in lines:
> -        data = l.split('|')
> -        cache[data[0]] = {}
> -        cache[data[0]]['ts'] = int(data[1])
> -        cache[data[0]]['size'] = int(data[2])
> -        cache[data[0]]['seen'] = False
> +	try:
> +            data = l.split('|')
> +            d = cache[data[0]] = {}
> +            d['ts'] = int(data[1])
> +            d['size'] = int(data[2])
> +            d['seen'] = False
> +	except IndexError, e:
> +            print("Corrupted line in cachefile " + cachefile + " : " + l)
> +	    raise e
>      return cache
>  
>  def mkdirhier(dir):
> diff --git a/recipes/stage-manager/stagemanager-native_0.0.1.bb b/recipes/stage-manager/stagemanager-native_0.0.1.bb
> index 5708045..4357517 100644
> --- a/recipes/stage-manager/stagemanager-native_0.0.1.bb
> +++ b/recipes/stage-manager/stagemanager-native_0.0.1.bb
> @@ -1,5 +1,5 @@
>  DESCRIPTION = "Helper script for packaged-staging.bbclass"
> -PR = "r11"
> +PR = "r13"
>  
>  SRC_URI = "file://stage-manager \
>             file://stage-manager-ipkg \

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFL1WjkMkyGM64RGpERAt8oAJ9mwOyDvMIdKcnwwwT+FKNCf+96SACgm+DY
c1xLNKOJQXZjZurAa6nNGiU=
=QDGW
-----END PGP SIGNATURE-----



