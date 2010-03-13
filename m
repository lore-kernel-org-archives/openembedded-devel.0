Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NqOdq-0005xW-WD for openembedded-devel@lists.openembedded.org;
	Sat, 13 Mar 2010 11:32:27 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NqOay-0007ge-LZ for openembedded-devel@lists.openembedded.org;
	Sat, 13 Mar 2010 11:29:24 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sat, 13 Mar 2010 11:29:24 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 13 Mar 2010 11:29:24 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sat, 13 Mar 2010 11:29:13 +0100
Message-ID: <hnfpdp$mg6$1@dough.gmane.org>
References: <1268429974-12872-1-git-send-email-ulf.samuelsson@atmel.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.8) Gecko/20100223 Shredder/3.0.3pre
In-Reply-To: <1268429974-12872-1-git-send-email-ulf.samuelsson@atmel.com>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] multimedia:;Add media contents to rootfs
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
X-List-Received-Date: Sat, 13 Mar 2010 10:32:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 12-03-10 22:39, Ulf Samuelsson wrote:
> This package will copy the contents of "multimedia.tar.bz2."
> (Note the dot at the end) to the "/home/root/multimedia" directory
> in the target. By replacing the empty default file, you
> can add your own multimedia files for testing.
> 
> Signed-off-by: Ulf Samuelsson <ulf.samuelsson@atmel.com>


NAK. Package never never touch $HOME, if you want things installed into
$HOME, look into /etc/skel.



> ---
>  recipes/multimedia/files/multimedia.tar.bz2. |  Bin 0 -> 118 bytes
>  recipes/multimedia/multimedia_0.1.bb         |   19 +++++++++++++++++++
>  2 files changed, 19 insertions(+), 0 deletions(-)
>  create mode 100644 recipes/multimedia/files/multimedia.tar.bz2.
>  create mode 100644 recipes/multimedia/multimedia_0.1.bb
> 
> diff --git a/recipes/multimedia/files/multimedia.tar.bz2. b/recipes/multimedia/files/multimedia.tar.bz2.
> new file mode 100644
> index 0000000000000000000000000000000000000000..09d719c63e6aa4afafce68e4bd6131e1a484537a
> GIT binary patch
> literal 118
> zcmV-+0Ez!XT4*^jL0KkKS(4QIK>z?-dw{@z03bjCe}DiGV+LLz1PCAibrDVIr<61U
> z(g&0hL?8j6G-*F=sE|@fLNkjR-2x^Ik_Ts_))SHl@W5~jiU45mLa9=&!C73{3N630
> Y^gyx_&QUp?$p_-@NT&)C5?Y^VAXlj?#Q*>R
> 
> literal 0
> HcmV?d00001
> 
> diff --git a/recipes/multimedia/multimedia_0.1.bb b/recipes/multimedia/multimedia_0.1.bb
> new file mode 100644
> index 0000000..5776059
> --- /dev/null
> +++ b/recipes/multimedia/multimedia_0.1.bb
> @@ -0,0 +1,19 @@
> +DESCRIPTION = "MultiMedia files"
> +PR = "r1"
> +
> +# Note '.' at end of the filename to avoid decompress by bitbake
> +SRC_URI = "\
> +	file://multimedia.tar.bz2. \
> +	"
> +
> +do_install() {
> +	install -d ${D}/home/root/multimedia
> +	tar jxvf ${WORKDIR}/multimedia.tar.bz2.	-C ${D}/home/root/multimedia
> +	rm -f ${D}/home/root/multimedia/.empty
> +}
> +
> +FILES_${PN} = "\
> +	/home/root/multimedia/* \
> +	"
> +
> +PACKAGE_ARCH = "${MACHINE_ARCH}"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFLm2j5MkyGM64RGpERAoBWAKCcH+Dt6rUTXt5hrTj1pcGcQ1XO+ACfY2PX
rBbMEgk5o0l8ILfLcIfvDMA=
=UTCx
-----END PGP SIGNATURE-----



