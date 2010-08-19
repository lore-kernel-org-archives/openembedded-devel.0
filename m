Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Olyxr-0006oL-DV
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Aug 2010 08:51:04 +0200
Received: by iwn38 with SMTP id 38so1489002iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Aug 2010 23:50:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=taigdxQKew/mo0QYx5pq3D1t7Bwfio3ambqayKDnuHg=;
	b=i27p48bWvvPgwJHGJmQ8G2qSBpBPLfMcAwYYsxldG6LcLDDYHisvL21rd7rEVc/m32
	A/fOZ3zk1komrL+zx7f28nPvO3m/Ik6+Qt3WdvIIJMGPuHYsSfxKvz/4iJ/8TEDS+mt9
	X6zNOTnDGLdEu7IaCFym2DX1X5EVm+2O0wXi4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=wvmB9Y+ujgedMoMGvXlwBDyI+MaX4LXCZ4hHjDFW6xsseq3z+qQ15m3Oz5nKYmyHjJ
	IBmes+oYa5C1ejeYk/fjPyNAzUQDAPvDUkiZxh+NrIG34kvSy3BB+CK66GKTYmVbBdiD
	7R5NG2H62ksUDoB3B2DgR1JhJvdarWzWNrsMI=
MIME-Version: 1.0
Received: by 10.231.36.77 with SMTP id s13mr10184102ibd.190.1282200644961;
	Wed, 18 Aug 2010 23:50:44 -0700 (PDT)
Received: by 10.231.208.72 with HTTP; Wed, 18 Aug 2010 23:50:44 -0700 (PDT)
In-Reply-To: <1282198749-25911-1-git-send-email-coolaj86@gmail.com>
References: <1282198749-25911-1-git-send-email-coolaj86@gmail.com>
Date: Thu, 19 Aug 2010 08:50:44 +0200
Message-ID: <AANLkTin1LNj80zSFxs81euO+0gw2bEA-JCpkx8s04FLh@mail.gmail.com>
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
Subject: Re: [PATCH] removed duplicate node recipe
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
X-List-Received-Date: Thu, 19 Aug 2010 06:51:04 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/8/19 AJ ONeal <coolaj86@gmail.com>:
> ---
> =A0recipes/node/node_v0.1.104.bb | =A0 23 -----------------------
> =A01 files changed, 0 insertions(+), 23 deletions(-)
> =A0delete mode 100644 recipes/node/node_v0.1.104.bb
>
> diff --git a/recipes/node/node_v0.1.104.bb b/recipes/node/node_v0.1.104.b=
b
> deleted file mode 100644
> index 368b8fb..0000000
> --- a/recipes/node/node_v0.1.104.bb
> +++ /dev/null
> @@ -1,23 +0,0 @@
> -DESCRIPTION =3D "nodeJS Evented I/O for V8 JavaScript"
> -PR =3D "r0"
> -DEPENDS =3D "openssl"
> -SRC_URI =3D " \
> -http://nodejs.org/dist/node-v${PV}.tar.gz \
> -"
> -#libev-cross.patch
> -#node-cross.patch
> -SRC_URI[md5sum] =3D "907fa1e0a2f1f0c3df5efc97fd05a7d2"
> -SRC_URI[sha256sum] =3D "a1c776f44bc07305dc0e56df17cc3260eaafa0394c3b06c2=
7448ad85bec272df"
> -S =3D "${WORKDIR}/node-v${PV}"
> -do_configure () {
> -./configure
> -}
> -do_compile () {
> -export DEST_CPU=3Darm
> -make
> -}
> -do_install () {
> -install -d ${D}${bindir}/
> -install -m 0755 ${S}/node ${D}${bindir}/
> -}
> -FILES_${PN} =3D "${bindir}/node"
> --
> 1.6.0.4
>
Not sure where you got this from but my tree does not have a node
recipe and it does not show up in dev head in cgit.

Frans


