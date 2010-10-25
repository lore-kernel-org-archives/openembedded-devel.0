Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PABCF-000390-8N
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 Oct 2010 02:45:56 +0200
Received: by yxe42 with SMTP id 42so1820966yxe.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Oct 2010 17:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=djh7JmX0+GtINdFzQe3/ghdRdI1fbUovgn8G2a/uPl8=;
	b=OlZj+vDJGSjXMSBuvpwu6bnaCk8GUS0IN2jkUdUicM1H6XQ3R92ImPyNaZRVY2yfYI
	9CDVllaOlDWfgWlBHMDRbQKBe5qqgY1c5yzpFUWlmLjeHdP+ccGzI8D/ei25pS9NaDt3
	fG7Io6zhQBSmTvKIXg0nna64U+QDqbRNjKYZ0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=xUNwl3C6voeJD2rRCyKdRxbG9w56TZU9bpsNI9yMySe/CGvOjRblyz6f7D38Z9y4Na
	HgFyGIlmCRjJJPvf7FXT6UZ3WkcLZ3Gq7/AcAF7M4+u1hghU6Q50SBh+sQC+ZPA4T/GI
	9LViqd5edCZza3uMvtXrnkXjT6BqD5TGamqxc=
Received: by 10.42.179.136 with SMTP id bq8mr3424050icb.144.1287967514153;
	Sun, 24 Oct 2010 17:45:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.42.164.194 with HTTP; Sun, 24 Oct 2010 17:44:54 -0700 (PDT)
In-Reply-To: <1281954040-17014-1-git-send-email-fransmeulenbroeks@gmail.com>
References: <1281954040-17014-1-git-send-email-fransmeulenbroeks@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 24 Oct 2010 17:44:54 -0700
Message-ID: <AANLkTik03sMrtSoTGuwcPp10hwhzDiF5Sw=R70xr-hwQ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
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
X-List-Received-Date: Mon, 25 Oct 2010 00:45:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 16, 2010 at 3:20 AM, Frans Meulenbroeks
<fransmeulenbroeks@gmail.com> wrote:
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

Please install the patch

Acked-by: Khem Raj <raj.khem@gmail.com>

>
> =C2=A0classes/utils.bbclass | =C2=A0 45 +--------------------------------=
------------
> =C2=A01 files changed, 1 insertions(+), 44 deletions(-)
> =C2=A0delete mode 100644 conf/checksums.ini
>
> diff --git a/classes/utils.bbclass b/classes/utils.bbclass
> index 7740ea3..83cf33c 100644
> --- a/classes/utils.bbclass
> +++ b/classes/utils.bbclass
> @@ -157,50 +157,7 @@ def base_get_checksums(pn, pv, src_uri, localpath, p=
arams, data):
> =C2=A0 =C2=A0 expected_md5sum =3D bb.data.getVarFlag("SRC_URI", md5flag, =
data)
> =C2=A0 =C2=A0 expected_sha256sum =3D bb.data.getVarFlag("SRC_URI", sha256=
flag, data)
>
> - =C2=A0 =C2=A0if (expected_md5sum and expected_sha256sum):
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0return (expected_md5sum,expected_sha256sum)
> - =C2=A0 =C2=A0else:
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0# missing checksum, parse checksums.ini
> -
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0# Verify the SHA and MD5 sums we have in OE =
and check what do
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0# in
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0checksum_paths =3D bb.data.getVar('BBPATH', =
data, True).split(":")
> -
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0# reverse the list to give precedence to dir=
ectories that
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0# appear first in BBPATH
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0checksum_paths.reverse()
> -
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0checksum_files =3D ["%s/conf/checksums.ini" =
% path for path in checksum_paths]
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0try:
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0parser =3D base_chk_load_parse=
r(checksum_files)
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0except ValueError:
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.note("No conf/checksums.ini=
 found, not checking checksums")
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return (None,None)
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0except:
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.note("Creating the CheckSum=
 parser failed: %s:%s" % (sys.exc_info()[0], sys.exc_info()[1]))
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return (None,None)
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0pn_pv_src =3D "%s-%s-%s" % (pn,pv,src_uri)
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0pn_src =C2=A0 =C2=A0=3D "%s-%s" % (pn,src_ur=
i)
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0if parser.has_section(pn_pv_src):
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0expected_md5sum =C2=A0 =C2=A0=
=3D parser.get(pn_pv_src, "md5")
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0expected_sha256sum =3D parser.=
get(pn_pv_src, "sha256")
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0elif parser.has_section(pn_src):
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0expected_md5sum =C2=A0 =C2=A0=
=3D parser.get(pn_src, "md5")
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0expected_sha256sum =3D parser.=
get(pn_src, "sha256")
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0elif parser.has_section(src_uri):
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0expected_md5sum =C2=A0 =C2=A0=
=3D parser.get(src_uri, "md5")
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0expected_sha256sum =3D parser.=
get(src_uri, "sha256")
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0else:
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return (None,None)
> -
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0if name:
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.note("This package has no c=
hecksums in corresponding recipe '%s', please consider moving its checksums=
 from checksums.ini file \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\nSRC_URI[%s.md5=
sum] =3D \"%s\"\nSRC_URI[%s.sha256sum] =3D \"%s\"\n" % (bb.data.getVar("FIL=
E", data, True), name, expected_md5sum, name, expected_sha256sum))
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0else:
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.note("This package has no c=
hecksums in corresponding recipe '%s', please consider moving its checksums=
 from checksums.ini file \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\nSRC_URI[md5sum=
] =3D \"%s\"\nSRC_URI[sha256sum] =3D \"%s\"\n" % (bb.data.getVar("FILE", da=
ta, True), expected_md5sum, expected_sha256sum))
> -
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0return (expected_md5sum, expected_sha256sum)
> + =C2=A0 =C2=A0return (expected_md5sum,expected_sha256sum)
>
> =C2=A0def base_chk_file(pn, pv, src_uri, localpath, params, data):
> =C2=A0 =C2=A0 (expected_md5sum, expected_sha256sum) =3D base_get_checksum=
s(pn, pv, src_uri, localpath, params, data)
> diff --git a/conf/checksums.ini b/conf/checksums.ini
> deleted file mode 100644
> index e69de29..0000000
> --
> 1.7.0.4
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


