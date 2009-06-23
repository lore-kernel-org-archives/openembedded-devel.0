Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1MJ32r-0008EI-GO
	for openembedded-devel@openembedded.org; Tue, 23 Jun 2009 12:16:07 +0200
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1MJ2sA-00025m-Dh
	for openembedded-devel@openembedded.org; Tue, 23 Jun 2009 10:05:02 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Tue, 23 Jun 2009 10:05:02 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Tue, 23 Jun 2009 10:05:02 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 23 Jun 2009 11:14:16 +0200
Message-ID: <h1q6d8$a5v$10@ger.gmane.org>
References: <200906230941.30107.marcin@juszkiewicz.com.pl>
	<1245747394-31806-1-git-send-email-marcin@juszkiewicz.com.pl>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1pre) Gecko/20090610 Shredder/3.0b3pre
In-Reply-To: <1245747394-31806-1-git-send-email-marcin@juszkiewicz.com.pl>
Sender: news <news@ger.gmane.org>
Subject: Re: [STABLE][PATCH 021/125] rootfs_deb: make Packages.gz, not Packages.bz2.
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
X-List-Received-Date: Tue, 23 Jun 2009 10:16:10 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23-06-09 10:56, Marcin Juszkiewicz wrote:
> From: Michael Smith<msmith@cbnco.com>
>
> apt ignores Packages.bz2 unless bzip2 exists in /bin/bzip2 (!!).
> If it's in /usr/bin/bzip2 (e.g. SuSE build host) the image fails to build.
>
> Also, remove commented-out check for DEPLOY_KEEP_PACKAGES.
>
> Signed-off-by: Michael Smith<msmith@cbnco.com>
> Signed-off-by: Marcin Juszkiewicz<marcin@juszkiewicz.com.pl>

Acked-by: Koen Kooi <koen@openembedded.org>

> ---
>   classes/rootfs_deb.bbclass |   10 ++++++----
>   1 files changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/classes/rootfs_deb.bbclass b/classes/rootfs_deb.bbclass
> index 2768c2a..8222066 100644
> --- a/classes/rootfs_deb.bbclass
> +++ b/classes/rootfs_deb.bbclass
> @@ -24,10 +24,12 @@ fakeroot rootfs_deb_do_rootfs () {
>   			continue;
>   		fi
>   		cd ${DEPLOY_DIR_DEB}/$arch
> -		# if [ -z "${DEPLOY_KEEP_PACKAGES}" ]; then
> -			rm -f Packages.gz Packages Packages.bz2
> -		# fi
> -		dpkg-scanpackages . | bzip2>  Packages.bz2
> +		rm -f Packages.gz Packages Packages.bz2
> +
> +		# apt-native ignores Packages.bz2 unless /bin/bzip2 exists
> +		# on the build host, so stick with gzip
> +		dpkg-scanpackages . | gzip>  Packages.gz
> +
>   		echo "Label: $arch">  Release
>
>   		echo "deb file:${DEPLOY_DIR_DEB}/$arch/ ./">>  ${STAGING_ETCDIR_NATIVE}/apt/sources.list.rev




