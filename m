Received: from first.geanix.com (first.geanix.com [116.203.34.67])
 by mx.groups.io with SMTP id smtpd.web11.550.1631027118541629815
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Sep 2021 08:05:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@geanix.com header.s=first header.b=jrhbDzrg;
 spf=pass (domain: geanix.com, ip: 116.203.34.67, mailfrom: esben@geanix.com)
Received: from localhost (unknown [185.17.218.86])
	by first.geanix.com (Postfix) with ESMTPSA id 30F69440F7F;
	Tue,  7 Sep 2021 15:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=geanix.com; s=first;
	t=1631027105; bh=mWEIuzJeWRznHZNJsZaHTda6XKbe3tHpdpNMVmewusk=;
	h=From:To:Cc:Subject:Date;
	b=jrhbDzrgeGSwhwtWmB6C3kKgCkGPkXxcMVASWRDYgWiPTVPaTbfJOYZ+m0zvG51be
	 Ud0RaP6EPZoozvLjuFhl7XpK4KwOtnQM3kcACOBEYw0ZT4P+Z0Wolca9VXHhD/ktyS
	 KegiYQ+5aQli1eKRGQOh4oa+GY+Toslmd6SVXou6+B0U8+NM11G4C+Z0aOB52SRH6M
	 DjMvJvk5qFZUxNfRkq9ZmzOzygBuMyRC0p6Cc8dYFuj5x5d22Rm7fOKb8YUfLCvP+x
	 ihx4OlzxNluUSLAaVM8wodBg5M8vHvcycFnwTOdOJ0IoFvgxaOUUY8Emo1vA4Dcsgf
	 D6tliLBOSW13w==
From: "Esben Haabendal" <esben@geanix.com>
To: openembedded-devel@lists.openembedded.org
Cc: Esben Haabendal <esben.haabendal@huawei.com>
Subject: [meta-java] [PATCH] openjdk-7: fix recipe parsing for "other" architectures
Date: Tue,  7 Sep 2021 17:05:04 +0200
Message-Id: <348657c1580c048fe36168fee8970673941e41b9.1631027018.git.esben@geanix.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
X-Spam-Status: No, score=-3.1 required=4.0 tests=ALL_TRUSTED,BAYES_00,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,URIBL_BLOCKED
	autolearn=disabled version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on 13e2a5895688
Content-Transfer-Encoding: quoted-printable

Using meta-java in configurations where TARGET architecture is something
different than the most mainstream archictures (intel, arm, powerpc, mips=
),
bitbake errors out with something like the following:

    ERROR: ExpansionError during parsing /home/esben/ostc/openharmony/pok=
y/meta-java/recipes-core/openjdk/openjdk-7_99b00-2.6.5.bb
    Traceback (most recent call last):
      File "Var <LLVM_CONFIGURE_ARCH>", line 1, in <module>
      File "/home/esben/ostc/openharmony/poky/meta-java/classes/openjdk-b=
uild-helper.bbclass", line 86, in openjdk_build_helper_get_llvm_configure=
_arch(d=3D<bb.data_smart.DataSmart object at 0x7fc729388940>):
             else:
        >        if 'shark' in d.getVar('PACKAGECONFIG').split():
                     bb.warn("%s does not support %s in Shark builds yet"=
 % (d.getVar('PN'), arch) );
    bb.data_smart.ExpansionError: Failure expanding variable LLVM_CONFIGU=
RE_ARCH, expression was ${@openjdk_build_helper_get_llvm_configure_arch(d=
)} which triggered exception AttributeError: 'NoneType' object has no att=
ribute 'split'

It should be safe to set PACKAGECONFIG default value to empty string, so =
we
can safely expand it.

Signed-off-by: Esben Haabendal <esben.haabendal@huawei.com>
---
 recipes-core/openjdk/openjdk-7-common.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-core/openjdk/openjdk-7-common.inc b/recipes-core/ope=
njdk/openjdk-7-common.inc
index c87266dcce58..0db8aecd2945 100644
--- a/recipes-core/openjdk/openjdk-7-common.inc
+++ b/recipes-core/openjdk/openjdk-7-common.inc
@@ -97,6 +97,7 @@ export CACAO_CONFIGURE_ARGS =3D " \
=20
 JAVA_HOME[unexport] =3D "1"
=20
+PACKAGECONFIG ??=3D ""
 PACKAGECONFIG[kerberos] =3D "--enable-system-kerberos,--disable-system-k=
erberos,krb5"
=20
 EXTRA_OECONF =3D " \
--=20
2.33.0

