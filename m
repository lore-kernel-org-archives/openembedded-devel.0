Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1ODH0R-0007a5-3d for openembedded-devel@lists.openembedded.org;
	Sat, 15 May 2010 15:02:15 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1ODGwd-0002nZ-Mz for openembedded-devel@lists.openembedded.org;
	Sat, 15 May 2010 14:58:19 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 May 2010 14:58:19 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 May 2010 14:58:19 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
connect(): No such file or directory
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sat, 15 May 2010 14:58:12 +0200
Message-ID: <hsm5p4$qn6$1@dough.gmane.org>
References: <1273915414-3417-1-git-send-email-eric@eukrea.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.9) Gecko/20100428 Shredder/3.0.5pre
In-Reply-To: <1273915414-3417-1-git-send-email-eric@eukrea.com>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 1/2] sed: add gettext dependency
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
X-List-Received-Date: Sat, 15 May 2010 13:02:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

I ran into the same problem this morning :)

http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=4154c5f1b9e65b5e2ecb026a06d53fe178921d26

On 15-05-10 11:23, Eric Benard wrote:
> bitbake meta-toolchain with task-sdk-basae fails without this when
> runned from scratch
> 
> Signed-off-by: Eric Benard <eric@eukrea.com>
> ---
>  recipes/sed/sed_4.1.2.bb |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/recipes/sed/sed_4.1.2.bb b/recipes/sed/sed_4.1.2.bb
> index 5cfa531..4838063 100644
> --- a/recipes/sed/sed_4.1.2.bb
> +++ b/recipes/sed/sed_4.1.2.bb
> @@ -6,7 +6,7 @@ PR = "r1"
>  SRC_URI = "${GNU_MIRROR}/sed/sed-${PV}.tar.gz"
>  S = "${WORKDIR}/sed-${PV}"
>  
> -inherit autotools
> +inherit autotools gettext
>  
>  do_install () {
>  	autotools_do_install

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFL7ppkMkyGM64RGpERAogxAJ9+lBr+wYPhIaLtRyiZNweV8yMa2wCfcdUK
ns4suPvHPVAq+b13nEySW4Y=
=44LE
-----END PGP SIGNATURE-----



