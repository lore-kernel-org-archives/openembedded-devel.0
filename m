Received: from mail-iw0-f174.google.com ([209.85.223.174])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1NqMMC-0008Rb-8L
	for openembedded-devel@lists.openembedded.org;
	Sat, 13 Mar 2010 09:06:06 +0100
Received: by iwn4 with SMTP id 4so580080iwn.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 13 Mar 2010 00:02:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=ig5HCPbo+kTIz5O6aPwuvATTeGlYivT/w7Z5jNyjcEs=;
	b=QldK5M7oXHQV9aWnEou7lLQI+vBUdkSA3zozglC6wYCsXzIAyQFlhqTAPQMhR0ePRJ
	fsF5HVOL+I1GV7XoabNOVrl6NE/liXiR+lXrWg0ExicPB7a2mSs3rXiKrAR8YZJV0PGs
	qOgRmAUvysR+hwaRT+urkNcC+K/SfKhaGOI38=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=I/JAhb/KICQX9GqyY8c2tFUveu3y6dxjWiyNyt2jA2icN9pJ+d4mXtUBztfV8uDZ27
	6D1Cnips6oqyXwy5+jkOypoxAziYwwqMZJhcWA2IExCde5jZ5LJ2h2x75jLwl/48mVBL
	8BXy4b5E139zbwM6bG5w9Cik1nRjLF4Q7BUS8=
MIME-Version: 1.0
Received: by 10.231.59.5 with SMTP id j5mr559321ibh.6.1268467378083; Sat, 13 
	Mar 2010 00:02:58 -0800 (PST)
In-Reply-To: <1268465302-3725-1-git-send-email-sgarman@zenlinux.com>
References: <1268465302-3725-1-git-send-email-sgarman@zenlinux.com>
Date: Sat, 13 Mar 2010 00:02:58 -0800
Message-ID: <19c1b8a91003130002g55d34a65l9858e5ae62062eb3@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.223.174
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] sed: migrate -native to BBCLASSEXTEND
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
X-List-Received-Date: Sat, 13 Mar 2010 08:06:06 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 12, 2010 at 11:28 PM, Scott Garman <sgarman@zenlinux.com> wrote=
:
> Signed-off-by: Scott Garman <sgarman@zenlinux.com>

can you also convert other native recipes for sed to use BBCLASSEXTEND

> ---
> =A0recipes/sed/sed-native_4.1.2.bb | =A0 =A03 ---
> =A0recipes/sed/sed_4.1.2.bb =A0 =A0 =A0 =A0| =A0 =A03 ++-
> =A02 files changed, 2 insertions(+), 4 deletions(-)
> =A0delete mode 100644 recipes/sed/sed-native_4.1.2.bb
>
> diff --git a/recipes/sed/sed-native_4.1.2.bb b/recipes/sed/sed-native_4.1=
.2.bb
> deleted file mode 100644
> index 3bfacd8..0000000
> --- a/recipes/sed/sed-native_4.1.2.bb
> +++ /dev/null
> @@ -1,3 +0,0 @@
> -SECTION =3D "console/utils"
> -require sed_${PV}.bb
> -inherit native
> diff --git a/recipes/sed/sed_4.1.2.bb b/recipes/sed/sed_4.1.2.bb
> index fe80f3e..e4337e2 100644
> --- a/recipes/sed/sed_4.1.2.bb
> +++ b/recipes/sed/sed_4.1.2.bb
> @@ -1,7 +1,7 @@
> =A0LICENSE =3D "GPL"
> =A0SECTION =3D "console/utils"
> =A0DESCRIPTION =3D "sed is a Stream EDitor."
> -PR =3D "r1"
> +PR =3D "r2"
>
> =A0SRC_URI =3D "${GNU_MIRROR}/sed/sed-${PV}.tar.gz"
> =A0S =3D "${WORKDIR}/sed-${PV}"
> @@ -24,3 +24,4 @@ pkg_prerm_${PN} () {
> =A0 =A0 =A0 =A0update-alternatives --remove sed sed.${PN}
> =A0}
>
> +BBCLASSEXTEND =3D "native"
> --
> 1.6.3.3
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


