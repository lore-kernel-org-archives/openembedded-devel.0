Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PruRk-0004sH-1y for openembedded-devel@lists.openembedded.org;
	Tue, 22 Feb 2011 16:46:40 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PruQS-0003uN-N5 for openembedded-devel@lists.openembedded.org;
	Tue, 22 Feb 2011 16:45:20 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Feb 2011 16:45:20 +0100
Received: from k.kooi by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Feb 2011 16:45:20 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 22 Feb 2011 16:45:06 +0100
Message-ID: <ik0lm2$u8f$1@dough.gmane.org>
References: <1298370092-31915-1-git-send-email-kernel-hacker@bennee.com>
	<1298370092-31915-2-git-send-email-kernel-hacker@bennee.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <1298370092-31915-2-git-send-email-kernel-hacker@bennee.com>
X-Enigmail-Version: 1.0.1
Subject: Re: [PATCH 1/2] libnet: fake a libnet pkg to allow libnet-dev to be in SDK
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
X-List-Received-Date: Tue, 22 Feb 2011 15:46:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 22-02-11 11:21, kernel-hacker@bennee.com wrote:
> From: Alex Bennee <ajb@cbnl.com>
> 
> I'm sure there is a better way than this but this works for now.
> By default libnet-dev has a dependancy on libnet, however this is
> not built as libnet is a static package. This makes it impossible
> to add libnet-dev to a SDK.
> 
> Commenting out the FILES_${PN} for libnet means it does get built
> and together with the -dev package can be added to the SDK
> 
> Signed-off-by: Alex Bennee <ajb@cbnl.com>
> ---
>  recipes/libnet/libnet_1.1.2.1.bb |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/recipes/libnet/libnet_1.1.2.1.bb b/recipes/libnet/libnet_1.1.2.1.bb
> index b09f56e..94c0418 100644
> --- a/recipes/libnet/libnet_1.1.2.1.bb
> +++ b/recipes/libnet/libnet_1.1.2.1.bb
> @@ -32,7 +32,7 @@ do_install_append () {
>  }
>  
>  #static build
> -FILES_${PN} = ""
> +#FILES_${PN} = ""
>  FILES_${PN}-dev += "${bindir}/libnet-config"
>  
>  CPPFLAGS_prepend = "-I${S}/libnet/include "

setting ALLOW_EMPTY to '1' and bumping PR would be a better fix IMO

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNY9oCMkyGM64RGpERAke4AJ9qOy+UbwMMBg+6cRzdgkmxFW6ZgACfRbwt
l64XgWXekQ4Rs3/0uwmjbqQ=
=Lay7
-----END PGP SIGNATURE-----



