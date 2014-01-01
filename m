Return-Path: <gcho-openembedded-devel@m.gmane.org>
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by mail.openembedded.org (Postfix) with ESMTP id 92F276A413
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Jan 2014 10:53:26 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1VyJQO-0001fr-Tc for openembedded-devel@lists.openembedded.org;
	Wed, 01 Jan 2014 11:53:20 +0100
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Jan 2014 11:53:20 +0100
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Jan 2014 11:53:20 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 01 Jan 2014 11:53:46 +0100
Message-ID: <la0s29$taa$1@ger.gmane.org>
References: <1388455711-20416-1-git-send-email-otavio@ossystems.com.br>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
In-Reply-To: <1388455711-20416-1-git-send-email-otavio@ossystems.com.br>
X-Enigmail-Version: 1.6
Subject: Re: [meta-oe] tearofsteel-1080p: Add recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 01 Jan 2014 10:53:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Otavio Salvador schreef op 31-12-13 03:08:
> This adds the Tears of Steel movie in 1080P as a sample content for easy
> addition in images.
> 
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

Acked-by: Koen Kooi <koen@dominion.thruhere.net>

> --- .../sample-content/tearsofsteel-1080p.bb                   | 14
> ++++++++++++++ 1 file changed, 14 insertions(+) create mode 100644
> meta-multimedia/recipes-multimedia/sample-content/tearsofsteel-1080p.bb
> 
> diff --git
> a/meta-multimedia/recipes-multimedia/sample-content/tearsofsteel-1080p.bb
> b/meta-multimedia/recipes-multimedia/sample-content/tearsofsteel-1080p.bb
>
> 
new file mode 100644
> index 0000000..86e79f3 --- /dev/null +++
> b/meta-multimedia/recipes-multimedia/sample-content/tearsofsteel-1080p.bb
>
> 
@@ -0,0 +1,14 @@
> +DESCRIPTION = "Tears of Steel movie - 1080P" +LICENSE = "CC-BY-3.0" 
> +LIC_FILES_CHKSUM =
> "file://${COREBASE}/meta/files/common-licenses/CC-BY-3.0;md5=dfa02b5755629022e267f10b9c0a2ab7"
>
> 
+
> +SRC_URI =
> "http://ftp.nluug.nl/pub/graphics/blender/demo/movies/ToS/ToS-4k-1920.mov"
>
> 
+
> +inherit allarch + +do_install() { +	install -d ${D}${datadir}/movies +
> install -m 0644 ${WORKDIR}/ToS-4k-1920.mov ${D}${datadir}/movies/ +} + 
> +FILES_${PN} += "${datadir}/movies"
> 

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFSw/O6MkyGM64RGpERAvjqAJ9MoQTYPB8+ByPpjR9ZJQL6VGmNiwCfUUzo
8ElWYkklCTC8ZLlrykxkKcc=
=JL0h
-----END PGP SIGNATURE-----


