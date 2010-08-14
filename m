Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OkCPM-0003ar-9r
	for openembedded-devel@lists.openembedded.org;
	Sat, 14 Aug 2010 10:48:19 +0200
Received: by yxd39 with SMTP id 39so778944yxd.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 14 Aug 2010 01:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=E/N/BlM4Q42eV05GmgbzJXwC//8EBiO6LbyAVLywlnc=;
	b=UBaRjlGbiqshlFQJKqMxFOmDn+ErsbNX4zQSf791rIlmuCFGTN+3sJT9KO72LKsU91
	PnmAQNMkff3yOVZLKXBQNHFVwOyZcTIVrTDw0xBaVkzPgqX70XDc936ysO57fsJHNVGX
	GrKQX85RyBZrxcY9Xhbtmtqn9n+tXXMdBk5Ek=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=V393CMbiy9rIE1WjlU1YKY2Jka1mBOVjXWbQE8tOLt40WvedAXHUtixBG/CMNhlyUe
	yjkrTlPFBYuO85vEl6YbmDDPN1eb/+DkXB/U4gkx9wdlZU+NhS0w7m5E5CzCoVojmirP
	WIDceJPLcQW74IfsK4NUGCkgKew0b+3i9HMkw=
MIME-Version: 1.0
Received: by 10.231.14.137 with SMTP id g9mr2519750iba.183.1281775657526; Sat,
	14 Aug 2010 01:47:37 -0700 (PDT)
Received: by 10.231.208.72 with HTTP; Sat, 14 Aug 2010 01:47:37 -0700 (PDT)
In-Reply-To: <1281700216-26652-1-git-send-email-noor_ahsan@mentor.com>
References: <1281700216-26652-1-git-send-email-noor_ahsan@mentor.com>
Date: Sat, 14 Aug 2010 10:47:37 +0200
Message-ID: <AANLkTikS3yJGu-izfXRSjmNZvXQowXnz0vAPzDv4H=y0@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] serload-native: Removing legacy staging
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
X-List-Received-Date: Sat, 14 Aug 2010 08:48:20 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/8/13 Ahsan, Noor <noor_ahsan@mentor.com>:
> * Replaced do_stage function with do_install and replaced ${STAGING_BINDI=
R} with ${D}${bindir}
>
> Signed-off-by: Ahsan, Noor <noor_ahsan@mentor.com>
> ---
> =A0recipes/simpad-utilities/serload-native.bb | =A0 12 ++++++++----
> =A01 files changed, 8 insertions(+), 4 deletions(-)
>
> diff --git a/recipes/simpad-utilities/serload-native.bb b/recipes/simpad-=
utilities/serload-native.bb
> index 9be199f..d147db2 100644
> --- a/recipes/simpad-utilities/serload-native.bb
> +++ b/recipes/simpad-utilities/serload-native.bb
> @@ -3,14 +3,18 @@ LICENSE=3D "GPL"
> =A0DESCRIPTION =3D "Console utility for transferring a SIMpad boot image =
via serial a SIMpad"
> =A0FILESDIR =3D "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/serload"
> =A0SRC_URI =3D "file://serialdownload.cpp file://main.cpp file://serialdo=
wnload.h"
> +PR =3D "r1"
>
> =A0inherit native
>
> +NATIVE_INSTALL_WORKS =3D "1"
> +
> =A0do_compile() {
> - =A0 =A0 =A0 cp ${WORKDIR}/*.h ${WORKDIR}/*.cpp .
> - =A0 =A0 =A0 ${CXX} -I. -o serload main.cpp serialdownload.cpp
> + =A0 =A0 =A0 =A0cp ${WORKDIR}/*.h ${WORKDIR}/*.cpp .
> + =A0 =A0 =A0 =A0${CXX} -I. -o serload main.cpp serialdownload.cpp
> =A0}
>
> -do_stage() {
> - =A0 =A0 =A0 install -m 0755 serload ${STAGING_BINDIR}/
> +do_install() {
> + =A0 =A0 =A0 =A0install -d ${D}${bindir}/
> + =A0 =A0 =A0 =A0install -m 0755 serload ${D}${bindir}/
> =A0}

removed FILESDIR as suggested by Tom RIni,
reran oe-styilze
compiled
committed and pushed

Thanks for your contribution.
Feel free to attack some more recipes :-)

Frans


