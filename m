Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OsVlt-0006ie-Pn for openembedded-devel@lists.openembedded.org;
	Mon, 06 Sep 2010 09:05:43 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OsVlI-0007nB-4z for openembedded-devel@lists.openembedded.org;
	Mon, 06 Sep 2010 09:05:04 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Sep 2010 09:05:04 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Sep 2010 09:05:04 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 06 Sep 2010 08:48:47 +0200
Message-ID: <i622sf$jp9$6@dough.gmane.org>
References: <201009030248.47018.schnitzeltony@gmx.de>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.11) Gecko/20100729 Shredder/3.0.7pre
In-Reply-To: <201009030248.47018.schnitzeltony@gmx.de>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 5/5] clutter (+box2d +gtk): Bump to latest (stable) versions
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
X-List-Received-Date: Mon, 06 Sep 2010 07:05:43 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 03-09-10 02:48, Andreas Mueller wrote:
> 
> * clutter has a known problem with fonts feor more details and
>   workaround see
>   http://lists.clutter-project.org/pipermail/clutter-devel-list/2010-September/000070.html
> * clutter-box2d_0.10.0_git has the introspection bug fixed upstream
>   and a funny (patience) new demo in blockbox
> 
> Signed-off-by: Andreas Mueller <schnitzeltony@gmx.de>

Acked-by: Koen Kooi <k-kooi@ti.com>


> ---
>  recipes/clutter/clutter-box2d_0.10.0_git.bb |   12 +++++++++
>  recipes/clutter/clutter-gtk_0.10.6.bb       |   10 +++++++
>  recipes/clutter/clutter_1.2.12.bb           |   36 +++++++++++++++++++++++++++
>  3 files changed, 58 insertions(+), 0 deletions(-)
>  create mode 100644 recipes/clutter/clutter-box2d_0.10.0_git.bb
>  create mode 100644 recipes/clutter/clutter-gtk_0.10.6.bb
>  create mode 100644 recipes/clutter/clutter_1.2.12.bb
> 
> diff --git a/recipes/clutter/clutter-box2d_0.10.0_git.bb b/recipes/clutter/clutter-box2d_0.10.0_git.bb
> new file mode 100644
> index 0000000..4696a01
> --- /dev/null
> +++ b/recipes/clutter/clutter-box2d_0.10.0_git.bb
> @@ -0,0 +1,12 @@
> +require clutter-box2d.inc
> +
> +SRCREV = "4e72b9c135a9439b82d801c62422531db611f98b"
> +
> +PR = "${INC_PR}.0"
> +PR_append = "+git${SRCREV}"
> +
> +SRC_URI = "git://git.clutter-project.org/clutter-box2d.git;protocol=git \
> +           file://example-data-location.patch \
> +          "
> +
> +S = "${WORKDIR}/git"
> diff --git a/recipes/clutter/clutter-gtk_0.10.6.bb b/recipes/clutter/clutter-gtk_0.10.6.bb
> new file mode 100644
> index 0000000..ab66c77
> --- /dev/null
> +++ b/recipes/clutter/clutter-gtk_0.10.6.bb
> @@ -0,0 +1,10 @@
> +require clutter-gtk.inc
> +
> +PR = "${INC_PR}.1"
> +
> +SRC_URI = "http://source.clutter-project.org/sources/clutter-gtk/0.10/clutter-gtk-${PV}.tar.bz2 \
> +          "
> +
> +SRC_URI[md5sum] = "e7407392b14d6cddd9d4f86feaa9bd3f"
> +SRC_URI[sha256sum] = "c65ec1e6b2932ed23b3db145357a96ae5ec7cb0666139468eba781d6c56a5371"
> +
> diff --git a/recipes/clutter/clutter_1.2.12.bb b/recipes/clutter/clutter_1.2.12.bb
> new file mode 100644
> index 0000000..a454544
> --- /dev/null
> +++ b/recipes/clutter/clutter_1.2.12.bb
> @@ -0,0 +1,36 @@
> +require clutter.inc
> +
> +PR = "${INC_PR}.1"
> +
> +SRC_URI = "http://source.clutter-project.org/sources/clutter/1.2/clutter-${PV}.tar.bz2 \
> +           ${INC_SRC_URI} \
> +          "
> +
> +# recommended for --clutter-debug / --cogl-debug params
> +BASE_CONF += " --enable-debug"
> +
> +do_configure_prepend() {
> +	# align the test data location *.c (V1.2 uses macro ASSETS_DIR for path in *.c)
> +	for i in $(find ${S}/tests -name Makefile.am) ; do
> +		sed -i -e 's:$(top_srcdir)/tests/data:${datadir}/${PN}-tests:g' $i
> +	done
> +}
> +
> +do_compile_prepend() {
> +	rebuild_shader_sources ${S}/clutter/cogl/cogl/driver/gles
> +	# align test data location *.json
> +	for full_name in $(find ${S}/tests/data -name *.png -o -name *.json) ; do
> +		data_name=${full_name##*/}
> +		for i in $(find ${S}/tests -name *.json) ; do
> +			sed -i -e s:${data_name}:${datadir}/${PN}-tests/${data_name}:g $i
> +		done
> +	done
> +}
> +
> +do_install() {
> +	autotools_do_install
> +	install_tests
> +}
> +
> +SRC_URI[md5sum] = "76f70e765adcf7146be1ceb50bafa14f"
> +SRC_URI[sha256sum] = "4582e6579897374d1f8ce51daa330311ebb90033fad95d5f076c1e9392b4ae68"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFMhI7PMkyGM64RGpERAqrPAJ9W3CLr1/Vs0MDITSJ9XN4RlSTZpwCfaNqZ
LcAinkbN8/Ney5FgcdXyQMo=
=ClNP
-----END PGP SIGNATURE-----



