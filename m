Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1P4YyI-0002Lr-W7 for openembedded-devel@lists.openembedded.org;
	Sat, 09 Oct 2010 14:56:24 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1P4Yxx-00083g-Di for openembedded-devel@lists.openembedded.org;
	Sat, 09 Oct 2010 14:55:57 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 Oct 2010 14:55:57 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 Oct 2010 14:55:57 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sat, 09 Oct 2010 14:55:47 +0200
Message-ID: <i8pooj$56n$1@dough.gmane.org>
References: <1286621826-9198-1-git-send-email-koen@openembedded.org>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.11) Gecko/20100822 Shredder/3.0.7pre
In-Reply-To: <1286621826-9198-1-git-send-email-koen@openembedded.org>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 1/2] kernel bbclass: split do_compile into do_compile and do_compile_modules
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
X-List-Received-Date: Sat, 09 Oct 2010 12:56:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

disregard this one, _modules is a local override, v2 will fix that

On 09-10-10 12:57, Koen Kooi wrote:
> This allows recipes to insert a custom task in between building *Image and modules
> 
> Signed-off-by: Koen Kooi <koen@openembedded.org>
> ---
>  classes/kernel.bbclass |    4 ++++
>  1 files changed, 4 insertions(+), 0 deletions(-)
> 
> diff --git a/classes/kernel.bbclass b/classes/kernel.bbclass
> index cf6b8cd..5d5e93b 100644
> --- a/classes/kernel.bbclass
> +++ b/classes/kernel.bbclass
> @@ -89,12 +89,16 @@ kernel_do_compile() {
>  		oe_runmake dep CC="${KERNEL_CC}" LD="${KERNEL_LD}"
>  	fi
>  	oe_runmake ${KERNEL_IMAGETYPE} CC="${KERNEL_CC}" LD="${KERNEL_LD}"
> +}
> +
> +kernel_do_compile_modules() {
>  	if (grep -q -i -e '^CONFIG_MODULES=y$' .config); then
>  		oe_runmake modules  CC="${KERNEL_CC}" LD="${KERNEL_LD}"
>  	else
>  		oenote "no modules to compile"
>  	fi
>  }
> +addtask compile_modules after do_compile before do_install
>  
>  kernel_do_install() {
>  	unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFMsGZTMkyGM64RGpERAlpLAKCDoOp5yV1METuyM5r7XbA53MhZKACffYr2
4zygv+VrY75MAdL4gHdTFx8=
=jrRu
-----END PGP SIGNATURE-----



