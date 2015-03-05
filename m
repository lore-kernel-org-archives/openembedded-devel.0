Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by mail.openembedded.org (Postfix) with ESMTP id 3E3CE7385B
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Mar 2015 18:01:15 +0000 (UTC)
Received: by widem10 with SMTP id em10so40344916wid.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Mar 2015 10:01:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=fPWf8z0Aaa9wZdrtsquoGDlJFbn+VXXkb+qFprCyzAE=;
	b=iWAqU8AjB7Bt2bmKcqplDbpvixMpuT+jhdXx1UasRJdFEMpwxGy3Ohe3jgNN3VBYof
	qEvwl4xM8cjicAdw5617pCQxS0R4Ux6X1FnRaGkKgWHlTc//sIvix77AzaqwZyLFU0Rd
	DMkcpWT+C0YAHxdjBEacUd+zEuzsxo+eIlXypbtIxtg/OOwHAU6zEagaVphplKfVgYCH
	sSvYEQrtJbdrTdNvF037bkgMVdp7aBmoHyg0cWqjlLvN/Kw2W4GPw7bgRTXoU3QwOzzr
	l4c+/jUSHKSaKlF/mRCwRLZ36T2r0cyXnwnlcOzHvar+bbYHCKFhkvoUej+hFlWCtls3
	JvxQ==
X-Received: by 10.180.206.83 with SMTP id lm19mr25300519wic.41.1425578476485; 
	Thu, 05 Mar 2015 10:01:16 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	fu1sm9962708wic.2.2015.03.05.10.01.15
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 05 Mar 2015 10:01:15 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Thu, 5 Mar 2015 19:01:20 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150305180120.GX2337@jama>
References: <1425248624-2993-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
In-Reply-To: <1425248624-2993-1-git-send-email-schnitzeltony@googlemail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH] qt-creator: avoid conflicts with meta-qt5's qt5-creator
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
X-List-Received-Date: Thu, 05 Mar 2015 18:01:17 -0000
X-Groupsio-MsgNum: 54666
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="JjNtGRvLZqzR8wa5"
Content-Disposition: inline

--JjNtGRvLZqzR8wa5
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 01, 2015 at 11:23:44PM +0100, Andreas M=FCller wrote:
> We avoid conflicts by installing no files to sysroot. This causes no fall=
out
> because nothing depends on qt5-creator (if something included later depen=
ding
> on qt-creator it should depend on qt5-creator).
> Note that
>=20
> | WARNING: QA Issue: qt5-creator rdepends on qt-creator, but it isn't a b=
uild dependency? [build-deps]
>=20
> is a false positve because the names of the libraries are same as for
> qt5-creator (see test below).

This isn't enough to resolve the warning (but it resolves the sysroot
conflict which is good).

qt-creator is still recorded as runtime provider for couple of
libraries, we can list them all in PRIVATE_LIBS (if we can assume that
nothing will link against them - which is already assumed by not staging
them).

Here is the list from qt5-creator log.do_package:

$ grep "requires package qt-creator" log.do_package
DEBUG: qt5-creator: Dependency libCore.so requires package qt-creator (used=
 by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e-oe-linux-g=
nueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/lib/qt5/qtcreato=
r/plugins/libQmlJSTools.so)
DEBUG: qt5-creator: Dependency libProjectExplorer.so requires package qt-cr=
eator (used by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e=
-oe-linux-gnueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/lib/q=
t5/qtcreator/plugins/libQmlJSTools.so)
DEBUG: qt5-creator: Dependency libQtSupport.so requires package qt-creator =
(used by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e-oe-li=
nux-gnueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/lib/qt5/qtc=
reator/plugins/libQmlJSTools.so)
DEBUG: qt5-creator: Dependency libTextEditor.so requires package qt-creator=
 (used by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e-oe-l=
inux-gnueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/lib/qt5/qt=
creator/plugins/libQmlJSTools.so)
DEBUG: qt5-creator: Dependency libCppTools.so requires package qt-creator (=
used by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e-oe-lin=
ux-gnueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/lib/qt5/qtcr=
eator/plugins/libQmlJSTools.so)
DEBUG: qt5-creator: Dependency libAnalyzerBase.so requires package qt-creat=
or (used by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e-oe=
-linux-gnueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/lib/qt5/=
qtcreator/plugins/libQmlProfiler.so)
DEBUG: qt5-creator: Dependency libCore.so requires package qt-creator (used=
 by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e-oe-linux-g=
nueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/lib/qt5/qtcreato=
r/plugins/libQmlProfiler.so)
DEBUG: qt5-creator: Dependency libProjectExplorer.so requires package qt-cr=
eator (used by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e=
-oe-linux-gnueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/lib/q=
t5/qtcreator/plugins/libQmlProfiler.so)
DEBUG: qt5-creator: Dependency libQtSupport.so requires package qt-creator =
(used by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e-oe-li=
nux-gnueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/lib/qt5/qtc=
reator/plugins/libQmlProfiler.so)
DEBUG: qt5-creator: Dependency libProjectExplorer.so requires package qt-cr=
eator (used by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e=
-oe-linux-gnueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/lib/q=
t5/qtcreator/plugins/libClearCase.so)
DEBUG: qt5-creator: Dependency libTextEditor.so requires package qt-creator=
 (used by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e-oe-l=
inux-gnueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/lib/qt5/qt=
creator/plugins/libClearCase.so)
DEBUG: qt5-creator: Dependency libCore.so requires package qt-creator (used=
 by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e-oe-linux-g=
nueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/lib/qt5/qtcreato=
r/plugins/libClearCase.so)
DEBUG: qt5-creator: Dependency libVcsBase.so requires package qt-creator (u=
sed by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e-oe-linu=
x-gnueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/lib/qt5/qtcre=
ator/plugins/libClearCase.so)
DEBUG: qt5-creator: Dependency libCore.so requires package qt-creator (used=
 by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e-oe-linux-g=
nueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/lib/qt5/qtcreato=
r/plugins/libQmlProjectManager.so)
DEBUG: qt5-creator: Dependency libProjectExplorer.so requires package qt-cr=
eator (used by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e=
-oe-linux-gnueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/lib/q=
t5/qtcreator/plugins/libQmlProjectManager.so)
DEBUG: qt5-creator: Dependency libQtSupport.so requires package qt-creator =
(used by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e-oe-li=
nux-gnueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/lib/qt5/qtc=
reator/plugins/libQmlProjectManager.so)
DEBUG: qt5-creator: Dependency libAnalyzerBase.so requires package qt-creat=
or (used by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e-oe=
-linux-gnueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/lib/qt5/=
qtcreator/plugins/libQnx.so)
DEBUG: qt5-creator: Dependency libCore.so requires package qt-creator (used=
 by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e-oe-linux-g=
nueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/lib/qt5/qtcreato=
r/plugins/libQnx.so)
DEBUG: qt5-creator: Dependency libDebugger.so requires package qt-creator (=
used by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e-oe-lin=
ux-gnueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/lib/qt5/qtcr=
eator/plugins/libQnx.so)
DEBUG: qt5-creator: Dependency libProjectExplorer.so requires package qt-cr=
eator (used by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e=
-oe-linux-gnueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/lib/q=
t5/qtcreator/plugins/libQnx.so)
DEBUG: qt5-creator: Dependency libQtSupport.so requires package qt-creator =
(used by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e-oe-li=
nux-gnueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/lib/qt5/qtc=
reator/plugins/libQnx.so)
DEBUG: qt5-creator: Dependency libRemoteLinux.so requires package qt-creato=
r (used by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e-oe-=
linux-gnueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/lib/qt5/q=
tcreator/plugins/libQnx.so)
DEBUG: qt5-creator: Dependency libTextEditor.so requires package qt-creator=
 (used by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e-oe-l=
inux-gnueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/lib/qt5/qt=
creator/plugins/libQnx.so)
DEBUG: qt5-creator: Dependency libCore.so requires package qt-creator (used=
 by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e-oe-linux-g=
nueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/lib/qt5/qtcreato=
r/plugins/libCMakeProjectManager.so)
DEBUG: qt5-creator: Dependency libProjectExplorer.so requires package qt-cr=
eator (used by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e=
-oe-linux-gnueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/lib/q=
t5/qtcreator/plugins/libCMakeProjectManager.so)
DEBUG: qt5-creator: Dependency libCppTools.so requires package qt-creator (=
used by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e-oe-lin=
ux-gnueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/lib/qt5/qtcr=
eator/plugins/libCMakeProjectManager.so)
DEBUG: qt5-creator: Dependency libTextEditor.so requires package qt-creator=
 (used by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e-oe-l=
inux-gnueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/lib/qt5/qt=
creator/plugins/libCMakeProjectManager.so)
DEBUG: qt5-creator: Dependency libQtSupport.so requires package qt-creator =
(used by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e-oe-li=
nux-gnueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/lib/qt5/qtc=
reator/plugins/libCMakeProjectManager.so)
DEBUG: qt5-creator: Dependency libAnalyzerBase.so requires package qt-creat=
or (used by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e-oe=
-linux-gnueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/lib/qt5/=
qtcreator/plugins/libValgrind.so)
DEBUG: qt5-creator: Dependency libCore.so requires package qt-creator (used=
 by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e-oe-linux-g=
nueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/lib/qt5/qtcreato=
r/plugins/libValgrind.so)
DEBUG: qt5-creator: Dependency libProjectExplorer.so requires package qt-cr=
eator (used by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e=
-oe-linux-gnueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/lib/q=
t5/qtcreator/plugins/libValgrind.so)
DEBUG: qt5-creator: Dependency libTextEditor.so requires package qt-creator=
 (used by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e-oe-l=
inux-gnueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/lib/qt5/qt=
creator/plugins/libValgrind.so)
DEBUG: qt5-creator: Dependency libRemoteLinux.so requires package qt-creato=
r (used by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e-oe-=
linux-gnueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/lib/qt5/q=
tcreator/plugins/libValgrind.so)
DEBUG: qt5-creator: Dependency libCore.so requires package qt-creator (used=
 by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e-oe-linux-g=
nueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/lib/qt5/qtcreato=
r/plugins/libDebugger.so)
DEBUG: qt5-creator: Dependency libCppTools.so requires package qt-creator (=
used by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e-oe-lin=
ux-gnueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/lib/qt5/qtcr=
eator/plugins/libDebugger.so)
DEBUG: qt5-creator: Dependency libProjectExplorer.so requires package qt-cr=
eator (used by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e=
-oe-linux-gnueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/lib/q=
t5/qtcreator/plugins/libDebugger.so)
DEBUG: qt5-creator: Dependency libTextEditor.so requires package qt-creator=
 (used by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e-oe-l=
inux-gnueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/lib/qt5/qt=
creator/plugins/libDebugger.so)
DEBUG: qt5-creator: Dependency libCore.so requires package qt-creator (used=
 by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e-oe-linux-g=
nueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/lib/qt5/qtcreato=
r/plugins/libAndroid.so)
DEBUG: qt5-creator: Dependency libDebugger.so requires package qt-creator (=
used by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e-oe-lin=
ux-gnueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/lib/qt5/qtcr=
eator/plugins/libAndroid.so)
DEBUG: qt5-creator: Dependency libProjectExplorer.so requires package qt-cr=
eator (used by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e=
-oe-linux-gnueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/lib/q=
t5/qtcreator/plugins/libAndroid.so)
DEBUG: qt5-creator: Dependency libQtSupport.so requires package qt-creator =
(used by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e-oe-li=
nux-gnueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/lib/qt5/qtc=
reator/plugins/libAndroid.so)
DEBUG: qt5-creator: Dependency libTextEditor.so requires package qt-creator=
 (used by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e-oe-l=
inux-gnueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/lib/qt5/qt=
creator/plugins/libAndroid.so)
DEBUG: qt5-creator: Dependency libAnalyzerBase.so requires package qt-creat=
or (used by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e-oe=
-linux-gnueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/lib/qt5/=
qtcreator/plugins/libAndroid.so)
DEBUG: qt5-creator: Dependency libCore.so requires package qt-creator (used=
 by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e-oe-linux-g=
nueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/lib/qt5/qtcreato=
r/plugins/libWinRt.so)
DEBUG: qt5-creator: Dependency libDebugger.so requires package qt-creator (=
used by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e-oe-lin=
ux-gnueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/lib/qt5/qtcr=
eator/plugins/libWinRt.so)
DEBUG: qt5-creator: Dependency libProjectExplorer.so requires package qt-cr=
eator (used by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e=
-oe-linux-gnueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/lib/q=
t5/qtcreator/plugins/libWinRt.so)
DEBUG: qt5-creator: Dependency libQtSupport.so requires package qt-creator =
(used by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e-oe-li=
nux-gnueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/lib/qt5/qtc=
reator/plugins/libWinRt.so)
DEBUG: qt5-creator: Dependency libCore.so requires package qt-creator (used=
 by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e-oe-linux-g=
nueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/lib/qt5/qtcreato=
r/plugins/libMacros.so)
DEBUG: qt5-creator: Dependency libTextEditor.so requires package qt-creator=
 (used by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e-oe-l=
inux-gnueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/lib/qt5/qt=
creator/plugins/libMacros.so)
DEBUG: qt5-creator: Dependency libCore.so requires package qt-creator (used=
 by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e-oe-linux-g=
nueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/lib/qt5/qtcreato=
r/plugins/libGLSLEditor.so)
DEBUG: qt5-creator: Dependency libTextEditor.so requires package qt-creator=
 (used by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e-oe-l=
inux-gnueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/lib/qt5/qt=
creator/plugins/libGLSLEditor.so)
DEBUG: qt5-creator: Dependency libCppTools.so requires package qt-creator (=
used by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e-oe-lin=
ux-gnueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/lib/qt5/qtcr=
eator/plugins/libGLSLEditor.so)
DEBUG: qt5-creator: Dependency libTextEditor.so requires package qt-creator=
 (used by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e-oe-l=
inux-gnueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/lib/qt5/qt=
creator/plugins/libBinEditor.so)
DEBUG: qt5-creator: Dependency libCore.so requires package qt-creator (used=
 by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e-oe-linux-g=
nueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/lib/qt5/qtcreato=
r/plugins/libBinEditor.so)
DEBUG: qt5-creator: Dependency libTextEditor.so requires package qt-creator=
 (used by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e-oe-l=
inux-gnueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/lib/qt5/qt=
creator/plugins/libGit.so)
DEBUG: qt5-creator: Dependency libCore.so requires package qt-creator (used=
 by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e-oe-linux-g=
nueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/lib/qt5/qtcreato=
r/plugins/libGit.so)
DEBUG: qt5-creator: Dependency libVcsBase.so requires package qt-creator (u=
sed by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e-oe-linu=
x-gnueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/lib/qt5/qtcre=
ator/plugins/libGit.so)
DEBUG: qt5-creator: Dependency libDiffEditor.so requires package qt-creator=
 (used by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e-oe-l=
inux-gnueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/lib/qt5/qt=
creator/plugins/libGit.so)
DEBUG: qt5-creator: Dependency libTextEditor.so requires package qt-creator=
 (used by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e-oe-l=
inux-gnueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/lib/qt5/qt=
creator/plugins/libMercurial.so)
DEBUG: qt5-creator: Dependency libCore.so requires package qt-creator (used=
 by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e-oe-linux-g=
nueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/lib/qt5/qtcreato=
r/plugins/libMercurial.so)
DEBUG: qt5-creator: Dependency libVcsBase.so requires package qt-creator (u=
sed by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e-oe-linu=
x-gnueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/lib/qt5/qtcre=
ator/plugins/libMercurial.so)
DEBUG: qt5-creator: Dependency libProjectExplorer.so requires package qt-cr=
eator (used by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e=
-oe-linux-gnueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/lib/q=
t5/qtcreator/plugins/libAutotoolsProjectManager.so)
DEBUG: qt5-creator: Dependency libCore.so requires package qt-creator (used=
 by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e-oe-linux-g=
nueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/lib/qt5/qtcreato=
r/plugins/libAutotoolsProjectManager.so)
DEBUG: qt5-creator: Dependency libCppTools.so requires package qt-creator (=
used by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e-oe-lin=
ux-gnueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/lib/qt5/qtcr=
eator/plugins/libAutotoolsProjectManager.so)
DEBUG: qt5-creator: Dependency libCore.so requires package qt-creator (used=
 by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e-oe-linux-g=
nueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/lib/qt5/qtcreato=
r/plugins/libBeautifier.so)
DEBUG: qt5-creator: Dependency libDiffEditor.so requires package qt-creator=
 (used by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e-oe-l=
inux-gnueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/lib/qt5/qt=
creator/plugins/libBeautifier.so)
DEBUG: qt5-creator: Dependency libProjectExplorer.so requires package qt-cr=
eator (used by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e=
-oe-linux-gnueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/lib/q=
t5/qtcreator/plugins/libBeautifier.so)
DEBUG: qt5-creator: Dependency libTextEditor.so requires package qt-creator=
 (used by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e-oe-l=
inux-gnueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/lib/qt5/qt=
creator/plugins/libBeautifier.so)
DEBUG: qt5-creator: Dependency libCore.so requires package qt-creator (used=
 by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e-oe-linux-g=
nueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/lib/qt5/qtcreato=
r/plugins/libQmakeAndroidSupport.so)
DEBUG: qt5-creator: Dependency libProjectExplorer.so requires package qt-cr=
eator (used by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e=
-oe-linux-gnueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/lib/q=
t5/qtcreator/plugins/libQmakeAndroidSupport.so)
DEBUG: qt5-creator: Dependency libQtSupport.so requires package qt-creator =
(used by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e-oe-li=
nux-gnueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/lib/qt5/qtc=
reator/plugins/libQmakeAndroidSupport.so)
DEBUG: qt5-creator: Dependency libAndroid.so requires package qt-creator (u=
sed by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e-oe-linu=
x-gnueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/lib/qt5/qtcre=
ator/plugins/libQmakeAndroidSupport.so)
DEBUG: qt5-creator: Dependency libCore.so requires package qt-creator (used=
 by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e-oe-linux-g=
nueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/lib/qt5/qtcreato=
r/plugins/libHelp.so)
DEBUG: qt5-creator: Dependency libProjectExplorer.so requires package qt-cr=
eator (used by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e=
-oe-linux-gnueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/lib/q=
t5/qtcreator/plugins/libHelp.so)
DEBUG: qt5-creator: Dependency libProjectExplorer.so requires package qt-cr=
eator (used by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e=
-oe-linux-gnueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/lib/q=
t5/qtcreator/plugins/libBookmarks.so)
DEBUG: qt5-creator: Dependency libCore.so requires package qt-creator (used=
 by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e-oe-linux-g=
nueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/lib/qt5/qtcreato=
r/plugins/libBookmarks.so)
DEBUG: qt5-creator: Dependency libTextEditor.so requires package qt-creator=
 (used by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e-oe-l=
inux-gnueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/lib/qt5/qt=
creator/plugins/libBookmarks.so)
DEBUG: qt5-creator: Dependency libCore.so requires package qt-creator (used=
 by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e-oe-linux-g=
nueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/lib/qt5/qtcreato=
r/plugins/libGenericProjectManager.so)
DEBUG: qt5-creator: Dependency libProjectExplorer.so requires package qt-cr=
eator (used by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e=
-oe-linux-gnueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/lib/q=
t5/qtcreator/plugins/libGenericProjectManager.so)
DEBUG: qt5-creator: Dependency libCppTools.so requires package qt-creator (=
used by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e-oe-lin=
ux-gnueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/lib/qt5/qtcr=
eator/plugins/libGenericProjectManager.so)
DEBUG: qt5-creator: Dependency libTextEditor.so requires package qt-creator=
 (used by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e-oe-l=
inux-gnueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/lib/qt5/qt=
creator/plugins/libGenericProjectManager.so)
DEBUG: qt5-creator: Dependency libQtSupport.so requires package qt-creator =
(used by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e-oe-li=
nux-gnueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/lib/qt5/qtc=
reator/plugins/libGenericProjectManager.so)
DEBUG: qt5-creator: Dependency libCore.so requires package qt-creator (used=
 by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e-oe-linux-g=
nueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/lib/qt5/qtcreato=
r/plugins/libVcsBase.so)
DEBUG: qt5-creator: Dependency libTextEditor.so requires package qt-creator=
 (used by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e-oe-l=
inux-gnueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/lib/qt5/qt=
creator/plugins/libVcsBase.so)
DEBUG: qt5-creator: Dependency libProjectExplorer.so requires package qt-cr=
eator (used by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e=
-oe-linux-gnueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/lib/q=
t5/qtcreator/plugins/libVcsBase.so)
DEBUG: qt5-creator: Dependency libCppTools.so requires package qt-creator (=
used by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e-oe-lin=
ux-gnueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/lib/qt5/qtcr=
eator/plugins/libVcsBase.so)
DEBUG: qt5-creator: Dependency libCore.so requires package qt-creator (used=
 by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e-oe-linux-g=
nueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/lib/qt5/qtcreato=
r/plugins/libQmakeProjectManager.so)
DEBUG: qt5-creator: Dependency libProjectExplorer.so requires package qt-cr=
eator (used by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e=
-oe-linux-gnueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/lib/q=
t5/qtcreator/plugins/libQmakeProjectManager.so)
DEBUG: qt5-creator: Dependency libQtSupport.so requires package qt-creator =
(used by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e-oe-li=
nux-gnueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/lib/qt5/qtc=
reator/plugins/libQmakeProjectManager.so)
DEBUG: qt5-creator: Dependency libTextEditor.so requires package qt-creator=
 (used by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e-oe-l=
inux-gnueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/lib/qt5/qt=
creator/plugins/libQmakeProjectManager.so)
DEBUG: qt5-creator: Dependency libCppTools.so requires package qt-creator (=
used by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e-oe-lin=
ux-gnueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/lib/qt5/qtcr=
eator/plugins/libQmakeProjectManager.so)
DEBUG: qt5-creator: Dependency libResourceEditor.so requires package qt-cre=
ator (used by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e-=
oe-linux-gnueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/lib/qt=
5/qtcreator/plugins/libQmakeProjectManager.so)
DEBUG: qt5-creator: Dependency libCore.so requires package qt-creator (used=
 by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e-oe-linux-g=
nueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/lib/qt5/qtcreato=
r/plugins/libTaskList.so)
DEBUG: qt5-creator: Dependency libProjectExplorer.so requires package qt-cr=
eator (used by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e=
-oe-linux-gnueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/lib/q=
t5/qtcreator/plugins/libTaskList.so)
DEBUG: qt5-creator: Dependency libCore.so requires package qt-creator (used=
 by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e-oe-linux-g=
nueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/lib/qt5/qtcreato=
r/plugins/libResourceEditor.so)
DEBUG: qt5-creator: Dependency libProjectExplorer.so requires package qt-cr=
eator (used by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e=
-oe-linux-gnueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/lib/q=
t5/qtcreator/plugins/libResourceEditor.so)
DEBUG: qt5-creator: Dependency libCore.so requires package qt-creator (used=
 by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e-oe-linux-g=
nueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/lib/qt5/qtcreato=
r/plugins/libQtSupport.so)
DEBUG: qt5-creator: Dependency libCppTools.so requires package qt-creator (=
used by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e-oe-lin=
ux-gnueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/lib/qt5/qtcr=
eator/plugins/libQtSupport.so)
DEBUG: qt5-creator: Dependency libProjectExplorer.so requires package qt-cr=
eator (used by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e=
-oe-linux-gnueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/lib/q=
t5/qtcreator/plugins/libQtSupport.so)
DEBUG: qt5-creator: Dependency libTextEditor.so requires package qt-creator=
 (used by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e-oe-l=
inux-gnueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/lib/qt5/qt=
creator/plugins/libCodePaster.so)
DEBUG: qt5-creator: Dependency libCore.so requires package qt-creator (used=
 by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e-oe-linux-g=
nueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/lib/qt5/qtcreato=
r/plugins/libCodePaster.so)
DEBUG: qt5-creator: Dependency libTextEditor.so requires package qt-creator=
 (used by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e-oe-l=
inux-gnueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/lib/qt5/qt=
creator/plugins/libPerforce.so)
DEBUG: qt5-creator: Dependency libCore.so requires package qt-creator (used=
 by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e-oe-linux-g=
nueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/lib/qt5/qtcreato=
r/plugins/libPerforce.so)
DEBUG: qt5-creator: Dependency libVcsBase.so requires package qt-creator (u=
sed by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e-oe-linu=
x-gnueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/lib/qt5/qtcre=
ator/plugins/libPerforce.so)
DEBUG: qt5-creator: Dependency libCore.so requires package qt-creator (used=
 by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e-oe-linux-g=
nueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/lib/qt5/qtcreato=
r/plugins/libWelcome.so)
DEBUG: qt5-creator: Dependency libTextEditor.so requires package qt-creator=
 (used by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e-oe-l=
inux-gnueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/lib/qt5/qt=
creator/plugins/libDiffEditor.so)
DEBUG: qt5-creator: Dependency libCore.so requires package qt-creator (used=
 by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e-oe-linux-g=
nueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/lib/qt5/qtcreato=
r/plugins/libDiffEditor.so)
DEBUG: qt5-creator: Dependency libResourceEditor.so requires package qt-cre=
ator (used by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e-=
oe-linux-gnueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/lib/qt=
5/qtcreator/plugins/libDesigner.so)
DEBUG: qt5-creator: Dependency libCppTools.so requires package qt-creator (=
used by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e-oe-lin=
ux-gnueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/lib/qt5/qtcr=
eator/plugins/libDesigner.so)
DEBUG: qt5-creator: Dependency libProjectExplorer.so requires package qt-cr=
eator (used by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e=
-oe-linux-gnueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/lib/q=
t5/qtcreator/plugins/libDesigner.so)
DEBUG: qt5-creator: Dependency libQtSupport.so requires package qt-creator =
(used by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e-oe-li=
nux-gnueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/lib/qt5/qtc=
reator/plugins/libDesigner.so)
DEBUG: qt5-creator: Dependency libTextEditor.so requires package qt-creator=
 (used by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e-oe-l=
inux-gnueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/lib/qt5/qt=
creator/plugins/libDesigner.so)
DEBUG: qt5-creator: Dependency libCore.so requires package qt-creator (used=
 by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e-oe-linux-g=
nueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/lib/qt5/qtcreato=
r/plugins/libDesigner.so)
DEBUG: qt5-creator: Dependency libCore.so requires package qt-creator (used=
 by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e-oe-linux-g=
nueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/lib/qt5/qtcreato=
r/plugins/libTextEditor.so)
DEBUG: qt5-creator: Dependency libCore.so requires package qt-creator (used=
 by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e-oe-linux-g=
nueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/lib/qt5/qtcreato=
r/plugins/libEmacsKeys.so)
DEBUG: qt5-creator: Dependency libTextEditor.so requires package qt-creator=
 (used by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e-oe-l=
inux-gnueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/lib/qt5/qt=
creator/plugins/libEmacsKeys.so)
DEBUG: qt5-creator: Dependency libTextEditor.so requires package qt-creator=
 (used by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e-oe-l=
inux-gnueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/lib/qt5/qt=
creator/plugins/libCppEditor.so)
DEBUG: qt5-creator: Dependency libCore.so requires package qt-creator (used=
 by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e-oe-linux-g=
nueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/lib/qt5/qtcreato=
r/plugins/libCppEditor.so)
DEBUG: qt5-creator: Dependency libCppTools.so requires package qt-creator (=
used by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e-oe-lin=
ux-gnueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/lib/qt5/qtcr=
eator/plugins/libCppEditor.so)
DEBUG: qt5-creator: Dependency libProjectExplorer.so requires package qt-cr=
eator (used by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e=
-oe-linux-gnueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/lib/q=
t5/qtcreator/plugins/libCppEditor.so)
DEBUG: qt5-creator: Dependency libCore.so requires package qt-creator (used=
 by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e-oe-linux-g=
nueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/lib/qt5/qtcreato=
r/plugins/libClassView.so)
DEBUG: qt5-creator: Dependency libCppTools.so requires package qt-creator (=
used by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e-oe-lin=
ux-gnueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/lib/qt5/qtcr=
eator/plugins/libClassView.so)
DEBUG: qt5-creator: Dependency libProjectExplorer.so requires package qt-cr=
eator (used by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e=
-oe-linux-gnueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/lib/q=
t5/qtcreator/plugins/libClassView.so)
DEBUG: qt5-creator: Dependency libTextEditor.so requires package qt-creator=
 (used by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e-oe-l=
inux-gnueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/lib/qt5/qt=
creator/plugins/libClassView.so)
DEBUG: qt5-creator: Dependency libCore.so requires package qt-creator (used=
 by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e-oe-linux-g=
nueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/lib/qt5/qtcreato=
r/plugins/libAnalyzerBase.so)
DEBUG: qt5-creator: Dependency libProjectExplorer.so requires package qt-cr=
eator (used by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e=
-oe-linux-gnueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/lib/q=
t5/qtcreator/plugins/libAnalyzerBase.so)
DEBUG: qt5-creator: Dependency libTextEditor.so requires package qt-creator=
 (used by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e-oe-l=
inux-gnueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/lib/qt5/qt=
creator/plugins/libAnalyzerBase.so)
DEBUG: qt5-creator: Dependency libCppTools.so requires package qt-creator (=
used by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e-oe-lin=
ux-gnueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/lib/qt5/qtcr=
eator/plugins/libAnalyzerBase.so)
DEBUG: qt5-creator: Dependency libCore.so requires package qt-creator (used=
 by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e-oe-linux-g=
nueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/lib/qt5/qtcreato=
r/plugins/libFakeVim.so)
DEBUG: qt5-creator: Dependency libTextEditor.so requires package qt-creator=
 (used by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e-oe-l=
inux-gnueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/lib/qt5/qt=
creator/plugins/libFakeVim.so)
DEBUG: qt5-creator: Dependency libCore.so requires package qt-creator (used=
 by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e-oe-linux-g=
nueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/lib/qt5/qtcreato=
r/plugins/libHelloWorld.so)
DEBUG: qt5-creator: Dependency libCore.so requires package qt-creator (used=
 by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e-oe-linux-g=
nueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/lib/qt5/qtcreato=
r/plugins/libRemoteLinux.so)
DEBUG: qt5-creator: Dependency libDebugger.so requires package qt-creator (=
used by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e-oe-lin=
ux-gnueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/lib/qt5/qtcr=
eator/plugins/libRemoteLinux.so)
DEBUG: qt5-creator: Dependency libProjectExplorer.so requires package qt-cr=
eator (used by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e=
-oe-linux-gnueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/lib/q=
t5/qtcreator/plugins/libRemoteLinux.so)
DEBUG: qt5-creator: Dependency libQtSupport.so requires package qt-creator =
(used by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e-oe-li=
nux-gnueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/lib/qt5/qtc=
reator/plugins/libRemoteLinux.so)
DEBUG: qt5-creator: Dependency libAnalyzerBase.so requires package qt-creat=
or (used by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e-oe=
-linux-gnueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/lib/qt5/=
qtcreator/plugins/libRemoteLinux.so)
DEBUG: qt5-creator: Dependency libCore.so requires package qt-creator (used=
 by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e-oe-linux-g=
nueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/lib/qt5/qtcreato=
r/plugins/libIos.so)
DEBUG: qt5-creator: Dependency libDebugger.so requires package qt-creator (=
used by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e-oe-lin=
ux-gnueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/lib/qt5/qtcr=
eator/plugins/libIos.so)
DEBUG: qt5-creator: Dependency libProjectExplorer.so requires package qt-cr=
eator (used by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e=
-oe-linux-gnueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/lib/q=
t5/qtcreator/plugins/libIos.so)
DEBUG: qt5-creator: Dependency libAnalyzerBase.so requires package qt-creat=
or (used by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e-oe=
-linux-gnueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/lib/qt5/=
qtcreator/plugins/libIos.so)
DEBUG: qt5-creator: Dependency libQtSupport.so requires package qt-creator =
(used by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e-oe-li=
nux-gnueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/lib/qt5/qtc=
reator/plugins/libIos.so)
DEBUG: qt5-creator: Dependency libCore.so requires package qt-creator (used=
 by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e-oe-linux-g=
nueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/lib/qt5/qtcreato=
r/plugins/libQbsProjectManager.so)
DEBUG: qt5-creator: Dependency libProjectExplorer.so requires package qt-cr=
eator (used by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e=
-oe-linux-gnueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/lib/q=
t5/qtcreator/plugins/libQbsProjectManager.so)
DEBUG: qt5-creator: Dependency libCppTools.so requires package qt-creator (=
used by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e-oe-lin=
ux-gnueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/lib/qt5/qtcr=
eator/plugins/libQbsProjectManager.so)
DEBUG: qt5-creator: Dependency libQtSupport.so requires package qt-creator =
(used by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e-oe-li=
nux-gnueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/lib/qt5/qtc=
reator/plugins/libQbsProjectManager.so)
DEBUG: qt5-creator: Dependency libCore.so requires package qt-creator (used=
 by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e-oe-linux-g=
nueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/lib/qt5/qtcreato=
r/plugins/libCppTools.so)
DEBUG: qt5-creator: Dependency libProjectExplorer.so requires package qt-cr=
eator (used by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e=
-oe-linux-gnueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/lib/q=
t5/qtcreator/plugins/libCppTools.so)
DEBUG: qt5-creator: Dependency libTextEditor.so requires package qt-creator=
 (used by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e-oe-l=
inux-gnueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/lib/qt5/qt=
creator/plugins/libCppTools.so)
DEBUG: qt5-creator: Dependency libTextEditor.so requires package qt-creator=
 (used by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e-oe-l=
inux-gnueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/lib/qt5/qt=
creator/plugins/libCVS.so)
DEBUG: qt5-creator: Dependency libCore.so requires package qt-creator (used=
 by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e-oe-linux-g=
nueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/lib/qt5/qtcreato=
r/plugins/libCVS.so)
DEBUG: qt5-creator: Dependency libVcsBase.so requires package qt-creator (u=
sed by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e-oe-linu=
x-gnueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/lib/qt5/qtcre=
ator/plugins/libCVS.so)
DEBUG: qt5-creator: Dependency libTextEditor.so requires package qt-creator=
 (used by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e-oe-l=
inux-gnueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/lib/qt5/qt=
creator/plugins/libSubversion.so)
DEBUG: qt5-creator: Dependency libCore.so requires package qt-creator (used=
 by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e-oe-linux-g=
nueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/lib/qt5/qtcreato=
r/plugins/libSubversion.so)
DEBUG: qt5-creator: Dependency libVcsBase.so requires package qt-creator (u=
sed by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e-oe-linu=
x-gnueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/lib/qt5/qtcre=
ator/plugins/libSubversion.so)
DEBUG: qt5-creator: Dependency libCore.so requires package qt-creator (used=
 by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e-oe-linux-g=
nueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/lib/qt5/qtcreato=
r/plugins/libPythonEditor.so)
DEBUG: qt5-creator: Dependency libTextEditor.so requires package qt-creator=
 (used by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e-oe-l=
inux-gnueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/lib/qt5/qt=
creator/plugins/libPythonEditor.so)
DEBUG: qt5-creator: Dependency libCore.so requires package qt-creator (used=
 by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e-oe-linux-g=
nueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/lib/qt5/qtcreato=
r/plugins/libImageViewer.so)
DEBUG: qt5-creator: Dependency libCore.so requires package qt-creator (used=
 by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e-oe-linux-g=
nueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/lib/qt5/qtcreato=
r/plugins/libQmlJSEditor.so)
DEBUG: qt5-creator: Dependency libTextEditor.so requires package qt-creator=
 (used by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e-oe-l=
inux-gnueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/lib/qt5/qt=
creator/plugins/libQmlJSEditor.so)
DEBUG: qt5-creator: Dependency libProjectExplorer.so requires package qt-cr=
eator (used by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e=
-oe-linux-gnueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/lib/q=
t5/qtcreator/plugins/libQmlJSEditor.so)
DEBUG: qt5-creator: Dependency libQmlJSTools.so requires package qt-creator=
 (used by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e-oe-l=
inux-gnueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/lib/qt5/qt=
creator/plugins/libQmlJSEditor.so)
DEBUG: qt5-creator: Dependency libCore.so requires package qt-creator (used=
 by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e-oe-linux-g=
nueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/lib/qt5/qtcreato=
r/plugins/libTodo.so)
DEBUG: qt5-creator: Dependency libProjectExplorer.so requires package qt-cr=
eator (used by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e=
-oe-linux-gnueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/lib/q=
t5/qtcreator/plugins/libTodo.so)
DEBUG: qt5-creator: Dependency libCppTools.so requires package qt-creator (=
used by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e-oe-lin=
ux-gnueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/lib/qt5/qtcr=
eator/plugins/libTodo.so)
DEBUG: qt5-creator: Dependency libTextEditor.so requires package qt-creator=
 (used by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e-oe-l=
inux-gnueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/lib/qt5/qt=
creator/plugins/libBazaar.so)
DEBUG: qt5-creator: Dependency libCore.so requires package qt-creator (used=
 by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e-oe-linux-g=
nueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/lib/qt5/qtcreato=
r/plugins/libBazaar.so)
DEBUG: qt5-creator: Dependency libVcsBase.so requires package qt-creator (u=
sed by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e-oe-linu=
x-gnueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/lib/qt5/qtcre=
ator/plugins/libBazaar.so)
DEBUG: qt5-creator: Dependency libCore.so requires package qt-creator (used=
 by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e-oe-linux-g=
nueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/lib/qt5/qtcreato=
r/plugins/libProjectExplorer.so)
DEBUG: qt5-creator: Dependency libTextEditor.so requires package qt-creator=
 (used by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e-oe-l=
inux-gnueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/lib/qt5/qt=
creator/plugins/libProjectExplorer.so)
DEBUG: qt5-creator: Dependency libCore.so requires package qt-creator (used=
 by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e-oe-linux-g=
nueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/lib/qt5/qtcreato=
r/plugins/libBareMetal.so)
DEBUG: qt5-creator: Dependency libDebugger.so requires package qt-creator (=
used by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e-oe-lin=
ux-gnueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/lib/qt5/qtcr=
eator/plugins/libBareMetal.so)
DEBUG: qt5-creator: Dependency libProjectExplorer.so requires package qt-cr=
eator (used by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e=
-oe-linux-gnueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/lib/q=
t5/qtcreator/plugins/libBareMetal.so)
DEBUG: qt5-creator: Dependency libQtSupport.so requires package qt-creator =
(used by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e-oe-li=
nux-gnueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/lib/qt5/qtc=
reator/plugins/libBareMetal.so)
DEBUG: qt5-creator: Dependency libProjectExplorer.so requires package qt-cr=
eator (used by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e=
-oe-linux-gnueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/bin/b=
uildoutputparser)
DEBUG: qt5-creator: Dependency libQtSupport.so requires package qt-creator =
(used by files: /home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e-oe-li=
nux-gnueabi/qt5-creator/3.3.1-r0/packages-split/qt5-creator/usr/bin/buildou=
tputparser)

Would you mind sending another patch for this?

> This patch was tested by:
>=20
> 1. building qt-creator from scratch
> 2. building an image containing qt5-creator.
>    * qt5-creator did not fail for sysroot conflicts
>    * image was build without pulling qt-creator
>=20
> Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>
> ---
>  meta-oe/recipes-qt/qt-creator/qt-creator_2.8.1.bb | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/meta-oe/recipes-qt/qt-creator/qt-creator_2.8.1.bb b/meta-oe/=
recipes-qt/qt-creator/qt-creator_2.8.1.bb
> index 11d7be7..670ffad 100644
> --- a/meta-oe/recipes-qt/qt-creator/qt-creator_2.8.1.bb
> +++ b/meta-oe/recipes-qt/qt-creator/qt-creator_2.8.1.bb
> @@ -33,6 +33,11 @@ RRECOMMENDS_${PN} +=3D "packagegroup-core-buildessenti=
al \
>                        qt4-plugin-sqldriver-sqlite \
>  "
> =20
> +# avoid conflicts with meta-qt5's qt-creator and do install nothing to s=
ysroot
> +# this does no harm cause nothing depends on qt-creator
> +sysroot_stage_all() {
> +}
> +
>  # the regexp in insane.bbclass doesn't allow this valid path:
>  # qt-creator-2.8.1: qt-creator: found library in wrong location: /usr/sh=
are/qtcreator/qbs/lib/qbs/plugins/libqbs_cpp_scanner.so
>  # qt-creator: found library in wrong location: /usr/share/qtcreator/qbs/=
lib/qbs/plugins/libqbs_qt_scanner.so
> --=20
> 1.9.3
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--JjNtGRvLZqzR8wa5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlT4mfAACgkQN1Ujt2V2gBxpZgCfVVsQd+b+GXcoYd261Aea6ohD
vS4AnAj+4kYRngFJZNMcSdmDkVPhJ2MT
=75hr
-----END PGP SIGNATURE-----

--JjNtGRvLZqzR8wa5--
