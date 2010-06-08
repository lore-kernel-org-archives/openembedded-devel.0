Received: from mail-fx0-f65.google.com ([209.85.161.65])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <majo.huber@googlemail.com>) id 1OLuLt-0001vS-0f
	for openembedded-devel@lists.openembedded.org;
	Tue, 08 Jun 2010 10:40:06 +0200
Received: by fxm10 with SMTP id 10so1170335fxm.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Jun 2010 01:35:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type:content-transfer-encoding;
	bh=Gdo9fnqzuVnKiKXzOiUoPnhx7+lJqYEffI0UYYj7W7M=;
	b=CUhSRtOGaEaOyua0lKPORN2WMzJWpoD1uMNFstMc6fxqTugn7HRAllGNIG8B0vD9ar
	HG+DkaKU0+gsv8bgGIyx0OzMmfEckvfQc0nUgCP+mWxPSkLUmHw32n/7MlLB38UZLX3G
	+md9WKN4XoMLkxawltWd5bFslS8/n+WG8hCIw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=googlemail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=I0DMlBPdf/Gmy9384WxoiUTqrQSW9tQ67K1aTdufdeJ9UKvaXLGaIgZTcMDsk04vWg
	qrzxZP0mrTLo8GwU/ZlJ7sfzpf1HsVCOSLfB4GiOaKxfGQxv09jeYM4WEHrztf58SNBV
	ycW582nFs3WoEyZG7c+nsApS6LcmgFTSZf/wk=
MIME-Version: 1.0
Received: by 10.239.142.211 with SMTP id h19mr1071053hba.211.1275986143918; 
	Tue, 08 Jun 2010 01:35:43 -0700 (PDT)
Received: by 10.239.191.205 with HTTP; Tue, 8 Jun 2010 01:35:43 -0700 (PDT)
Date: Tue, 8 Jun 2010 10:35:43 +0200
Message-ID: <AANLkTikDUVz4o6PWPVeopFdUMj7Jj4Seg3PoukWhXfBO@mail.gmail.com>
From: majo huber <majo.huber@googlemail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.65
X-SA-Exim-Mail-From: majo.huber@googlemail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH]qt4_addons: new recipie for qt thumbwheel
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
X-List-Received-Date: Tue, 08 Jun 2010 08:40:06 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

Hi,

sorry for the inconvenience and thanks for the help. I hopefully
configured git correct now for future use. I also hope that this post
now is correct.

---

 .../patches/qt4-thumbwheel-opensource_2.4.bb       |   33 ++++++++++++++++=
++++
 1 files changed, 33 insertions(+)
 create mode 100644 recipes/qt4_addons/qt4-thumbwheel-opensource_2.4.bb

diff --git a/recipes/qt4_addons/qt4-thumbwheel-opensource_2.4.bb
b/recipes/qt4_addons/qt4-thumbwheel-opensource_2.4.bb
new file mode 100644
index 0000000..1f7843a
--- /dev/null
+++ b/recipes/qt4_addons/qt4-thumbwheel-opensource_2.4.bb
@@ -0,0 +1,33 @@
+SECTION =3D "libs"
+PRIORITY =3D "optional"
+HOMEPAGE =3D "http://qt.nokia.com/downloads"
+LICENSE =3D "GPL LGPL"
+DEPENDS =3D "qt4-embedded"
+
+inherit qt4e autotools
+
+PR =3D "r0"
+
+SRC_URI =3D "ftp://ftp.qt.nokia.com/qt/solutions/lgpl/qtthumbwheel-2.4-ope=
nsource.tar.gz"
+
+S =3D "${WORKDIR}/qtthumbwheel-${PV}-opensource"
+
+do_configure() {
+  echo yes | ./configure -library
+  ${OE_QMAKE_QMAKE}
+}
+
+do_install() {
+  install -d ${D}${libdir}
+  install -m 0755 ${S}/lib/libQtSolutions_ThumbWheel-${PV}.so.1.0.0
${D}${libdir}
+  ln -sf libQtSolutions_ThumbWheel-${PV}.so.1.0.0
${D}${libdir}/libQtSolutions_ThumbWheel-${PV}.so.1.0
+  ln -sf libQtSolutions_ThumbWheel-${PV}.so.1.0.0
${D}${libdir}/libQtSolutions_ThumbWheel-${PV}.so.1
+  ln -sf libQtSolutions_ThumbWheel-${PV}.so.1.0.0
${D}${libdir}/libQtSolutions_ThumbWheel-${PV}.so
+}
+
+#ALLOW_EMPTY =3D ""
+RDEPENDS_${PN} =3D "libqt-embeddedgui4"
+FILES_${PN} =3D "${libdir}/lib*.so*"
+
+SRC_URI[md5sum] =3D 48765bb0e09c0d2e686eca59cb233df9
+SRC_URI[sha256sum] =3D
"fa3208deef718ef76a93a8d421880e89c9a86f1003ac28ed6e34e393f0544be7"

--=20
1.6.3.3




2010/6/7 Paul Menzel <paulepanter@users.sourceforge.net>:
> Dear majo,
>
>
> Am Montag, den 07.06.2010, 16:56 +0200 schrieb majo huber:
>
>> we have made a new recipie for building the qt thumbwheel (a
>> touchscreen encoder wheel for the qt library).
>
> thanks a lot.
>
>> I'd kindly request if anybody could push that to the dev branch.
>> I'd also suggest to put it in a separate directory e.g. called qt_addons=
.
>
> Could you please resend this properly formatted [1] so that the
> developers can commit this easily? That=92d be great.
>
> Especially tag the subject with [PATCH], create your proposed directory
> and provide a commit message. `git format-patch` and `git send-email`
> help you doing this.
>
>
> Thanks,
>
> Paul
>
>
> [1] http://wiki.openembedded.org/index.php/Commit_Policy
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>


