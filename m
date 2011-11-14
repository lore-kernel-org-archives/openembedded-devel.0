Received: from comal.ext.ti.com ([198.47.26.152])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <vitap@ti.com>) id 1RPzpX-0000YN-Gj
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 Nov 2011 17:56:23 +0100
Received: from dlep34.itg.ti.com ([157.170.170.115])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id pAEGip2e018832
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Nov 2011 10:44:51 -0600
Received: from dlep26.itg.ti.com (smtp-le.itg.ti.com [157.170.170.27])
	by dlep34.itg.ti.com (8.13.7/8.13.8) with ESMTP id pAEGipRv025040
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Nov 2011 10:44:51 -0600 (CST)
Received: from DNCE72.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id pAEGiopr000017
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Nov 2011 10:44:51 -0600 (CST)
Received: from DNCE03.ent.ti.com ([fe80::19cb:d761:16a6:9b51]) by
	DNCE72.ent.ti.com ([fe80::8e3:61e5:a5b9:593c%23]) with mapi id
	14.01.0323.003; Mon, 14 Nov 2011 17:44:50 +0100
From: "Preskovsky, Vita" <vitap@ti.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [PATCH] bluez4: Add version 4.95 Signed-off-by: Vita
	Preskovsky <vitap@ti.com> Adds new recipe that builds bluez-4.95
	package
Thread-Index: AQHMouETTotIHQmWqkmPS38kmhsBtZWsfUCAgAAVBxA=
Date: Mon, 14 Nov 2011 16:44:49 +0000
Message-ID: <99AD691F1FA415449470C6EA37B6FE4608611C@DNCE03.ent.ti.com>
References: <1321284045-13726-1-git-send-email-vitap@ti.com>
	<j9rfbv$l9f$1@dough.gmane.org>
In-Reply-To: <j9rfbv$l9f$1@dough.gmane.org>
Accept-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [137.167.131.83]
x-exclaimer-md-config: f9c360f5-3d1e-4c3c-8703-f45bf52eff6b
MIME-Version: 1.0
Subject: Re: [PATCH] bluez4: Add version 4.95 Signed-off-by: Vita Preskovsky <vitap@ti.com> Adds new recipe that builds bluez-4.95 package
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
X-List-Received-Date: Mon, 14 Nov 2011 16:56:24 -0000
X-Groupsio-MsgNum: 35382
Content-Language: en-US
Content-Type: multipart/mixed;
	boundary="_002_99AD691F1FA415449470C6EA37B6FE4608611CDNCE03entticom_"

--_002_99AD691F1FA415449470C6EA37B6FE4608611CDNCE03entticom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

No. I made local branch to make this patch. I also used git send-email comm=
and to send this patch, which is usually succeeds. =20
I'm sending it as attachment.

Regards,
Vita.=20

-----Original Message-----
From: openembedded-devel-bounces@lists.openembedded.org [mailto:openembedde=
d-devel-bounces@lists.openembedded.org] On Behalf Of Koen Kooi
Sent: Monday, November 14, 2011 6:25 PM
To: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] [PATCH] bluez4: Add version 4.95 Signed-off-by: Vita Pres=
kovsky <vitap@ti.com> Adds new recipe that builds bluez-4.95 package

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 14-11-11 16:20, Vita Preskovsky schreef:
> Second version of the patch adresses comments made by community members.
> Checked on angstrom, version 2011.09.

Do you have a git tree to pull these patches from? It seems to have been
corrupted along the way.

regards,

Koen

> --- recipes/bluez/bluez4_4.95.bb |   30 ++++++++++++++++++++++++++++++ 1
> files changed, 30 insertions(+), 0 deletions(-) create mode 100644
> recipes/bluez/bluez4_4.95.bb
>=20
> diff --git a/recipes/bluez/bluez4_4.95.bb b/recipes/bluez/bluez4_4.95.bb=
=20
> new file mode 100644 index 0000000..290dff6 --- /dev/null +++
> b/recipes/bluez/bluez4_4.95.bb @@ -0,0 +1,30 @@ +require bluez4.inc +=20
> +SRC_URI =3D "\ +
> ${KERNELORG_MIRROR}/pub/linux/bluetooth/bluez-${PV}.tar.gz \ +
> file://bluetooth.conf \ +" +SRC_URI[md5sum] =3D
> "341294b2849a04a4afff5c96bfbf30b2" +SRC_URI[sha256sum] =3D
> "d6ea9de410fc2bcd2620d709c2202893b218e2e6a55c3c0ce6bebd27fa4120f6" +=20
> +DEFAULT_PREFERENCE =3D "-1" +DEFAULT_PREFERENCE_angstrom =3D "1" + +DEPE=
NDS
> +=3D "libsndfile1" + +PR =3D "${INC_PR}.0" + +# Not all distros have a re=
cent
> enough udev +BTUDEV =3D " --disable-udevrules" +BTUDEV_angstrom =3D "
> --enable-udevrules" +BTUDEV_shr =3D " --enable-udevrules" + +EXTRA_OECONF
> +=3D "${BTUDEV}" +do_configure_append(){ +	echo "#define
> LIBUDEV_I_KNOW_THE_API_IS_SUBJECT_TO_CHANGE" >> ${S}/config.h +} +=20
> +FILES_${PN}-dbg +=3D "\ +  ${base_libdir}/udev/.debug \ +
> ${libdir}/*/.debug \ +"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (Darwin)
Comment: GPGTools - http://gpgtools.org

iEYEARECAAYFAk7BQLwACgkQMkyGM64RGpFKeQCgjnEnJ3cOKn36Ibc4BzWWsaaE
84UAmgKh6u4JhlzxzemXqCwujwMQb9Iq
=3DhA5v
-----END PGP SIGNATURE-----


_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--_002_99AD691F1FA415449470C6EA37B6FE4608611CDNCE03entticom_
Content-Type: application/octet-stream;
	name="0001-bluez4-Add-version-4.95.patch"
Content-Description: 0001-bluez4-Add-version-4.95.patch
Content-Disposition: attachment;
	filename="0001-bluez4-Add-version-4.95.patch"; size=1531;
	creation-date="Mon, 14 Nov 2011 16:39:31 GMT";
	modification-date="Mon, 14 Nov 2011 16:39:31 GMT"
Content-Transfer-Encoding: base64

RnJvbSAxZTU3NjgyM2E1ODNmNWFhZjQwOWI5ZWQ5MTFhZjcxZTY0MjA5NWViIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBWaXRhIFByZXNrb3Zza3kgPHZpdGFwQHRpLmNvbT4KRGF0ZTog
TW9uLCAxNCBOb3YgMjAxMSAxNjowODoxMyArMDIwMApTdWJqZWN0OiBbUEFUQ0hdIGJsdWV6NDog
QWRkIHZlcnNpb24gNC45NQogU2lnbmVkLW9mZi1ieTogVml0YSBQcmVza292c2t5IDx2aXRhcEB0
aS5jb20+CiBBZGRzIG5ldyByZWNpcGUgdGhhdCBidWlsZHMgYmx1ZXotNC45NSBwYWNrYWdlCgog
U2Vjb25kIHZlcnNpb24gb2YgdGhlIHBhdGNoIGFkcmVzc2VzIGNvbW1lbnRzIG1hZGUgYnkgY29t
bXVuaXR5IAogbWVtYmVycy4gQ2hlY2tlZCBvbiBhbmdzdHJvbSwgdmVyc2lvbiAyMDExLjA5Lgot
LS0KIHJlY2lwZXMvYmx1ZXovYmx1ZXo0XzQuOTUuYmIgfCAgIDMwICsrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKwogMSBmaWxlcyBjaGFuZ2VkLCAzMCBpbnNlcnRpb25zKCspLCAwIGRlbGV0
aW9ucygtKQogY3JlYXRlIG1vZGUgMTAwNjQ0IHJlY2lwZXMvYmx1ZXovYmx1ZXo0XzQuOTUuYmIK
CmRpZmYgLS1naXQgYS9yZWNpcGVzL2JsdWV6L2JsdWV6NF80Ljk1LmJiIGIvcmVjaXBlcy9ibHVl
ei9ibHVlejRfNC45NS5iYgpuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwLi4yOTBk
ZmY2Ci0tLSAvZGV2L251bGwKKysrIGIvcmVjaXBlcy9ibHVlei9ibHVlejRfNC45NS5iYgpAQCAt
MCwwICsxLDMwIEBACityZXF1aXJlIGJsdWV6NC5pbmMKKworU1JDX1VSSSA9ICJcCisgICR7S0VS
TkVMT1JHX01JUlJPUn0vcHViL2xpbnV4L2JsdWV0b290aC9ibHVlei0ke1BWfS50YXIuZ3ogXAor
ICBmaWxlOi8vYmx1ZXRvb3RoLmNvbmYgXAorIgorU1JDX1VSSVttZDVzdW1dID0gIjM0MTI5NGIy
ODQ5YTA0YTRhZmZmNWM5NmJmYmYzMGIyIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImQ2ZWE5ZGU0
MTBmYzJiY2QyNjIwZDcwOWMyMjAyODkzYjIxOGUyZTZhNTVjM2MwY2U2YmViZDI3ZmE0MTIwZjYi
CisKK0RFRkFVTFRfUFJFRkVSRU5DRSA9ICItMSIKK0RFRkFVTFRfUFJFRkVSRU5DRV9hbmdzdHJv
bSA9ICIxIgorCitERVBFTkRTICs9ICJsaWJzbmRmaWxlMSIKKworUFIgPSAiJHtJTkNfUFJ9LjAi
CisKKyMgTm90IGFsbCBkaXN0cm9zIGhhdmUgYSByZWNlbnQgZW5vdWdoIHVkZXYKK0JUVURFViA9
ICIgLS1kaXNhYmxlLXVkZXZydWxlcyIKK0JUVURFVl9hbmdzdHJvbSA9ICIgLS1lbmFibGUtdWRl
dnJ1bGVzIgorQlRVREVWX3NociA9ICIgLS1lbmFibGUtdWRldnJ1bGVzIgorCitFWFRSQV9PRUNP
TkYgKz0gIiR7QlRVREVWfSIKK2RvX2NvbmZpZ3VyZV9hcHBlbmQoKXsKKwllY2hvICIjZGVmaW5l
IExJQlVERVZfSV9LTk9XX1RIRV9BUElfSVNfU1VCSkVDVF9UT19DSEFOR0UiID4+ICR7U30vY29u
ZmlnLmgKK30KKworRklMRVNfJHtQTn0tZGJnICs9ICJcCisgICR7YmFzZV9saWJkaXJ9L3VkZXYv
LmRlYnVnIFwKKyAgJHtsaWJkaXJ9LyovLmRlYnVnIFwKKyIKLS0gCjEuNy4wLjQKCg==

--_002_99AD691F1FA415449470C6EA37B6FE4608611CDNCE03entticom_--
