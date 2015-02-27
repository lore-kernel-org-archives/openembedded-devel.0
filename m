Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f51.google.com (mail-wg0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 7340972007
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Feb 2015 06:50:35 +0000 (UTC)
Received: by wghb13 with SMTP id b13so17736235wgh.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Feb 2015 22:50:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=IxKKBDkkICQm7sunVCnBcF90w1q03oZo9pPX5i7586I=;
	b=ndfKUNFh/1HJob3FRuBzjRj7WRNr/kH8yHQgvzPWQlj7vY6m/8644xXAQH2zavWs6D
	A/h5hzqa2FXvlhAVPmWFt/FN929dUlXHzmEHV3pJZfOTkoeyWvP1wISlHYFb0NlMbNSL
	znq1WQWtheEycVmdHitfxHMvBHJijQEpJcP+MAosHqIkkZLAd89NWD05IxPT65X//SqJ
	YL2X7Fg9MTbnM0VONZyUkXs0/C0YWdWu4W4uRY51g9OUQhWkzxAe1kExbJD7fvrTIs8T
	1eDj8QrxG0PItGMQodmNpS6Yj8p1ds8FmYi7/uPBs37f5kKTsWBK7/dTctMdJtzukgCQ
	aYrQ==
X-Received: by 10.181.25.232 with SMTP id it8mr3243271wid.63.1425019836753;
	Thu, 26 Feb 2015 22:50:36 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	gi3sm1416837wic.15.2015.02.26.22.50.35
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 26 Feb 2015 22:50:35 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 27 Feb 2015 07:50:54 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150227065054.GB2309@jama>
References: <1422338033-18521-1-git-send-email-schnitzeltony@googlemail.com>
	<1422338033-18521-5-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
In-Reply-To: <1422338033-18521-5-git-send-email-schnitzeltony@googlemail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-qt5][PATCH 4/5] qt5-creator: add 3.3.0 of qt-creator
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
X-List-Received-Date: Fri, 27 Feb 2015 06:50:37 -0000
X-Groupsio-MsgNum: 54516
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="H1spWtNR+x+ondvy"
Content-Disposition: inline

--H1spWtNR+x+ondvy
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 27, 2015 at 06:53:52AM +0100, Andreas M=FCller wrote:
> * this is the first version which dropped qt4 support
> * rename recipe to avoid conflicts with meta-oe's qt-creator

It still conflicts with qt-creator in sysroot on couple files, please try to
change it to use different datadir or don't stage datadir in sysroot at all=
 (if
it works without it).

ERROR: The recipe qt5-creator is trying to install files into a shared area=
 when those files already exist. Those files and their manifest location ar=
e:
   /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtc=
reator/qbs/share/qbs/modules/qbs/common.qbs
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qbs/share/qbs/modules/cpp/windows-msvc.qbs
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qbs/share/qbs/modules/cpp/windows-mingw.qbs
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qbs/share/qbs/modules/cpp/UnixGCC.qbs
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qbs/share/qbs/modules/cpp/osx-gcc.qbs
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qbs/share/qbs/modules/cpp/msvc.js
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qbs/share/qbs/modules/cpp/linux-gcc.qbs
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qbs/share/qbs/modules/cpp/ios-gcc.qbs
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qbs/share/qbs/modules/cpp/genericunix-gcc.qbs
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qbs/share/qbs/modules/cpp/GenericGCC.qbs
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qbs/share/qbs/modules/cpp/gcc.js
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qbs/share/qbs/modules/cpp/DarwinGCC.qbs
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qbs/share/qbs/modules/cpp/CppModule.qbs
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qbs/share/qbs/imports/qbs/Probes/PkgConfigProbe.qbs
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qbs/share/qbs/imports/qbs/Probes/PathProbe.qbs
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qbs/share/qbs/imports/qbs/Probes/IncludeProbe.qbs
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qbs/share/qbs/imports/qbs/Probes/FrameworkProbe.qbs
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qbs/share/qbs/imports/qbs/Probes/BinaryProbe.qbs
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qbs/share/qbs/imports/qbs/FileInfo/fileinfo.js
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qbs/share/qbs/imports/qbs/base/StaticLibrary.qbs
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qbs/share/qbs/imports/qbs/base/DynamicLibrary.qbs
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qbs/share/qbs/imports/qbs/base/CppApplication.qbs
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qbs/share/qbs/imports/qbs/base/Application.qbs
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/translations/qtcreator_cs.qm
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/translations/qtcreator_de.qm
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/translations/qtcreator_fr.qm
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/translations/qtcreator_ja.qm
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/translations/qtcreator_pl.qm
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/translations/qtcreator_ru.qm
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/translations/qtcreator_sl.qm
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/translations/qtcreator_zh_CN.qm
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/translations/qtcreator_zh_TW.qm
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/snippets/text.xml
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/snippets/qml.xml
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/snippets/cpp.xml
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/templates/wizards/README.txt
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/templates/wizards/scriptgeneratedproject/wizard_sample.xml
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/templates/wizards/scriptgeneratedproject/generate.pl
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/templates/wizards/qtquick2-extension/wizard.xml
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/templates/wizards/qtquick2-extension/qmldir
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/templates/wizards/qtquick2-extension/project.pro
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/templates/wizards/qtquick2-extension/plugin.h
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/templates/wizards/qtquick2-extension/plugin.cpp
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/templates/wizards/qtquick2-extension/object.h
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/templates/wizards/qtquick2-extension/object.cpp
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/templates/wizards/qtquick2-extension/lib.png
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/templates/wizards/qtquick1-extension/wizard.xml
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/templates/wizards/qtquick1-extension/qmldir
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/templates/wizards/qtquick1-extension/project.pro
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/templates/wizards/qtquick1-extension/plugin.h
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/templates/wizards/qtquick1-extension/plugin.cpp
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/templates/wizards/qtquick1-extension/object.h
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/templates/wizards/qtquick1-extension/object.cpp
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/templates/wizards/qtquick1-extension/lib.png
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/templates/wizards/qtcreatorplugin/wizard.xml
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/templates/wizards/qtcreatorplugin/qtcreator_logo_24.png
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/templates/wizards/qtcreatorplugin/mypluginconstants.h
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/templates/wizards/qtcreatorplugin/myplugin_global.h
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/templates/wizards/qtcreatorplugin/myplugin.pro
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/templates/wizards/qtcreatorplugin/myplugin.h
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/templates/wizards/qtcreatorplugin/myplugin.cpp
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/templates/wizards/listmodel/wizard_sample.xml
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/templates/wizards/listmodel/listmodel.h
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/templates/wizards/listmodel/listmodel.cpp
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/templates/wizards/helloworld/wizard_sample.xml
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/templates/wizards/helloworld/project.pro
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/templates/wizards/helloworld/main.cpp
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/templates/wizards/helloworld/console.png
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/templates/wizards/codesnippet/wizard.xml
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/templates/wizards/codesnippet/project.pro
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/templates/wizards/codesnippet/main.cpp
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/templates/wizards/bb-qt5-bardescriptor/wizard.xml
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/templates/wizards/bb-qt5-bardescriptor/bar-descriptor.xml
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/templates/wizards/bb-cascades-app/wizard.xml
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/templates/wizards/bb-cascades-app/project.pro
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/templates/wizards/bb-cascades-app/icon.png
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/templates/wizards/bb-cascades-app/bar-descriptor.xml
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/templates/wizards/bb-cascades-app/assets/main.qml
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/templates/wizards/bb-bardescriptor/wizard.xml
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/templates/wizards/bb-bardescriptor/bar-descriptor.xml
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/templates/shared/manifest.aegis
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/templates/shared/deployment.pri
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/templates/shared/app.desktop
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/templates/qt4project/widget.ui
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/templates/qt4project/mywidget_form.h
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/templates/qt4project/mywidget_form.cpp
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/templates/qt4project/mywidget.h
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/templates/qt4project/mywidget.cpp
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/templates/qt4project/main.cpp
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/templates/qt4project/customwidgetwizard/tpl_widget_lib.pro
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/templates/qt4project/customwidgetwizard/tpl_widget_include.pri
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/templates/qt4project/customwidgetwizard/tpl_widget.h
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/templates/qt4project/customwidgetwizard/tpl_widget.cpp
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/templates/qt4project/customwidgetwizard/tpl_single.h
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/templates/qt4project/customwidgetwizard/tpl_single.cpp
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/templates/qt4project/customwidgetwizard/tpl_resources.qrc
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/templates/qt4project/customwidgetwizard/tpl_plugin.pro
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/templates/qt4project/customwidgetwizard/tpl_collection.h
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/templates/qt4project/customwidgetwizard/tpl_collection.cpp
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/designer/templates.xml
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/designer/templates/Widget.ui
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/designer/templates/Main_Window.ui
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/designer/templates/Dialog_without_Buttons.ui
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/designer/templates/Dialog_with_Buttons_Right.ui
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/designer/templates/Dialog_with_Buttons_Bottom.ui
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/styles/intellij.xml
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/styles/inkpot.xml
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/styles/grayscale.xml
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/styles/default.xml
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/schemes/Xcode.kms
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/schemes/MS_Visual_C++.kms
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/welcomescreen/welcomescreen.qmlproject
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/welcomescreen/welcomescreen.qml
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/welcomescreen/tutorials.qml
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/welcomescreen/qtcreator_tutorials.xml
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/welcomescreen/images_areaofinterest.xml
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/welcomescreen/examples.qml
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/welcomescreen/develop.qml
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/welcomescreen/widgets/ToolTip.qml
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/welcomescreen/widgets/Sessions.qml
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/welcomescreen/widgets/SessionItem.qml
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/welcomescreen/widgets/SearchBar.qml
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/welcomescreen/widgets/RecentProjects.qml
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/welcomescreen/widgets/qmldir
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/welcomescreen/widgets/ProjectItem.qml
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/welcomescreen/widgets/PageLoader.qml
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/welcomescreen/widgets/PageCaption.qml
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/welcomescreen/widgets/Logo.qml
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/welcomescreen/widgets/LinksBar.qml
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/welcomescreen/widgets/LinkedText.qml
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/welcomescreen/widgets/IconAndLink.qml
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/welcomescreen/widgets/Delegate.qml
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/welcomescreen/widgets/CustomTab.qml
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/welcomescreen/widgets/CustomizedGridView.qml
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/welcomescreen/widgets/CustomFonts.qml
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/welcomescreen/widgets/ComboBox.qml
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/welcomescreen/widgets/images/tab.png
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/welcomescreen/widgets/images/qtcreator.png
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/welcomescreen/widgets/images/more.png
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/welcomescreen/widgets/images/info.png
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/welcomescreen/widgets/images/dropshadow.png
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/welcomescreen/widgets/images/bullet.png
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/welcomescreen/widgets/images/arrowBig.png
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/welcomescreen/widgets/images/arrow_up.png
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/welcomescreen/widgets/images/arrow_down.png
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/welcomescreen/widgets/images/mockup/thread-examples.png
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/welcomescreen/widgets/images/mockup/qtscript-examples.png
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/welcomescreen/widgets/images/mockup/penguin.png
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/welcomescreen/widgets/images/mockup/opengl-examples.png
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/welcomescreen/widgets/images/mockup/network-examples.png
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/welcomescreen/widgets/images/mockup/mainwindow-examples.png
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/welcomescreen/widgets/images/mockup/layout-examples.png
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/welcomescreen/widgets/images/mockup/itemview-examples.png
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/welcomescreen/widgets/images/mockup/draganddrop-examples.png
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/welcomescreen/widgets/images/mockup/desktop-examples.png
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/welcomescreen/widgets/images/mockup/designer-examples.png
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/welcomescreen/widgets/images/icons/videoIcon.png
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/welcomescreen/widgets/images/icons/rename.png
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/welcomescreen/widgets/images/icons/qwidget.png
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/welcomescreen/widgets/images/icons/qtquick.png
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/welcomescreen/widgets/images/icons/qt_sdk.png
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/welcomescreen/widgets/images/icons/developing_with_qt_creator.png
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/welcomescreen/widgets/images/icons/delete.png
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/welcomescreen/widgets/images/icons/ddays12.png
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/welcomescreen/widgets/images/icons/components.png
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/welcomescreen/widgets/images/icons/clone.png
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/welcomescreen/widgets/images/icons/buildrun.png
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/welcomescreen/widgets/images/icons/adressbook.png
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/welcomescreen/widgets/dummydata/tabsModel.qml
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/welcomescreen/widgets/dummydata/pagesModel.qml
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/welcomescreen/widgets/dummydata/mockupTags.qml
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/welcomescreen/widgets/dummydata/examplesModel.qml
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/welcomescreen/widgets/dummydata/context/ExampleGridView.qml
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/welcomescreen/widgets/dummydata/context/ExampleDelegate.qml
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/welcomescreen/dummydata/tutorialsModel.qml
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/welcomescreen/dummydata/sessionList.qml
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/welcomescreen/dummydata/projectList.qml
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/welcomescreen/dummydata/pagesModel.qml
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/welcomescreen/dummydata/examplesModel.qml
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qmlicons/QtWebkit/16x16/WebView.png
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qmlicons/Qt/16x16/Window.png
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qmlicons/Qt/16x16/TumblerDialog.png
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qmlicons/Qt/16x16/TumblerColumn.png
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qmlicons/Qt/16x16/TumblerButton.png
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qmlicons/Qt/16x16/Tumbler.png
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qmlicons/Qt/16x16/Transition.png
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qmlicons/Qt/16x16/ToolBar.png
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qmlicons/Qt/16x16/TimePickerDialog.png
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qmlicons/Qt/16x16/TextInput.png
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qmlicons/Qt/16x16/TextField.png
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qmlicons/Qt/16x16/TextEdit.png
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qmlicons/Qt/16x16/TextArea.png
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qmlicons/Qt/16x16/Text.png
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qmlicons/Qt/16x16/TabButton.png
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qmlicons/Qt/16x16/TabBar.png
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qmlicons/Qt/16x16/Switch.png
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qmlicons/Qt/16x16/State.png
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qmlicons/Qt/16x16/Slider.png
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qmlicons/Qt/16x16/SequentialAnimation.png
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qmlicons/Qt/16x16/Rectangle.png
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qmlicons/Qt/16x16/RatingIndicator.png
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qmlicons/Qt/16x16/RadioButton.png
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qmlicons/Qt/16x16/PropertyChanges.png
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qmlicons/Qt/16x16/ProgressBar.png
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qmlicons/Qt/16x16/PauseAnimation.png
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qmlicons/Qt/16x16/PathView.png
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qmlicons/Qt/16x16/ParallelAnimation.png
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qmlicons/Qt/16x16/PageIndicator.png
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qmlicons/Qt/16x16/MouseArea.png
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qmlicons/Qt/16x16/MoreIndicator.png
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qmlicons/Qt/16x16/ListView.png
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qmlicons/Qt/16x16/ListDelegate.png
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qmlicons/Qt/16x16/ListButton.png
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qmlicons/Qt/16x16/Item.png
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qmlicons/Qt/16x16/item-icon16.png
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qmlicons/Qt/16x16/InfoBanner.png
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qmlicons/Qt/16x16/Image.png
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qmlicons/Qt/16x16/GridView.png
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qmlicons/Qt/16x16/FocusScope.png
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qmlicons/Qt/16x16/Flipable.png
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qmlicons/Qt/16x16/Flickable.png
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qmlicons/Qt/16x16/DatePickerDialog.png
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qmlicons/Qt/16x16/CountBubble.png
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qmlicons/Qt/16x16/Component.png
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qmlicons/Qt/16x16/ColorAnimation.png
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qmlicons/Qt/16x16/ChoiceList.png
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qmlicons/Qt/16x16/CheckBox.png
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qmlicons/Qt/16x16/ButtonRow.png
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qmlicons/Qt/16x16/ButtonColumn.png
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qmlicons/Qt/16x16/Button.png
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qmlicons/Qt/16x16/BusyIndicator.png
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qmlicons/Qt/16x16/BorderImage.png
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/qmlpuppet_utilities.pri
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/qmlpuppet.qrc
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/qmlpuppet/qmlpuppetmain.cpp
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/qmlpuppet/qmlpuppet.pro
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/qmlpuppet/qmlpuppet.pri
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/qmlpuppet/instances/servernodeinstance.h
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/qmlpuppet/instances/servernodeinstance.cpp
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/qmlpuppet/instances/qt4rendernodeinstanceserver.h
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/qmlpuppet/instances/qt4rendernodeinstanceserver.cpp
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/qmlpuppet/instances/qt4previewnodeinstanceserver.h
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/qmlpuppet/instances/qt4previewnodeinstanceserver.cpp
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/qmlpuppet/instances/qt4nodeinstanceserver.h
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/qmlpuppet/instances/qt4nodeinstanceserver.cpp
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/qmlpuppet/instances/qt4nodeinstanceclientproxy.h
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/qmlpuppet/instances/qt4nodeinstanceclientproxy.cpp
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/qmlpuppet/instances/qt4informationnodeinstanceserver.h
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/qmlpuppet/instances/qt4informationnodeinstanceserver.cpp
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/qmlpuppet/instances/qmltransitionnodeinstance.h
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/qmlpuppet/instances/qmltransitionnodeinstance.cpp
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/qmlpuppet/instances/qmlstatenodeinstance.h
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/qmlpuppet/instances/qmlstatenodeinstance.cpp
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/qmlpuppet/instances/qmlpropertychangesnodeinstance.h
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/qmlpuppet/instances/qmlpropertychangesnodeinstance.cpp
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/qmlpuppet/instances/qmlgraphicsitemnodeinstance.h
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/qmlpuppet/instances/qmlgraphicsitemnodeinstance.cpp
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/qmlpuppet/instances/positionernodeinstance.h
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/qmlpuppet/instances/positionernodeinstance.cpp
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/qmlpuppet/instances/objectnodeinstance.h
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/qmlpuppet/instances/objectnodeinstance.cpp
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/qmlpuppet/instances/nodeinstancesignalspy.h
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/qmlpuppet/instances/nodeinstancesignalspy.cpp
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/qmlpuppet/instances/nodeinstanceserver.h
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/qmlpuppet/instances/nodeinstanceserver.cpp
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/qmlpuppet/instances/nodeinstancemetaobject.h
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/qmlpuppet/instances/nodeinstancemetaobject.cpp
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/qmlpuppet/instances/instances.pri
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/qmlpuppet/instances/graphicsobjectnodeinstance.h
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/qmlpuppet/instances/graphicsobjectnodeinstance.cpp
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/qmlpuppet/instances/dummynodeinstance.h
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/qmlpuppet/instances/dummynodeinstance.cpp
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/qmlpuppet/instances/dummycontextobject.h
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/qmlpuppet/instances/dummycontextobject.cpp
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/qmlpuppet/instances/componentnodeinstance.h
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/qmlpuppet/instances/componentnodeinstance.cpp
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/qmlpuppet/instances/childrenchangeeventfilter.h
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/qmlpuppet/instances/childrenchangeeventfilter.cpp
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/qmlpuppet/instances/behaviornodeinstance.h
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/qmlpuppet/instances/behaviornodeinstance.cpp
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/qmlpuppet/instances/anchorchangesnodeinstance.h
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/qmlpuppet/instances/anchorchangesnodeinstance.cpp
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/qml2puppet/qml2puppetmain.cpp
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/qml2puppet/qml2puppet.pro
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/qml2puppet/qml2puppet.pri
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/qml2puppet/instances/servernodeinstance.h
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/qml2puppet/instances/servernodeinstance.cpp
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/qml2puppet/instances/quickitemnodeinstance.h
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/qml2puppet/instances/quickitemnodeinstance.cpp
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/qml2puppet/instances/qt5rendernodeinstanceserver.h
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/qml2puppet/instances/qt5rendernodeinstanceserver.cpp
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/qml2puppet/instances/qt5previewnodeinstanceserver.h
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/qml2puppet/instances/qt5previewnodeinstanceserver.cpp
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/qml2puppet/instances/qt5nodeinstanceserver.h
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/qml2puppet/instances/qt5nodeinstanceserver.cpp
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/qml2puppet/instances/qt5nodeinstanceclientproxy.h
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/qml2puppet/instances/qt5nodeinstanceclientproxy.cpp
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/qml2puppet/instances/qt5informationnodeinstanceserver.h
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/qml2puppet/instances/qt5informationnodeinstanceserver.cpp
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/qml2puppet/instances/qmltransitionnodeinstance.h
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/qml2puppet/instances/qmltransitionnodeinstance.cpp
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/qml2puppet/instances/qmlstatenodeinstance.h
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/qml2puppet/instances/qmlstatenodeinstance.cpp
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/qml2puppet/instances/qmlpropertychangesnodeinstance.h
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/qml2puppet/instances/qmlpropertychangesnodeinstance.cpp
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/qml2puppet/instances/positionernodeinstance.h
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/qml2puppet/instances/positionernodeinstance.cpp
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/qml2puppet/instances/objectnodeinstance.h
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/qml2puppet/instances/objectnodeinstance.cpp
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/qml2puppet/instances/nodeinstancesignalspy.h
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/qml2puppet/instances/nodeinstancesignalspy.cpp
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/qml2puppet/instances/nodeinstanceserver.h
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/qml2puppet/instances/nodeinstanceserver.cpp
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/qml2puppet/instances/nodeinstancemetaobject.h
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/qml2puppet/instances/nodeinstancemetaobject.cpp
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/qml2puppet/instances/layoutnodeinstance.h
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/qml2puppet/instances/layoutnodeinstance.cpp
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/qml2puppet/instances/instances.pri
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/qml2puppet/instances/dummynodeinstance.h
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/qml2puppet/instances/dummynodeinstance.cpp
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/qml2puppet/instances/dummycontextobject.h
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/qml2puppet/instances/dummycontextobject.cpp
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/qml2puppet/instances/componentnodeinstance.h
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/qml2puppet/instances/componentnodeinstance.cpp
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/qml2puppet/instances/childrenchangeeventfilter.h
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/qml2puppet/instances/childrenchangeeventfilter.cpp
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/qml2puppet/instances/behaviornodeinstance.h
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/qml2puppet/instances/behaviornodeinstance.cpp
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/qml2puppet/instances/anchorchangesnodeinstance.h
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/qml2puppet/instances/anchorchangesnodeinstance.cpp
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/interfaces/nodeinstanceserverinterface.h
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/interfaces/nodeinstanceserverinterface.cpp
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/interfaces/nodeinstanceglobal.h
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/interfaces/nodeinstanceclientinterface.h
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/interfaces/interfaces.pri
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/interfaces/commondefines.h
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/instances/nodeinstanceclientproxy.h
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/instances/nodeinstanceclientproxy.cpp
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/instances/instances.pri
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/images/webkit.png
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/images/template_image.png
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/html/welcome.html
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/container/reparentcontainer.h
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/container/reparentcontainer.cpp
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/container/propertyvaluecontainer.h
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/container/propertyvaluecontainer.cpp
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/container/propertybindingcontainer.h
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/container/propertybindingcontainer.cpp
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/container/propertyabstractcontainer.h
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/container/propertyabstractcontainer.cpp
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/container/instancecontainer.h
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/container/instancecontainer.cpp
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/container/informationcontainer.h
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/container/informationcontainer.cpp
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/container/imagecontainer.h
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/container/imagecontainer.cpp
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/container/idcontainer.h
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/container/idcontainer.cpp
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/container/container.pri
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/container/addimportcontainer.h
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/container/addimportcontainer.cpp
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/commands/valueschangedcommand.h
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/commands/valueschangedcommand.cpp
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/commands/tokencommand.h
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/commands/tokencommand.cpp
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/commands/synchronizecommand.h
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/commands/synchronizecommand.cpp
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/commands/statepreviewimagechangedcommand.h
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/commands/statepreviewimagechangedcommand.cpp
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/commands/reparentinstancescommand.h
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/commands/reparentinstancescommand.cpp
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/commands/removesharedmemorycommand.h
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/commands/removesharedmemorycommand.cpp
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/commands/removepropertiescommand.h
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/commands/removepropertiescommand.cpp
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/commands/removeinstancescommand.h
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/commands/removeinstancescommand.cpp
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/commands/pixmapchangedcommand.h
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/commands/pixmapchangedcommand.cpp
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/commands/informationchangedcommand.h
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/commands/informationchangedcommand.cpp
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/commands/endpuppetcommand.h
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/commands/endpuppetcommand.cpp
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/commands/debugoutputcommand.h
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/commands/debugoutputcommand.cpp
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/commands/createscenecommand.h
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/commands/createscenecommand.cpp
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/commands/createinstancescommand.h
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/commands/createinstancescommand.cpp
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/commands/componentcompletedcommand.h
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/commands/componentcompletedcommand.cpp
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/commands/completecomponentcommand.h
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/commands/completecomponentcommand.cpp
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/commands/commands.pri
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/commands/clearscenecommand.h
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/commands/clearscenecommand.cpp
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/commands/childrenchangedcommand.h
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/commands/childrenchangedcommand.cpp
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/commands/changevaluescommand.h
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/commands/changevaluescommand.cpp
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/commands/changestatecommand.h
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/commands/changestatecommand.cpp
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/commands/changenodesourcecommand.h
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/commands/changenodesourcecommand.cpp
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/commands/changeidscommand.h
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/commands/changeidscommand.cpp
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/commands/changefileurlcommand.h
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/commands/changefileurlcommand.cpp
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/commands/changebindingscommand.h
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/commands/changebindingscommand.cpp
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/commands/changeauxiliarycommand.h
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmlpuppet/commands/changeauxiliarycommand.cpp
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmldump/qmlstreamwriter.h
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmldump/qmlstreamwriter.cpp
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmldump/qmldump.pro
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmldump/main.cpp
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmldump/LICENSE.LGPL
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmldump/LGPL_EXCEPTION.TXT
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml/qmldump/Info.plist.in
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml-type-descriptions/qtwebkit.qmltypes
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml-type-descriptions/qtmultimediakit.qmltypes
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml-type-descriptions/qtmobility-systeminfo.qmltypes
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml-type-descriptions/qtmobility-serviceframework.qmltypes
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml-type-descriptions/qtmobility-sensors.qmltypes
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml-type-descriptions/qtmobility-publishsubscribe.qmltypes
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml-type-descriptions/qtmobility-organizer.qmltypes
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml-type-descriptions/qtmobility-messaging.qmltypes
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml-type-descriptions/qtmobility-location.qmltypes
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml-type-descriptions/qtmobility-gallery.qmltypes
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml-type-descriptions/qtmobility-feedback.qmltypes
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml-type-descriptions/qtmobility-contacts.qmltypes
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml-type-descriptions/qtmobility-connectivity.qmltypes
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml-type-descriptions/qt5QtQuick2-bundle.json
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml-type-descriptions/qt5QtQuick1-bundle.json
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml-type-descriptions/qt4QtQuick1-bundle.json
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml-type-descriptions/qt-labs-particles.qmltypes
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml-type-descriptions/qt-labs-gestures.qmltypes
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml-type-descriptions/qt-labs-folderlistmodel.qmltypes
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml-type-descriptions/qmltypes-bundle.json
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml-type-descriptions/qmlruntime.qmltypes
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml-type-descriptions/qmlproject.qmltypes
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml-type-descriptions/qmlproject-bundle.json
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml-type-descriptions/qbs-bundle.json
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/qml-type-descriptions/builtins.qmltypes
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/generic-highlighter/yacc.xml
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/generic-highlighter/xml.xml
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/generic-highlighter/valgrind-suppression.xml
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/generic-highlighter/ruby.xml
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/generic-highlighter/perl.xml
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/generic-highlighter/javadoc.xml
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/generic-highlighter/java.xml
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/generic-highlighter/ini.xml
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/generic-highlighter/html.xml
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/generic-highlighter/dtd.xml
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/generic-highlighter/doxygen.xml
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/generic-highlighter/css.xml
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/generic-highlighter/cmake.xml
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/generic-highlighter/bash.xml
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/generic-highlighter/autoconf.xml
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/generic-highlighter/alert.xml
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/glsl/glsl_es_100_common.glsl
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/glsl/glsl_es_100.vert
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/glsl/glsl_es_100.frag
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/glsl/glsl_120_common.glsl
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/glsl/glsl_120.vert
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/glsl/glsl_120.frag
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/externaltools/vi.xml
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/externaltools/qmlscene.xml
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/externaltools/qmlviewer.xml
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/externaltools/sort.xml
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/externaltools/lupdate.xml
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/qtcre=
ator/externaltools/lrelease.xml
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/icons=
/hicolor/16x16/apps/QtProject-qtcreator.png
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/icons=
/hicolor/64x64/apps/QtProject-qtcreator.png
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/icons=
/hicolor/32x32/apps/QtProject-qtcreator.png
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/icons=
/hicolor/24x24/apps/QtProject-qtcreator.png
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/icons=
/hicolor/256x256/apps/QtProject-qtcreator.png
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/icons=
/hicolor/128x128/apps/QtProject-qtcreator.png
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/icons=
/hicolor/48x48/apps/QtProject-qtcreator.png
 Matched in manifest-qemux86-qt-creator.populate_sysroot
 /home/jenkins/oe/world/shr-core/tmp-glibc/sysroots/qemux86/usr/share/icons=
/hicolor/512x512/apps/QtProject-qtcreator.png
 Matched in manifest-qemux86-qt-creator.populate_sysroot
Please verify which recipe should provide the above files.
The build has stopped as continuing in this scenario WILL break things, if =
not now, possibly in the future (we've seen builds fail several months late=
r). If the system knew how to recover from this automatically it would howe=
ver there are several different scenarios which can result in this and we d=
on't know which one this is. It may be you have switched providers of somet=
hing like virtual/kernel (e.g. from linux-yocto to linux-yocto-dev), in tha=
t case you need to execute the clean task for both recipes and it will reso=
lve this error. It may be you changed DISTRO_FEATURES from systemd to udev =
or vice versa. Cleaning those recipes should again resolve this error howev=
er switching DISTRO_FEATURES on an existing build directory is not supporte=
d, you should really clean out tmp and rebuild (reusing sstate should be sa=
fe). It could be the overlapping files detected are harmless in which case =
adding them to SSTATE_DUPWHITELIST may be the correct solution. It could al=
so be your build is including two different conflicting versions of things =
(e.g. bluez 4 and bluez 5 and the correct solution for that would be to res=
olve the conflict. If in doubt, please ask on the mailing list, sharing the=
 error and filelist above.
ERROR: If the above message is too much, the simpler version is you're advi=
sed to wipe out tmp and rebuild (reusing sstate is fine). That will likely =
fix things in most (but not all) cases.
ERROR: Function failed: sstate_task_postfunc
ERROR: Logfile of failure stored in: /home/jenkins/oe/world/shr-core/tmp-gl=
ibc/work/i586-oe-linux/qt5-creator/3.3.0-r0/temp/log.do_populate_sysroot.15=
355
NOTE: recipe qt5-creator-3.3.0-r0: task do_populate_sysroot: Failed
ERROR: Task 8866 (/home/jenkins/oe/world/shr-core/meta-qt5/recipes-qt/qt5/q=
t5-creator_3.3.0.bb, do_populate_sysroot) failed with exit code '1'
> * Desktop file was based on [1]
>=20
> [1] http://pkgs.fedoraproject.org/cgit/qt-creator.git/tree/qtcreator.desk=
top
>=20
> Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>
> ---
>  ...t-creator-to-build-on-arm-aarch32-and-aar.patch | 94 ++++++++++++++++=
++++++
>  recipes-qt/qt5/qt5-creator/qtcreator.desktop.in    | 10 +++
>  recipes-qt/qt5/qt5-creator_3.3.0.bb                | 87 ++++++++++++++++=
++++
>  3 files changed, 191 insertions(+)
>  create mode 100644 recipes-qt/qt5/qt5-creator/0001-Fix-Allow-qt-creator-=
to-build-on-arm-aarch32-and-aar.patch
>  create mode 100644 recipes-qt/qt5/qt5-creator/qtcreator.desktop.in
>  create mode 100644 recipes-qt/qt5/qt5-creator_3.3.0.bb
>=20
> diff --git a/recipes-qt/qt5/qt5-creator/0001-Fix-Allow-qt-creator-to-buil=
d-on-arm-aarch32-and-aar.patch b/recipes-qt/qt5/qt5-creator/0001-Fix-Allow-=
qt-creator-to-build-on-arm-aarch32-and-aar.patch
> new file mode 100644
> index 0000000..3ed8bc4
> --- /dev/null
> +++ b/recipes-qt/qt5/qt5-creator/0001-Fix-Allow-qt-creator-to-build-on-ar=
m-aarch32-and-aar.patch
> @@ -0,0 +1,94 @@
> +From 748174788b318c6316e6d41ce323306120223e02 Mon Sep 17 00:00:00 2001
> +From: Greg Nietsky <gregory@distrotech.co.za>
> +Date: Tue, 4 Mar 2014 11:33:40 +0200
> +Subject: [PATCH 1/2] Fix: Allow qt-creator to build on arm aarch32 and a=
arch64
> +
> +Botan is imported hardwired for x86 this small patch allows it
> +too operate on arm other platforms could be added.
> +
> +Task-number: QTCREATORBUG-8107
> +Change-Id: Iddea28f21c9fa1afd2fdd5d16a44e6c96a516a7a
> +---
> + src/libs/3rdparty/botan/botan.cpp | 16 +++++++++++++++-
> + src/libs/3rdparty/botan/botan.h   |  2 ++
> + 2 files changed, 17 insertions(+), 1 deletion(-)
> +
> +diff --git a/src/libs/3rdparty/botan/botan.cpp b/src/libs/3rdparty/botan=
/botan.cpp
> +index b7a9ddf..c5b9826 100644
> +--- a/src/libs/3rdparty/botan/botan.cpp
> ++++ b/src/libs/3rdparty/botan/botan.cpp
> +@@ -1101,6 +1101,8 @@ class Montgomery_Exponentiator : public Modular_Ex=
ponentiator
> +=20
> + #if (BOTAN_MP_WORD_BITS !=3D 32)
> +    #error The mp_x86_32 module requires that BOTAN_MP_WORD_BITS =3D=3D =
32
> ++#elif !defined(BOTAN_TARGET_CPU_IS_X86_FAMILY)
> ++typedef Botan::u64bit dword;
> + #endif
> +=20
> + #ifdef Q_OS_UNIX
> +@@ -1118,6 +1120,7 @@ extern "C" {
> + */
> + inline word word_madd2(word a, word b, word* c)
> +    {
> ++#if defined(BOTAN_TARGET_CPU_IS_X86_FAMILY)
> +    asm(
> +       ASM("mull %[b]")
> +       ASM("addl %[c],%[a]")
> +@@ -1127,6 +1130,11 @@ inline word word_madd2(word a, word b, word* c)
> +       : "0"(a), "1"(b), [c]"g"(*c) : "cc");
> +=20
> +    return a;
> ++#else
> ++   dword z =3D (dword)a * b + *c;
> ++   *c =3D (word)(z >> BOTAN_MP_WORD_BITS);
> ++   return (word)z;
> ++#endif
> +    }
> +=20
> + /*
> +@@ -1134,6 +1142,7 @@ inline word word_madd2(word a, word b, word* c)
> + */
> + inline word word_madd3(word a, word b, word c, word* d)
> +    {
> ++#if defined(BOTAN_TARGET_CPU_IS_X86_FAMILY)
> +    asm(
> +       ASM("mull %[b]")
> +=20
> +@@ -1147,6 +1156,11 @@ inline word word_madd3(word a, word b, word c, wo=
rd* d)
> +       : "0"(a), "1"(b), [c]"g"(c), [d]"g"(*d) : "cc");
> +=20
> +    return a;
> ++#else
> ++   dword z =3D (dword)a * b + c + *d;
> ++   *d =3D (word)(z >> BOTAN_MP_WORD_BITS);
> ++   return (word)z;
> ++#endif
> +    }
> +=20
> + }
> +@@ -2315,7 +2329,7 @@ namespace Botan {
> +=20
> + extern "C" {
> +=20
> +-#ifdef Q_OS_UNIX
> ++#if defined(Q_OS_UNIX) && defined(BOTAN_TARGET_CPU_IS_X86_FAMILY)
> + /*
> + * Helper Macros for x86 Assembly
> + */
> +diff --git a/src/libs/3rdparty/botan/botan.h b/src/libs/3rdparty/botan/b=
otan.h
> +index 2981d2c..1c8d828 100644
> +--- a/src/libs/3rdparty/botan/botan.h
> ++++ b/src/libs/3rdparty/botan/botan.h
> +@@ -82,7 +82,9 @@
> + #endif
> +=20
> + #define BOTAN_TARGET_CPU_IS_LITTLE_ENDIAN
> ++#if !defined(__arm__) && !defined(__aarch64__)
> + #define BOTAN_TARGET_CPU_IS_X86_FAMILY
> ++#endif
> + #define BOTAN_TARGET_UNALIGNED_MEMORY_ACCESS_OK 1
> +=20
> + #if defined(BOTAN_TARGET_CPU_IS_LITTLE_ENDIAN) || \
> +--=20
> +1.8.3.1
> +
> diff --git a/recipes-qt/qt5/qt5-creator/qtcreator.desktop.in b/recipes-qt=
/qt5/qt5-creator/qtcreator.desktop.in
> new file mode 100644
> index 0000000..64f7c6b
> --- /dev/null
> +++ b/recipes-qt/qt5/qt5-creator/qtcreator.desktop.in
> @@ -0,0 +1,10 @@
> +[Desktop Entry]
> +Type=3DApplication
> +Exec=3Dsh -c "PATH=3D$PATH:@QT5_QMAKE@ qtcreator %F"
> +Name=3DQt Creator
> +GenericName=3DC++ IDE for developing Qt applications
> +X-KDE-StartupNotify=3Dtrue
> +Icon=3DQtProject-qtcreator
> +Terminal=3Dfalse
> +Categories=3DDevelopment;IDE;Qt;
> +MimeType=3Dtext/x-c++src;text/x-c++hdr;text/x-xsrc;application/x-designe=
r;application/vnd.nokia.qt.qmakeprofile;application/vnd.nokia.xml.qt.resour=
ce;
> diff --git a/recipes-qt/qt5/qt5-creator_3.3.0.bb b/recipes-qt/qt5/qt5-cre=
ator_3.3.0.bb
> new file mode 100644
> index 0000000..76f9982
> --- /dev/null
> +++ b/recipes-qt/qt5/qt5-creator_3.3.0.bb
> @@ -0,0 +1,87 @@
> +SUMMARY =3D "Qt Creator is a new cross-platform Qt IDE"
> +
> +# Note:
> +# The toolchain auto detection does not work completely yet. To compile/=
debug
> +# open menu 'Tools/Options and select 'Build & Run'. In tab 'Kits' selec=
t 'Desktop'
> +# 'Compiler/Manage...' and add local gcc'. At 'Debugger' select
> +# 'System GDB at /usr/bin/gdb.
> +
> +HOMEPAGE =3D "https://qt-project.org/"
> +LICENSE =3D "LGPLv2.1 | GPLv3"
> +LIC_FILES_CHKSUM =3D " \
> +    file://LGPL_EXCEPTION.TXT;md5=3Deb6c371255e1262c55ae9b652a90b528 \
> +    file://LICENSE.LGPLv21;md5=3D243b725d71bb5df4a1e5920b344b86ad \
> +    file://LICENSE.LGPLv3;md5=3Dc1939be5579666be947371bc8120425f \
> +"
> +
> +inherit qmake5
> +
> +DEPENDS =3D "qtbase qtscript qtwebkit qtxmlpatterns qtx11extras qtdeclar=
ative qttools qttools-native qtsvg"
> +
> +SRC_URI =3D " \
> +    http://download.qt.io/official_releases/qtcreator/3.3/${PV}/qt-creat=
or-opensource-src-${PV}.tar.gz \
> +    file://0001-Fix-Allow-qt-creator-to-build-on-arm-aarch32-and-aar.pat=
ch \
> +    file://qtcreator.desktop.in \
> +"
> +SRC_URI[md5sum] =3D "5e33988908282c779f2e6e4dca2bba3e"
> +SRC_URI[sha256sum] =3D "27a5c8815fab95f959134047f8315686de4de6f99b0bedfd=
46b5dedae390525a"
> +
> +S =3D "${WORKDIR}/qt-creator-opensource-src-${PV}"
> +
> +EXTRA_QMAKEVARS_PRE +=3D "IDE_LIBRARY_BASENAME=3D${baselib}/${QT_DIR_NAM=
E}"
> +
> +do_configure_prepend() {
> +    # causes gcc infinite loop with 4.9.x for arm targets similar to
> +    # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D61033
> +    export DO_NOT_BUILD_QMLDESIGNER=3D1
> +}
> +
> +do_configure_append() {
> +    # Find native tools
> +    sed -i 's:${STAGING_BINDIR}.*/lrelease:${STAGING_BINDIR_NATIVE}/${QT=
_DIR_NAME}/lrelease:g' ${B}/share/qtcreator/translations/Makefile
> +    sed -i 's:${STAGING_BINDIR}.*/qdoc:${STAGING_BINDIR_NATIVE}/${QT_DIR=
_NAME}/qdoc:g' ${B}/Makefile
> +
> +    # see qtbase-native.inc
> +    # sed -i 's:QT_INSTALL_DOCS=3D${docdir}:QT_INSTALL_DOCS=3D${STAGING_=
DATADIR_NATIVE}/${QT_DIR_NAME}/doc:g' ${B}/Makefile
> +}
> +
> +do_compile_append() {
> +    # build docs
> +    #oe_runmake docs_online
> +}
> +
> +do_install() {
> +    oe_runmake install INSTALL_ROOT=3D${D}${prefix}
> +    oe_runmake install_inst_qch_docs INSTALL_ROOT=3D${D}${prefix}
> +    # install desktop and ensure that qt-creator finds qmake
> +    install -d ${D}${datadir}/applications
> +    install -m 0644 ${WORKDIR}/qtcreator.desktop.in ${D}${datadir}/appli=
cations/qtcreator.desktop
> +    sed -i 's:@QT5_QMAKE@:${bindir}/${QT_DIR_NAME}:g' ${D}${datadir}/app=
lications/qtcreator.desktop
> +}
> +
> +FILES_${PN} +=3D " \
> +    ${datadir}/qtcreator \
> +    ${datadir}/icons \
> +    ${libdir}/${QT_DIR_NAME}/qtcreator \
> +"
> +FILES_${PN}-dbg +=3D " \
> +    ${libdir}/${QT_DIR_NAME}/qtcreator/.debug \
> +    ${libdir}/${QT_DIR_NAME}/qtcreator/plugins/.debug \
> +    ${libdir}/${QT_DIR_NAME}/qtcreator/plugins/qbs/plugins/.debug \
> +"
> +
> +FILES_${PN}-dev +=3D " \
> +    ${libdir}/${QT_DIR_NAME}/qtcreator/*${SOLIBSDEV} \
> +"
> +
> +RDEPENDS_${PN} +=3D "perl"
> +RCONFLICTS_${PN} =3D "qt-creator"
> +
> +# To give best user experience out of the box..
> +RRECOMMENDS_${PN} +=3D " \
> +    packagegroup-qt5-toolchain-target \
> +    binutils \
> +    ccache \
> +    gcc-symlinks \
> +    gdb \
> +"
> --=20
> 1.8.3.1
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--H1spWtNR+x+ondvy
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlTwE84ACgkQN1Ujt2V2gBz93ACdF4RAy6UsztKPIbpHCfnMK9zQ
zW8AoJFDbkCsOr7Go+pMWl3igtepvxyI
=ZXU1
-----END PGP SIGNATURE-----

--H1spWtNR+x+ondvy--
