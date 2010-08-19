Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Om0dK-0002sD-7Q for openembedded-devel@lists.openembedded.org;
	Thu, 19 Aug 2010 10:37:59 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Om0d1-0007c8-4b for openembedded-devel@lists.openembedded.org;
	Thu, 19 Aug 2010 10:37:39 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Aug 2010 10:37:39 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Aug 2010 10:37:39 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 19 Aug 2010 10:37:28 +0200
Message-ID: <i4iqg8$g6i$2@dough.gmane.org>
References: <1282198068-25415-1-git-send-email-coolaj86@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.11) Gecko/20100729 Shredder/3.0.7pre
In-Reply-To: <1282198068-25415-1-git-send-email-coolaj86@gmail.com>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] added a .bb for node.js
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
X-List-Received-Date: Thu, 19 Aug 2010 08:37:59 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 19-08-10 08:07, AJ ONeal wrote:

> diff --git a/recipes/node/node_0.1.104.bb b/recipes/node/node_0.1.104.bb
> new file mode 100644
> index 0000000..a99eaff
> --- /dev/null
> +++ b/recipes/node/node_0.1.104.bb
> @@ -0,0 +1,28 @@
> +DESCRIPTION = "nodeJS Evented I/O for V8 JavaScript"

> +PR = "r0"

r0 is the default, so remove that line, it only increases parse time.

> +DEPENDS = "openssl"
> +SRC_URI = " \
> +http://nodejs.org/dist/node-v${PV}.tar.gz \
> +file://libev-arm-cross.patch;apply=yes \
> +file://node-arm-cross.patch;apply=yes \
> +"
> +SRC_URI[md5sum] = "907fa1e0a2f1f0c3df5efc97fd05a7d2"
> +SRC_URI[sha256sum] = "a1c776f44bc07305dc0e56df17cc3260eaafa0394c3b06c27448ad85bec272df"
> +S = "${WORKDIR}/node-v${PV}"
> +do_configure () {

> +export DEST_CPU=arm

NAK, we support more than ARM cpus in OE

> +./configure
> +# skip complaints about 'config.log'
> +cat /dev/null > ${S}/build/config.log
> +}
> +do_qa_configure () {
> +}

NAK, fix the bugs instead of silencing the warning

> +do_compile () {
> +export DEST_CPU=arm
> +make
> +}

again, NAK, we support more than ARM cpus in OE


> +do_install () {
> +install -d ${D}${bindir}/
> +install -m 0755 ${S}/node ${D}${bindir}/
> +}

'make install' doesn't work?


-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFMbO1HMkyGM64RGpERAjwhAJsGHT8vVCVIso0dGsRsyTzT1UFW2wCgrrGj
NNapHt4oedB+qSPatTwatKc=
=HuvB
-----END PGP SIGNATURE-----



