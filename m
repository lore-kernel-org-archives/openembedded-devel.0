Return-Path: <f.suligoi@asem.it>
X-Greylist: delayed 304 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 21 Dec 2016 12:55:21 UTC
Received: from smtp.asem.it (smtp.asem.it [151.22.69.122])
	by mail.openembedded.org (Postfix) with ESMTP id 1CD1971DF7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Dec 2016 12:55:21 +0000 (UTC)
Received: from webmail.asem.it by asem.it (smtp.asem.it)
	(SecurityGateway 4.0.1) with ESMTP id SG002479688.MSG 
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Dec 2016 13:50:15 +0100S
Received: from ASAS044.asem.intra (172.16.16.44) by ASAS044.asem.intra
	(172.16.16.44) with Microsoft SMTP Server (TLS) id 15.1.225.42;
	Wed, 21 Dec 2016 13:50:14 +0100
Received: from ASAS044.asem.intra ([::1]) by ASAS044.asem.intra ([::1]) with
	mapi id 15.01.0225.041; Wed, 21 Dec 2016 13:50:14 +0100
From: Flavio Suligoi <f.suligoi@asem.it>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [OE][meta-qt5] Runtime error with qt5.7
Thread-Index: AQHSW31TdqiV16rJ006UbtWQtIMkqQ==
Date: Wed, 21 Dec 2016 12:50:14 +0000
Message-ID: <32e1bacb35684936a5f570af7030495a@asem.it>
Accept-Language: it-IT, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [172.16.17.75]
MIME-Version: 1.0
X-SGHeloLookup-Result: hardfail smtp.helo=webmail.asem.it (does not match
	172.16.16.44)
X-SGSPF-Result: none (smtp.asem.it)
X-SGOP-RefID: str=0001.0A0B0203.585A7A87.0211, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0 (_st=1 _vt=0 _iwf=0)
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: [meta-qt5] Runtime error with qt5.7
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 21 Dec 2016 12:55:23 -0000
Content-Language: it-IT
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi all,


I'm using a i-MX6DL board.

Using the meta-qt5, branch "morty", when I try to execute the cinematicexpe=
rience I have the following error:


# export DISPLAY=3D:0.0

# export QT_DEBUG_PLUGINS=3D1

# cd /usr/share/cinematicexperience-1.0

# ./Qt5_CinematicExperience -platform xcb

...

...

...

...

Got keys from plugin meta data ("webp")
QFactoryLoader::QFactoryLoader() checking directory path "/usr/share/cinema=
ticexperience-1.0/imageformats" ...
loaded library "/usr/lib/qt5/plugins/imageformats/libqdds.so"
loaded library "/usr/lib/qt5/plugins/imageformats/libqgif.so"
loaded library "/usr/lib/qt5/plugins/imageformats/libqicns.so"
loaded library "/usr/lib/qt5/plugins/imageformats/libqico.so"
loaded library "/usr/lib/qt5/plugins/imageformats/libqjpeg.so"
loaded library "/usr/lib/qt5/plugins/imageformats/libqsvg.so"
loaded library "/usr/lib/qt5/plugins/imageformats/libqtga.so"
loaded library "/usr/lib/qt5/plugins/imageformats/libqtiff.so"
loaded library "/usr/lib/qt5/plugins/imageformats/libqwbmp.so"
loaded library "/usr/lib/qt5/plugins/imageformats/libqwebp.so"
libpng warning: iCCP: known incorrect sRGB profile
libpng warning: iCCP: known incorrect sRGB profile
QFactoryLoader::QFactoryLoader() checking directory path "/usr/lib/qt5/plug=
ins/accessiblebridge" ...
QFactoryLoader::QFactoryLoader() checking directory path "/usr/share/cinema=
ticexperience-1.0/accessiblebridge" ...
QXcbIntegration: Cannot create platform OpenGL context, neither GLX nor EGL=
 are enabled
Failed to create OpenGL context for format QSurfaceFormat(version 2.0, opti=
ons QFlags(), depthBufferSize 24, redBufferSize -1, greenBufferSize -1, blu=
eBufferSize -1, alphaBufferSize -1, stencilBufferSize 8, samples -1, swapBe=
havior 2, swapInterval 1, profile  0)
Aborted

#

Any idea?

Thanks,

Flavio

Flavio Suligoi
Software Engineer - Firmware

ASEM S.p.A.
Via Buia, 4, 33011 Artegna (UD) Italia
Tel +39 0432 967 477
Fax +39 0432 967 467
Email: f.suligoi@asem.it<mailto:f.suligoi@asem.it>
Internet: www.asem.it<https://webmail.asem.it/owa/redir.aspx?C=3Da-a2Td948U=
ebb2jLiaIQvpzVc2YeatEIIZa1ulJgnTNEZUdBP7YowxXvsufAL0bNRtCK6tS6e6g.&URL=3Dht=
tp%3a%2f%2fwww.asem.it%2f>

Questo messaggio =E8 equiparato a corrispondenza in busta chiusa. E' vietat=
a la sua diffusione, distribuzione, riproduzione e l'uso delle informazioni=
 contenute a chi non =E8 destinatario; il responsabile =E8 soggetto a conse=
guenze legali.Se avete ricevuto questo messaggio per errore, siete pregati =
di segnalarlo immediatamente al mittente e di distruggerlo (compresi i file=
 eventualmente allegati) senza farne copia.
This e-mail is confidential. If you are not the addressee or an authorized =
recipient of this message, any distribution, copying, publication or use of=
 this information for any purpose is strictly prohibited.Please, notify the=
 sender immediately by e-mail and then delete this message.

