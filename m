Return-Path: <raj.khem@gmail.com>
Received: from mail-qc0-f175.google.com (mail-qc0-f175.google.com
	[209.85.216.175])
	by mail.openembedded.org (Postfix) with ESMTP id EC09860232
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 13 Dec 2014 01:44:04 +0000 (UTC)
Received: by mail-qc0-f175.google.com with SMTP id b13so7004254qcw.20
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Dec 2014 17:44:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to;
	bh=fhnerqhNl2jkXx+UwIOFYioJIQXLIUQfJL4QdosnkMc=;
	b=VBzutsKtDXWgiyhJdba0QCbNb55xRMVqFy0UdJZp0zEin3X9d4OdQ6W1oMFLac+fDU
	UqpYrHjjHS8K6zmUrdKbL3Hsd+VCpvEZ1hyc4EmbTIqYMlQYv9/DNROelWnsO49WrEKe
	VhXrUfITpyEy7L7F75zJ4R3CQhmc4XLMyBV4nLoNXkyIUaIKOpkqvzP8yJRHo4qcefNn
	Z/t49IOzWKUFL16sSX002zB8BFoiv/TJNpd//huxAUhCRiqmAZ4nZSRz+/LxaecNKyFU
	Po0WJCmGL0liQHfM6ePWs9H03pan8eC3wbAzvjILkfEX3GN35625iC6B/WCCD17ny41d
	QYuQ==
X-Received: by 10.229.249.137 with SMTP id mk9mr2130701qcb.4.1418435044382;
	Fri, 12 Dec 2014 17:44:04 -0800 (PST)
Received: from 10.25.251.235-ra01.westchester.pa.bo.comcast.net
	([68.87.42.115])
	by mx.google.com with ESMTPSA id r1sm3113070qam.42.2014.12.12.17.44.03
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 12 Dec 2014 17:44:03 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 8.1 \(1993\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1418433227-14617-1-git-send-email-akuster808@gmail.com>
Date: Fri, 12 Dec 2014 17:44:01 -0800
Message-Id: <86D280EF-C9D9-4644-83C3-91B9703C9292@gmail.com>
References: <1418433227-14617-1-git-send-email-akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.1993)
Subject: Re: [meta-networking][PATCH] netkit-tftp: new package
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 13 Dec 2014 01:44:10 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


> On Dec 12, 2014, at 5:13 PM, Armin Kuster <akuster808@gmail.com> =
wrote:
>=20
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
> .../recipes-netkit/netkit-tftp/netkit-tftp_0.17.bb | 70 =
++++++++++++++++++++++
> 1 file changed, 70 insertions(+)
> create mode 100644 =
meta-networking/recipes-netkit/netkit-tftp/netkit-tftp_0.17.bb
>=20
> diff --git =
a/meta-networking/recipes-netkit/netkit-tftp/netkit-tftp_0.17.bb =
b/meta-networking/recipes-netkit/netkit-tftp/netkit-tftp_0.17.bb
> new file mode 100644
> index 0000000..bd5c113
> --- /dev/null
> +++ b/meta-networking/recipes-netkit/netkit-tftp/netkit-tftp_0.17.bb
> @@ -0,0 +1,70 @@
> +DESCRIPTION =3D " tftp - Trivial file transfer protocol client \
> +    tftpd- Trivial file transfer protocol server "
> +SECTION =3D "networking"
> +LICENSE =3D =E2=80=9CBSD"

which BSD clause ?

> +DEPENDS =3D " tcp-wrappers"
> +
> +LIC_FILES_CHKSUM =3D =
"file://tftp/tftp.c;beginline=3D2;endline=3D3;md5=3D84d2cfe1e60863a7d82648=
734ba4d30c"
> +
> +SRC_URI =3D =
"${DEBIAN_MIRROR}/main/n/${BPN}/${BPN}_${PV}.orig.tar.gz;name=3Darchive =
\
> +        =
${DEBIAN_MIRROR}/main/n/${BPN}/${BPN}_${PV}-18.diff.gz;name=3Dpatch18 \
> +"
> +
> +SRC_URI[archive.md5sum] =3D "b7262c798e2ff50e29c2ff50dfd8d6a8"
> +SRC_URI[archive.sha256sum] =3D =
"3a43c0010d4e61f412563fd83769d4667d8b8e82903526d21cb9205fe55ad14d"
> +SRC_URI[patch18.md5sum] =3D "cb29e7a33dd85105ba6e6ec4f971e42c"
> +SRC_URI[patch18.sha256sum] =3D =
"092437d27b4fa88c044ef6290372fee5ce06d223607f0e22a6e527065c8930e7"
> +
> +inherit autotools-brokensep=20
> +
> +do_configure () {
> +    ./configure --prefix=3D${prefix}
> +    echo "CFLAGS=3D${CFLAGS}" > MCONFIG
> +}
> +
> +do_compile () {
> +    oe_runmake 'CC=3D${CC}' 'LD=3D${LD}' 'LDFLAGS=3D${LDFLAGS}' =
'CFLAGS=3D${CFLAGS}'=20
> +}
> +
> +do_install () {
> +    install -d ${D}${bindir}
> +    install -d ${D}${sbindir}
> +    install -d ${D}${mandir}/man1
> +    install -d ${D}${mandir}/man8
> +    install -d ${D}${sysconfdir}/xinetd.d
> +
> +    sed -i 's/install -s/install/' tftp/Makefile
> +    sed -i 's/install -s/install/' tftpd/Makefile
> +
> +    oe_runmake 'INSTALLROOT=3D${D}' 'BINMODE=3D0755' \
> +    'DAEMONMODE=3D0755' 'MANMODE=3D0644' \
> +    'BINDIR=3D${bindir}' 'SBINDIR=3D${sbindir}' \
> +    'MANDIR=3D${mandir}' install
> +
> +    # create the xinetd config file =20
> +    cat >tftp.conf <<EOF
> + service tftp=20
> + {
> +    disable        =3D no=20
> +    socket_type    =3D dgram
> +    port           =3D 69
> +    protocol       =3D udp=20
> +    wait           =3D yes
> +    user           =3D nobody=20
> +    server         =3D ${sbindir}/in.tftpd
> +    server_args    =3D /tftpboot
> + }
> +EOF

may be this can be a separate file ? since then we can override it via =
bbappend if needed

> +    install tftp.conf ${D}/${sysconfdir}/xinetd.d/tftp
> +}
> +
> +INSANE_SKIP_${PN} =3D "already-stripped=E2=80=9D

Not nice, we loose the debuggability just replace install -s in its =
makefiles with install
or may be just setting INSTALL variable is enough.

> +
> +PACKAGES =3D "${PN}-client ${PN}-server ${PN}-doc ${BPN}-dbg"
> +FILES_${PN}-client =3D "${bindir}/*"
> +FILES_${PN}-server =3D "${sbindir}/* ${sysconfdir}/xinetd.d/*"
> +FILES_${PN}-doc =3D "${mandir}"
> +FILES_${PN}-dbg =3D "${prefix}/src/debug \
> +            ${bindir}/.debug ${sbindir}/.debug"
> +
> +RDEPENDS_${PN}-server =3D "tcp-wrappers xinetd"
> --=20
> 1.9.1
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


