Received: from arroyo.ext.ti.com ([192.94.94.40])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <msprathap@ti.com>) id 1RQza9-0003Fg-Q1
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 Nov 2011 11:52:46 +0100
Received: from dbdp20.itg.ti.com ([172.24.170.38])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id pAHAhYD9005148
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Nov 2011 04:43:36 -0600
Received: from DBDE70.ent.ti.com (localhost [127.0.0.1])
	by dbdp20.itg.ti.com (8.13.8/8.13.8) with ESMTP id pAHAhXG2013069
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Nov 2011 16:13:33 +0530 (IST)
Received: from DBDE01.ent.ti.com ([fe80::d5df:c4b5:9919:4e10]) by
	DBDE70.ent.ti.com ([fe80::2141:513f:409:315a%21]) with mapi id
	14.01.0323.003; Thu, 17 Nov 2011 16:13:32 +0530
From: "Srinivas, Prathap" <msprathap@ti.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] Patches to add support for TI Linux Graphics SDK release
	04.04.00.02
Thread-Index: AcyIzd2+N3qNHV6OQ0qpVEOJ0yRTEAcRz4/Q
Date: Thu, 17 Nov 2011 10:43:31 +0000
Message-ID: <C2C4AB609E1BCF4689C1782E8F42E30A0279FE@DBDE01.ent.ti.com>
References: <5A47E75E594F054BAF48C5E4FC4B92AB038595A123@dbde02.ent.ti.com>
	<j73pg0$knr$1@dough.gmane.org>
	<5A47E75E594F054BAF48C5E4FC4B92AB038595A16D@dbde02.ent.ti.com>
	<j73rr4$5ar$1@dough.gmane.org>
In-Reply-To: <j73rr4$5ar$1@dough.gmane.org>
Accept-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-originating-ip: [172.24.133.21]
MIME-Version: 1.0
Subject: Re: Patches to add support for TI Linux Graphics SDK release 04.04.00.02
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
X-List-Received-Date: Thu, 17 Nov 2011 10:52:51 -0000
X-Groupsio-MsgNum: 35423
Content-Language: en-US
Content-Type: multipart/mixed;
	boundary="_004_C2C4AB609E1BCF4689C1782E8F42E30A0279FEDBDE01entticom_"

--_004_C2C4AB609E1BCF4689C1782E8F42E30A0279FEDBDE01entticom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

The comments provided have been addressed.
Please find the updated patches attached.

Thanks,
Prathap.

-----Original Message-----
From: openembedded-devel-bounces@lists.openembedded.org [mailto:openembedde=
d-devel-bounces@lists.openembedded.org] On Behalf Of Koen Kooi
Sent: Wednesday, October 12, 2011 4:28 PM
To: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] Patches to add support for TI Linux Graphics SDK release =
04.04.00.02

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 12-10-11 12:42, Srinivas, Prathap schreef:
> Thanks for the comments. Please find my responses inline.


>> diff --git a/recipes/powervr-drivers/libgles-omap3_4.04.00.02.bb=20
>> b/recipes/powervr-drivers/libgles-omap3_4.04.00.02.bb new file mode=20
>> 100644 index 0000000..c5062c1 --- /dev/null +++=20
>> b/recipes/powervr-drivers/libgles-omap3_4.04.00.02.bb @@ -0,0 +1,29 @@
>>  +BINLOCATION_omap3  =3D "${S}/gfx_rel_es3.x" +BINLOCATION_ti816x =3D=20
>> "${S}/gfx_rel_es6.x" + +ES2LOCATION =3D "${S}/gfx_rel_es2.x" +ES3LOCATIO=
N
>> =3D "${S}/gfx_rel_es3.x" +ES5LOCATION =3D "${S}/gfx_rel_es5.x" +ES6LOCAT=
ION
>> =3D "${S}/gfx_rel_es6.x"
>=20
> Since the above is being repeated in each recipe, shouldn't it move to
> the .inc? - I am just following in the way of already existing recipes.
> Existing recipes have this. If it still needs to be addressed, let me
> know.

It needs to be addressed, otherwise I wouldn't have mentioned it

>=20
>> --- /dev/null +++=20
>> b/recipes/powervr-drivers/omap3-sgx-modules_1.6.16.4117.bb
>=20
>> +MACHINE_KERNEL_PR_append =3D "i"
>=20
> Start at 'a' please, or remove it - I am just following in the way of
> already existing recipes. Existing recipes have this way only. If it
> still needs to be addressed, let me know.

It needs to be addressed, otherwise I wouldn't have mentioned it

>> +TI_PLATFORM_omap3 =3D "omap3630" +TI_PLATFORM_ti816x =3D "ti81xx" +=20
>> +MODULESLOCATION_omap3 =3D "dc_omapfb3_linux" +MODULESLOCATION_ti816x =
=3D=20
>> "dc_ti81xx_linux"
>=20
> Move to .inc? - I am just following in the way of already existing
> recipes. Existing recipes have this way only. If it still needs to be
> addressed, let me know.

It needs to be addressed, otherwise I wouldn't have mentioned it


>> diff --git a/recipes/powervr-drivers/libgles-omap3.inc=20
>> b/recipes/powervr-drivers/libgles-omap3.inc index 36c311d..e605681=20
>> 100644 --- a/recipes/powervr-drivers/libgles-omap3.inc +++=20
>> b/recipes/powervr-drivers/libgles-omap3.inc @@ -1,7 +1,7 @@ DESCRIPTION
>> =3D "libGLES for the omap3" LICENSE =3D "proprietary-binary"
>=20
>> -PR =3D "r15" +PR =3D "r16"
>=20
>> COMPATIBLE_MACHINE =3D "(omap3|ti816x)"
>=20
>> @@ -35,6 +35,13 @@ do_configure() { for i in $(find ${S} -name "*.h")=20
>> $(find ${S} -name "*.c") $(find ${S} -name "Make*") ; do chmod 0644 $i
>>  done + +	for drifile in $(find ${S} -name "libsrv_um_dri.so"); do + if
>> [ "$drifile" !=3D "" ] ; then +                        dir=3D$(dirname=20
>> ${drifile}) +                        rm -rf ${dir}/libsrv_um_dri.so +=20
>> fi +	done
>=20
> What does this try to fix exactly? - This fix is for the issue seen with
> opkg install of libgles-omap3_4.04.00.02-r16.6_armv7a.ipk on target. With
> Graphics SDK release 04.04.00.02, there are 2 versions of the library
> libsrv_um.so - one is libsrv_um.so and other is libsrv_um_dri.so (For
> Xorg driver). What we observed was in presence of libsrv_um_dri.so , the
> links created under /usr/lib were all by default linking to
> libsrv_um_dri.so only. Due to this demos used to fail. Now this fix makes
> sure that only 1 appropriate version of the library libsrv_um.so is
> present and hence links created will now be proper.
=3D

Please put that explanation in both the commit message and as a comment
about the for loop so people won't say "I am just following in the way of
already existing recipes" when this issues has been properly fixed.


-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFOlXKkMkyGM64RGpERAvROAKCCDqURb233i2eJ2mxdCNU2DoyhEACfXQmr
jB2nZhTMFSiQY0LWiRxYedE=3D
=3D1KC2
-----END PGP SIGNATURE-----


_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--_004_C2C4AB609E1BCF4689C1782E8F42E30A0279FEDBDE01entticom_
Content-Type: application/octet-stream;
	name="0003-libgles-omap3.inc-Fix-for-library-linking-isssue-wit.patch"
Content-Description: 0003-libgles-omap3.inc-Fix-for-library-linking-isssue-wit.patch
Content-Disposition: attachment;
	filename="0003-libgles-omap3.inc-Fix-for-library-linking-isssue-wit.patch";
	size=2351; creation-date="Thu, 17 Nov 2011 10:38:43 GMT";
	modification-date="Thu, 17 Nov 2011 10:31:47 GMT"
Content-Transfer-Encoding: base64

RnJvbSAwZmRhMGE5MTdmNzkxODg3N2Q2YzFhMTRlOTM1MTA4MTdjNGJmMGVjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBQcmF0aGFwIE0gUyA8bXNwcmF0aGFwQHRpLmNvbT4KRGF0ZTog
VGh1LCAxNyBOb3YgMjAxMSAxNTozNTowOCArMDUzMApTdWJqZWN0OiBbUEFUQ0ggdjIgMy8zXSBs
aWJnbGVzLW9tYXAzLmluYyA6IEZpeCBmb3IgbGlicmFyeSBsaW5raW5nIGlzc3N1ZSB3aXRoIGdy
YXBoaWNzIFNESwoKKiBUaGlzIGlzIHRoZSBmaXggZm9yIHRoZSBpc3N1ZSBzZWVuIHdpdGggb3Br
ZyBpbnN0YWxsIG9mIGxpYmdsZXMtb21hcDNfNC4wNC4wMC4wMi1yMTYuNl9hcm12N2EuaXBrIG9u
IHRhcmdldC4KKiBXaXRoIEdyYXBoaWNzIFNESyByZWxlYXNlIDA0LjA0LjAwLjAyIG9ud2FyZHMs
IHRoZXJlIGFyZSAyIHZlcnNpb25zIG9mIHRoZSBsaWJyYXJ5IGxpYnNydl91bS5zbyAtIG9uZSBp
cyBsaWJzcnZfdW0uc28gYW5kIG90aGVyIGlzIGxpYnNydl91bV9kcmkuc28gKEZvciBYb3JnIGRy
aXZlcikuSW4gcHJlc2VuY2Ugb2YgbGlic3J2X3VtX2RyaS5zbyAsIHRoZSBsaW5rcyBjcmVhdGVk
IHVuZGVyIC91c3IvbGliIHdlcmUgYWxsIGJ5IGRlZmF1bHQgbGlua2luZyB0byBsaWJzcnZfdW1f
ZHJpLnNvIG9ubHkuIER1ZSB0byB0aGlzIDNEIGRlbW9zIHdlcmUgZmFpbGluZy4KKiBUaGlzIGZp
eCBtYWtlcyBzdXJlIHRoYXQgb25seSBvbmUgYXBwcm9wcmlhdGUgdmVyc2lvbiBvZiB0aGUgbGli
cmFyeSBsaWJzcnZfdW0uc28gaXMgcHJlc2VudCBvbiB0YXJnZXQgYW5kIGhlbmNlIGxpbmtzIGNy
ZWF0ZWQgd2lsbCBub3cgYmUgcHJvcGVyLgoKU2lnbmVkLW9mZi1ieTogUHJhdGhhcCBNIFMgPG1z
cHJhdGhhcEB0aS5jb20+Ci0tLQogcmVjaXBlcy9wb3dlcnZyLWRyaXZlcnMvbGliZ2xlcy1vbWFw
My5pbmMgfCAgIDEyICsrKysrKysrKysrKwogMSBmaWxlcyBjaGFuZ2VkLCAxMiBpbnNlcnRpb25z
KCspLCAwIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3JlY2lwZXMvcG93ZXJ2ci1kcml2ZXJz
L2xpYmdsZXMtb21hcDMuaW5jIGIvcmVjaXBlcy9wb3dlcnZyLWRyaXZlcnMvbGliZ2xlcy1vbWFw
My5pbmMKaW5kZXggZjZiOTRiMC4uMTE5Zjc0YyAxMDA2NDQKLS0tIGEvcmVjaXBlcy9wb3dlcnZy
LWRyaXZlcnMvbGliZ2xlcy1vbWFwMy5pbmMKKysrIGIvcmVjaXBlcy9wb3dlcnZyLWRyaXZlcnMv
bGliZ2xlcy1vbWFwMy5pbmMKQEAgLTM4LDYgKzM4LDE4IEBAIGRvX2NvbmZpZ3VyZSgpIHsKIAkJ
Y2htb2QgMDY0NCAkaQogCWRvbmUgCiAKKwkjIFRoZSBiZWxvdyBmb3IgbG9vcCBpcyB0aGUgZml4
IGZvciB0aGUgaXNzdWUgc2VlbiB3aXRoIG9wa2cgaW5zdGFsbCBvZiBsaWJnbGVzLW9tYXAzXzQu
MDQuMDAuMDItcjE2LjZfYXJtdjdhLmlwayBvbiB0YXJnZXQuIAorCSMgV2l0aCBHcmFwaGljcyBT
REsgcmVsZWFzZSAwNC4wNC4wMC4wMiwgdGhlcmUgYXJlIDIgdmVyc2lvbnMgb2YgdGhlIGxpYnJh
cnkgbGlic3J2X3VtLnNvIC0gb25lIGlzIGxpYnNydl91bS5zbyBhbmQgb3RoZXIgaXMgbGlic3J2
X3VtX2RyaS5zbyAoRm9yIFhvcmcgZHJpdmVyKS4gCisJIyBJbiBwcmVzZW5jZSBvZiBsaWJzcnZf
dW1fZHJpLnNvICwgdGhlIGxpbmtzIGNyZWF0ZWQgdW5kZXIgL3Vzci9saWIgd2VyZSBhbGwgYnkg
ZGVmYXVsdCBsaW5raW5nIHRvIGxpYnNydl91bV9kcmkuc28gb25seS4gRHVlIHRvIHRoaXMgM0Qg
ZGVtb3Mgd2VyZSBmYWlsaW5nLiAKKwkjIE5vdyB0aGlzIGZpeCBtYWtlcyBzdXJlIHRoYXQgb25s
eSBvbmUgYXBwcm9wcmlhdGUgdmVyc2lvbiBvZiB0aGUgbGlicmFyeSBsaWJzcnZfdW0uc28gaXMg
cHJlc2VudCBvbiB0YXJnZXQgYW5kIGhlbmNlIGxpbmtzIGNyZWF0ZWQgd2lsbCBub3cgYmUgcHJv
cGVyLgorCisJZm9yIGRyaWZpbGUgaW4gJChmaW5kICR7U30gLW5hbWUgImxpYnNydl91bV9kcmku
c28iKTsgZG8KKwkJaWYgWyAiJGRyaWZpbGUiICE9ICIiIF0gOyB0aGVuCisJCQlkaXI9JChkaXJu
YW1lICR7ZHJpZmlsZX0pCisJCQlybSAtcmYgJHtkaXJ9L2xpYnNydl91bV9kcmkuc28KKwkJZmkK
Kwlkb25lCisKIAkjIEF0dGVtcHQgdG8gY3JlYXRlIHByb3BlciBsaWJyYXJ5IHNvZnRsaW5rcwog
CWZvciBzb2ZpbGUgaW4gJChmaW5kICR7U30gLW5hbWUgImxpYipPcGVuKi5zbyIpICQoZmluZCAk
e1N9IC1uYW1lICJsaWIqc3J2Ki5zbyIpICQoZmluZCAke1N9IC1uYW1lICJsaWIqZ2wqLnNvIikg
JChmaW5kICR7U30gLW5hbWUgImxpYnB2ciouc28iKSAkKGZpbmQgJHtTfSAtbmFtZSAibGliKkdM
Ki5zbyIpOyBkbwogCQlpZiBbICIkKHJlYWRsaW5rIC1uICR7c29maWxlfSkiID0gIiIgXSA7IHRo
ZW4KLS0gCjEuNy4xCgo=

--_004_C2C4AB609E1BCF4689C1782E8F42E30A0279FEDBDE01entticom_
Content-Type: application/octet-stream;
	name="0001-kernel.bbclass-stage-additional-directories.patch"
Content-Description: 0001-kernel.bbclass-stage-additional-directories.patch
Content-Disposition: attachment;
	filename="0001-kernel.bbclass-stage-additional-directories.patch"; size=1384;
	creation-date="Thu, 17 Nov 2011 10:38:44 GMT";
	modification-date="Thu, 17 Nov 2011 10:31:47 GMT"
Content-Transfer-Encoding: base64

RnJvbSBhOTgzNmVlNmE4ZjQzMzI0NWNmYTc0NmQ3YzdhNDU0N2EzMTFjYjU1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBQcmF0aGFwIE0gUyA8bXNwcmF0aGFwQHRpLmNvbT4KRGF0ZTog
VGh1LCAxNyBOb3YgMjAxMSAxNDoyMjozNSArMDUzMApTdWJqZWN0OiBbUEFUQ0ggdjIgMS8zXSBr
ZXJuZWwuYmJjbGFzczogc3RhZ2UgYWRkaXRpb25hbCBkaXJlY3RvcmllcwoKKiBUaGUgZ3JhcGhp
Y3MgU0RLIHJlcXVpcmVzIGFkZGl0aW9uYWwgZGlyZWN0b3JpZXMgdG8gYmUgc3RhZ2VkCiAgZm9y
IGNvbXBpbGF0aW9uLgoKU2lnbmVkLW9mZi1ieTogUHJhdGhhcCBNIFMgPG1zcHJhdGhhcEB0aS5j
b20+Ci0tLQogY2xhc3Nlcy9rZXJuZWwuYmJjbGFzcyB8ICAgIDIgKy0KIDEgZmlsZXMgY2hhbmdl
ZCwgMSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2NsYXNzZXMv
a2VybmVsLmJiY2xhc3MgYi9jbGFzc2VzL2tlcm5lbC5iYmNsYXNzCmluZGV4IDAxMDljZTYuLmJm
NzMxZTYgMTAwNjQ0Ci0tLSBhL2NsYXNzZXMva2VybmVsLmJiY2xhc3MKKysrIGIvY2xhc3Nlcy9r
ZXJuZWwuYmJjbGFzcwpAQCAtMTY4LDcgKzE2OCw3IEBAIHN5c3Jvb3Rfc3RhZ2VfYWxsX2FwcGVu
ZCgpIHsKIAlta2RpciAtcCAka2VybmVsZGlyL2luY2x1ZGUvYXNtLWdlbmVyaWMKIAljcCAtZlIg
aW5jbHVkZS9hc20tZ2VuZXJpYy8qICRrZXJuZWxkaXIvaW5jbHVkZS9hc20tZ2VuZXJpYy8KIAot
CWZvciBlbnRyeSBpbiBkcml2ZXJzL2NyeXB0byBkcml2ZXJzL21lZGlhIGluY2x1ZGUvZ2VuZXJh
dGVkIGluY2x1ZGUvbGludXggaW5jbHVkZS9uZXQgaW5jbHVkZS9wY21jaWEgaW5jbHVkZS9tZWRp
YSBpbmNsdWRlL2FjcGkgaW5jbHVkZS9zb3VuZCBpbmNsdWRlL3ZpZGVvIGluY2x1ZGUvc2NzaSBp
bmNsdWRlL3RyYWNlIGluY2x1ZGUvbXRkIGluY2x1ZGUvcmRtYSBpbmNsdWRlL2RybSBpbmNsdWRl
L3hlbiBjcnlwdG8vb2NmOyBkbworCWZvciBlbnRyeSBpbiBkcml2ZXJzL2NyeXB0byBkcml2ZXJz
L21lZGlhIGRyaXZlcnMvdmlkZW8gZHJpdmVycy9ncHUgZHJpdmVycy9iYXNlIGluY2x1ZGUvZ2Vu
ZXJhdGVkIGluY2x1ZGUvbGludXggaW5jbHVkZS9uZXQgaW5jbHVkZS9wY21jaWEgaW5jbHVkZS9t
ZWRpYSBpbmNsdWRlL2FjcGkgaW5jbHVkZS9zb3VuZCBpbmNsdWRlL3ZpZGVvIGluY2x1ZGUvc2Nz
aSBpbmNsdWRlL3RyYWNlIGluY2x1ZGUvbXRkIGluY2x1ZGUvcmRtYSBpbmNsdWRlL2RybSBpbmNs
dWRlL3hlbiBjcnlwdG8vb2NmOyBkbwogCQlpZiBbIC1kICRlbnRyeSBdOyB0aGVuCiAJCQlta2Rp
ciAtcCAka2VybmVsZGlyLyRlbnRyeQogCQkJY3AgLWZSICRlbnRyeS8qICRrZXJuZWxkaXIvJGVu
dHJ5LwotLSAKMS43LjEKCg==

--_004_C2C4AB609E1BCF4689C1782E8F42E30A0279FEDBDE01entticom_
Content-Type: application/octet-stream;
	name="0002-libgles-omap3_4.04.00.02-added-support-for-graphics-.patch"
Content-Description: 0002-libgles-omap3_4.04.00.02-added-support-for-graphics-.patch
Content-Disposition: attachment;
	filename="0002-libgles-omap3_4.04.00.02-added-support-for-graphics-.patch";
	size=4903; creation-date="Thu, 17 Nov 2011 10:38:44 GMT";
	modification-date="Thu, 17 Nov 2011 10:31:47 GMT"
Content-Transfer-Encoding: base64

RnJvbSBhZGI0NzVmMzg5NDEyZmUxOTNhNjU0ZWMwMDhhZTQ5ZmQ3YjllYmQ1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBQcmF0aGFwIE0gUyA8bXNwcmF0aGFwQHRpLmNvbT4KRGF0ZTog
VGh1LCAxNyBOb3YgMjAxMSAxNDozMDo1OSArMDUzMApTdWJqZWN0OiBbUEFUQ0ggdjIgMi8zXSBs
aWJnbGVzLW9tYXAzXzQuMDQuMDAuMDI6IGFkZGVkIHN1cHBvcnQgZm9yIGdyYXBoaWNzIHNkayAw
NC4wNC4wMC4wMgoKKiBBZGRlZCBzdXBwb3J0IGZvciBzZ3ggZGRrIDEuNi4xNi40MTE3CiogQWRk
ZWQgcG93ZXJ2ci5pbmMgdG8gaW5jbHVkZSB2YXJpYWJsZXMgY29tbW9uIHRvIGdyYXBoaWNzIFNE
SyByZWNpcGVzCiogQnVtcGVkIHVwIHRoZSBQUiBpbiBsaWJnbGVzLW9tYXAzLmluYwoKU2lnbmVk
LW9mZi1ieTogUHJhdGhhcCBNIFMgPG1zcHJhdGhhcEB0aS5jb20+Ci0tLQogcmVjaXBlcy9wb3dl
cnZyLWRyaXZlcnMvbGliZ2xlcy1vbWFwMy5pbmMgICAgICAgICAgfCAgICA0ICsrLQogLi4uL3Bv
d2VydnItZHJpdmVycy9saWJnbGVzLW9tYXAzXzQuMDQuMDAuMDIuYmIgICAgfCAgIDIxICsrKysr
KysrKysrCiAuLi4vb21hcDMtc2d4LW1vZHVsZXNfMS42LjE2LjQxMTcuYmIgICAgICAgICAgICAg
ICB8ICAgMzkgKysrKysrKysrKysrKysrKysrKysKIHJlY2lwZXMvcG93ZXJ2ci1kcml2ZXJzL3Bv
d2VydnIuaW5jICAgICAgICAgICAgICAgIHwgICAgNiArKysKIDQgZmlsZXMgY2hhbmdlZCwgNjkg
aW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbnMoLSkKIGNyZWF0ZSBtb2RlIDEwMDY0NCByZWNpcGVz
L3Bvd2VydnItZHJpdmVycy9saWJnbGVzLW9tYXAzXzQuMDQuMDAuMDIuYmIKIGNyZWF0ZSBtb2Rl
IDEwMDY0NCByZWNpcGVzL3Bvd2VydnItZHJpdmVycy9vbWFwMy1zZ3gtbW9kdWxlc18xLjYuMTYu
NDExNy5iYgogY3JlYXRlIG1vZGUgMTAwNjQ0IHJlY2lwZXMvcG93ZXJ2ci1kcml2ZXJzL3Bvd2Vy
dnIuaW5jCgpkaWZmIC0tZ2l0IGEvcmVjaXBlcy9wb3dlcnZyLWRyaXZlcnMvbGliZ2xlcy1vbWFw
My5pbmMgYi9yZWNpcGVzL3Bvd2VydnItZHJpdmVycy9saWJnbGVzLW9tYXAzLmluYwppbmRleCAz
NmMzMTFkLi5mNmI5NGIwIDEwMDY0NAotLS0gYS9yZWNpcGVzL3Bvd2VydnItZHJpdmVycy9saWJn
bGVzLW9tYXAzLmluYworKysgYi9yZWNpcGVzL3Bvd2VydnItZHJpdmVycy9saWJnbGVzLW9tYXAz
LmluYwpAQCAtMSw3ICsxLDcgQEAKIERFU0NSSVBUSU9OID0gImxpYkdMRVMgZm9yIHRoZSBvbWFw
MyIKIExJQ0VOU0UgPSAicHJvcHJpZXRhcnktYmluYXJ5IgogCi1QUiA9ICJyMTUiCitQUiA9ICJy
MTYiCiAKIENPTVBBVElCTEVfTUFDSElORSA9ICIob21hcDN8dGk4MTZ4KSIKIApAQCAtMjIsNiAr
MjIsOCBAQCBTID0gIiR7V09SS0RJUn0vT01BUDM1eF9HcmFwaGljc19TREtfJHtTR1hQVn0iCiBU
SV9CSU5fVU5QS19DTURTPSJZOiBxWTp3b3JrZGlyOlkiCiByZXF1aXJlIC4uL3RpL3RpLWV1bGEt
dW5wYWNrLmluYwogCitCSU5MT0NBVElPTl9vbWFwMyAgPSAiJHtTfS9nZnhfcmVsX2VzMy54Igor
QklOTE9DQVRJT05fdGk4MTZ4ID0gIiR7U30vZ2Z4X3JlbF9lczYueCIKIEJJTkxPQ0FUSU9OID89
ICIke1N9L2dmeF9yZWwiCiBFUzJMT0NBVElPTiA/PSAiJHtTfS9nZnhfcmVsX2VzMi54IgogRVMz
TE9DQVRJT04gPz0gIiR7U30vZ2Z4X3JlbF9lczMueCIKZGlmZiAtLWdpdCBhL3JlY2lwZXMvcG93
ZXJ2ci1kcml2ZXJzL2xpYmdsZXMtb21hcDNfNC4wNC4wMC4wMi5iYiBiL3JlY2lwZXMvcG93ZXJ2
ci1kcml2ZXJzL2xpYmdsZXMtb21hcDNfNC4wNC4wMC4wMi5iYgpuZXcgZmlsZSBtb2RlIDEwMDY0
NAppbmRleCAwMDAwMDAwLi5lOTVhNWQ4Ci0tLSAvZGV2L251bGwKKysrIGIvcmVjaXBlcy9wb3dl
cnZyLWRyaXZlcnMvbGliZ2xlcy1vbWFwM180LjA0LjAwLjAyLmJiCkBAIC0wLDAgKzEsMjEgQEAK
K3JlcXVpcmUgbGliZ2xlcy1vbWFwMy5pbmMKKworIyBkb3dubG9hZCByZXF1aXJlZCBiaW5hcnkg
ZGlzdHJpYnV0aW9uIGZyb206CisjIGh0dHA6Ly9zb2Z0d2FyZS1kbC50aS5jb20vZHNwcy9kc3Bz
X3B1YmxpY19zdy9zZG9fc2IvdGFyZ2V0Y29udGVudC9nZnhzZGsvbGF0ZXN0L2luZGV4X0ZEUy5o
dG1sCisjIHNlZSBsaWJnbGVzLW9tYXAzLmluYyBmb3IgZGV0YWlsZWQgaW5zdGFsbGF0aW9uIGlu
c3RydWN0aW9ucworCitTR1hQViA9ICI0XzA0XzAwXzAyIgorSU1HUFYgPSAiMS42LjE2LjQxMTci
CitCSU5GSUxFIDo9ICJHcmFwaGljc19TREtfc2V0dXBsaW51eF8ke1NHWFBWfS5iaW4iCisKK1NS
Q19VUkkgPSAiaHR0cDovL3NvZnR3YXJlLWRsLnRpLmNvbS9kc3BzL2RzcHNfcHVibGljX3N3L3Nk
b19zYi90YXJnZXRjb250ZW50L2dmeHNkay8ke1NHWFBWfS9leHBvcnRzL0dyYXBoaWNzX1NES19z
ZXR1cGxpbnV4XyR7U0dYUFZ9LmJpbiBcCisgICAgICAgICAgICAgICAgICAgZmlsZTovL2NwdXR5
cGUgXAorICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9yYy5wdnIgXAorICAgICAgICAgICAgICAg
ICAgIGZpbGU6Ly9zYW1wbGUuZGVza3RvcCBcCisgICAgICAgICAgICAgICAgICAgZmlsZTovLzk5
LWJ1ZmZlcmNsYXNzLnJ1bGVzICBcCisiCitTUkNfVVJJW21kNXN1bV0gPSAiOTAxMzI3NzY1YzA5
OTE5MDBhZmRhOTE0NzNmODQ3MjUiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiMmNlZDIzMjllYzgx
OWU0MmQ1N2VjYTFhMTExMjBiMDJlYzljMzMyZmI2M2JhYTBhNDEyODVlZWQwN2Q0YjQ4ZSIKKwor
UyA9ICIke1dPUktESVJ9L0dyYXBoaWNzX1NES18ke1NHWFBWfSIKKwpkaWZmIC0tZ2l0IGEvcmVj
aXBlcy9wb3dlcnZyLWRyaXZlcnMvb21hcDMtc2d4LW1vZHVsZXNfMS42LjE2LjQxMTcuYmIgYi9y
ZWNpcGVzL3Bvd2VydnItZHJpdmVycy9vbWFwMy1zZ3gtbW9kdWxlc18xLjYuMTYuNDExNy5iYgpu
ZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwLi40YzE5MzY4Ci0tLSAvZGV2L251bGwK
KysrIGIvcmVjaXBlcy9wb3dlcnZyLWRyaXZlcnMvb21hcDMtc2d4LW1vZHVsZXNfMS42LjE2LjQx
MTcuYmIKQEAgLTAsMCArMSwzOSBAQAorREVTQ1JJUFRJT04gPSAiS2VybmVsIGRyaXZlcnMgZm9y
IHRoZSBQb3dlclZSIFNHWCBjaGlwc2V0IGZvdW5kIGluIHRoZSBvbWFwMyBTb0NzIgorTElDRU5T
RSA9ICJHUEx2MiIKKworIyBkb3dubG9hZCByZXF1aXJlZCBiaW5hcnkgZGlzdHJpYnV0aW9uIGZy
b206CisjIGh0dHA6Ly9zb2Z0d2FyZS1kbC50aS5jb20vZHNwcy9kc3BzX3B1YmxpY19zdy9zZG9f
c2IvdGFyZ2V0Y29udGVudC9nZnhzZGsvbGF0ZXN0L2luZGV4X0ZEUy5odG1sCisjIHNlZSBsaWJn
bGVzLW9tYXAzLmluYyBmb3IgZGV0YWlsZWQgaW5zdGFsbGF0aW9uIGluc3RydWN0aW9ucworCitU
SV9CSU5fVU5QS19DTURTPSJZOiBxWTp3b3JrZGlyOlkiCityZXF1aXJlIC4uL3RpL3RpLWV1bGEt
dW5wYWNrLmluYworcmVxdWlyZSBwb3dlcnZyLmluYworCitTR1hQViA9ICI0XzA0XzAwXzAyIgor
SU1HUFYgPSAiMS42LjE2LjQxMTciCitCSU5GSUxFIDo9ICJHcmFwaGljc19TREtfc2V0dXBsaW51
eF8ke1NHWFBWfS5iaW4iCisKK2luaGVyaXQgbW9kdWxlCisKK01BQ0hJTkVfS0VSTkVMX1BSX2Fw
cGVuZCA9ICJhIgorCitTUkNfVVJJID0gImh0dHA6Ly9zb2Z0d2FyZS1kbC50aS5jb20vZHNwcy9k
c3BzX3B1YmxpY19zdy9zZG9fc2IvdGFyZ2V0Y29udGVudC9nZnhzZGsvJHtTR1hQVn0vZXhwb3J0
cy9HcmFwaGljc19TREtfc2V0dXBsaW51eF8ke1NHWFBWfS5iaW4gXAorICAgICAgICAgICBmaWxl
Oi8vQ29tcGlsZS1maXhlcy1mb3ItMzgta2VybmVsLnBhdGNoIFwKKyAgICAgICAgICAiCitTUkNf
VVJJW21kNXN1bV0gPSAiOTAxMzI3NzY1YzA5OTE5MDBhZmRhOTE0NzNmODQ3MjUiCitTUkNfVVJJ
W3NoYTI1NnN1bV0gPSAiMmNlZDIzMjllYzgxOWU0MmQ1N2VjYTFhMTExMjBiMDJlYzljMzMyZmI2
M2JhYTBhNDEyODVlZWQwN2Q0YjQ4ZSIKKworUyA9ICIke1dPUktESVJ9L0dyYXBoaWNzX1NES18k
e1NHWFBWfS9HRlhfTGludXhfS00iCisKK1BWUkJVSUxEID0gInJlbGVhc2UiCisKK1BBQ0tBR0Vf
U1RSSVAgPSAibm8iCisKK01BS0VfVEFSR0VUUyA9ICIgQlVJTEQ9JHtQVlJCVUlMRH0gVElfUExB
VEZPUk09JHtUSV9QTEFURk9STX0iCisKK2RvX2luc3RhbGwoKSB7CisJbWtkaXIgLXAgJHtEfS9s
aWIvbW9kdWxlcy8ke0tFUk5FTF9WRVJTSU9OfS9rZXJuZWwvZHJpdmVycy9ncHUvcHZyCisJY3Ag
JHtTfS9wdnJzcnZrbS5rbyAke0R9L2xpYi9tb2R1bGVzLyR7S0VSTkVMX1ZFUlNJT059L2tlcm5l
bC9kcml2ZXJzL2dwdS9wdnIKKwljcCAke1N9L3NlcnZpY2VzNC8zcmRwYXJ0eS8ke01PRFVMRVNM
T0NBVElPTn0vb21hcGxmYi5rbyAgJHtEfS9saWIvbW9kdWxlcy8ke0tFUk5FTF9WRVJTSU9OfS9r
ZXJuZWwvZHJpdmVycy9ncHUvcHZyCisJY3AgJHtTfS9zZXJ2aWNlczQvM3JkcGFydHkvYnVmZmVy
Y2xhc3NfdGkvYnVmZmVyY2xhc3NfdGkua28gJHtEfS9saWIvbW9kdWxlcy8ke0tFUk5FTF9WRVJT
SU9OfS9rZXJuZWwvZHJpdmVycy9ncHUvcHZyCit9CmRpZmYgLS1naXQgYS9yZWNpcGVzL3Bvd2Vy
dnItZHJpdmVycy9wb3dlcnZyLmluYyBiL3JlY2lwZXMvcG93ZXJ2ci1kcml2ZXJzL3Bvd2VydnIu
aW5jCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAuLjVjNjM3OWEKLS0tIC9kZXYv
bnVsbAorKysgYi9yZWNpcGVzL3Bvd2VydnItZHJpdmVycy9wb3dlcnZyLmluYwpAQCAtMCwwICsx
LDYgQEAKK1RJX1BMQVRGT1JNX29tYXAzID0gIm9tYXAzNjMwIgorVElfUExBVEZPUk1fdGk4MTZ4
ID0gInRpODF4eCIKKworTU9EVUxFU0xPQ0FUSU9OX29tYXAzID0gImRjX29tYXBmYjNfbGludXgi
CitNT0RVTEVTTE9DQVRJT05fdGk4MTZ4ID0gImRjX3RpODF4eF9saW51eCIKKwotLSAKMS43LjEK
Cg==

--_004_C2C4AB609E1BCF4689C1782E8F42E30A0279FEDBDE01entticom_--
