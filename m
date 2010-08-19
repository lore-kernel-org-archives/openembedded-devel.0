Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Olzl9-0001J5-Vw
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Aug 2010 09:42:00 +0200
Received: by iwn38 with SMTP id 38so1531949iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Aug 2010 00:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:cc:content-type;
	bh=e+MNKa9jzjcCJS5bVNfx6fp1emtZkSozqyOedQtnOSc=;
	b=Yu9wrpPEZzBCnQdHOTTUlLV6R8ouFb3Vq0owioTsyJ6frUkih6RKCgEhcHyDhyccuv
	yIfrSKTT8V04bNSmjQko6KWWPQIBm8RejG4s+8p0ZOtVLprkqMmXUT5n7DEKJDlrth3m
	U10YzxqA9fyELfqUchdtiRE8fUDKESyaqdvqo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	b=jnhUDCpRotOVd2kJ0wH8N60h6W6y+4sD7VYHjqShy7TiAtfdLGNbXJjVU6yxERVfFw
	uCjyCpo0RNob3VSie0IUPXAWi2AJ99WLgplC3jjNHpihkdJ/7vrRiWiagAr0fJ6hRWih
	MZPC8v2kmrnA7e2IKSgXiE6cb2oDg21+HMqj8=
MIME-Version: 1.0
Received: by 10.231.146.129 with SMTP id h1mr10554527ibv.181.1282203701299;
	Thu, 19 Aug 2010 00:41:41 -0700 (PDT)
Received: by 10.231.208.72 with HTTP; Thu, 19 Aug 2010 00:41:41 -0700 (PDT)
In-Reply-To: <1282198068-25415-1-git-send-email-coolaj86@gmail.com>
References: <1282198068-25415-1-git-send-email-coolaj86@gmail.com>
Date: Thu, 19 Aug 2010 09:41:41 +0200
Message-ID: <AANLkTim+vtt_F9A-Fetitct7hsAYaoZwA6kRpjL8tqBk@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: "General mailing list for gumstix users."
	<gumstix-users@lists.sourceforge.net>
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
X-List-Received-Date: Thu, 19 Aug 2010 07:42:00 -0000
Content-Type: text/plain; charset=ISO-8859-1

Can't judge the patches, but will give some feedback on one of your
recipe versions

2010/8/19 AJ ONeal <coolaj86@gmail.com>:

> diff --git a/recipes/node/node_0.1.104.bb b/recipes/node/node_0.1.104.bb
> new file mode 100644
> index 0000000..a99eaff
> --- /dev/null
> +++ b/recipes/node/node_0.1.104.bb
> @@ -0,0 +1,28 @@
> +DESCRIPTION = "nodeJS Evented I/O for V8 JavaScript"

can you add std headers like HOMEPAGE and LICENSE
see other recipes for examples

> +PR = "r0"
> +DEPENDS = "openssl"
> +SRC_URI = " \
> +http://nodejs.org/dist/node-v${PV}.tar.gz \
> +file://libev-arm-cross.patch;apply=yes \
> +file://node-arm-cross.patch;apply=yes \
please indent (with spaces); apply=yes is default for patch files so
no need to add it
> +"
> +SRC_URI[md5sum] = "907fa1e0a2f1f0c3df5efc97fd05a7d2"
> +SRC_URI[sha256sum] = "a1c776f44bc07305dc0e56df17cc3260eaafa0394c3b06c27448ad85bec272df"
> +S = "${WORKDIR}/node-v${PV}"
> +do_configure () {
> +export DEST_CPU=arm
> +./configure
> +# skip complaints about 'config.log'
> +cat /dev/null > ${S}/build/config.log
> +}
> +do_qa_configure () {
> +}
needed?

> +do_compile () {
> +export DEST_CPU=arm
> +make
if it works use: oe_runmake DEST_CPU=arm
> +}
> +do_install () {
> +install -d ${D}${bindir}/
> +install -m 0755 ${S}/node ${D}${bindir}/
is there no make install? If so you probably should do
oe_runmake install
maybe overriding DESTDIR or whatever your makefile uses

> +}
> +FILES_${PN} = "${bindir}/node"

I think your bindir will be in the package anyway (and shouldn't it be
${D}${bindir}; don't do this often enough to know for sure, peek into
other recipes)

Please resubmit as v2

Frans


