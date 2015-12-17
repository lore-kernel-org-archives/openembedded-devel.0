Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f182.google.com (mail-qk0-f182.google.com
	[209.85.220.182])
	by mail.openembedded.org (Postfix) with ESMTP id CB7AA6E5CB
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Dec 2015 12:40:09 +0000 (UTC)
Received: by mail-qk0-f182.google.com with SMTP id p187so97684004qkd.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Dec 2015 04:40:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:from:date:to:subject:user-agent:mime-version
	:content-type:content-transfer-encoding;
	bh=Q7X9EjnGgKD8z/7If8YnppFPoxO/hFIRy+qwHk0t7JM=;
	b=F1e4ojY8qee5EzTOioPvAxfF7DUFbCenlhW0QgBmx5rXhtws5EHuKQ6iAgHwlxhmWL
	XuGr7NsXi314MSDDwFEJZeLa7Q35AZIR65F8OLYG7lorFMVyU77t7wV2M+Cx9Rj1mj7J
	BhB+hFKJ0wN3RmQ3XVS4iOIYsEtFLnsNMpXl80ydLyi4T29NPPwlfvYt3jAAyXhf3Wl3
	frL0q7UvaKuU9iqSk0CaTqTurtPKyDsXi2xaJYxvix/74eizj6qYxmYa+f3kebvFHEA8
	bwMrJPXiWg1+BXS81aKOK9VYC/ruQ0bVpNSX4dEdxddhQI/1TJHlS8Y3VZcI6NOPSCTc
	vtyw==
X-Received: by 10.55.55.72 with SMTP id e69mr66636882qka.42.1450356009970;
	Thu, 17 Dec 2015 04:40:09 -0800 (PST)
Received: from localhost ([177.194.217.47]) by smtp.gmail.com with ESMTPSA id
	o80sm2428664qkl.30.2015.12.17.04.40.07
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 17 Dec 2015 04:40:08 -0800 (PST)
Message-ID: <5672ad28.d3d1370a.a6c96.ffffc77d@mx.google.com>
Received: by localhost (sSMTP sendmail emulation);
	Thu, 17 Dec 2015 10:40:04 -0200
From: "Otavio Salvador" <otavio.salvador@gmail.com>
Date: Thu, 17 Dec 2015 10:40:04 -0200
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
User-Agent: mail v14.8.5
MIME-Version: 1.0
Subject: Updates to meta-java (master) in 2015-12-17
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
X-List-Received-Date: Thu, 17 Dec 2015 12:40:10 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello,

I pushed following updates:

commit 35739fca028996c594b1efa2225a77c8d6038193 (HEAD -> pending, yocto/mas=
ter, m/master)
Author: Erkka K=C3=A4=C3=A4ri=C3=A4 <erkka.kaaria@intel.com>
Date:   Wed Dec 16 12:49:13 2015 +0200

    openjdk-8: Use zero mode on arm
   =20
    Currently arm build fails due to hotspot errors. Use zero mode instead.
   =20
    Signed-off-by: Erkka K=C3=A4=C3=A4ri=C3=A4 <erkka.kaaria@intel.com>
    Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

commit 90dd0d795d239e845cd235662dcce5134655ecab
Author: Jackie Huang <jackie.huang@windriver.com>
Date:   Wed Dec 16 14:42:07 2015 +0800

    openjdk-7: skip the already-stripped test
   =20
    libfreetype.so.6 is copied from STAGING_LIBDIR and
    binaries/libraries in sysroot are already stripped
    since the following commit in oe-core:
    "30f3774 staging: Strip files in sysroot"
   =20
    Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
    Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

commit d4fbf276edcc2dbf7531ac0daa2bb169c3d5adee
Author: Jackie Huang <jackie.huang@windriver.com>
Date:   Tue Dec 15 14:46:45 2015 +0800

    openjdk-7: drop an inappropriate patch
   =20
    The patch icedtea-jdk-build-nio-gensor-genuc-gensc-static.patch
    is to add static option to build nio gensor/genuc/gensc, and
    was added when upgrading to IcedTea 2.6.1 OpenJDK 7u85b01.
   =20
    Another patch icedtea-jdk-nio-use-host-cc.patch uses host cc
    for nio build so it fails on host that lack of static libraries:
    | /usr/bin/ld: cannot find -lpthread
   =20
    And there is no comments explaining why it needs static linking,
    so drop the patch for now unless we have better understanding
    and make a more proper patch.
   =20
    Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
    Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

commit a16545d6c8ecb1eda359d86ad5613f1d9d7b9f48
Author: Jackie Huang <jackie.huang@windriver.com>
Date:   Mon Dec 14 17:01:19 2015 +0800

    cacao: fix the depends for target package
   =20
    The target package also depends on classpath, zlib, etc,
    which is incorrect overrode, use _append for the
    class-target instead.
   =20
    Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
    Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

commit bf6405846903e2e5495a337c8f2076eb915b15f6
Author: Jens Rehsack <rehsack@gmail.com>
Date:   Sat Dec 12 10:36:02 2015 +0100

    openjdk-8: fix rewrite QA warnings
   =20
    Fix bitbake warnings from variable renaming like
   =20
        Variable key FILES_${PN} (${bindir}/* ${sbindir}/* ${libexecdir}/* =
${libdir}/lib*${SOLIBS} ${sysconfdir} ${sharedstatedir} ${localstatedir} ${=
base_bindir}/* ${base_sbindir}/* ${base_libdir}/*${SOLIBS} ${base_prefix}/l=
ib/udev/rules.d ${prefix}/lib/udev/rules.d ${datadir}/${BPN} ${libdir}/${BP=
N}/* ${datadir}/pixmaps ${datadir}/applications ${datadir}/idl ${datadir}/o=
mf ${datadir}/sounds ${libdir}/bonobo/servers) replaces original key FILES_=
openjre-8 (    ${JRE_HOME}/bin/[a-z]*     ${JRE_HOME}/lib/[a-z]*     ${JRE_=
HOME}/LICENSE     ${JRE_HOME}/release ).
   =20
    It is caused by using FILES_${PN} and FILES_{JDKPN} or FILES_${JREPN},
    respectively. Moving FILES_{JDKPN} to openjdk-8_%.bb and FILES_${JREPN}=
 to
    openjre-8_%.bb to allow consequently use FILES_${PN}.
   =20
    Signed-off-by: Jens Rehsack <sno@netbsd.org>
    Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

Regards,

--
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

