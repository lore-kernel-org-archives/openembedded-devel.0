Received: from mail.gw90.de ([188.40.100.199])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <paulepanter@users.sourceforge.net>)
	id 1OYfd0-0001G4-Gc for openembedded-devel@lists.openembedded.org;
	Tue, 13 Jul 2010 15:34:33 +0200
Received: from f053041232.adsl.alicedsl.de ([78.53.41.232]
	helo=[192.168.178.21])
	by mail.gw90.de with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.69) (envelope-from <paulepanter@users.sourceforge.net>)
	id 1OYfY6-0008Ua-Pr for openembedded-devel@lists.openembedded.org;
	Tue, 13 Jul 2010 13:29:27 +0000
From: Paul Menzel <paulepanter@users.sourceforge.net>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 13 Jul 2010 15:29:24 +0200
Message-ID: <1279027764.3935.13.camel@mattotaupa>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.2 
X-SA-Exim-Connect-IP: 188.40.100.199
X-SA-Exim-Mail-From: paulepanter@users.sourceforge.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: angstrom-2008.1, uclibc, perl 5.8.8: error: #error It appears you have defined _FILE_OFFSET_BITS=64.
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
X-List-Received-Date: Tue, 13 Jul 2010 13:34:34 -0000
X-Groupsio-MsgNum: 20931
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-FcJHRZ3+xQ5qEpqAMn/9"

--=-FcJHRZ3+xQ5qEpqAMn/9
Content-Type: multipart/mixed; boundary="=-fFQ+nUcN53/5+kqKC2PL"

--=-fFQ+nUcN53/5+kqKC2PL
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear OE folks,


I tried to build angstrom-2008.1 with the OE dev branch using uclibc.

        DISTRO =3D "angstrom-2008.1"
       =20
        GLIBC_GENERATE_LOCALES =3D "en_US.UTF-8 en_GB.UTF-8 de_DE.UTF-8"
       =20
        MACHINE =3D "beagleboard"
        BUILD_ARCH =3D "i686"
        BUILD_OS =3D "linux"
        ANGSTROMLIBC =3D "uclibc"

Building perl 5.8.8 I get the following error.

        make[1]: Entering directory `/oe/angstrom-dev/work/armv7a-angstrom-=
linux-uclibceabi/perl-5.8.8-r34/perl-5.8.8'
        `sh  cflags "optimize=3D'-O2'" miniperlmain.o` -fPIC miniperlmain.c
        	  CCCMD =3D  arm-angstrom-linux-uclibceabi-gcc -march=3Darmv7-a -m=
tune=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -DPERL_CORE -c -isystem/=
oe/angstrom-dev/sysroots/armv7a-angstrom-linux-uclibceabi/usr/include -fexp=
ensive-optimizations -fomit-frame-pointer -frename-registers -O2 -ggdb3 -D_=
REENTRANT -D_GNU_SOURCE -DTHREADS_HAVE_PIDS -fno-strict-aliasing -pipe -D_L=
ARGEFILE_SOURCE -D_FILE_OFFSET_BITS=3D64 -O2  -Wall
        In file included from /oe/angstrom-dev/sysroots/armv7a-angstrom-lin=
ux-uclibceabi/usr/include/sys/types.h:27,
                         from perl.h:420,
                         from miniperlmain.c:36:
        /oe/angstrom-dev/sysroots/armv7a-angstrom-linux-uclibceabi/usr/incl=
ude/features.h:416:4: error: #error It appears you have defined _FILE_OFFSE=
T_BITS=3D64. Unfortunately, uClibc was built without large file support ena=
bled.
        In file included from /oe/angstrom-dev/sysroots/armv7a-angstrom-lin=
ux-uclibceabi/usr/include/stdio.h:72,
                         from perlio.h:65,
                         from iperlsys.h:51,
                         from perl.h:2733,
                         from miniperlmain.c:36:
        /oe/angstrom-dev/sysroots/armv7a-angstrom-linux-uclibceabi/usr/incl=
ude/bits/uClibc_stdio.h:61:2: error: #error Sorry... uClibc was built witho=
ut large file support!
        In file included from perlio.h:65,
                         from iperlsys.h:51,
                         from perl.h:2733,
                         from miniperlmain.c:36:
        /oe/angstrom-dev/sysroots/armv7a-angstrom-linux-uclibceabi/usr/incl=
ude/stdio.h:83: error: expected '=3D', ',', ';', 'asm' or '__attribute__' b=
efore 'fpos_t'
        In file included from perlio.h:65,
                         from iperlsys.h:51,
                         from perl.h:2733,
                         from miniperlmain.c:36:
        /oe/angstrom-dev/sysroots/armv7a-angstrom-linux-uclibceabi/usr/incl=
ude/stdio.h:714: error: expected declaration specifiers or '...' before 'fp=
os_t'
        /oe/angstrom-dev/sysroots/armv7a-angstrom-linux-uclibceabi/usr/incl=
ude/stdio.h:716: error: expected ';', ',' or ')' before '*' token
        In file included from perl.h:3950,
                         from miniperlmain.c:36:
        proto.h:297: error: expected declaration specifiers or '...' before=
 'off64_t'
        proto.h:299: error: expected '=3D', ',', ';', 'asm' or '__attribute=
__' before 'Perl_do_sysseek'
        proto.h:300: error: expected '=3D', ',', ';', 'asm' or '__attribute=
__' before 'Perl_do_tell'
        proto.h:2004: error: expected '=3D', ',', ';', 'asm' or '__attribut=
e__' before 'Perl_PerlIO_tell'
        proto.h:2005: error: expected declaration specifiers or '...' befor=
e 'off64_t'

Full compile log is attached. Searching the Web did not turn anything up
and currently it logs like git.openembedded.org is down.

I appreciate any hints.


Thanks,

Paul

--=-fFQ+nUcN53/5+kqKC2PL
Content-Disposition: attachment; filename="log.do_compile.23052"
Content-Transfer-Encoding: base64
Content-Type: text/plain; name="log.do_compile.23052"; charset="UTF-8"

Tk9URTogbWFrZSAtZSBNQUtFRkxBR1M9IHBlcmwgTEQ9YXJtLWFuZ3N0cm9tLWxpbnV4LXVjbGli
Y2VhYmktZ2NjDQpQZXJsIGNyb3NzLWJ1aWxkIGRpcmVjdG9yeSBpcyAvc3J2L2ZpbG1lL29lL2Fu
Z3N0cm9tLWRldi93b3JrL2FybXY3YS1hbmdzdHJvbS1saW51eC11Y2xpYmNlYWJpL3BlcmwtNS44
LjgtcjM0L3BlcmwtNS44LjgvQ3Jvc3MNClRhcmdldCBhcmNoIGlzIGFybS1saW51eC11Y2xpYmNl
YWJpDQp0b29sY2hhaW46IGFybS1hbmdzdHJvbS1saW51eC11Y2xpYmNlYWJpLWdjYyAtbWFyY2g9
YXJtdjctYSAtbXR1bmU9Y29ydGV4LWE4IC1tZnB1PW5lb24gLW1mbG9hdC1hYmk9c29mdGZwLCBh
cm0tYW5nc3Ryb20tbGludXgtdWNsaWJjZWFiaS1nKysgLW1hcmNoPWFybXY3LWEgLW10dW5lPWNv
cnRleC1hOCAtbWZwdT1uZW9uIC1tZmxvYXQtYWJpPXNvZnRmcCwgYXJtLWFuZ3N0cm9tLWxpbnV4
LXVjbGliY2VhYmktZ2NjLCBhcm0tYW5nc3Ryb20tbGludXgtdWNsaWJjZWFiaS1zdHJpcCwgYXJt
LWFuZ3N0cm9tLWxpbnV4LXVjbGliY2VhYmktYXIsIGFybS1hbmdzdHJvbS1saW51eC11Y2xpYmNl
YWJpLXJhbmxpYg0KT3B0aW1pemF0aW9uczogLWZleHBlbnNpdmUtb3B0aW1pemF0aW9ucyAtZm9t
aXQtZnJhbWUtcG9pbnRlciAtTzINCi9zcnYvZmlsbWUvb2UvYW5nc3Ryb20tZGV2L3dvcmsvYXJt
djdhLWFuZ3N0cm9tLWxpbnV4LXVjbGliY2VhYmkvcGVybC01LjguOC1yMzQvcGVybC01LjguOC9D
cm9zcy9nZW5lcmF0ZV9jb25maWdfc2ggY29uZmlnLnNoLWFybS1saW51eC11Y2xpYmNlYWJpID4g
L3Nydi9maWxtZS9vZS9hbmdzdHJvbS1kZXYvd29yay9hcm12N2EtYW5nc3Ryb20tbGludXgtdWNs
aWJjZWFiaS9wZXJsLTUuOC44LXIzNC9wZXJsLTUuOC44L0Nyb3NzLy4uL2NvbmZpZy5zaA0KY2Qg
L3Nydi9maWxtZS9vZS9hbmdzdHJvbS1kZXYvd29yay9hcm12N2EtYW5nc3Ryb20tbGludXgtdWNs
aWJjZWFiaS9wZXJsLTUuOC44LXIzNC9wZXJsLTUuOC44L0Nyb3NzLy4uIDsgLi9Db25maWd1cmUg
LVMgOyBtYWtlIGRlcGVuZCA7IG1ha2UgOyBtYWtlIG1vcmUNCiANCkZldGNoaW5nIGFuc3dlcnMg
ZnJvbSBjb25maWcuc2guLi4NCiANCkRvaW5nIHZhcmlhYmxlIHN1YnN0aXR1dGlvbnMgb24gLlNI
IGZpbGVzLi4uDQpFeHRyYWN0aW5nIGNmbGFncyAod2l0aCB2YXJpYWJsZSBzdWJzdGl0dXRpb25z
KQ0KRXh0cmFjdGluZyBjb25maWcuaCAod2l0aCB2YXJpYWJsZSBzdWJzdGl0dXRpb25zKQ0KRXh0
cmFjdGluZyBtYWtlYXBlcmwgKHdpdGggdmFyaWFibGUgc3Vic3RpdHV0aW9ucykNCkV4dHJhY3Rp
bmcgbWFrZWRlcGVuZCAod2l0aCB2YXJpYWJsZSBzdWJzdGl0dXRpb25zKQ0KRXh0cmFjdGluZyBt
YWtlZGlyICh3aXRoIHZhcmlhYmxlIHN1YnN0aXR1dGlvbnMpDQpsaW51eCBsaWJyYXJpZXMgb3Zl
cndyaXR0ZW4gYnkgY3Jvc3MtY29tcGlsZSBwYXRjaGVzDQpFeHRyYWN0aW5nIE1ha2VmaWxlICh3
aXRoIHZhcmlhYmxlIHN1YnN0aXR1dGlvbnMpDQpFeHRyYWN0aW5nIG15Y29uZmlnICh3aXRoIHZh
cmlhYmxlIHN1YnN0aXR1dGlvbnMpDQpFeHRyYWN0aW5nIHBvZC9NYWtlZmlsZSAod2l0aCB2YXJp
YWJsZSBzdWJzdGl0dXRpb25zKQ0KRXh0cmFjdGluZyBQb2xpY3kuc2ggKHdpdGggdmFyaWFibGUg
c3Vic3RpdHV0aW9ucykNCkV4dHJhY3Rpbmcgd3JpdGVtYWluICh3aXRoIHZhcmlhYmxlIHN1YnN0
aXR1dGlvbnMpDQpFeHRyYWN0aW5nIHgycC9jZmxhZ3MgKHdpdGggdmFyaWFibGUgc3Vic3RpdHV0
aW9ucykNCkV4dHJhY3RpbmcgeDJwL01ha2VmaWxlICh3aXRoIHZhcmlhYmxlIHN1YnN0aXR1dGlv
bnMpDQpFeHRyYWN0aW9uIGRvbmUuDQptYWtlWzFdOiBFbnRlcmluZyBkaXJlY3RvcnkgYC9zcnYv
ZmlsbWUvb2UvYW5nc3Ryb20tZGV2L3dvcmsvYXJtdjdhLWFuZ3N0cm9tLWxpbnV4LXVjbGliY2Vh
YmkvcGVybC01LjguOC1yMzQvcGVybC01LjguOCcNCnNoIC4vbWFrZWRlcGVuZCBNQUtFPW1ha2UN
Cm1ha2VbMl06IEVudGVyaW5nIGRpcmVjdG9yeSBgL3Nydi9maWxtZS9vZS9hbmdzdHJvbS1kZXYv
d29yay9hcm12N2EtYW5nc3Ryb20tbGludXgtdWNsaWJjZWFiaS9wZXJsLTUuOC44LXIzNC9wZXJs
LTUuOC44Jw0Kc2ggd3JpdGVtYWluIGxpYi9hdXRvL0R5bmFMb2FkZXIvRHluYUxvYWRlci5hICA+
IHBlcmxtYWluLmMNCnJtIC1mIG9wbWluaS5jDQpjcCBvcC5jIG9wbWluaS5jDQplY2hvICBhdi5j
IHNjb3BlLmMgb3AuYyBkb29wLmMgZG9pby5jIGR1bXAuYyBodi5jIG1nLmMgcmVlbnRyLmMgcGVy
bC5jIHBlcmx5LmMgcHAuYyBwcF9ob3QuYyBwcF9jdGwuYyBwcF9zeXMuYyByZWdjb21wLmMgcmVn
ZXhlYy5jIHV0ZjguYyBndi5jIHN2LmMgdGFpbnQuYyB0b2tlLmMgdXRpbC5jIGRlYi5jIHJ1bi5j
IHVuaXZlcnNhbC5jIHhzdXRpbHMuYyBwYWQuYyBnbG9iYWxzLmMgcGVybGlvLmMgcGVybGFwaS5j
IG51bWVyaWMuYyBsb2NhbGUuYyBwcF9wYWNrLmMgcHBfc29ydC5jIG1pbmlwZXJsbWFpbi5jIHBl
cmxtYWluLmMgb3BtaW5pLmMgfCB0ciAnICcgJ1xuJyA+LmNsaXN0DQptYWtlWzJdOiBMZWF2aW5n
IGRpcmVjdG9yeSBgL3Nydi9maWxtZS9vZS9hbmdzdHJvbS1kZXYvd29yay9hcm12N2EtYW5nc3Ry
b20tbGludXgtdWNsaWJjZWFiaS9wZXJsLTUuOC44LXIzNC9wZXJsLTUuOC44Jw0KRmluZGluZyBk
ZXBlbmRlbmNpZXMgZm9yIGF2Lm8uDQpGaW5kaW5nIGRlcGVuZGVuY2llcyBmb3Igc2NvcGUuby4N
CkZpbmRpbmcgZGVwZW5kZW5jaWVzIGZvciBvcC5vLg0KRmluZGluZyBkZXBlbmRlbmNpZXMgZm9y
IGRvb3Auby4NCkZpbmRpbmcgZGVwZW5kZW5jaWVzIGZvciBkb2lvLm8uDQpGaW5kaW5nIGRlcGVu
ZGVuY2llcyBmb3IgZHVtcC5vLg0KRmluZGluZyBkZXBlbmRlbmNpZXMgZm9yIGh2Lm8uDQpGaW5k
aW5nIGRlcGVuZGVuY2llcyBmb3IgbWcuby4NCkZpbmRpbmcgZGVwZW5kZW5jaWVzIGZvciByZWVu
dHIuby4NCkZpbmRpbmcgZGVwZW5kZW5jaWVzIGZvciBwZXJsLm8uDQpGaW5kaW5nIGRlcGVuZGVu
Y2llcyBmb3IgcGVybHkuby4NCkZpbmRpbmcgZGVwZW5kZW5jaWVzIGZvciBwcC5vLg0KRmluZGlu
ZyBkZXBlbmRlbmNpZXMgZm9yIHBwX2hvdC5vLg0KRmluZGluZyBkZXBlbmRlbmNpZXMgZm9yIHBw
X2N0bC5vLg0KRmluZGluZyBkZXBlbmRlbmNpZXMgZm9yIHBwX3N5cy5vLg0KRmluZGluZyBkZXBl
bmRlbmNpZXMgZm9yIHJlZ2NvbXAuby4NCkZpbmRpbmcgZGVwZW5kZW5jaWVzIGZvciByZWdleGVj
Lm8uDQpGaW5kaW5nIGRlcGVuZGVuY2llcyBmb3IgdXRmOC5vLg0KRmluZGluZyBkZXBlbmRlbmNp
ZXMgZm9yIGd2Lm8uDQpGaW5kaW5nIGRlcGVuZGVuY2llcyBmb3Igc3Yuby4NCkZpbmRpbmcgZGVw
ZW5kZW5jaWVzIGZvciB0YWludC5vLg0KRmluZGluZyBkZXBlbmRlbmNpZXMgZm9yIHRva2Uuby4N
CkZpbmRpbmcgZGVwZW5kZW5jaWVzIGZvciB1dGlsLm8uDQpGaW5kaW5nIGRlcGVuZGVuY2llcyBm
b3IgZGViLm8uDQpGaW5kaW5nIGRlcGVuZGVuY2llcyBmb3IgcnVuLm8uDQpGaW5kaW5nIGRlcGVu
ZGVuY2llcyBmb3IgdW5pdmVyc2FsLm8uDQpGaW5kaW5nIGRlcGVuZGVuY2llcyBmb3IgeHN1dGls
cy5vLg0KRmluZGluZyBkZXBlbmRlbmNpZXMgZm9yIHBhZC5vLg0KRmluZGluZyBkZXBlbmRlbmNp
ZXMgZm9yIGdsb2JhbHMuby4NCkZpbmRpbmcgZGVwZW5kZW5jaWVzIGZvciBwZXJsaW8uby4NCkZp
bmRpbmcgZGVwZW5kZW5jaWVzIGZvciBwZXJsYXBpLm8uDQpGaW5kaW5nIGRlcGVuZGVuY2llcyBm
b3IgbnVtZXJpYy5vLg0KRmluZGluZyBkZXBlbmRlbmNpZXMgZm9yIGxvY2FsZS5vLg0KRmluZGlu
ZyBkZXBlbmRlbmNpZXMgZm9yIHBwX3BhY2suby4NCkZpbmRpbmcgZGVwZW5kZW5jaWVzIGZvciBw
cF9zb3J0Lm8uDQpGaW5kaW5nIGRlcGVuZGVuY2llcyBmb3IgbWluaXBlcmxtYWluLm8uDQpGaW5k
aW5nIGRlcGVuZGVuY2llcyBmb3IgcGVybG1haW4uby4NCkZpbmRpbmcgZGVwZW5kZW5jaWVzIGZv
ciBvcG1pbmkuby4NCm1ha2VbMl06IEVudGVyaW5nIGRpcmVjdG9yeSBgL3Nydi9maWxtZS9vZS9h
bmdzdHJvbS1kZXYvd29yay9hcm12N2EtYW5nc3Ryb20tbGludXgtdWNsaWJjZWFiaS9wZXJsLTUu
OC44LXIzNC9wZXJsLTUuOC44Jw0KZWNobyBNYWtlZmlsZS5TSCBjZmxhZ3MuU0ggY29uZmlnX2gu
U0ggbWFrZWFwZXJsLlNIIG1ha2VkZXBlbmQuU0ggbWFrZWRpci5TSCBteWNvbmZpZy5TSCB3cml0
ZW1haW4uU0ggcG9kL01ha2VmaWxlLlNIIHwgdHIgJyAnICdcbicgPi5zaGxpc3QNCm1ha2VbMl06
IExlYXZpbmcgZGlyZWN0b3J5IGAvc3J2L2ZpbG1lL29lL2FuZ3N0cm9tLWRldi93b3JrL2FybXY3
YS1hbmdzdHJvbS1saW51eC11Y2xpYmNlYWJpL3BlcmwtNS44LjgtcjM0L3BlcmwtNS44LjgnDQpV
cGRhdGluZyBtYWtlZmlsZS4uLg0KdGVzdCAtcyBwZXJsbWFpbi5jICYmIHRvdWNoIHBlcmxtYWlu
LmMNCmNkIHgycDsgbWFrZSBkZXBlbmQNCm1ha2VbMl06IEVudGVyaW5nIGRpcmVjdG9yeSBgL3Ny
di9maWxtZS9vZS9hbmdzdHJvbS1kZXYvd29yay9hcm12N2EtYW5nc3Ryb20tbGludXgtdWNsaWJj
ZWFiaS9wZXJsLTUuOC44LXIzNC9wZXJsLTUuOC44L3gycCcNCnNoIC4uL21ha2VkZXBlbmQgTUFL
RT1tYWtlDQptYWtlWzNdOiBFbnRlcmluZyBkaXJlY3RvcnkgYC9zcnYvZmlsbWUvb2UvYW5nc3Ry
b20tZGV2L3dvcmsvYXJtdjdhLWFuZ3N0cm9tLWxpbnV4LXVjbGliY2VhYmkvcGVybC01LjguOC1y
MzQvcGVybC01LjguOC94MnAnDQplY2hvIGhhc2guYyAgc3RyLmMgdXRpbC5jIHdhbGsuYyB8IHRy
ICcgJyAnXG4nID4uY2xpc3QNCm1ha2VbM106IExlYXZpbmcgZGlyZWN0b3J5IGAvc3J2L2ZpbG1l
L29lL2FuZ3N0cm9tLWRldi93b3JrL2FybXY3YS1hbmdzdHJvbS1saW51eC11Y2xpYmNlYWJpL3Bl
cmwtNS44LjgtcjM0L3BlcmwtNS44LjgveDJwJw0KRmluZGluZyBkZXBlbmRlbmNpZXMgZm9yIGhh
c2guby4NCkZpbmRpbmcgZGVwZW5kZW5jaWVzIGZvciBzdHIuby4NCkZpbmRpbmcgZGVwZW5kZW5j
aWVzIGZvciB1dGlsLm8uDQpGaW5kaW5nIGRlcGVuZGVuY2llcyBmb3Igd2Fsay5vLg0KbWFrZVsz
XTogRW50ZXJpbmcgZGlyZWN0b3J5IGAvc3J2L2ZpbG1lL29lL2FuZ3N0cm9tLWRldi93b3JrL2Fy
bXY3YS1hbmdzdHJvbS1saW51eC11Y2xpYmNlYWJpL3BlcmwtNS44LjgtcjM0L3BlcmwtNS44Ljgv
eDJwJw0KZWNobyBNYWtlZmlsZS5TSCBjZmxhZ3MuU0ggfCB0ciAnICcgJ1xuJyA+LnNobGlzdA0K
bWFrZVszXTogTGVhdmluZyBkaXJlY3RvcnkgYC9zcnYvZmlsbWUvb2UvYW5nc3Ryb20tZGV2L3dv
cmsvYXJtdjdhLWFuZ3N0cm9tLWxpbnV4LXVjbGliY2VhYmkvcGVybC01LjguOC1yMzQvcGVybC01
LjguOC94MnAnDQpVcGRhdGluZyBtYWtlZmlsZS4uLg0KbWFrZVsyXTogTGVhdmluZyBkaXJlY3Rv
cnkgYC9zcnYvZmlsbWUvb2UvYW5nc3Ryb20tZGV2L3dvcmsvYXJtdjdhLWFuZ3N0cm9tLWxpbnV4
LXVjbGliY2VhYmkvcGVybC01LjguOC1yMzQvcGVybC01LjguOC94MnAnDQptYWtlWzFdOiBMZWF2
aW5nIGRpcmVjdG9yeSBgL3Nydi9maWxtZS9vZS9hbmdzdHJvbS1kZXYvd29yay9hcm12N2EtYW5n
c3Ryb20tbGludXgtdWNsaWJjZWFiaS9wZXJsLTUuOC44LXIzNC9wZXJsLTUuOC44Jw0KbWFrZVsx
XTogRW50ZXJpbmcgZGlyZWN0b3J5IGAvc3J2L2ZpbG1lL29lL2FuZ3N0cm9tLWRldi93b3JrL2Fy
bXY3YS1hbmdzdHJvbS1saW51eC11Y2xpYmNlYWJpL3BlcmwtNS44LjgtcjM0L3BlcmwtNS44Ljgn
DQpgc2ggIGNmbGFncyAib3B0aW1pemU9Jy1PMiciIG1pbmlwZXJsbWFpbi5vYCAtZlBJQyBtaW5p
cGVybG1haW4uYw0KCSAgQ0NDTUQgPSAgYXJtLWFuZ3N0cm9tLWxpbnV4LXVjbGliY2VhYmktZ2Nj
IC1tYXJjaD1hcm12Ny1hIC1tdHVuZT1jb3J0ZXgtYTggLW1mcHU9bmVvbiAtbWZsb2F0LWFiaT1z
b2Z0ZnAgLURQRVJMX0NPUkUgLWMgLWlzeXN0ZW0vc3J2L2ZpbG1lL29lL2FuZ3N0cm9tLWRldi9z
eXNyb290cy9hcm12N2EtYW5nc3Ryb20tbGludXgtdWNsaWJjZWFiaS91c3IvaW5jbHVkZSAtZmV4
cGVuc2l2ZS1vcHRpbWl6YXRpb25zIC1mb21pdC1mcmFtZS1wb2ludGVyIC1mcmVuYW1lLXJlZ2lz
dGVycyAtTzIgLWdnZGIzIC1EX1JFRU5UUkFOVCAtRF9HTlVfU09VUkNFIC1EVEhSRUFEU19IQVZF
X1BJRFMgLWZuby1zdHJpY3QtYWxpYXNpbmcgLXBpcGUgLURfTEFSR0VGSUxFX1NPVVJDRSAtRF9G
SUxFX09GRlNFVF9CSVRTPTY0IC1PMiAgLVdhbGwNCkluIGZpbGUgaW5jbHVkZWQgZnJvbSAvc3J2
L2ZpbG1lL29lL2FuZ3N0cm9tLWRldi9zeXNyb290cy9hcm12N2EtYW5nc3Ryb20tbGludXgtdWNs
aWJjZWFiaS91c3IvaW5jbHVkZS9zeXMvdHlwZXMuaDoyNywNCiAgICAgICAgICAgICAgICAgZnJv
bSBwZXJsLmg6NDIwLA0KICAgICAgICAgICAgICAgICBmcm9tIG1pbmlwZXJsbWFpbi5jOjM2Og0K
L3Nydi9maWxtZS9vZS9hbmdzdHJvbS1kZXYvc3lzcm9vdHMvYXJtdjdhLWFuZ3N0cm9tLWxpbnV4
LXVjbGliY2VhYmkvdXNyL2luY2x1ZGUvZmVhdHVyZXMuaDo0MTY6NDogZXJyb3I6ICNlcnJvciBJ
dCBhcHBlYXJzIHlvdSBoYXZlIGRlZmluZWQgX0ZJTEVfT0ZGU0VUX0JJVFM9NjQuIFVuZm9ydHVu
YXRlbHksIHVDbGliYyB3YXMgYnVpbHQgd2l0aG91dCBsYXJnZSBmaWxlIHN1cHBvcnQgZW5hYmxl
ZC4NCkluIGZpbGUgaW5jbHVkZWQgZnJvbSAvc3J2L2ZpbG1lL29lL2FuZ3N0cm9tLWRldi9zeXNy
b290cy9hcm12N2EtYW5nc3Ryb20tbGludXgtdWNsaWJjZWFiaS91c3IvaW5jbHVkZS9zdGRpby5o
OjcyLA0KICAgICAgICAgICAgICAgICBmcm9tIHBlcmxpby5oOjY1LA0KICAgICAgICAgICAgICAg
ICBmcm9tIGlwZXJsc3lzLmg6NTEsDQogICAgICAgICAgICAgICAgIGZyb20gcGVybC5oOjI3MzMs
DQogICAgICAgICAgICAgICAgIGZyb20gbWluaXBlcmxtYWluLmM6MzY6DQovc3J2L2ZpbG1lL29l
L2FuZ3N0cm9tLWRldi9zeXNyb290cy9hcm12N2EtYW5nc3Ryb20tbGludXgtdWNsaWJjZWFiaS91
c3IvaW5jbHVkZS9iaXRzL3VDbGliY19zdGRpby5oOjYxOjI6IGVycm9yOiAjZXJyb3IgU29ycnku
Li4gdUNsaWJjIHdhcyBidWlsdCB3aXRob3V0IGxhcmdlIGZpbGUgc3VwcG9ydCENCkluIGZpbGUg
aW5jbHVkZWQgZnJvbSBwZXJsaW8uaDo2NSwNCiAgICAgICAgICAgICAgICAgZnJvbSBpcGVybHN5
cy5oOjUxLA0KICAgICAgICAgICAgICAgICBmcm9tIHBlcmwuaDoyNzMzLA0KICAgICAgICAgICAg
ICAgICBmcm9tIG1pbmlwZXJsbWFpbi5jOjM2Og0KL3Nydi9maWxtZS9vZS9hbmdzdHJvbS1kZXYv
c3lzcm9vdHMvYXJtdjdhLWFuZ3N0cm9tLWxpbnV4LXVjbGliY2VhYmkvdXNyL2luY2x1ZGUvc3Rk
aW8uaDo4MzogZXJyb3I6IGV4cGVjdGVkICc9JywgJywnLCAnOycsICdhc20nIG9yICdfX2F0dHJp
YnV0ZV9fJyBiZWZvcmUgJ2Zwb3NfdCcNCkluIGZpbGUgaW5jbHVkZWQgZnJvbSBwZXJsaW8uaDo2
NSwNCiAgICAgICAgICAgICAgICAgZnJvbSBpcGVybHN5cy5oOjUxLA0KICAgICAgICAgICAgICAg
ICBmcm9tIHBlcmwuaDoyNzMzLA0KICAgICAgICAgICAgICAgICBmcm9tIG1pbmlwZXJsbWFpbi5j
OjM2Og0KL3Nydi9maWxtZS9vZS9hbmdzdHJvbS1kZXYvc3lzcm9vdHMvYXJtdjdhLWFuZ3N0cm9t
LWxpbnV4LXVjbGliY2VhYmkvdXNyL2luY2x1ZGUvc3RkaW8uaDo3MTQ6IGVycm9yOiBleHBlY3Rl
ZCBkZWNsYXJhdGlvbiBzcGVjaWZpZXJzIG9yICcuLi4nIGJlZm9yZSAnZnBvc190Jw0KL3Nydi9m
aWxtZS9vZS9hbmdzdHJvbS1kZXYvc3lzcm9vdHMvYXJtdjdhLWFuZ3N0cm9tLWxpbnV4LXVjbGli
Y2VhYmkvdXNyL2luY2x1ZGUvc3RkaW8uaDo3MTY6IGVycm9yOiBleHBlY3RlZCAnOycsICcsJyBv
ciAnKScgYmVmb3JlICcqJyB0b2tlbg0KSW4gZmlsZSBpbmNsdWRlZCBmcm9tIHBlcmwuaDozOTUw
LA0KICAgICAgICAgICAgICAgICBmcm9tIG1pbmlwZXJsbWFpbi5jOjM2Og0KcHJvdG8uaDoyOTc6
IGVycm9yOiBleHBlY3RlZCBkZWNsYXJhdGlvbiBzcGVjaWZpZXJzIG9yICcuLi4nIGJlZm9yZSAn
b2ZmNjRfdCcNCnByb3RvLmg6Mjk5OiBlcnJvcjogZXhwZWN0ZWQgJz0nLCAnLCcsICc7JywgJ2Fz
bScgb3IgJ19fYXR0cmlidXRlX18nIGJlZm9yZSAnUGVybF9kb19zeXNzZWVrJw0KcHJvdG8uaDoz
MDA6IGVycm9yOiBleHBlY3RlZCAnPScsICcsJywgJzsnLCAnYXNtJyBvciAnX19hdHRyaWJ1dGVf
XycgYmVmb3JlICdQZXJsX2RvX3RlbGwnDQpwcm90by5oOjIwMDQ6IGVycm9yOiBleHBlY3RlZCAn
PScsICcsJywgJzsnLCAnYXNtJyBvciAnX19hdHRyaWJ1dGVfXycgYmVmb3JlICdQZXJsX1BlcmxJ
T190ZWxsJw0KcHJvdG8uaDoyMDA1OiBlcnJvcjogZXhwZWN0ZWQgZGVjbGFyYXRpb24gc3BlY2lm
aWVycyBvciAnLi4uJyBiZWZvcmUgJ29mZjY0X3QnDQptYWtlWzFdOiAqKiogW21pbmlwZXJsbWFp
bi5vXSBFcnJvciAxDQptYWtlWzFdOiBMZWF2aW5nIGRpcmVjdG9yeSBgL3Nydi9maWxtZS9vZS9h
bmdzdHJvbS1kZXYvd29yay9hcm12N2EtYW5nc3Ryb20tbGludXgtdWNsaWJjZWFiaS9wZXJsLTUu
OC44LXIzNC9wZXJsLTUuOC44Jw0KbWFrZVsxXTogRW50ZXJpbmcgZGlyZWN0b3J5IGAvc3J2L2Zp
bG1lL29lL2FuZ3N0cm9tLWRldi93b3JrL2FybXY3YS1hbmdzdHJvbS1saW51eC11Y2xpYmNlYWJp
L3BlcmwtNS44LjgtcjM0L3BlcmwtNS44LjgnDQptYWtlWzFdOiBbZXh0cmEucG9kc10gRXJyb3Ig
MSAoaWdub3JlZCkNCi4vbWluaXBlcmwgLUlsaWIgY29uZmlncG0gLS1oZWF2eT1saWIvQ29uZmln
X2hlYXZ5LnBsIGxpYi9Db25maWcucG0NCm1ha2VbMV06IC4vbWluaXBlcmw6IENvbW1hbmQgbm90
IGZvdW5kDQptYWtlWzFdOiAqKiogW2xpYi9Db25maWcucG9kXSBFcnJvciAxMjcNCm1ha2VbMV06
IExlYXZpbmcgZGlyZWN0b3J5IGAvc3J2L2ZpbG1lL29lL2FuZ3N0cm9tLWRldi93b3JrL2FybXY3
YS1hbmdzdHJvbS1saW51eC11Y2xpYmNlYWJpL3BlcmwtNS44LjgtcjM0L3BlcmwtNS44LjgnDQpt
YWtlOiAqKiogW3BlcmxdIEVycm9yIDINCkZBVEFMOiBvZV9ydW5tYWtlIGZhaWxlZA0K

--=-fFQ+nUcN53/5+kqKC2PL--

--=-FcJHRZ3+xQ5qEpqAMn/9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkw8ajQACgkQPX1aK2wOHVhKKwCfSA1BJpuqndb/sb67PewizkAJ
OdwAnjz+HRnRfwvhUAkKXke6ROXYgx3y
=dIM5
-----END PGP SIGNATURE-----

--=-FcJHRZ3+xQ5qEpqAMn/9--
