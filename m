Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vwyodapink@gmail.com>) id 1OZnjG-0006DH-S8
	for openembedded-devel@lists.openembedded.org;
	Fri, 16 Jul 2010 18:25:41 +0200
Received: by gxk3 with SMTP id 3so1025936gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Jul 2010 09:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=TBYveMoqwTeIjP1HdJAcdq2SfI7bkmFDrHs+xIpQKDE=;
	b=NFCkRrJYbKjTMMYPoqTjld0ecETCzWb+aBZPj4S9Mv3TfFwm8Jhy5OsTSAdtA7y5V6
	J3URAgww4/vy1Kcx5EX1ACXzUpuCWQLlb0ueqQv9/FJDGhvf0PiavjD7j3NMbdnM8Np5
	EZrLL58u/GIX1u+McPWvnDIp4At7QzfuY2lxA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=C+agCWHbD7jsWW0OujaPhGD3C49vPliLUpZJ4SappBbW+o9udJE3pJtsJkpN6yxnl2
	JEG22wu7ps/2MPtNVbE+maKc9r0VJV3nUyUXw+uQEjxvYJ9PT0fbAWKWOyJXTFGm00vK
	ugW9S0t/j9pBj4ohnt4CJmZU8ZRAiMQU/CZWE=
MIME-Version: 1.0
Received: by 10.101.173.37 with SMTP id a37mr1529605anp.70.1279297532055; Fri, 
	16 Jul 2010 09:25:32 -0700 (PDT)
Received: by 10.100.127.11 with HTTP; Fri, 16 Jul 2010 09:25:31 -0700 (PDT)
In-Reply-To: <BAY127-W14254C957B2B347B4D3BDFD8BC0@phx.gbl>
References: <BAY127-W14254C957B2B347B4D3BDFD8BC0@phx.gbl>
Date: Fri, 16 Jul 2010 09:25:31 -0700
Message-ID: <AANLkTik0-k3uWjMV2hU2zF3yKX2IzfSAGNttIIU34s8b@mail.gmail.com>
From: "J. L. " <vwyodapink@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.175
X-SA-Exim-Mail-From: vwyodapink@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Problem of libpcap
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
X-List-Received-Date: Fri, 16 Jul 2010 16:25:41 -0000
X-Groupsio-MsgNum: 21059
Content-Type: multipart/mixed; boundary=001636988bf3f5d037048b83aa20

--001636988bf3f5d037048b83aa20
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

Mine is building fine here are the files incase you are using a older
pull of OE which it looks like you might be. I attacked all the
patches for it as well. Hope this helps you out. I have noticed there
are a bunch that are not building and or are WAY WAY out of date.


require libpcap.inc

PR =3D "r6"
SRC_URI =3D "http://www.tcpdump.org/release/libpcap-${PV}.tar.gz"
SRC_URI +=3D "file://aclocal.patch"
SRC_URI +=3D "file://ieee80215-arphrd.patch"
SRC_URI +=3D "file://ldflags.patch"
SRC_URI +=3D "file://0001-Fix-some-problems-that-show-up-in-autoconf-2.64-a=
nd-.patch"

do_configure_prepend() {
	cat ${S}/aclocal.m4 >>${S}/acinclude.m4
}

do_compile () {
    oe_runmake
    rm -f *.o
    oe_runmake shared
}

do_install () {
    install -d ${D}${libdir}
    install -d ${D}${bindir}
    oe_runmake install DESTDIR=3D${D}
    oe_runmake install-shared DESTDIR=3D${D}
	oe_libinstall -a -so libpcap ${D}${libdir}

    install -d ${D}${includedir}/pcap
    install -m 0644 pcap/pcap.h ${D}${includedir}/pcap/pcap.h
    install -m 0644 pcap/namedb.h ${D}${includedir}/pcap/namedb.h
    install -m 0644 pcap/bpf.h ${D}${includedir}/pcap/bpf.h
}



SRC_URI[md5sum] =3D "9ad1358c5dec48456405eac197a46d3d"
SRC_URI[sha256sum] =3D
"a214c4e1d7e22a758f66fe1d08f0ce41c3ba801a4c13dd1188e1e38288ac73c0"




DESCRIPTION =3D "Network Packet Capture Library"
HOMEPAGE =3D "http://www.tcpdump.org/"
SECTION =3D "libs/network"
LICENSE =3D "BSD"
DEPENDS =3D "bluez-libs flex-native bison-native"

PR =3D "r3"

# Don't forget to edit shared.patch to have the correct version number insi=
de
SRC_URI =3D "http://www.tcpdump.org/release/libpcap-${PV}.tar.gz \
           file://shared.patch"

inherit autotools

EXTRA_OECONF =3D "--with-pcap=3Dlinux"

CPPFLAGS_prepend =3D "-I${S} "
CFLAGS_prepend =3D "-I${S} "
CXXFLAGS_prepend =3D "-I${S} "

do_configure_prepend () {
	if [ ! -e acinclude.m4 ]; then
		cat aclocal.m4 > acinclude.m4
	fi
}

do_install_append () {
	install -d ${D}${includedir}/net
	install -d ${D}${datadir}/aclocal
	ln -sf ../pcap-bpf.h ${D}${includedir}/net/bpf.h
	install -m 0644 acinclude.m4 ${D}${datadir}/aclocal/libpcap.m4
}






On Fri, Jul 16, 2010 at 8:12 AM, saleh usman <salehusman@hotmail.com> wrote=
:
>
> I am bitbaking console-iamge but getting error of not building libpcap? I=
've bitbake libpcap separately but it is also not building. Its bitbake fai=
ls during configure. These are shown in following terminal logs. Kindly tel=
l me how to remove this error?
> Saleh
>
> [Saleh@localhost ~]$ bitbake console-image
> NOTE: Handling BitBake files: \ (8169/8169) [100 %]
> NOTE: Parsing finished. 7530 cached, 309 parsed, 330 skipped, 0 masked.
> NOTE: Resolving any missing task queue dependencies
> NOTE: Preparing runqueue
> NOTE: Executing runqueue
> NOTE: Running task 1774 of 3226 (ID: 1317, /sdr/openembedded/recipes/libp=
cap/libpcap_1.0.0.bb, do_configure)
> ERROR: function do_configure failed
> ERROR: log data follows (/sdr/build/tmp/work/armv5te-angstrom-linux-gnuea=
bi/libpcap-1.0.0-r6/temp/log.do_configure.2961)
> | cat: /sdr/build/tmp/work/armv5te-angstrom-linux-gnueabi/libpcap-1.0.0-r=
6/libpcap-1.0.0/aclocal.m4: No such file or directory
> NOTE: Task failed: /sdr/build/tmp/work/armv5te-angstrom-linux-gnueabi/lib=
pcap-1.0.0-r6/temp/log.do_configure.2961
> ERROR: TaskFailed event exception, aborting
> ERROR: Build of /sdr/openembedded/recipes/libpcap/libpcap_1.0.0.bb do_con=
figure failed
> ERROR: Task 1317 (/sdr/openembedded/recipes/libpcap/libpcap_1.0.0.bb, do_=
configure) failed
> NOTE: Tasks Summary: Attempted 1773 tasks of which 1773 didn't need to be=
 rerun and 1 failed.
> ERROR: '/sdr/openembedded/recipes/libpcap/libpcap_1.0.0.bb' failed
>
>
> [Saleh@localhost openembedded]$ bitbake libpcap
> NOTE: Handling BitBake files: \ (8169/8169) [100 %]
> NOTE: Parsing finished. 7530 cached, 309 parsed, 330 skipped, 0 masked.
> NOTE: Resolving any missing task queue dependencies
> NOTE: Preparing runqueue
> NOTE: Executing runqueue
> NOTE: Running task 1695 of 2385 (ID: 7, /sdr/openembedded/recipes/libpcap=
/libpcap_1.0.0.bb, do_configure)
> ERROR: function do_configure failed
> ERROR: log data follows (/sdr/build/tmp/work/armv5te-angstrom-linux-gnuea=
bi/libpcap-1.0.0-r6/temp/log.do_configure.11281)
> | cat: /sdr/build/tmp/work/armv5te-angstrom-linux-gnueabi/libpcap-1.0.0-r=
6/libpcap-1.0.0/aclocal.m4: No such file or directory
> NOTE: Task failed: /sdr/build/tmp/work/armv5te-angstrom-linux-gnueabi/lib=
pcap-1.0.0-r6/temp/log.do_configure.11281
> ERROR: TaskFailed event exception, aborting
> ERROR: Build of /sdr/openembedded/recipes/libpcap/libpcap_1.0.0.bb do_con=
figure failed
> ERROR: Task 7 (/sdr/openembedded/recipes/libpcap/libpcap_1.0.0.bb, do_con=
figure) failed
> NOTE: Tasks Summary: Attempted 1694 tasks of which 1694 didn't need to be=
 rerun and 1 failed.
> ERROR: '/sdr/openembedded/recipes/libpcap/libpcap_1.0.0.bb' failed
>
>
> _________________________________________________________________
> Hotmail: Trusted email with Microsoft=92s powerful SPAM protection.
> https://signup.live.com/signup.aspx?id=3D60969
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

--001636988bf3f5d037048b83aa20
Content-Type: text/x-patch; charset=US-ASCII; name="ldflags.patch"
Content-Disposition: attachment; filename="ldflags.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_gbp8olhk1

ZGlmZiAtdXJOIGxpYnBjYXAtMS4wLjAub3JpZy9NYWtlZmlsZS5pbiBsaWJwY2FwLTEuMC4wL01h
a2VmaWxlLmluCi0tLSBsaWJwY2FwLTEuMC4wLm9yaWcvTWFrZWZpbGUuaW4JMjAwOC0xMC0yOCAw
MToyNjoxMy4wMDAwMDAwMDAgKzAwMDAKKysrIGxpYnBjYXAtMS4wLjAvTWFrZWZpbGUuaW4JMjAw
OS0wNC0wMiAxMzo1NDoyMC4wMDAwMDAwMDAgKzAwMDAKQEAgLTMyNiw3ICszMjYsNyBAQAogIwog
bGlicGNhcC5zbzogJChPQkopCiAJQHJtIC1mICRACi0JJChDQykgLXNoYXJlZCAtV2wsLXNvbmFt
ZSwkQC4xIC1vICRALmBjYXQgJChzcmNkaXIpL1ZFUlNJT05gICQoT0JKKSAkKERBR0xJQlMpCisJ
JChDQykgJChMREZMQUdTKSAtc2hhcmVkIC1XbCwtc29uYW1lLCRALjEgLW8gJEAuYGNhdCAkKHNy
Y2RpcikvVkVSU0lPTmAgJChPQkopICQoREFHTElCUykKIAogIwogIyBUaGUgZm9sbG93aW5nIHJ1
bGUgc3VjY2VlZHMsIGJ1dCB0aGUgcmVzdWx0IGlzIHVudGVzdGVkLgo=

--001636988bf3f5d037048b83aa20
Content-Type: text/x-patch; charset=US-ASCII; name="ieee80215-arphrd.patch"
Content-Disposition: attachment; filename="ieee80215-arphrd.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_gbp8oqn32

SW5kZXg6IGxpYnBjYXAtMS4wLjAvcGNhcC1saW51eC5jCj09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KLS0tIGxpYnBjYXAt
MS4wLjAub3JpZy9wY2FwLWxpbnV4LmMJMjAwOS0wMS0yOCAxMTo1ODo1NC4wMDAwMDAwMDAgKzAz
MDAKKysrIGxpYnBjYXAtMS4wLjAvcGNhcC1saW51eC5jCTIwMDktMDEtMjggMTE6NTk6MDQuMDAw
MDAwMDAwICswMzAwCkBAIC0xNjE2LDYgKzE2MTYsMTcgQEAKIAkJICogc28gbGV0J3MgdXNlICJM
aW51eC1jb29rZWQiIG1vZGUuIEplYW4gSUkgKi8KIAkJLy9oYW5kbGUtPm1kLmNvb2tlZCA9IDE7
CiAJCWJyZWFrOworI2lmbmRlZiBBUlBIUkRfSUVFRTgwMjE1CisjZGVmaW5lIEFSUEhSRF9JRUVF
ODAyMTUgODA0CisjZW5kaWYKKyNpZm5kZWYgQVJQSFJEX0lFRUU4MDIxNV9QSFkKKyNkZWZpbmUg
QVJQSFJEX0lFRUU4MDIxNV9QSFkgODA1CisjZW5kaWYKKworICAgIGNhc2UgQVJQSFJEX0lFRUU4
MDIxNToKKyAgICBjYXNlIEFSUEhSRF9JRUVFODAyMTVfUEhZOgorICAgICAgICBoYW5kbGUtPmxp
bmt0eXBlID0gRExUX0lFRUU4MDJfMTVfNDsKKyAgICAgICAgYnJlYWs7CiAKIAkvKiBBUlBIUkRf
TEFQRCBpcyB1bm9mZmljaWFsIGFuZCByYW5kb21seSBhbGxvY2F0ZWQsIGlmIHJlYWxsb2NhdGlv
bgogCSAqIGlzIG5lZWRlZCwgcGxlYXNlIHJlcG9ydCBpdCB0byA8ZGFuaWVsZUBvcmxhbmRpLmNv
bT4gKi8K

--001636988bf3f5d037048b83aa20
Content-Type: text/x-patch; charset=US-ASCII; name="aclocal.patch"
Content-Disposition: attachment; filename="aclocal.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_gbp8ouky3

ZGlmZiAtTmFydSBsaWJwY2FwLTAuOS43Lm9yaWcvYWNsb2NhbC5tNCBsaWJwY2FwLTAuOS43L2Fj
aW5jbHVkZS5tNAotLS0gbGlicGNhcC0wLjkuNy5vcmlnL2FjbG9jYWwubTQJMjAwNy0wOS0xNiAw
MToxOTo1MS4wMDAwMDAwMDAgKzAyMDAKKysrIGxpYnBjYXAtMC45LjcvYWNsb2NhbC5tNAkyMDA3
LTA5LTE2IDAyOjQ1OjUyLjAwMDAwMDAwMCArMDIwMApAQCAtNDIsNyArNDIsNyBAQAogZG5sCWFj
X2N2X2xibF9nY2NfdmVycwogZG5sCUxCTF9DRkxBR1MKIGRubAotQUNfREVGVU4oQUNfTEJMX0Nf
SU5JVCwKK0FDX0RFRlVOKFtBQ19MQkxfQ19JTklUXSwKICAgICBbQUNfUFJFUkVRKDIuMTIpCiAg
ICAgQUNfQkVGT1JFKFskMF0sIFtBQ19QUk9HX0NDXSkKICAgICBBQ19CRUZPUkUoWyQwXSwgW0FD
X0xCTF9GSVhJTkNMVURFU10pCkBAIC0xNjksNyArMTY5LDcgQEAKICMgTWFrZSBzdXJlIHdlIHVz
ZSB0aGUgVl9DQ09QVCBmbGFncywgYmVjYXVzZSBzb21lIG9mIHRob3NlIG1pZ2h0CiAjIGRpc2Fi
bGUgaW5saW5pbmcuCiAjCi1BQ19ERUZVTihBQ19MQkxfQ19JTkxJTkUsCitBQ19ERUZVTihbQUNf
TEJMX0NfSU5MSU5FXSwKICAgICBbQUNfTVNHX0NIRUNLSU5HKGZvciBpbmxpbmUpCiAgICAgc2F2
ZV9DRkxBR1M9IiRDRkxBR1MiCiAgICAgQ0ZMQUdTPSIkVl9DQ09QVCIKQEAgLTIyNSw3ICsyMjUs
NyBAQAogZG5sCUxJQlMKIGRubAlMQkxfTElCUwogZG5sCi1BQ19ERUZVTihBQ19MQkxfTElCUENB
UCwKK0FDX0RFRlVOKFtBQ19MQkxfTElCUENBUF0sCiAgICAgW0FDX1JFUVVJUkUoW0FDX0xCTF9M
SUJSQVJZX05FVF0pCiAgICAgZG5sCiAgICAgZG5sIHNhdmUgYSBjb3B5IGJlZm9yZSBsb2NhdGlu
ZyBsaWJwY2FwLmEKQEAgLTI5Myw3ICsyOTMsNyBAQAogZG5sCVJFVFNJR1RZUEUgKGRlZmluZWQp
CiBkbmwJUkVUU0lHVkFMIChkZWZpbmVkKQogZG5sCi1BQ19ERUZVTihBQ19MQkxfVFlQRV9TSUdO
QUwsCitBQ19ERUZVTihbQUNfTEJMX1RZUEVfU0lHTkFMXSwKICAgICBbQUNfQkVGT1JFKFskMF0s
IFtBQ19MQkxfTElCUENBUF0pCiAgICAgQUNfVFlQRV9TSUdOQUwKICAgICBpZiB0ZXN0ICIkYWNf
Y3ZfdHlwZV9zaWduYWwiID0gdm9pZCA7IHRoZW4KQEAgLTMyMyw3ICszMjMsNyBAQAogZG5sCiBk
bmwJQUNfTEJMX0ZJWElOQ0xVREVTCiBkbmwKLUFDX0RFRlVOKEFDX0xCTF9GSVhJTkNMVURFUywK
K0FDX0RFRlVOKFtBQ19MQkxfRklYSU5DTFVERVNdLAogICAgIFtpZiB0ZXN0ICIkR0NDIiA9IHll
cyA7IHRoZW4KIAkgICAgQUNfTVNHX0NIRUNLSU5HKGZvciBBTlNJIGlvY3RsIGRlZmluaXRpb25z
KQogCSAgICBBQ19DQUNIRV9WQUwoYWNfY3ZfbGJsX2djY19maXhpbmNsdWRlcywKQEAgLTM2OSw3
ICszNjksNyBAQAogZG5sCSQyICh5YWNjIGFwcGVuZGVkKQogZG5sCSQzIChvcHRpb25hbCBmbGV4
IGFuZCBiaXNvbiAtUCBwcmVmaXgpCiBkbmwKLUFDX0RFRlVOKEFDX0xCTF9MRVhfQU5EX1lBQ0Ms
CitBQ19ERUZVTihbQUNfTEJMX0xFWF9BTkRfWUFDQ10sCiAgICAgW0FDX0FSR19XSVRIKGZsZXgs
IFsgIC0td2l0aG91dC1mbGV4ICAgICAgICAgIGRvbid0IHVzZSBmbGV4XSkKICAgICBBQ19BUkdf
V0lUSChiaXNvbiwgWyAgLS13aXRob3V0LWJpc29uICAgICAgICAgZG9uJ3QgdXNlIGJpc29uXSkK
ICAgICBpZiB0ZXN0ICIkd2l0aF9mbGV4IiA9IG5vIDsgdGhlbgpAQCAtNDIyLDcgKzQyMiw3IEBA
CiBkbmwKIGRubAlERUNMV0FJVFNUQVRVUyAoZGVmaW5lZCkKIGRubAotQUNfREVGVU4oQUNfTEJM
X1VOSU9OX1dBSVQsCitBQ19ERUZVTihbQUNfTEJMX1VOSU9OX1dBSVRdLAogICAgIFtBQ19NU0df
Q0hFQ0tJTkcoaWYgdW5pb24gd2FpdCBpcyB1c2VkKQogICAgIEFDX0NBQ0hFX1ZBTChhY19jdl9s
YmxfdW5pb25fd2FpdCwKIAlBQ19UUllfQ09NUElMRShbCkBAIC00NTEsNyArNDUxLDcgQEAKIGRu
bAogZG5sCUhBVkVfU09DS0FERFJfU0FfTEVOIChkZWZpbmVkKQogZG5sCi1BQ19ERUZVTihBQ19M
QkxfU09DS0FERFJfU0FfTEVOLAorQUNfREVGVU4oW0FDX0xCTF9TT0NLQUREUl9TQV9MRU5dLAog
ICAgIFtBQ19NU0dfQ0hFQ0tJTkcoaWYgc29ja2FkZHIgc3RydWN0IGhhcyBzYV9sZW4gbWVtYmVy
KQogICAgIEFDX0NBQ0hFX1ZBTChhY19jdl9sYmxfc29ja2FkZHJfaGFzX3NhX2xlbiwKIAlBQ19U
UllfQ09NUElMRShbCkBAIC00NzYsNyArNDc2LDcgQEAKIGRubAogZG5sCUhBVkVfU09DS0FERFJf
U1RPUkFHRSAoZGVmaW5lZCkKIGRubAotQUNfREVGVU4oQUNfTEJMX1NPQ0tBRERSX1NUT1JBR0Us
CitBQ19ERUZVTihbQUNfTEJMX1NPQ0tBRERSX1NUT1JBR0VdLAogICAgIFtBQ19NU0dfQ0hFQ0tJ
TkcoaWYgc29ja2FkZHJfc3RvcmFnZSBzdHJ1Y3QgZXhpc3RzKQogICAgIEFDX0NBQ0hFX1ZBTChh
Y19jdl9sYmxfaGFzX3NvY2thZGRyX3N0b3JhZ2UsCiAJQUNfVFJZX0NPTVBJTEUoWwpAQCAtNTA5
LDcgKzUwOSw3IEBACiBkbmwgd29uJ3QgYmUgdXNpbmcgY29kZSB0aGF0IHdvdWxkIHVzZSB0aGF0
IG1lbWJlciwgb3Igd2Ugd291bGRuJ3QKIGRubCBjb21waWxlIGluIGFueSBjYXNlKS4KIGRubAot
QUNfREVGVU4oQUNfTEJMX0hQX1BQQV9JTkZPX1RfRExfTU9EVUxFX0lEXzEsCitBQ19ERUZVTihb
QUNfTEJMX0hQX1BQQV9JTkZPX1RfRExfTU9EVUxFX0lEXzFdLAogICAgIFtBQ19NU0dfQ0hFQ0tJ
TkcoaWYgZGxfaHBfcHBhX2luZm9fdCBzdHJ1Y3QgaGFzIGRsX21vZHVsZV9pZF8xIG1lbWJlcikK
ICAgICBBQ19DQUNIRV9WQUwoYWNfY3ZfbGJsX2RsX2hwX3BwYV9pbmZvX3RfaGFzX2RsX21vZHVs
ZV9pZF8xLAogCUFDX1RSWV9DT01QSUxFKFsKQEAgLTUzNSw3ICs1MzUsNyBAQAogZG5sCiBkbmwJ
YWNfY3ZfbGJsX2hhdmVfcnVuX3BhdGggKHllcyBvciBubykKIGRubAotQUNfREVGVU4oQUNfTEJM
X0hBVkVfUlVOX1BBVEgsCitBQ19ERUZVTihbQUNfTEJMX0hBVkVfUlVOX1BBVEhdLAogICAgIFtB
Q19NU0dfQ0hFQ0tJTkcoZm9yICR7Q0MtY2N9IC1SKQogICAgIEFDX0NBQ0hFX1ZBTChhY19jdl9s
YmxfaGF2ZV9ydW5fcGF0aCwKIAlbZWNobyAnbWFpbigpe30nID4gY29uZnRlc3QuYwpAQCAtNTYx
LDcgKzU2MSw3IEBACiBkbmwJaW50MzJfdCAoZGVmaW5lZCkKIGRubAl1X2ludDMyX3QgKGRlZmlu
ZWQpCiBkbmwKLUFDX0RFRlVOKEFDX0xCTF9DSEVDS19UWVBFLAorQUNfREVGVU4oW0FDX0xCTF9D
SEVDS19UWVBFXSwKICAgICBbQUNfTVNHX0NIRUNLSU5HKGZvciAkMSB1c2luZyAkQ0MpCiAgICAg
QUNfQ0FDSEVfVkFMKGFjX2N2X2xibF9oYXZlXyQxLAogCUFDX1RSWV9DT01QSUxFKFsKQEAgLTU5
MCw3ICs1OTAsNyBAQAogZG5sCiBkbmwJTEJMX0FMSUdOIChERUZJTkVEKQogZG5sCi1BQ19ERUZV
TihBQ19MQkxfVU5BTElHTkVEX0FDQ0VTUywKK0FDX0RFRlVOKFtBQ19MQkxfVU5BTElHTkVEX0FD
Q0VTU10sCiAgICAgW0FDX01TR19DSEVDS0lORyhpZiB1bmFsaWduZWQgYWNjZXNzZXMgZmFpbCkK
ICAgICBBQ19DQUNIRV9WQUwoYWNfY3ZfbGJsX3VuYWxpZ25lZF9mYWlsLAogCVtjYXNlICIkaG9z
dF9jcHUiIGluCkBAIC02OTUsNyArNjk1LDcgQEAKIGRubAlIQVZFX09TX1BST1RPX0ggKGRlZmlu
ZWQpCiBkbmwJb3MtcHJvdG8uaCAoc3ltbGlua2VkKQogZG5sCi1BQ19ERUZVTihBQ19MQkxfREVW
RUwsCitBQ19ERUZVTihbQUNfTEJMX0RFVkVMXSwKICAgICBbcm0gLWYgb3MtcHJvdG8uaAogICAg
IGlmIHRlc3QgIiR7TEJMX0NGTEFHUytzZXR9IiA9IHNldDsgdGhlbgogCSAgICAkMT0iJCQxICR7
TEJMX0NGTEFHU30iCkBAIC04MjUsNyArODI1LDcgQEAKIGRubCBzdGF0aWNhbGx5IGFuZCBoYXBw
ZW4gdG8gaGF2ZSBhIGxpYnJlc29sdi5hIGx5aW5nIGFyb3VuZCAoYW5kIG5vCiBkbmwgbGlibnNs
LmEpLgogZG5sCi1BQ19ERUZVTihBQ19MQkxfTElCUkFSWV9ORVQsIFsKK0FDX0RFRlVOKFtBQ19M
QkxfTElCUkFSWV9ORVRdLCBbCiAgICAgIyBNb3N0IG9wZXJhdGluZyBzeXN0ZW1zIGhhdmUgZ2V0
aG9zdGJ5bmFtZSgpIGluIHRoZSBkZWZhdWx0IHNlYXJjaGVkCiAgICAgIyBsaWJyYXJpZXMgKGku
ZS4gbGliYyk6CiAgICAgIyBTb21lIE9TZXMgKGVnLiBTb2xhcmlzKSBwbGFjZSBpdCBpbiBsaWJu
c2wKQEAgLTg0OCw3ICs4NDgsNyBAQAogZG5sIFRlc3QgZm9yIF9fYXR0cmlidXRlX18KIGRubAog
Ci1BQ19ERUZVTihBQ19DX19fQVRUUklCVVRFX18sIFsKK0FDX0RFRlVOKFtBQ19DX19fQVRUUklC
VVRFX19dLCBbCiBBQ19NU0dfQ0hFQ0tJTkcoZm9yIF9fYXR0cmlidXRlX18pCiBBQ19DQUNIRV9W
QUwoYWNfY3ZfX19hdHRyaWJ1dGVfXywgWwogQUNfQ09NUElMRV9JRkVMU0UoCkBAIC04ODYsNyAr
ODg2LDcgQEAKIGRubAogZG5sIC1TY290dCBCYXJyb24KIGRubAotQUNfREVGVU4oQUNfTEJMX1RQ
QUNLRVRfU1RBVFMsCitBQ19ERUZVTihbQUNfTEJMX1RQQUNLRVRfU1RBVFNdLAogICAgW0FDX01T
R19DSEVDS0lORyhpZiBpZl9wYWNrZXQuaCBoYXMgdHBhY2tldF9zdGF0cyBkZWZpbmVkKQogICAg
QUNfQ0FDSEVfVkFMKGFjX2N2X2xibF90cGFja2V0X3N0YXRzLAogICAgQUNfVFJZX0NPTVBJTEUo
Wwo=

--001636988bf3f5d037048b83aa20
Content-Type: text/x-patch; charset=US-ASCII; 
	name="0001-Fix-some-problems-that-show-up-in-autoconf-2.64-and-.patch"
Content-Disposition: attachment; 
	filename="0001-Fix-some-problems-that-show-up-in-autoconf-2.64-and-.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_gbp8oy7h4

RnJvbSBkMWEzYTkyZmFiMTAzMjEwYWI1ZjYxNzgwYTczMWJjZTlhODkwOWI1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBHdXkgSGFycmlzIDxndXlAYWx1bS5taXQuZWR1PgpEYXRlOiBT
YXQsIDIgSmFuIDIwMTAgMTQ6MTU6NDYgLTA4MDAKU3ViamVjdDogW1BBVENIXSBGaXggc29tZSBw
cm9ibGVtcyB0aGF0IHNob3cgdXAgaW4gYXV0b2NvbmYgMi42NCBhbmQgbGF0ZXIuCgotLS0KIGFj
bG9jYWwubTQgICB8ICAgNjAgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0t
LS0tLS0tLS0tLS0tLS0tLS0tCiBjb25maWd1cmUgICAgfCAgICA5ICsrKystLS0KIGNvbmZpZ3Vy
ZS5pbiB8ICAgIDIgKwogMyBmaWxlcyBjaGFuZ2VkLCA0NSBpbnNlcnRpb25zKCspLCAyNiBkZWxl
dGlvbnMoLSkKCkluZGV4OiBsaWJwY2FwLTEuMC4wL2FjbG9jYWwubTQKPT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQotLS0g
bGlicGNhcC0xLjAuMC5vcmlnL2FjbG9jYWwubTQKKysrIGxpYnBjYXAtMS4wLjAvYWNsb2NhbC5t
NApAQCAtMjMsMzAgKzIzLDIxIEBAIGRubCBMQkwgYXV0b2NvbmYgbWFjcm9zCiBkbmwKIAogZG5s
Ci1kbmwgRGV0ZXJtaW5lIHdoaWNoIGNvbXBpbGVyIHdlJ3JlIHVzaW5nIChjYyBvciBnY2MpCi1k
bmwgSWYgdXNpbmcgZ2NjLCBkZXRlcm1pbmUgdGhlIHZlcnNpb24gbnVtYmVyCi1kbmwgSWYgdXNp
bmcgY2MsIHJlcXVpcmUgdGhhdCBpdCBzdXBwb3J0IGFuc2kgcHJvdG90eXBlcwotZG5sIElmIHVz
aW5nIGdjYywgdXNlIC1PMiAob3RoZXJ3aXNlIHVzZSAtTykKLWRubCBJZiB1c2luZyBjYywgZXhw
bGljaXRseSBzcGVjaWZ5IC91c3IvbG9jYWwvaW5jbHVkZQotZG5sCi1kbmwgdXNhZ2U6Ci1kbmwK
LWRubAlBQ19MQkxfQ19JTklUKGNvcHQsIGluY2xzKQotZG5sCi1kbmwgcmVzdWx0czoKK2RubCBE
byB3aGF0ZXZlciBBQ19MQkxfQ19JTklUIHdvcmsgaXMgbmVjZXNzYXJ5IGJlZm9yZSB1c2luZyBB
Q19QUk9HX0NDLgogZG5sCi1kbmwJJDEgKGNvcHQgc2V0KQotZG5sCSQyIChpbmNscyBzZXQpCi1k
bmwJQ0MKLWRubAlMREZMQUdTCi1kbmwJYWNfY3ZfbGJsX2djY192ZXJzCi1kbmwJTEJMX0NGTEFH
UworZG5sIEl0IGFwcGVhcnMgdGhhdCBuZXdlciB2ZXJzaW9ucyBvZiBhdXRvY29uZiAoMi42NCBh
bmQgbGF0ZXIpIHdpbGwsCitkbmwgaWYgeW91IHVzZSBBQ19UUllfQ09NUElMRSBpbiBhIG1hY3Jv
LCBzdGljayBBQ19QUk9HX0NDIGF0IHRoZQorZG5sIGJlZ2lubmluZyBvZiB0aGUgbWFjcm8sIGV2
ZW4gaWYgdGhlIG1hY3JvIGl0c2VsZiBjYWxscyBBQ19QUk9HX0NDLgorZG5sIFNlZSBzZWN0aW9u
IDIwLjggIkV4cGFuZGVkIEJlZm9yZSBSZXF1aXJlZCIgaW4gdGhlIEF1dG9jb25mCitkbmwgZG9j
dW1lbnRhdGlvbi4KK2RubAorZG5sIFRoaXMgY2F1c2VzIGEgc3RlYW1pbmcgaGVhcCBvZiBmYWls
IGluIG91ciBjYXNlLCBhcyB3ZSB3ZXJlLCBpbgorZG5sIEFDX0xCTF9DX0lOSVQsIGRvaW5nIHRo
ZSB0ZXN0cyB3ZSBub3cgZG8gaW4gQUNfTEJMX0NfUFJFUEFSRSwKK2RubCBjYWxsaW5nIEFDX1BS
T0dfQ0MsIGFuZCB0aGVuIGRvaW5nIHRoZSB0ZXN0cyB3ZSBub3cgZG8gaW4KK2RubCBBQ19MQkxf
Q19JTklULgogZG5sCi1BQ19ERUZVTihbQUNfTEJMX0NfSU5JVF0sCi0gICAgW0FDX1BSRVJFUSgy
LjEyKQotICAgIEFDX0JFRk9SRShbJDBdLCBbQUNfUFJPR19DQ10pCi0gICAgQUNfQkVGT1JFKFsk
MF0sIFtBQ19MQkxfRklYSU5DTFVERVNdKQotICAgIEFDX0JFRk9SRShbJDBdLCBbQUNfTEJMX0RF
VkVMXSkKK0FDX0RFRlVOKEFDX0xCTF9DX0lOSVRfQkVGT1JFX0NDLAorWwogICAgIEFDX0FSR19X
SVRIKGdjYywgWyAgLS13aXRob3V0LWdjYyAgICAgICAgICAgZG9uJ3QgdXNlIGdjY10pCiAgICAg
JDE9Ii1PIgogICAgICQyPSIiCkBAIC03Miw3ICs2MywzMiBAQCBBQ19ERUZVTihbQUNfTEJMX0Nf
SU5JVF0sCiAJICAgIENDPWNjCiAJICAgIGV4cG9ydCBDQwogICAgIGZpCi0gICAgQUNfUFJPR19D
QworXSkKKworZG5sCitkbmwgRGV0ZXJtaW5lIHdoaWNoIGNvbXBpbGVyIHdlJ3JlIHVzaW5nIChj
YyBvciBnY2MpCitkbmwgSWYgdXNpbmcgZ2NjLCBkZXRlcm1pbmUgdGhlIHZlcnNpb24gbnVtYmVy
CitkbmwgSWYgdXNpbmcgY2MsIHJlcXVpcmUgdGhhdCBpdCBzdXBwb3J0IGFuc2kgcHJvdG90eXBl
cworZG5sIElmIHVzaW5nIGdjYywgdXNlIC1PMiAob3RoZXJ3aXNlIHVzZSAtTykKK2RubCBJZiB1
c2luZyBjYywgZXhwbGljaXRseSBzcGVjaWZ5IC91c3IvbG9jYWwvaW5jbHVkZQorZG5sCitkbmwg
dXNhZ2U6CitkbmwKK2RubAlBQ19MQkxfQ19JTklUKGNvcHQsIGluY2xzKQorZG5sCitkbmwgcmVz
dWx0czoKK2RubAorZG5sCSQxIChjb3B0IHNldCkKK2RubAkkMiAoaW5jbHMgc2V0KQorZG5sCUND
CitkbmwJTERGTEFHUworZG5sCWFjX2N2X2xibF9nY2NfdmVycworZG5sCUxCTF9DRkxBR1MKK2Ru
bAorQUNfREVGVU4oQUNfTEJMX0NfSU5JVCwKKyAgICBbQUNfUFJFUkVRKDIuNTApCisgICAgQUNf
QkVGT1JFKFskMF0sIFtBQ19MQkxfRklYSU5DTFVERVNdKQorICAgIEFDX0JFRk9SRShbJDBdLCBb
QUNfTEJMX0RFVkVMXSkKICAgICBpZiB0ZXN0ICIkR0NDIiA9IHllcyA7IHRoZW4KIAkgICAgaWYg
dGVzdCAiJFNITElDQzIiID0geWVzIDsgdGhlbgogCQkgICAgYWNfY3ZfbGJsX2djY192ZXJzPTIK
SW5kZXg6IGxpYnBjYXAtMS4wLjAvY29uZmlndXJlCj09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KLS0tIGxpYnBjYXAtMS4w
LjAub3JpZy9jb25maWd1cmUKKysrIGxpYnBjYXAtMS4wLjAvY29uZmlndXJlCkBAIC0xODkzLDkg
KzE4OTMsNiBAQCB0ZXN0IC1uICIkdGFyZ2V0X2FsaWFzIiAmJgogCiAKIAotCi0KLQogIyBDaGVj
ayB3aGV0aGVyIC0td2l0aC1nY2Mgd2FzIGdpdmVuLgogaWYgdGVzdCAiJHt3aXRoX2djYytzZXR9
IiA9IHNldDsgdGhlbgogICB3aXRodmFsPSR3aXRoX2djYzsKQEAgLTE5NjIsNyArMTk1OSw4IEBA
IGZpCiAJICAgIENDPWNjCiAJICAgIGV4cG9ydCBDQwogICAgIGZpCi0gICAgYWNfZXh0PWMKKwor
YWNfZXh0PWMKIGFjX2NwcD0nJENQUCAkQ1BQRkxBR1MnCiBhY19jb21waWxlPSckQ0MgLWMgJENG
TEFHUyAkQ1BQRkxBR1MgY29uZnRlc3QuJGFjX2V4dCA+JjUnCiBhY19saW5rPSckQ0MgLW8gY29u
ZnRlc3QkYWNfZXhlZXh0ICRDRkxBR1MgJENQUEZMQUdTICRMREZMQUdTIGNvbmZ0ZXN0LiRhY19l
eHQgJExJQlMgPiY1JwpAQCAtMjg4MSw2ICsyODc5LDkgQEAgYWNfY29tcGlsZT0nJENDIC1jICRD
RkxBR1MgJENQUEZMQUdTIGNvbgogYWNfbGluaz0nJENDIC1vIGNvbmZ0ZXN0JGFjX2V4ZWV4dCAk
Q0ZMQUdTICRDUFBGTEFHUyAkTERGTEFHUyBjb25mdGVzdC4kYWNfZXh0ICRMSUJTID4mNScKIGFj
X2NvbXBpbGVyX2dudT0kYWNfY3ZfY19jb21waWxlcl9nbnUKIAorCisKKwogICAgIGlmIHRlc3Qg
IiRHQ0MiID0geWVzIDsgdGhlbgogCSAgICBpZiB0ZXN0ICIkU0hMSUNDMiIgPSB5ZXMgOyB0aGVu
CiAJCSAgICBhY19jdl9sYmxfZ2NjX3ZlcnM9MgpJbmRleDogbGlicGNhcC0xLjAuMC9jb25maWd1
cmUuaW4KPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PQotLS0gbGlicGNhcC0xLjAuMC5vcmlnL2NvbmZpZ3VyZS5pbgorKysg
bGlicGNhcC0xLjAuMC9jb25maWd1cmUuaW4KQEAgLTEyLDYgKzEyLDggQEAgQUNfSU5JVChwY2Fw
LmMpCiAKIEFDX0NBTk9OSUNBTF9TWVNURU0KIAorQUNfTEJMX0NfSU5JVF9CRUZPUkVfQ0MoVl9D
Q09QVCwgVl9JTkNMUykKK0FDX1BST0dfQ0MKIEFDX0xCTF9DX0lOSVQoVl9DQ09QVCwgVl9JTkNM
UywgVl9MSUJTKQogQUNfTEJMX0NfSU5MSU5FCiBBQ19DX19fQVRUUklCVVRFX18K

--001636988bf3f5d037048b83aa20--
