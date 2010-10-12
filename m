Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1P5ZwJ-0001dP-Od for openembedded-devel@lists.openembedded.org;
	Tue, 12 Oct 2010 10:10:29 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1P5Zvr-0007xb-Lq for openembedded-devel@lists.openembedded.org;
	Tue, 12 Oct 2010 10:09:59 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Oct 2010 10:09:59 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Oct 2010 10:09:59 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 12 Oct 2010 10:09:50 +0200
Message-ID: <i9154e$2rk$1@dough.gmane.org>
References: <1286783755-19145-1-git-send-email-koen@openembedded.org>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.11) Gecko/20100822 Shredder/3.0.7pre
In-Reply-To: <1286783755-19145-1-git-send-email-koen@openembedded.org>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCHv3 1/3] kernel bbclass: split do_compile into do_compile and do_compile_modules
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
X-List-Received-Date: Tue, 12 Oct 2010 08:10:30 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

ping

On 11-10-10 09:55, Koen Kooi wrote:
> This allows recipes to insert a custom task in between building *Image and modules
> 
> Signed-off-by: Koen Kooi <koen@openembedded.org>
> ---
>  classes/kernel.bbclass |    5 +++++
>  1 files changed, 5 insertions(+), 0 deletions(-)
> 
> diff --git a/classes/kernel.bbclass b/classes/kernel.bbclass
> index cf6b8cd..83e3f44 100644
> --- a/classes/kernel.bbclass
> +++ b/classes/kernel.bbclass
> @@ -89,12 +89,17 @@ kernel_do_compile() {
>  		oe_runmake dep CC="${KERNEL_CC}" LD="${KERNEL_LD}"
>  	fi
>  	oe_runmake ${KERNEL_IMAGETYPE} CC="${KERNEL_CC}" LD="${KERNEL_LD}"
> +}
> +
> +do_compile_kernelmodules() {
> +	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
>  	if (grep -q -i -e '^CONFIG_MODULES=y$' .config); then
>  		oe_runmake modules  CC="${KERNEL_CC}" LD="${KERNEL_LD}"
>  	else
>  		oenote "no modules to compile"
>  	fi
>  }
> +addtask compile_kernelmodules after do_compile before do_install
>  
>  kernel_do_install() {
>  	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFMtBfOMkyGM64RGpERAonPAKCPzmCFS67arfwLKKL8Eb7QENuKOgCgmx++
7TUh52+7x1OV5xjF7Pp/oFk=
=yf9t
-----END PGP SIGNATURE-----



