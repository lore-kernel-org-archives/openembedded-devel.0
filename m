Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OJ36P-0002kx-4F for openembedded-devel@lists.openembedded.org;
	Mon, 31 May 2010 13:24:17 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OJ32K-0005ia-89 for openembedded-devel@lists.openembedded.org;
	Mon, 31 May 2010 13:20:04 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 May 2010 13:20:04 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 May 2010 13:20:04 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
connect(): No such file or directory
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 31 May 2010 13:19:30 +0200
Message-ID: <hu0602$c6i$2@dough.gmane.org>
References: <1275299757-28908-1-git-send-email-ospite@studenti.unina.it>
	<1275299757-28908-2-git-send-email-ospite@studenti.unina.it>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.10) Gecko/20100512 Shredder/3.0.6pre
In-Reply-To: <1275299757-28908-2-git-send-email-ospite@studenti.unina.it>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openezx-devel@lists.gnumonks.org
Subject: Re: [PATCH 01/12] fso-image.inc: add an even shorter alias, for ls -l
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
X-List-Received-Date: Mon, 31 May 2010 11:24:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 31-05-10 11:55, Antonio Ospite wrote:
> 'l' is a must have along with 'll'.
> 
> Signed-off-by: Antonio Ospite <ospite@studenti.unina.it>
> ---
>  recipes/images/fso-image.inc |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
> 
> diff --git a/recipes/images/fso-image.inc b/recipes/images/fso-image.inc
> index cc626f3..704d267 100644
> --- a/recipes/images/fso-image.inc
> +++ b/recipes/images/fso-image.inc
> @@ -110,6 +110,7 @@ fso_rootfs_postprocess() {
>      echo "alias fso='cd /local/pkg/fso'" >>./etc/profile
>      echo "alias ipkg='opkg'" >>./etc/profile
>      echo "alias vim=vi" >>./etc/profile
> +    echo "alias l='ls -l'" >>./etc/profile
>      echo "alias ll='ls -al'" >>./etc/profile
>      # nfs
>      mkdir -p ./local/pkg

And what happens if you opkg upgrade base-files? You suddenly lost all
your tweaks to /etc/profile.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFMA5tCMkyGM64RGpERAvTLAKCoiQEUoCu0JGj/uOrp7iyRxAMj6ACglhn0
PHnpQdgGf53SuA5JG1DDIiw=
=ZVr0
-----END PGP SIGNATURE-----



