Received: from static.26.116.47.78.clients.your-server.de ([78.47.116.26]
	helo=phalanx.drlauer-research.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mickey@vanille-media.de>) id 1Or5m9-0006qE-Db
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Sep 2010 11:08:06 +0200
Received: from [192.168.1.14] (e180147196.adsl.alicedsl.de [85.180.147.196])
	by phalanx.drlauer-research.com (Postfix) with ESMTP id CE0695841A8
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Sep 2010 11:12:22 +0200 (CEST)
Mime-Version: 1.0 (Apple Message framework v1081)
From: "Dr. Michael Lauer" <mickey@vanille-media.de>
In-Reply-To: <AANLkTinLwurfepxhQvdybNHtMvx_Jq8Gv+26pJe1TgYC@mail.gmail.com>
Date: Thu, 2 Sep 2010 11:07:32 +0200
Message-Id: <1868EC98-4D23-4314-8EA2-52E69D4BD184@vanille-media.de>
References: <1281954040-17014-1-git-send-email-fransmeulenbroeks@gmail.com>
	<AANLkTinLwurfepxhQvdybNHtMvx_Jq8Gv+26pJe1TgYC@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.1081)
X-SA-Exim-Connect-IP: 78.47.116.26
X-SA-Exim-Mail-From: mickey@vanille-media.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
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
X-List-Received-Date: Thu, 02 Sep 2010 09:08:06 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Acked-by: Michael 'Mickey' Lauer <mickey@vanille-media.de>

Am 02.09.2010 um 11:02 schrieb Frans Meulenbroeks:

> Bump
>=20
> 2010/8/16 Frans Meulenbroeks <fransmeulenbroeks@gmail.com>:
>> Signed-off-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
>> ---
>>=20
>> As we have checksums in recipes for quite a while now, I feel the =
time has come to
>> remove the checksums.ini code from utils.bbclass and to remove the =
(now empty)
>> checksums.ini file.
>>=20
>> Attached is the patch.
>> Your feedback is appreciated
>>=20
>>  classes/utils.bbclass |   45 =
+--------------------------------------------
>>  1 files changed, 1 insertions(+), 44 deletions(-)
>>  delete mode 100644 conf/checksums.ini
>>=20
>> diff --git a/classes/utils.bbclass b/classes/utils.bbclass
>> index 7740ea3..83cf33c 100644
>> --- a/classes/utils.bbclass
>> +++ b/classes/utils.bbclass
>> @@ -157,50 +157,7 @@ def base_get_checksums(pn, pv, src_uri, =
localpath, params, data):
>>     expected_md5sum =3D bb.data.getVarFlag("SRC_URI", md5flag, data)
>>     expected_sha256sum =3D bb.data.getVarFlag("SRC_URI", sha256flag, =
data)
>>=20
>> -    if (expected_md5sum and expected_sha256sum):
>> -        return (expected_md5sum,expected_sha256sum)
>> -    else:
>> -        # missing checksum, parse checksums.ini
>> -
>> -        # Verify the SHA and MD5 sums we have in OE and check what =
do
>> -        # in
>> -        checksum_paths =3D bb.data.getVar('BBPATH', data, =
True).split(":")
>> -
>> -        # reverse the list to give precedence to directories that
>> -        # appear first in BBPATH
>> -        checksum_paths.reverse()
>> -
>> -        checksum_files =3D ["%s/conf/checksums.ini" % path for path =
in checksum_paths]
>> -        try:
>> -            parser =3D base_chk_load_parser(checksum_files)
>> -        except ValueError:
>> -            bb.note("No conf/checksums.ini found, not checking =
checksums")
>> -            return (None,None)
>> -        except:
>> -            bb.note("Creating the CheckSum parser failed: %s:%s" % =
(sys.exc_info()[0], sys.exc_info()[1]))
>> -            return (None,None)
>> -        pn_pv_src =3D "%s-%s-%s" % (pn,pv,src_uri)
>> -        pn_src    =3D "%s-%s" % (pn,src_uri)
>> -        if parser.has_section(pn_pv_src):
>> -            expected_md5sum    =3D parser.get(pn_pv_src, "md5")
>> -            expected_sha256sum =3D parser.get(pn_pv_src, "sha256")
>> -        elif parser.has_section(pn_src):
>> -            expected_md5sum    =3D parser.get(pn_src, "md5")
>> -            expected_sha256sum =3D parser.get(pn_src, "sha256")
>> -        elif parser.has_section(src_uri):
>> -            expected_md5sum    =3D parser.get(src_uri, "md5")
>> -            expected_sha256sum =3D parser.get(src_uri, "sha256")
>> -        else:
>> -            return (None,None)
>> -
>> -        if name:
>> -            bb.note("This package has no checksums in corresponding =
recipe '%s', please consider moving its checksums from checksums.ini =
file \
>> -                \nSRC_URI[%s.md5sum] =3D =
\"%s\"\nSRC_URI[%s.sha256sum] =3D \"%s\"\n" % (bb.data.getVar("FILE", =
data, True), name, expected_md5sum, name, expected_sha256sum))
>> -        else:
>> -            bb.note("This package has no checksums in corresponding =
recipe '%s', please consider moving its checksums from checksums.ini =
file \
>> -                \nSRC_URI[md5sum] =3D \"%s\"\nSRC_URI[sha256sum] =3D =
\"%s\"\n" % (bb.data.getVar("FILE", data, True), expected_md5sum, =
expected_sha256sum))
>> -
>> -        return (expected_md5sum, expected_sha256sum)
>> +    return (expected_md5sum,expected_sha256sum)
>>=20
>>  def base_chk_file(pn, pv, src_uri, localpath, params, data):
>>     (expected_md5sum, expected_sha256sum) =3D base_get_checksums(pn, =
pv, src_uri, localpath, params, data)
>> diff --git a/conf/checksums.ini b/conf/checksums.ini
>> deleted file mode 100644
>> index e69de29..0000000
>> --
>> 1.7.0.4
>>=20
>>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



