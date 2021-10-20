Return-Path: <esben@geanix.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 449D9C433EF
	for <webhook@archiver.kernel.org>; Wed, 20 Oct 2021 11:21:03 +0000 (UTC)
Received: from first.geanix.com (first.geanix.com [116.203.34.67])
 by mx.groups.io with SMTP id smtpd.web08.6672.1634728860477115558
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Oct 2021 04:21:02 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@geanix.com
 header.s=first header.b=BFJUsYX6;
 spf=pass (domain: geanix.com, ip: 116.203.34.67, mailfrom: esben@geanix.com)
Received: from localhost (87-49-146-144-mobile.dk.customer.tdc.net
 [87.49.146.144])
	by first.geanix.com (Postfix) with ESMTPSA id A149CC7F2C;
	Wed, 20 Oct 2021 11:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=geanix.com; s=first;
	t=1634728856; bh=WCqwmyp4RLPMVxx+VsM5NYL3CpaHmeTaqityntM66So=;
	h=From:To:Cc:Subject:Date;
	b=BFJUsYX6ioBP3yXF52pQ17oEJAuM+K9EOnJtyQf3Hh7FS1tZyQiXw+FNAjnd9zyvK
	 fmMxB7PZSMOH7PtHdJCaRM3mQrFmrPszguPsGuaVtTX2MdzRhDxlYTWIvXaLAHfglt
	 MmF0SY7PTeRYpCUlQ2fpPwhZXSdG7SMGouKT/TX3Vtsy3Pvt9tRKeB29xWMAjJuRpH
	 WhwOblYctTGzV1G7l5DlSu5P5JW6oOBtXN0e9PBZn5z/I5HHqQKMraHTTTi9KPRG3J
	 h6GS+lucYaGQcnZTLatvkAj215WJRzVLv+1QYThl+uCOFYsJ8AwV8bB8QUvWh3ykC+
	 YNTygGLMotDng==
From: Esben Haabendal <esben@geanix.com>
To: openembedded-devel@lists.openembedded.org
Cc: heinold@inf.fu-berlin.de,
	mario@ossystems.com.br,
	maxin.john@intel.com,
	otavio@ossystems.com.br,
	Esben Haabendal <esben.haabendal@huawei.com>
Subject: [meta-java] [PATCH v2] openjdk-7: fix recipe parsing for "other"
 architectures
Date: Wed, 20 Oct 2021 13:20:55 +0200
Message-Id: 
 <b099be176884f080fa998fabdc7114f2bba9cc5d.1634728692.git.esben.haabendal@huawei.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Oct 2021 11:21:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93479

From: Esben Haabendal <esben.haabendal@huawei.com>

Using meta-java in configurations where TARGET architecture is something
different than the most mainstream archictures (intel, arm, powerpc, mips=
),
bitbake errors out with something like the following:

    ERROR: ExpansionError during parsing /home/user/poky/meta-java/recipe=
s-core/openjdk/openjdk-7_99b00-2.6.5.bb
    Traceback (most recent call last):
      File "Var <LLVM_CONFIGURE_ARCH>", line 1, in <module>
      File "/home/user/poky/meta-java/classes/openjdk-build-helper.bbclas=
s", line 86, in openjdk_build_helper_get_llvm_configure_arch(d=3D<bb.data=
_smart.DataSmart object at 0x7fc729388940>):
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
can always safely expand it.

Signed-off-by: Esben Haabendal <esben.haabendal@huawei.com>
---
 recipes-core/openjdk/openjdk-7-common.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-core/openjdk/openjdk-7-common.inc b/recipes-core/ope=
njdk/openjdk-7-common.inc
index 0435233148b0..7f46a0932204 100644
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


