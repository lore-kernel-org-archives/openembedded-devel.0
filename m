Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1PYfMZ-00055V-02 for openembedded-devel@lists.openembedded.org;
	Fri, 31 Dec 2010 14:49:47 +0100
Received: from f053039212.adsl.alicedsl.de ([78.53.39.212]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1PYfMI-00065F-Jx for openembedded-devel@lists.openembedded.org;
	Fri, 31 Dec 2010 13:49:31 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 31 Dec 2010 14:49:29 +0100
Message-ID: <1293803369.6161.23.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.3 
Subject: perl program breakage: `Can't locate Config_heavy-arm-oe-linux-gnueabi.pl`
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
X-List-Received-Date: Fri, 31 Dec 2010 13:49:47 -0000
X-Groupsio-MsgNum: 27604
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-kGX1ZsSTCTThYs57SojQ"

--=-kGX1ZsSTCTThYs57SojQ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear OE folks,


several Perl recipes do not build anymore with current master with
`angstrom-2008.1` or `minimal` for `MACHINE =3D "beagleboard"`.

Here is the output from `libhtml-treebuilder-perl-3.23-r4`.

        $ more libhtml-treebuilder-perl-3.23-r4/temp/log.do_configure.28213
        Can't locate Config_heavy-arm-oe-linux-gnueabi.pl in @INC (@INC con=
tains: /oe/build-minimal-eglibc/minimal-dev/sysroots/i686-linux/usr/lib/per=
l/5.8.8 /oe/build-minimal-eglibc/minimal-dev/sysroots/i686-linux/usr/lib/pe=
rl/5.8.8 /oe/build-minimal-eglibc/minimal-dev/sysroots/i686-linux/usr/lib/p=
erl/5.8.8 /oe/build-minimal-eglibc/minimal-dev/sysroots/i686-linux/usr/lib/=
perl /oe/build-minimal-eglibc/minimal-dev/sysroots/i686-linux/usr/lib/perl/=
5.8.8 /oe/build-minimal-eglibc/minimal-dev/sysroots/i686-linux/usr/lib/perl=
/5.8.8 /oe/build-minimal-eglibc/minimal-dev/sysroots/i686-linux/usr/lib/per=
l .) at /oe/build-minimal-eglibc/minimal-dev/sysroots/i686-linux/usr/lib/pe=
rl/5.8.8/Config.pm line 71.
        Compilation failed in require at /oe/build-minimal-eglibc/minimal-d=
ev/sysroots/i686-linux/usr/lib/perl/5.8.8/ExtUtils/MakeMaker.pm line 7.
        BEGIN failed--compilation aborted at /oe/build-minimal-eglibc/minim=
al-dev/sysroots/i686-linux/usr/lib/perl/5.8.8/ExtUtils/MakeMaker.pm line 7.
        Compilation failed in require at Makefile.PL line 2.
        BEGIN failed--compilation aborted at Makefile.PL line 2.
        yes: standard output: Broken pipe
        yes: write error
        ERROR: Function do_configure failed

The following recipes also did not build.

        ERROR: '/oe/openembedded/recipes/perl/libio-compress-zlib-perl_2.01=
5.bb' failed
        ERROR: '/oe/openembedded/recipes/perl/libcompress-raw-zlib-perl_2.0=
23.bb' failed
        ERROR: '/oe/openembedded/recipes/perl/libio-compress-base-perl_2.01=
5.bb' failed
        ERROR: '/oe/openembedded/recipes/perl/libhtml-tagset-perl_3.20.bb' =
failed
        ERROR: '/oe/openembedded/recipes/perl/libcompress-zlib-perl_2.015.b=
b' failed
        ERROR: '/oe/openembedded/recipes/perl/libio-zlib-perl_1.10.bb' fail=
ed
        ERROR: '/oe/openembedded/recipes/perl/libxml-namespacesupport-perl_=
1.11.bb' failed
        ERROR: '/oe/openembedded/recipes/perl/libipc-sharelite-perl_0.09.bb=
' failed
        ERROR: '/oe/openembedded/recipes/perl/liberror-perl_0.17016.bb' fai=
led
        ERROR: '/oe/openembedded/recipes/perl/libdigest-sha1-perl_2.11.bb' =
failed
        ERROR: '/oe/openembedded/recipes/perl/libhtml-parser-perl_3.64.bb' =
failed
        ERROR: '/oe/openembedded/recipes/perl/liburi-perl_1.55.bb' failed
        ERROR: '/oe/openembedded/recipes/perl/libxml-sax-perl_0.96.bb' fail=
ed
        ERROR: '/oe/openembedded/recipes/perl/libtimedate-perl_1.20.bb' fai=
led
        ERROR: '/oe/openembedded/recipes/perl/libxml-parser-perl_2.36.bb' f=
ailed
        ERROR: '/oe/openembedded/recipes/perl/libwww-perl_5.834.bb' failed
        ERROR: '/oe/openembedded/recipes/perl/libtest-pod-perl_1.42.bb' fai=
led
        ERROR: '/oe/openembedded/recipes/perl/libarchive-tar-perl_1.30.bb' =
failed
        ERROR: '/oe/openembedded/recipes/perl/libextutils-parsexs-perl_2.16=
.bb' failed
        ERROR: '/oe/openembedded/recipes/perl/libextutils-cbuilder-perl_0.1=
8.bb' failed
        ERROR: '/oe/openembedded/recipes/perl/libversion-perl_0.82.bb' fail=
ed
        ERROR: '/oe/openembedded/recipes/perl/libyaml-perl_0.62.bb' failed
        ERROR: '/oe/openembedded/recipes/perl/libio-stringy-perl_2.110.bb' =
failed
        ERROR: '/oe/openembedded/recipes/perl/libnet-ssleay-perl_1.36.bb' f=
ailed
        ERROR: '/oe/openembedded/recipes/perl/libmailtools-perl_2.06.bb' fa=
iled
        ERROR: '/oe/openembedded/recipes/perl/libtermreadkey-perl_2.30.bb' =
failed
        ERROR: '/oe/openembedded/recipes/perl/libxml-regexp-perl_0.03.bb' f=
ailed
        ERROR: '/oe/openembedded/recipes/perl/libclass-methodmaker-perl_2.1=
5.bb' failed
        ERROR: '/oe/openembedded/recipes/perl/libclass-inspector-perl_1.24.=
bb' failed
        ERROR: '/oe/openembedded/recipes/perl/libio-socket-ssl-perl_1.32.bb=
' failed
        ERROR: '/oe/openembedded/recipes/perl/libtask-weaken-perl_1.03.bb' =
failed
        ERROR: '/oe/openembedded/recipes/perl/libmime-tools-perl_5.427.bb' =
failed
        ERROR: '/oe/openembedded/recipes/perl/libxml-writer-perl_0.606.bb' =
failed
        ERROR: '/oe/openembedded/recipes/perl/libxml-twig-perl_3.35.bb' fai=
led
        ERROR: '/oe/openembedded/recipes/perl/libwww-mechanize-perl_1.60.bb=
' failed
        ERROR: '/oe/openembedded/recipes/perl/libunicode-utf8simple-perl_1.=
06.bb' failed
        ERROR: '/oe/openembedded/recipes/perl/libunicode-string-perl_2.09.b=
b' failed
        ERROR: '/oe/openembedded/recipes/perl/libterm-progressbar-perl_2.09=
.bb' failed
        ERROR: '/oe/openembedded/recipes/perl/libsoap-lite-perl_0.712.bb' f=
ailed
        ERROR: '/oe/openembedded/recipes/perl/liblinux-dvb-perl_1.0.bb' fai=
led
        ERROR: '/oe/openembedded/recipes/perl/liblingua-en-numbers-ordinate=
_1.02.bb' failed
        ERROR: '/oe/openembedded/recipes/perl/libxml-dom-perl_1.44.bb' fail=
ed
        ERROR: '/oe/openembedded/recipes/perl/libhttp-cache-transparent-per=
l_1.0.bb' failed
        ERROR: '/oe/openembedded/recipes/perl/libhtml-treebuilder-perl_3.23=
.bb' failed
        ERROR: '/oe/openembedded/recipes/perl/libfile-slurp-perl_9999.13.bb=
' failed
        ERROR: '/oe/openembedded/recipes/perl/libdatetime-format-strptime-p=
erl_1.1000.bb' failed
        ERROR: '/oe/openembedded/recipes/perl/libdate-manip-perl_5.54.bb' f=
ailed
        ERROR: '/oe/openembedded/recipes/perl/libarchive-zip-perl_1.30.bb' =
failed
        ERROR: '/oe/openembedded/recipes/xbmc/xbmc_svn.bb' failed
        ERROR: '/oe/openembedded/recipes/evince/evince_2.30.0.bb' failed
        ERROR: '/oe/openembedded/recipes/perl/libio-compress-zlib-perl_2.01=
5.bb' failed
        ERROR: '/oe/openembedded/recipes/perl/libcompress-raw-zlib-perl_2.0=
23.bb' failed
        ERROR: '/oe/openembedded/recipes/perl/libio-compress-base-perl_2.01=
5.bb' failed
        ERROR: '/oe/openembedded/recipes/perl/libhtml-tagset-perl_3.20.bb' =
failed
        ERROR: '/oe/openembedded/recipes/perl/libcompress-zlib-perl_2.015.b=
b' failed
        ERROR: '/oe/openembedded/recipes/perl/libio-zlib-perl_1.10.bb' fail=
ed
        ERROR: '/oe/openembedded/recipes/perl/libxml-namespacesupport-perl_=
1.11.bb' failed
        ERROR: '/oe/openembedded/recipes/perl/libipc-sharelite-perl_0.09.bb=
' failed
        ERROR: '/oe/openembedded/recipes/perl/liberror-perl_0.17016.bb' fai=
led
        ERROR: '/oe/openembedded/recipes/perl/libdigest-sha1-perl_2.11.bb' =
failed
        ERROR: '/oe/openembedded/recipes/perl/libhtml-parser-perl_3.64.bb' =
failed
        ERROR: '/oe/openembedded/recipes/perl/liburi-perl_1.55.bb' failed
        ERROR: '/oe/openembedded/recipes/perl/libxml-sax-perl_0.96.bb' fail=
ed
        ERROR: '/oe/openembedded/recipes/perl/libtimedate-perl_1.20.bb' fai=
led
        ERROR: '/oe/openembedded/recipes/perl/libxml-parser-perl_2.36.bb' f=
ailed
        ERROR: '/oe/openembedded/recipes/perl/libwww-perl_5.834.bb' failed
        ERROR: '/oe/openembedded/recipes/perl/libtest-pod-perl_1.42.bb' fai=
led
        ERROR: '/oe/openembedded/recipes/perl/libarchive-tar-perl_1.30.bb' =
failed
        ERROR: '/oe/openembedded/recipes/perl/libextutils-parsexs-perl_2.16=
.bb' failed
        ERROR: '/oe/openembedded/recipes/perl/libextutils-cbuilder-perl_0.1=
8.bb' failed
        ERROR: '/oe/openembedded/recipes/perl/libversion-perl_0.82.bb' fail=
ed
        ERROR: '/oe/openembedded/recipes/perl/libyaml-perl_0.62.bb' failed
        ERROR: '/oe/openembedded/recipes/perl/libio-stringy-perl_2.110.bb' =
failed
        ERROR: '/oe/openembedded/recipes/perl/libnet-ssleay-perl_1.36.bb' f=
ailed
        ERROR: '/oe/openembedded/recipes/perl/libmailtools-perl_2.06.bb' fa=
iled
        ERROR: '/oe/openembedded/recipes/perl/libtermreadkey-perl_2.30.bb' =
failed
        ERROR: '/oe/openembedded/recipes/perl/libxml-regexp-perl_0.03.bb' f=
ailed
        ERROR: '/oe/openembedded/recipes/perl/libclass-methodmaker-perl_2.1=
5.bb' failed
        ERROR: '/oe/openembedded/recipes/perl/libclass-inspector-perl_1.24.=
bb' failed
        ERROR: '/oe/openembedded/recipes/perl/libio-socket-ssl-perl_1.32.bb=
' failed
        ERROR: '/oe/openembedded/recipes/perl/libtask-weaken-perl_1.03.bb' =
failed
        ERROR: '/oe/openembedded/recipes/perl/libmime-tools-perl_5.427.bb' =
failed
        ERROR: '/oe/openembedded/recipes/perl/libxml-writer-perl_0.606.bb' =
failed
        ERROR: '/oe/openembedded/recipes/perl/libxml-twig-perl_3.35.bb' fai=
led
        ERROR: '/oe/openembedded/recipes/perl/libwww-mechanize-perl_1.60.bb=
' failed
        ERROR: '/oe/openembedded/recipes/perl/libunicode-utf8simple-perl_1.=
06.bb' failed
        ERROR: '/oe/openembedded/recipes/perl/libunicode-string-perl_2.09.b=
b' failed
        ERROR: '/oe/openembedded/recipes/perl/libterm-progressbar-perl_2.09=
.bb' failed
        ERROR: '/oe/openembedded/recipes/perl/libsoap-lite-perl_0.712.bb' f=
ailed
        ERROR: '/oe/openembedded/recipes/perl/liblinux-dvb-perl_1.0.bb' fai=
led
        ERROR: '/oe/openembedded/recipes/perl/liblingua-en-numbers-ordinate=
_1.02.bb' failed
        ERROR: '/oe/openembedded/recipes/perl/libxml-dom-perl_1.44.bb' fail=
ed
        ERROR: '/oe/openembedded/recipes/perl/libhttp-cache-transparent-per=
l_1.0.bb' failed
        ERROR: '/oe/openembedded/recipes/perl/libhtml-treebuilder-perl_3.23=
.bb' failed
        ERROR: '/oe/openembedded/recipes/perl/libfile-slurp-perl_9999.13.bb=
' failed
        ERROR: '/oe/openembedded/recipes/perl/libdatetime-format-strptime-p=
erl_1.1000.bb' failed
        ERROR: '/oe/openembedded/recipes/perl/libdate-manip-perl_5.54.bb' f=
ailed
        ERROR: '/oe/openembedded/recipes/perl/libarchive-zip-perl_1.30.bb' =
failed
        ERROR: '/oe/openembedded/recipes/perl/libio-compress-zlib-perl_2.01=
5.bb' failed
        ERROR: '/oe/openembedded/recipes/perl/libcompress-raw-zlib-perl_2.0=
23.bb' failed
        ERROR: '/oe/openembedded/recipes/perl/libio-compress-base-perl_2.01=
5.bb' failed
        ERROR: '/oe/openembedded/recipes/perl/libhtml-tagset-perl_3.20.bb' =
failed
        ERROR: '/oe/openembedded/recipes/perl/libcompress-zlib-perl_2.015.b=
b' failed
        ERROR: '/oe/openembedded/recipes/perl/libio-zlib-perl_1.10.bb' fail=
ed
        ERROR: '/oe/openembedded/recipes/perl/libxml-namespacesupport-perl_=
1.11.bb' failed
        ERROR: '/oe/openembedded/recipes/perl/libipc-sharelite-perl_0.09.bb=
' failed
        ERROR: '/oe/openembedded/recipes/perl/liberror-perl_0.17016.bb' fai=
led
        ERROR: '/oe/openembedded/recipes/perl/libdigest-sha1-perl_2.11.bb' =
failed
        ERROR: '/oe/openembedded/recipes/perl/libhtml-parser-perl_3.64.bb' =
failed
        ERROR: '/oe/openembedded/recipes/perl/liburi-perl_1.55.bb' failed
        ERROR: '/oe/openembedded/recipes/perl/libxml-sax-perl_0.96.bb' fail=
ed
        ERROR: '/oe/openembedded/recipes/perl/libtimedate-perl_1.20.bb' fai=
led
        ERROR: '/oe/openembedded/recipes/perl/libxml-parser-perl_2.36.bb' f=
ailed
        ERROR: '/oe/openembedded/recipes/perl/libwww-perl_5.834.bb' failed
        ERROR: '/oe/openembedded/recipes/perl/libtest-pod-perl_1.42.bb' fai=
led
        ERROR: '/oe/openembedded/recipes/perl/libarchive-tar-perl_1.30.bb' =
failed
        ERROR: '/oe/openembedded/recipes/perl/libextutils-parsexs-perl_2.16=
.bb' failed
        ERROR: '/oe/openembedded/recipes/perl/libextutils-cbuilder-perl_0.1=
8.bb' failed
        ERROR: '/oe/openembedded/recipes/perl/libversion-perl_0.82.bb' fail=
ed
        ERROR: '/oe/openembedded/recipes/perl/libyaml-perl_0.62.bb' failed
        ERROR: '/oe/openembedded/recipes/perl/libio-stringy-perl_2.110.bb' =
failed
        ERROR: '/oe/openembedded/recipes/perl/libnet-ssleay-perl_1.36.bb' f=
ailed
        ERROR: '/oe/openembedded/recipes/perl/libmailtools-perl_2.06.bb' fa=
iled
        ERROR: '/oe/openembedded/recipes/perl/libtermreadkey-perl_2.30.bb' =
failed
        ERROR: '/oe/openembedded/recipes/perl/libxml-regexp-perl_0.03.bb' f=
ailed
        ERROR: '/oe/openembedded/recipes/perl/libclass-methodmaker-perl_2.1=
5.bb' failed
        ERROR: '/oe/openembedded/recipes/perl/libclass-inspector-perl_1.24.=
bb' failed
        ERROR: '/oe/openembedded/recipes/perl/libio-socket-ssl-perl_1.32.bb=
' failed
        ERROR: '/oe/openembedded/recipes/perl/libtask-weaken-perl_1.03.bb' =
failed
        ERROR: '/oe/openembedded/recipes/perl/libmime-tools-perl_5.427.bb' =
failed
        ERROR: '/oe/openembedded/recipes/perl/libxml-writer-perl_0.606.bb' =
failed
        ERROR: '/oe/openembedded/recipes/perl/libxml-twig-perl_3.35.bb' fai=
led
        ERROR: '/oe/openembedded/recipes/perl/libwww-mechanize-perl_1.60.bb=
' failed
        ERROR: '/oe/openembedded/recipes/perl/libunicode-utf8simple-perl_1.=
06.bb' failed
        ERROR: '/oe/openembedded/recipes/perl/libunicode-string-perl_2.09.b=
b' failed
        ERROR: '/oe/openembedded/recipes/perl/libterm-progressbar-perl_2.09=
.bb' failed
        ERROR: '/oe/openembedded/recipes/perl/libsoap-lite-perl_0.712.bb' f=
ailed
        ERROR: '/oe/openembedded/recipes/perl/liblinux-dvb-perl_1.0.bb' fai=
led                                                                        =
                           =20
        ERROR: '/oe/openembedded/recipes/perl/liblingua-en-numbers-ordinate=
_1.02.bb' failed
        ERROR: '/oe/openembedded/recipes/perl/libxml-dom-perl_1.44.bb' fail=
ed
        ERROR: '/oe/openembedded/recipes/perl/libhttp-cache-transparent-per=
l_1.0.bb' failed
        ERROR: '/oe/openembedded/recipes/perl/libhtml-treebuilder-perl_3.23=
.bb' failed
        ERROR: '/oe/openembedded/recipes/perl/libfile-slurp-perl_9999.13.bb=
' failed
        ERROR: '/oe/openembedded/recipes/perl/libdatetime-format-strptime-p=
erl_1.1000.bb' failed
        ERROR: '/oe/openembedded/recipes/perl/libdate-manip-perl_5.54.bb' f=
ailed
        ERROR: '/oe/openembedded/recipes/perl/libarchive-zip-perl_1.30.bb' =
failed
        ERROR: '/oe/openembedded/recipes/perl/libio-compress-zlib-perl_2.01=
5.bb' failed
        ERROR: '/oe/openembedded/recipes/perl/libcompress-raw-zlib-perl_2.0=
23.bb' failed
        ERROR: '/oe/openembedded/recipes/perl/libio-compress-base-perl_2.01=
5.bb' failed
        ERROR: '/oe/openembedded/recipes/perl/libhtml-tagset-perl_3.20.bb' =
failed
        ERROR: '/oe/openembedded/recipes/perl/libcompress-zlib-perl_2.015.b=
b' failed
        ERROR: '/oe/openembedded/recipes/perl/libio-zlib-perl_1.10.bb' fail=
ed
        ERROR: '/oe/openembedded/recipes/perl/libxml-namespacesupport-perl_=
1.11.bb' failed
        ERROR: '/oe/openembedded/recipes/perl/libipc-sharelite-perl_0.09.bb=
' failed
        ERROR: '/oe/openembedded/recipes/perl/liberror-perl_0.17016.bb' fai=
led
        ERROR: '/oe/openembedded/recipes/perl/libdigest-sha1-perl_2.11.bb' =
failed
        ERROR: '/oe/openembedded/recipes/perl/libhtml-parser-perl_3.64.bb' =
failed
        ERROR: '/oe/openembedded/recipes/perl/liburi-perl_1.55.bb' failed
        ERROR: '/oe/openembedded/recipes/perl/libxml-sax-perl_0.96.bb' fail=
ed
        ERROR: '/oe/openembedded/recipes/perl/libtimedate-perl_1.20.bb' fai=
led
        ERROR: '/oe/openembedded/recipes/perl/libxml-parser-perl_2.36.bb' f=
ailed
        ERROR: '/oe/openembedded/recipes/perl/libwww-perl_5.834.bb' failed
        ERROR: '/oe/openembedded/recipes/perl/libtest-pod-perl_1.42.bb' fai=
led
        ERROR: '/oe/openembedded/recipes/perl/libarchive-tar-perl_1.30.bb' =
failed
        ERROR: '/oe/openembedded/recipes/perl/libextutils-parsexs-perl_2.16=
.bb' failed
        ERROR: '/oe/openembedded/recipes/perl/libextutils-cbuilder-perl_0.1=
8.bb' failed
        ERROR: '/oe/openembedded/recipes/perl/libversion-perl_0.82.bb' fail=
ed
        ERROR: '/oe/openembedded/recipes/perl/libyaml-perl_0.62.bb' failed
        ERROR: '/oe/openembedded/recipes/perl/libio-stringy-perl_2.110.bb' =
failed
        ERROR: '/oe/openembedded/recipes/perl/libnet-ssleay-perl_1.36.bb' f=
ailed
        ERROR: '/oe/openembedded/recipes/perl/libmailtools-perl_2.06.bb' fa=
iled
        ERROR: '/oe/openembedded/recipes/perl/libtermreadkey-perl_2.30.bb' =
failed
        ERROR: '/oe/openembedded/recipes/perl/libxml-regexp-perl_0.03.bb' f=
ailed
        ERROR: '/oe/openembedded/recipes/perl/libclass-methodmaker-perl_2.1=
5.bb' failed
        ERROR: '/oe/openembedded/recipes/perl/libclass-inspector-perl_1.24.=
bb' failed
        ERROR: '/oe/openembedded/recipes/perl/libio-socket-ssl-perl_1.32.bb=
' failed
        ERROR: '/oe/openembedded/recipes/perl/libtask-weaken-perl_1.03.bb' =
failed
        ERROR: '/oe/openembedded/recipes/perl/libmime-tools-perl_5.427.bb' =
failed
        ERROR: '/oe/openembedded/recipes/perl/libxml-writer-perl_0.606.bb' =
failed
        ERROR: '/oe/openembedded/recipes/perl/libxml-twig-perl_3.35.bb' fai=
led
        ERROR: '/oe/openembedded/recipes/perl/libwww-mechanize-perl_1.60.bb=
' failed
        ERROR: '/oe/openembedded/recipes/perl/libunicode-utf8simple-perl_1.=
06.bb' failed
        ERROR: '/oe/openembedded/recipes/perl/libunicode-string-perl_2.09.b=
b' failed
        ERROR: '/oe/openembedded/recipes/perl/libterm-progressbar-perl_2.09=
.bb' failed
        ERROR: '/oe/openembedded/recipes/perl/libsoap-lite-perl_0.712.bb' f=
ailed
        ERROR: '/oe/openembedded/recipes/perl/liblinux-dvb-perl_1.0.bb' fai=
led
        ERROR: '/oe/openembedded/recipes/perl/liblingua-en-numbers-ordinate=
_1.02.bb' failed
        ERROR: '/oe/openembedded/recipes/perl/libxml-dom-perl_1.44.bb' fail=
ed
        ERROR: '/oe/openembedded/recipes/perl/libhttp-cache-transparent-per=
l_1.0.bb' failed
        ERROR: '/oe/openembedded/recipes/perl/libhtml-treebuilder-perl_3.23=
.bb' failed
        ERROR: '/oe/openembedded/recipes/perl/libfile-slurp-perl_9999.13.bb=
' failed
        ERROR: '/oe/openembedded/recipes/perl/libdatetime-format-strptime-p=
erl_1.1000.bb' failed
        ERROR: '/oe/openembedded/recipes/perl/libdate-manip-perl_5.54.bb' f=
ailed
        ERROR: '/oe/openembedded/recipes/perl/libarchive-zip-perl_1.30.bb' =
failed


Thanks,

Paul

--=-kGX1ZsSTCTThYs57SojQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAk0d32kACgkQPX1aK2wOHVjzOwCfelRJLdZVFUJPSMbS7HBHSAWH
3oAAn2e47+CkzwbJV9ASdUXb9DgfBJ1c
=9q7W
-----END PGP SIGNATURE-----

--=-kGX1ZsSTCTThYs57SojQ--
