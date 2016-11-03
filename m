Return-Path: <dl9pf@gmx.de>
X-Greylist: delayed 307 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 03 Nov 2016 11:08:22 UTC
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	by mail.openembedded.org (Postfix) with ESMTP id F08B7606A8
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  3 Nov 2016 11:08:22 +0000 (UTC)
Received: from elrond.localnet ([95.90.2.192]) by mail.gmx.com (mrgmx002) with
	ESMTPSA (Nemesis) id 0MYfre-1cNn3M3yq2-00VSz4;
	Thu, 03 Nov 2016 12:03:11 +0100
From: Jan-Simon =?ISO-8859-1?Q?M=F6ller?= <dl9pf@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 03 Nov 2016 12:03:10 +0100
Message-ID: <1735731.JWP8iUgCxd@elrond>
User-Agent: KMail/4.14.10 (Linux/4.1.34-33-default; KDE/4.14.18; x86_64; ; )
MIME-Version: 1.0
X-Provags-ID: V03:K0:NXO1cxWFl7MVGqBmyMbagSASIAGYhUVofqkbCodOMgvPnrm+bc7
	l3HDPBFQYmLbdz9P3Rfk0ypu70zmRBfezKFfdD1ZtNzX7V/HLy5IgIUPN9KMiJdzz5yM6ep
	5EJFFnXIWVQlNKgKpiPnQEbIvvhOEDn+ApYjLy7gypA4em77JgIG+ymVRR0T3rUcHmM1Uq6
	2ecPfV20fp8cZlr/wKN+Q==
X-UI-Out-Filterresults: notjunk:1;V01:K0:FSYfqKs9BMQ=:6hs1f8slXLsvx+WvbRX913
	VG8rzMNpahB231/0h+7jYvYarkWmjIPOLmSxbDCArl642LHRWud/7xomy49Xk/PDTFRNHtyBB
	O/AC+M1yFEG1KtrMmM+2Jc7r/CE1WXfwinQtgTOJ1JCyEh6iWWYg63sf5rxAHjOqvFX3ogqSU
	6NlhiXiFdxMvJVanztq5MhyI8z77uyXALddxz80FZqGlqEIbJkZyUDK3Ac+DiwI+oQa/IPVdU
	YbrIrUR2E/5gGgnA5Rnkl0ii5KmiD/RdEyII44nvkEsQKgcOwOlDeB5VTw7fQcCocIXQrARG1
	yL3rMI4ghvtz6TQeUaFr9amGllc4AwzB3645+MSNJxBKvq7KC0mg/vlZ310y852YYCFlTztkD
	bSU8Q5TLCVrfl4Oedz/7x+mLitKwNRoeerQZ9cbP7TlFvb5toIqfBhV8MpGYDOvnxbZJMEnnx
	hYlZqs7JUsmVOsV3P7vdsDDWhnBygxD334FnuepjjSZ9SulFIp3pneyAfSp3/c3aFeoI/5ObH
	VDRTBe4VUTq5NNoTnvkAcUbNILYKoVO0J/oiJWWY6ECYi3k1WDU5LghD3jhAKmhYZqIj4BzW/
	+SRuCPZ6nnC3VB4QI3mhGXAtWSre0Kuupqs85dKP6Q6m2ylii0LYrwwxBopa046EEfO9FErge
	8cUp+unv//apH9GZcRNvIhRE0AoROLrmYoyFQKfxqcZfSNlJgzshTHVkN8XUnmVdYSQO5r7WD
	s5PDM+wW2buV3lSFdiAka3IKTj86DrPymA9ZsJhmZIyFKhceNmiEXkF+clbZMeMb4Lpt5Cl/o
	6z9fX8y
Subject: [meta-oe] p7zip recipe broken with rm_work
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
X-List-Received-Date: Thu, 03 Nov 2016 11:08:25 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Hi !

./meta-oe/recipes-extended/p7zip/p7zip_9.20.1.bb

defines:

do_install_class-native() {
    install -d ${D}${bindir}
    install -d ${D}${bindir}/Codecs
    install -m 0755 ${S}/bin/7* ${D}${bindir}
    install -m 0755 ${S}/bin/Codecs/* ${D}${bindir}/Codecs

    # Create a shell script wrapper to execute next to 7z.so
    mv ${D}${bindir}/7z ${D}${bindir}/7z.bin
    echo "#! /bin/sh" > ${D}${bindir}/7z
    echo "exec ${D}${bindir}/7z.bin \"\$@\"" >> ${D}${bindir}/7z
    chmod 0755 ${D}${bindir}/7z
}

This wrapper breaks with "rm_work". Shouldn't it use the sysroot ?

Best,
--=20
--
Jan-Simon M=F6ller
dl9pf@gmx.de

