Received: from [195.149.226.213] (helo=smtp.host4.kei.pl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <openembedded@hrw.one.pl>) id 1GmBW8-0005lO-Ur
	for openembedded-devel@openembedded.org; Mon, 20 Nov 2006 16:57:09 +0100
Received: (qmail 28219 invoked by uid 813007); 20 Nov 2006 15:54:27 -0000
X-clamdmail: clamdmail 0.18a
Received: from v813.rev.tld.pl (HELO ?192.168.1.90?)
	(marcin@hrw.one.pl@195.149.226.213)
	by smtp.host4.kei.pl with ESMTPA; 20 Nov 2006 15:54:27 -0000
From: Marcin Juszkiewicz <openembedded@hrw.one.pl>
Organization: OpenEmbedded
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 Nov 2006 16:54:18 +0100
User-Agent: KMail/1.9.5
References: <0EC479DC-CDAB-4F46-8910-E02AB1D9017B@inf.fu-berlin.de>
	<4561C0E1.1030001@dominion.kabel.utwente.nl>
	<4561C3F2.9040100@dominion.kabel.utwente.nl>
In-Reply-To: <4561C3F2.9040100@dominion.kabel.utwente.nl>
MIME-Version: 1.0
Message-Id: <200611201654.19160.openembedded@hrw.one.pl>
Subject: Re: ParseErrors, Continued
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 20 Nov 2006 15:57:09 -0000
Content-Type: text/plain;
  charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Dnia poniedzia=B3ek, 20 listopada 2006 16:04, Koen Kooi napisa=B3:
> Koen Kooi schreef:
> > Holger Freyther schreef:

> >> you have done a lot and we are at 459 parser errors and here is the
> >> list. If you fix it you can officially punch me to finish the parser.

> and 'only' 160 left in revision

35 errors left but I think that now parser need fixing.

ParseError: geode-drivers/geode-v4l2lx_2.6.11.bb :16=20
ParseError: images/e-image.bb :6=20
ParseError: tin/tin_1.9.1.bb :15=20

Those looks like this:

export EXTRA_CFLAGS +=3D " -DLINUX_2_6=3D1"

And those ones are:

require ${@bb.data.getVar('P', d , 1).replace('-native-', '_')}.bb


ParseError: perl/libalgorithm-diff-perl-native_1.1902.bb :5=20
ParseError: perl/libarchive-tar-perl-native_1.30.bb :5=20
ParseError: perl/libcache-cache-perl-native_1.05.bb :5=20
ParseError: perl/libclass-container-perl-native_0.12.bb :5=20
ParseError: perl/libclass-data-inheritable-perl-native_0.06.bb :5=20
ParseError: perl/libcompress-zlib-perl-native_1.42.bb :5=20
ParseError: perl/libdata-optlist-perl-native_0.101.bb :5=20
ParseError: perl/libdevel-stacktrace-perl-native_1.13.bb :5=20
ParseError: perl/libdigest-sha1-perl-native_2.11.bb :5=20
ParseError: perl/liberror-perl-native_0.17004.bb :5=20
ParseError: perl/libexception-class-perl-native_1.23.bb :5=20
ParseError: perl/libextutils-cbuilder-perl-native_0.18.bb :5=20
ParseError: perl/libextutils-parsexs-perl-native_2.16.bb :5=20
ParseError: perl/libintl-perl-native_1.11.bb :5=20
ParseError: perl/libintl-perl-native_1.16.bb :5=20
ParseError: perl/libio-zlib-perl-native_1.04.bb :5=20
ParseError: perl/libipc-sharelite-perl-native_0.09.bb :5=20
ParseError: perl/liblocale-gettext-perl-native_1.05.bb :5=20
ParseError: perl/liblog-dispatch-perl-native_2.13.bb :5=20
ParseError: perl/liblog-log4perl-perl-native_1.06.bb :5=20
ParseError: perl/libmodule-build-perl-native_0.2805.bb :5=20
ParseError: perl/libnet-ip-perl-native_1.25.bb :5=20
ParseError: perl/libparams-util-perl-native_0.20.bb :5=20
ParseError: perl/libparams-validate-perl-native_0.86.bb :5=20
ParseError: perl/libsub-exporter-perl-native_0.970.bb :5=20
ParseError: perl/libsub-install-perl-native_0.922.bb :5=20
ParseError: perl/libsub-uplevel-perl-native_0.13.bb :5=20
ParseError: perl/libtext-diff-perl-native_0.35.bb :5=20
ParseError: perl/libversion-perl-native_0.6701.bb :5=20
ParseError: perl/libxml-parser-perl-native_2.34.bb :5=20
ParseError: perl/libyaml-perl-native_0.62.bb :5
=20

=2D-=20
JID: hrw-jabber.org
OpenEmbedded developer/consultant

     This may seem a bit weird, but that's okay, because it is weird.
                     -- Perl documentation




