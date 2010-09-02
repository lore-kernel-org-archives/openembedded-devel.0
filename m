Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Or5gs-0006bb-W4
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Sep 2010 11:02:40 +0200
Received: by iwn2 with SMTP id 2so302350iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Sep 2010 02:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=msMpFTD395CTFMYeaGVCJnFpHVd2adL6FGzCiZ7ilY4=;
	b=A4UongK0k0PMtnMyvNAGzkD4Q834h4uIxO1ranw6GIUqJ4NwbGMWDAHkklM5f5xAkf
	5H4CCT4lOkBGLZmaiE4tDDkx4Hdi8130HZtdssTXPPQ+nRHtyB2ITg5oBR0Zp/pJq+2o
	cTmPnViXztBX/bNJgkJiZI3rHmFPVVD9bp5hY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=qWoP0tK27VadkLZ8GGNu0B09ngv0lKKPdEhaG1OqKX131G5/XSeVpApDjZ4mGqVwyv
	runuwoTebYr5vZnFoMj9u5ghtvIRjMauvI1F9rFaPObjeKFPeacyn5mP2akXtr3NOnwW
	hJTvs8j2zlp//loEAjroRUbwTPI9f2+F0aLw8=
MIME-Version: 1.0
Received: by 10.231.146.212 with SMTP id i20mr10444908ibv.52.1283418125471;
	Thu, 02 Sep 2010 02:02:05 -0700 (PDT)
Received: by 10.231.205.138 with HTTP; Thu, 2 Sep 2010 02:02:05 -0700 (PDT)
In-Reply-To: <1281954040-17014-1-git-send-email-fransmeulenbroeks@gmail.com>
References: <1281954040-17014-1-git-send-email-fransmeulenbroeks@gmail.com>
Date: Thu, 2 Sep 2010 11:02:05 +0200
Message-ID: <AANLkTinLwurfepxhQvdybNHtMvx_Jq8Gv+26pJe1TgYC@mail.gmail.com>
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
Subject: Re: [PATCH] utils.bbclass: remove tests for checksums.ini
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
X-List-Received-Date: Thu, 02 Sep 2010 09:02:40 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Bump

2010/8/16 Frans Meulenbroeks <fransmeulenbroeks@gmail.com>:
> Signed-off-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
> ---
>
> As we have checksums in recipes for quite a while now, I feel the time ha=
s come to
> remove the checksums.ini code from utils.bbclass and to remove the (now e=
mpty)
> checksums.ini file.
>
> Attached is the patch.
> Your feedback is appreciated
>
> =A0classes/utils.bbclass | =A0 45 +--------------------------------------=
------
> =A01 files changed, 1 insertions(+), 44 deletions(-)
> =A0delete mode 100644 conf/checksums.ini
>
> diff --git a/classes/utils.bbclass b/classes/utils.bbclass
> index 7740ea3..83cf33c 100644
> --- a/classes/utils.bbclass
> +++ b/classes/utils.bbclass
> @@ -157,50 +157,7 @@ def base_get_checksums(pn, pv, src_uri, localpath, p=
arams, data):
> =A0 =A0 expected_md5sum =3D bb.data.getVarFlag("SRC_URI", md5flag, data)
> =A0 =A0 expected_sha256sum =3D bb.data.getVarFlag("SRC_URI", sha256flag, =
data)
>
> - =A0 =A0if (expected_md5sum and expected_sha256sum):
> - =A0 =A0 =A0 =A0return (expected_md5sum,expected_sha256sum)
> - =A0 =A0else:
> - =A0 =A0 =A0 =A0# missing checksum, parse checksums.ini
> -
> - =A0 =A0 =A0 =A0# Verify the SHA and MD5 sums we have in OE and check wh=
at do
> - =A0 =A0 =A0 =A0# in
> - =A0 =A0 =A0 =A0checksum_paths =3D bb.data.getVar('BBPATH', data, True).=
split(":")
> -
> - =A0 =A0 =A0 =A0# reverse the list to give precedence to directories tha=
t
> - =A0 =A0 =A0 =A0# appear first in BBPATH
> - =A0 =A0 =A0 =A0checksum_paths.reverse()
> -
> - =A0 =A0 =A0 =A0checksum_files =3D ["%s/conf/checksums.ini" % path for p=
ath in checksum_paths]
> - =A0 =A0 =A0 =A0try:
> - =A0 =A0 =A0 =A0 =A0 =A0parser =3D base_chk_load_parser(checksum_files)
> - =A0 =A0 =A0 =A0except ValueError:
> - =A0 =A0 =A0 =A0 =A0 =A0bb.note("No conf/checksums.ini found, not checki=
ng checksums")
> - =A0 =A0 =A0 =A0 =A0 =A0return (None,None)
> - =A0 =A0 =A0 =A0except:
> - =A0 =A0 =A0 =A0 =A0 =A0bb.note("Creating the CheckSum parser failed: %s=
:%s" % (sys.exc_info()[0], sys.exc_info()[1]))
> - =A0 =A0 =A0 =A0 =A0 =A0return (None,None)
> - =A0 =A0 =A0 =A0pn_pv_src =3D "%s-%s-%s" % (pn,pv,src_uri)
> - =A0 =A0 =A0 =A0pn_src =A0 =A0=3D "%s-%s" % (pn,src_uri)
> - =A0 =A0 =A0 =A0if parser.has_section(pn_pv_src):
> - =A0 =A0 =A0 =A0 =A0 =A0expected_md5sum =A0 =A0=3D parser.get(pn_pv_src,=
 "md5")
> - =A0 =A0 =A0 =A0 =A0 =A0expected_sha256sum =3D parser.get(pn_pv_src, "sh=
a256")
> - =A0 =A0 =A0 =A0elif parser.has_section(pn_src):
> - =A0 =A0 =A0 =A0 =A0 =A0expected_md5sum =A0 =A0=3D parser.get(pn_src, "m=
d5")
> - =A0 =A0 =A0 =A0 =A0 =A0expected_sha256sum =3D parser.get(pn_src, "sha25=
6")
> - =A0 =A0 =A0 =A0elif parser.has_section(src_uri):
> - =A0 =A0 =A0 =A0 =A0 =A0expected_md5sum =A0 =A0=3D parser.get(src_uri, "=
md5")
> - =A0 =A0 =A0 =A0 =A0 =A0expected_sha256sum =3D parser.get(src_uri, "sha2=
56")
> - =A0 =A0 =A0 =A0else:
> - =A0 =A0 =A0 =A0 =A0 =A0return (None,None)
> -
> - =A0 =A0 =A0 =A0if name:
> - =A0 =A0 =A0 =A0 =A0 =A0bb.note("This package has no checksums in corres=
ponding recipe '%s', please consider moving its checksums from checksums.in=
i file \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\nSRC_URI[%s.md5sum] =3D \"%s\"\nSRC_URI=
[%s.sha256sum] =3D \"%s\"\n" % (bb.data.getVar("FILE", data, True), name, e=
xpected_md5sum, name, expected_sha256sum))
> - =A0 =A0 =A0 =A0else:
> - =A0 =A0 =A0 =A0 =A0 =A0bb.note("This package has no checksums in corres=
ponding recipe '%s', please consider moving its checksums from checksums.in=
i file \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\nSRC_URI[md5sum] =3D \"%s\"\nSRC_URI[sh=
a256sum] =3D \"%s\"\n" % (bb.data.getVar("FILE", data, True), expected_md5s=
um, expected_sha256sum))
> -
> - =A0 =A0 =A0 =A0return (expected_md5sum, expected_sha256sum)
> + =A0 =A0return (expected_md5sum,expected_sha256sum)
>
> =A0def base_chk_file(pn, pv, src_uri, localpath, params, data):
> =A0 =A0 (expected_md5sum, expected_sha256sum) =3D base_get_checksums(pn, =
pv, src_uri, localpath, params, data)
> diff --git a/conf/checksums.ini b/conf/checksums.ini
> deleted file mode 100644
> index e69de29..0000000
> --
> 1.7.0.4
>
>


