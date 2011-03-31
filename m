Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Q5Oko-0007Ip-9g
	for openembedded-devel@lists.openembedded.org;
	Thu, 31 Mar 2011 22:46:06 +0200
Received: by fxm19 with SMTP id 19so2465073fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Mar 2011 13:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=cmKHU31zxcwJrDj4ckId6yuBckJWlMGeIqPMk/AExA0=;
	b=AOUH5yONQijGu8yx/NkaC34cghoIRf1+pkoUHlg9dOluJLEBlc6ePyumfkVTh2tzcC
	3HARaso/59KxX5VrrdtnM5ZZdqrN2IkRbYZmsdd+9JV5mVQaY5Sr2IzVr5OHUZubn3nv
	ecD5kyqEbZU74v5KgQDP5vwAhfgwhcakvAzPA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=qTGCguApdz4pJlkQYvHYXd/QXyeQnyGW/YjTV5QvOyBS27Hc8es0htajPZKg3SXYRz
	wV3X3N3kBl1k1izOvOqvddZdpTcrmvteE6QUomI63PLufm2j4xgGiXoty+kHoaswXcsS
	iPQ1a2I/NRhTQ8iODfCqKsKBLveZmFSJdmP5w=
Received: by 10.223.77.71 with SMTP id f7mr1556711fak.141.1301604246068; Thu,
	31 Mar 2011 13:44:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.23.136 with HTTP; Thu, 31 Mar 2011 13:43:36 -0700 (PDT)
In-Reply-To: <1301520289-9284-1-git-send-email-denis@denix.org>
References: <1301520289-9284-1-git-send-email-denis@denix.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 31 Mar 2011 13:43:36 -0700
Message-ID: <AANLkTin0--M5S0Jf1V9D4xVWJ_kd2oXoXn3CMFnPc02p@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: Re: [PATCH] qt4: security advisory - blacklist fraudulent comodo certificates
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
X-List-Received-Date: Thu, 31 Mar 2011 20:46:06 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 30, 2011 at 2:24 PM, Denys Dmytriyenko <denis@denix.org> wrote:
> From: Denys Dmytriyenko <denys@ti.com>
>
> Security advisory: Blacklist fraudulent certificates. More info is in the
> patch and at the following links:
> http://www.comodo.com/Comodo-Fraud-Incident-2011-03-23.html
> http://qt.nokia.com/files/qt-patches/blacklist-fraudulent-comodo-certific=
ates-patch.diff/view
>
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>


Acked-by: Khem Raj <raj.khem@gmail.com>
> ---
> =C2=A0...klist-fraudulent-comodo-certificates-patch.diff | =C2=A0134 ++++=
++++++++++++++++
> =C2=A0recipes/qt4/qt-4.6.3.inc =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A08 +-
> =C2=A0recipes/qt4/qt-4.7.2.inc =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A03 +-
> =C2=A0recipes/qt4/qt4-embedded_4.6.3.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A02 +-
> =C2=A0recipes/qt4/qt4-embedded_4.7.2.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A02 +-
> =C2=A05 files changed, 141 insertions(+), 8 deletions(-)
> =C2=A0create mode 100644 recipes/qt4/files/blacklist-fraudulent-comodo-ce=
rtificates-patch.diff
>
> diff --git a/recipes/qt4/files/blacklist-fraudulent-comodo-certificates-p=
atch.diff b/recipes/qt4/files/blacklist-fraudulent-comodo-certificates-patc=
h.diff
> new file mode 100644
> index 0000000..00faf75
> --- /dev/null
> +++ b/recipes/qt4/files/blacklist-fraudulent-comodo-certificates-patch.di=
ff
> @@ -0,0 +1,134 @@
> +Security advisory: Fraudulent certificates
> +
> +Background:
> +
> +Recently a group of people managed to get fraudulent SSL certificates si=
gned
> +by a Certificate Authority (CA).
> +
> +These certificates potentially enable their owners to pretend to be othe=
r
> +entities on the Web; the attackers can present valid certificates for e.=
g.
> +mail.google.com, login.yahoo.com and login.live.com, among others.
> +
> +The patch below solves this problem by blacklisting those fake certifica=
tes
> +and aborting an SSL handshake with entities that present these certifica=
tes.
> +The patch applies to all 4.6 and 4.7 versions, and should be applied to =
all Qt
> +4.6.x and 4.7.x versions; upcoming Qt releases will contain a fix for th=
is
> +problem.
> +
> +More technical background:
> +
> +In order to trick a user into establishing an SSL connection to a site u=
sing
> +one of those fake certificates, in addition to controlling the certifica=
te, an
> +attacker would need to either control the DNS server used by the victim,=
 or
> +have control over a proxy that the victim uses. That way, the attacker c=
ould
> +trick the victim to connect to the attacker?s site and then present the =
user
> +with a valid certificate.
> +
> +One obvious question now is: Should those certificates not just be revok=
ed,
> +which would solve the problem?
> +
> +First, they have been revoked by the affected Certificate Authority (see=
 above
> +link).
> +
> +However, the problem in this case, and probably part of the reason why m=
ost
> +browser vendors release new versions blacklisting those certificates, is=
 that
> +by default browsers do not treat invalid responses from an OCSP server (=
a
> +server used for checking the revocation status of a certificate) as fata=
l, and
> +will allow the SSL connection to proceed anyway. Qt itself does not supp=
ort
> +OCSP yet, which makes blacklisting the certificates the only valid optio=
n (now
> +would be a good moment to vote on the task for implementing OCSP in Qt);=
 since
> +Qt is relying on the system root certificates since version 4.7, it cann=
ot
> +control the root certificates that Qt trusts automatically anymore.
> +
> +http://www.comodo.com/Comodo-Fraud-Incident-2011-03-23.html
> +http://qt.nokia.com/files/qt-patches/blacklist-fraudulent-comodo-certifi=
cates-patch.diff/view
> +
> +diff --git a/src/network/ssl/qsslcertificate.cpp b/src/network/ssl/qsslc=
ertificate.cpp
> +index 618ac79..a5cdf01 100644
> +--- a/src/network/ssl/qsslcertificate.cpp
> ++++ b/src/network/ssl/qsslcertificate.cpp
> +@@ -219,17 +219,19 @@ bool QSslCertificate::isNull() const
> + =C2=A0 =C2=A0 Returns true if this certificate is valid; otherwise retu=
rns
> + =C2=A0 =C2=A0 false.
> +
> +- =C2=A0 =C2=A0Note: Currently, this function only checks that the curre=
nt
> ++ =C2=A0 =C2=A0Note: Currently, this function checks that the current
> + =C2=A0 =C2=A0 data-time is within the date-time range during which the
> +- =C2=A0 =C2=A0certificate is considered valid. No other checks are
> +- =C2=A0 =C2=A0currently performed.
> ++ =C2=A0 =C2=A0certificate is considered valid, and checks that the
> ++ =C2=A0 =C2=A0certificate is not in a blacklist of fraudulent certifica=
tes.
> +
> + =C2=A0 =C2=A0 \sa isNull()
> + */
> + bool QSslCertificate::isValid() const
> + {
> + =C2=A0 =C2=A0 const QDateTime currentTime =3D QDateTime::currentDateTim=
e();
> +- =C2=A0 =C2=A0return currentTime >=3D d->notValidBefore && currentTime =
<=3D d->notValidAfter;
> ++ =C2=A0 =C2=A0return currentTime >=3D d->notValidBefore &&
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0currentTime <=3D d->notValidA=
fter &&
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0! QSslCertificatePrivate::isB=
lacklisted(*this);
> + }
> +
> + /*!
> +@@ -798,6 +800,30 @@ QList<QSslCertificate> QSslCertificatePrivate::cert=
ificatesFromDer(const QByteAr
> + =C2=A0 =C2=A0 return certificates;
> + }
> +
> ++// These certificates are known to be fraudulent and were created durin=
g the comodo
> ++// compromise. See http://www.comodo.com/Comodo-Fraud-Incident-2011-03-=
23.html
> ++static const char *certificate_blacklist[] =3D {
> ++ =C2=A0 =C2=A0"04:7e:cb:e9:fc:a5:5f:7b:d0:9e:ae:36:e1:0c:ae:1e",
> ++ =C2=A0 =C2=A0"f5:c8:6a:f3:61:62:f1:3a:64:f5:4f:6d:c9:58:7c:06",
> ++ =C2=A0 =C2=A0"d7:55:8f:da:f5:f1:10:5b:b2:13:28:2b:70:77:29:a3",
> ++ =C2=A0 =C2=A0"39:2a:43:4f:0e:07:df:1f:8a:a3:05:de:34:e0:c2:29",
> ++ =C2=A0 =C2=A0"3e:75:ce:d4:6b:69:30:21:21:88:30:ae:86:a8:2a:71",
> ++ =C2=A0 =C2=A0"e9:02:8b:95:78:e4:15:dc:1a:71:0a:2b:88:15:44:47",
> ++ =C2=A0 =C2=A0"92:39:d5:34:8f:40:d1:69:5a:74:54:70:e1:f2:3f:43",
> ++ =C2=A0 =C2=A0"b0:b7:13:3e:d0:96:f9:b5:6f:ae:91:c8:74:bd:3a:c0",
> ++ =C2=A0 =C2=A0"d8:f3:5f:4e:b7:87:2b:2d:ab:06:92:e3:15:38:2f:b0",
> ++ =C2=A0 =C2=A00
> ++};
> ++
> ++bool QSslCertificatePrivate::isBlacklisted(const QSslCertificate &certi=
ficate)
> ++{
> ++ =C2=A0 =C2=A0for (int a =3D 0; certificate_blacklist[a] !=3D 0; a++) {
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0if (certificate.serialNumber() =3D=3D certi=
ficate_blacklist[a])
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return true;
> ++ =C2=A0 =C2=A0}
> ++ =C2=A0 =C2=A0return false;
> ++}
> ++
> + #ifndef QT_NO_DEBUG_STREAM
> + QDebug operator<<(QDebug debug, const QSslCertificate &certificate)
> + {
> +diff --git a/src/network/ssl/qsslcertificate_p.h b/src/network/ssl/qsslc=
ertificate_p.h
> +index cdceb0f..1ce33d3 100644
> +--- a/src/network/ssl/qsslcertificate_p.h
> ++++ b/src/network/ssl/qsslcertificate_p.h
> +@@ -96,6 +96,7 @@ public:
> + =C2=A0 =C2=A0 static QSslCertificate QSslCertificate_from_X509(X509 *x5=
09);
> + =C2=A0 =C2=A0 static QList<QSslCertificate> certificatesFromPem(const Q=
ByteArray &pem, int count =3D -1);
> + =C2=A0 =C2=A0 static QList<QSslCertificate> certificatesFromDer(const Q=
ByteArray &der, int count =3D -1);
> ++ =C2=A0 =C2=A0static bool isBlacklisted(const QSslCertificate &certific=
ate);
> +
> + =C2=A0 =C2=A0 friend class QSslSocketBackendPrivate;
> +
> +diff --git a/src/network/ssl/qsslsocket_openssl.cpp b/src/network/ssl/qs=
slsocket_openssl.cpp
> +index 0866534..2427193 100644
> +--- a/src/network/ssl/qsslsocket_openssl.cpp
> ++++ b/src/network/ssl/qsslsocket_openssl.cpp
> +@@ -1193,6 +1193,13 @@ bool QSslSocketBackendPrivate::startHandshake()
> + =C2=A0 =C2=A0 X509 *x509 =3D q_SSL_get_peer_certificate(ssl);
> + =C2=A0 =C2=A0 configuration.peerCertificate =3D QSslCertificatePrivate:=
:QSslCertificate_from_X509(x509);
> + =C2=A0 =C2=A0 q_X509_free(x509);
> ++ =C2=A0 =C2=A0if (QSslCertificatePrivate::isBlacklisted(configuration.p=
eerCertificate)) {
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0q->setErrorString(QSslSocket::tr("The peer =
certificate is blacklisted"));
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0q->setSocketError(QAbstractSocket::SslHands=
hakeFailedError);
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0emit q->error(QAbstractSocket::SslHandshake=
FailedError);
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0plainSocket->disconnectFromHost();
> ++ =C2=A0 =C2=A0 =C2=A0 =C2=A0return false;
> ++ =C2=A0 =C2=A0}
> +
> + =C2=A0 =C2=A0 // Start translating errors.
> + =C2=A0 =C2=A0 QList<QSslError> errors;
> diff --git a/recipes/qt4/qt-4.6.3.inc b/recipes/qt4/qt-4.6.3.inc
> index 5b91116..77c5cf6 100644
> --- a/recipes/qt4/qt-4.6.3.inc
> +++ b/recipes/qt4/qt-4.6.3.inc
> @@ -1,11 +1,14 @@
> =C2=A0DEFAULT_PREFERENCE =3D "-1"
> +LICENSE =3D "LGPLv2.1 GPLv3"
>
> =C2=A0FILESPATHPKG .=3D ":qt-${PV}"
>
> =C2=A0SRC_URI =3D "ftp://ftp.trolltech.com/qt/source/qt-everywhere-openso=
urce-src-${PV}.tar.gz \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://blacklist-fraudulent-comodo-c=
ertificates-patch.diff \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-cross-compile.patch =
\
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0002-fix-resinit-declarat=
ion.patch \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0004-no-qmake.patch \
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://hack-out-pg_config.patch \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0006-freetype-host-includ=
es.patch \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0008-qt-lib-infix.patch \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0009-support-2bpp.patch \
> @@ -64,10 +67,5 @@ do_install_append() {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0fi
> =C2=A0}
>
> -LICENSE =3D "LGPLv2.1 GPLv3"
> -SRC_URI +=3D " \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://hack-out-pg_config.patc=
h"
> -
> =C2=A0SRC_URI[md5sum] =3D "5c69f16d452b0bb3d44bc3c10556c072"
> =C2=A0SRC_URI[sha256sum] =3D "f4e0ada8d4d516bbb8600a3ee7d9046c9c79e38cd78=
1df9ffc46d8f16acd1768"
> -
> diff --git a/recipes/qt4/qt-4.7.2.inc b/recipes/qt4/qt-4.7.2.inc
> index 282bc82..e6a7b90 100644
> --- a/recipes/qt4/qt-4.7.2.inc
> +++ b/recipes/qt4/qt-4.7.2.inc
> @@ -5,8 +5,9 @@ FILESPATHPKG =3D. "qt-${PV}:"
>
> =C2=A0SRC_URI =3D "\
> =C2=A0 =C2=A0 =C2=A0 =C2=A0ftp://ftp.trolltech.com/qt/source/qt-everywher=
e-opensource-src-${PV}.tar.gz \
> + =C2=A0 =C2=A0 =C2=A0 file://blacklist-fraudulent-comodo-certificates-pa=
tch.diff \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0004-no-qmake.patch \
> - =C2=A0 =C2=A0file://hack-out-pg2-4.7.0.patch \
> + =C2=A0 =C2=A0 =C2=A0 file://hack-out-pg2-4.7.0.patch \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0006-freetype-host-includes.patch \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Added-Openembedded-crossarch-optio=
n.patch \
> =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0010-phonon-gstreamer-rgb-endianess.pat=
ch \
> diff --git a/recipes/qt4/qt4-embedded_4.6.3.bb b/recipes/qt4/qt4-embedded=
_4.6.3.bb
> index 13f3f00..fe49fdb 100644
> --- a/recipes/qt4/qt4-embedded_4.6.3.bb
> +++ b/recipes/qt4/qt4-embedded_4.6.3.bb
> @@ -1,6 +1,6 @@
> =C2=A0require qt4-embedded.inc
>
> -PR =3D "${INC_PR}.1"
> +PR =3D "${INC_PR}.2"
>
> =C2=A0QT_CONFIG_FLAGS_append_armv6 =3D " -no-neon "
>
> diff --git a/recipes/qt4/qt4-embedded_4.7.2.bb b/recipes/qt4/qt4-embedded=
_4.7.2.bb
> index 1cd43a6..7e3d4b8 100644
> --- a/recipes/qt4/qt4-embedded_4.7.2.bb
> +++ b/recipes/qt4/qt4-embedded_4.7.2.bb
> @@ -2,7 +2,7 @@ DEFAULT_PREFERENCE =3D "-1"
>
> =C2=A0require qt4-embedded.inc
>
> -PR =3D "${INC_PR}.0"
> +PR =3D "${INC_PR}.1"
>
> =C2=A0QT_CONFIG_FLAGS_append_armv6 =3D " -no-neon "
>
> --
> 1.7.0.4
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


