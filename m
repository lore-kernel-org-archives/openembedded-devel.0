Received: from mail-qy0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sylvain.pare@gmail.com>) id 1QeTyN-0004q6-R5
	for openembedded-devel@lists.openembedded.org;
	Wed, 06 Jul 2011 17:25:07 +0200
Received: by qyk30 with SMTP id 30so2548213qyk.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Jul 2011 08:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:from:date:message-id:subject:to:content-type;
	bh=vGpfQXkbvb5JyQjD8P95p/fDiLSEYH3gRw9oLqNMJSc=;
	b=wuEHjLaU29w80uj2trZ3wgs3mJ92bNNlvMLPCn9qPgTETF7rnIaR3YhDTra9NO95Oo
	+egcPhrP5BScisJZjJvWxh0QtDw/naK1XmNvG2iJWud/U6PBoxXsQx/meLD2N8Tf4tJ3
	zgHQp0uJCIpi+86raCxMzqO9CeADeMdXIzO8Y=
Received: by 10.229.79.20 with SMTP id n20mr6421357qck.275.1309965677107; Wed,
	06 Jul 2011 08:21:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.229.215.206 with HTTP; Wed, 6 Jul 2011 08:20:57 -0700 (PDT)
From: =?ISO-8859-1?Q?Sylvain_Par=E9?= <sylvain.pare@gmail.com>
Date: Wed, 6 Jul 2011 17:20:57 +0200
Message-ID: <CACrTVgKyLQ1UDqzUAcJACrsraPYfcOZf7c8HdfQOJsgTAx-r7A@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: [PATCH-proposal] fix vlc building (-fPIC error) by patching live555 recipe
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
X-List-Received-Date: Wed, 06 Jul 2011 15:25:08 -0000
X-Groupsio-MsgNum: 33011
Content-Type: multipart/mixed; boundary=00163646d9b3da1bc404a76826ea

--00163646d9b3da1bc404a76826ea
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi,

Attached a patch to fix this kind of error while building VLC :

libliveMedia.a: relocation R_ARM_MOVW_ABS_NC against `a local symbol' can
not be used when making a shared object; recompile with -fPIC
|
/home/sylvain/dev/SHR-Build/shr-unstable/tmp/sysroots/armv7a-oe-linux-gnuea=
bi/usr/lib/libliveMedia.a:
could not read symbols: Bad value
| collect2: ld returned 1 exit status

Let me know if it is not good enough, and if the patch is accepted.

Thanks by advance.

Regards,

Sylvain Par=E9 (aka GarthPS)

--00163646d9b3da1bc404a76826ea
Content-Type: application/octet-stream; 
	name="fix-fPIC-error-onbuilding-vlc.patch"
Content-Disposition: attachment; 
	filename="fix-fPIC-error-onbuilding-vlc.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_gpsfo38j0

ZGlmZiAtLWdpdCBhL3JlY2lwZXMvbGl2ZTU1NS9saXZlNTU1LmluYyBiL3JlY2lwZXMvbGl2ZTU1
NS9saXZlNTU1LmluYwppbmRleCAxNGU5N2JiLi43OTUxYjQ2IDEwMDY0NAotLS0gYS9yZWNpcGVz
L2xpdmU1NTUvbGl2ZTU1NS5pbmMKKysrIGIvcmVjaXBlcy9saXZlNTU1L2xpdmU1NTUuaW5jCkBA
IC0xOCw3ICsxOCw5IEBAIFRBUkdFVF9DQ19BUkNIICs9ICIke0xERkxBR1N9IgogCiBkb19jb25m
aWd1cmUoKSB7CiAJY3AgJHtXT1JLRElSfS9jb25maWcubGludXgtY3Jvc3MgLgorICAgICAgICBl
Y2hvICJDT01QSUxFX09QVFMrPSIgLWZQSUMgIiIgPj4gY29uZmlnLmxpbnV4LWNyb3NzCiAJLi9n
ZW5NYWtlZmlsZXMgbGludXgtY3Jvc3MKKyAgICAgICAgZmluZCAuIC1uYW1lICdNYWtlZmlsZScg
LWV4ZWMgZml4LW1ha2VmaWxlIHt9IFw7CiB9CiAKIGRvX2NvbXBpbGUoKSB7Cg==

--00163646d9b3da1bc404a76826ea--
