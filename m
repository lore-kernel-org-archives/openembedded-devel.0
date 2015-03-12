Return-Path: <frederico@cadete.eu>
Received: from mail-pa0-f50.google.com (mail-pa0-f50.google.com
	[209.85.220.50])
	by mail.openembedded.org (Postfix) with ESMTP id 18FBC73B50
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Mar 2015 12:22:03 +0000 (UTC)
Received: by padet14 with SMTP id et14so20107802pad.11
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Mar 2015 05:22:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=3aLb6724GR9Co41t7xUCtZJILzCGHZJ6FrnlvTddi5s=;
	b=HtjeTK6/UJY5aJfv9Mk1qOXE1oJgVSP82iPXNdPGIIxiLxx0Fa13Fy0u6UGsDl8O28
	zfoRfHPFJd1swSGighOkqqqL+0DjsigDthzEvUhw7o6qSuE85lh5Xc4I/rUuoCZG43Bv
	ySs9bEY5V2pQQZlPn4hvhWhOxwAao4DG/uoytQY03XzyUXp+wuN3/K6t9SCCHg+B3mpf
	BpesKXihtK1VjUZCU/4AFbclUFbSdYJ0wrixGFPBFEzFVkrLJoHgRgkbgVTwtkehGguz
	srWB3kP2n0nhgj0xdPu2n9ucWmYe/cbNP/kSjcfEFbGLuYCewQVZobhdDZthkL1G8H9Y
	fImQ==
X-Gm-Message-State: ALoCoQkoiRa8xDGdKW7MQOTttKYmUpuMQcZs0q7a6ZQDIRxMjmNDPSPaPkX9+CdxrNiFSAZYieS+
X-Received: by 10.70.134.102 with SMTP id pj6mr12030619pdb.95.1426162924871;
	Thu, 12 Mar 2015 05:22:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.66.139.198 with HTTP; Thu, 12 Mar 2015 05:21:44 -0700 (PDT)
X-Originating-IP: [212.166.56.147]
In-Reply-To: <20150312114832.GC2338@jama>
References: <20150310172917.GF2340@jama>
	<1426019866-3634-1-git-send-email-frederico@cadete.eu>
	<20150312114832.GC2338@jama>
From: Frederico Cadete <frederico@cadete.eu>
Date: Thu, 12 Mar 2015 13:21:44 +0100
Message-ID: <CAL5ScNWvNufp4KdpGVzwnFMwCQ5H+5Gfg2B4Tf=fsZpoPrNvzA@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Frederico Cadete <frederico.cadete@awtce.be>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH v2] qt5-git, *qtbase*, qt5everywheredemo: Fetch from code.qt.io
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
X-List-Received-Date: Thu, 12 Mar 2015 12:22:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Thanks, and sorry about that. I realize now (i.e. too late) that my
yocto setup is not building qt5everywheredemo.

On Thu, Mar 12, 2015 at 12:48 PM, Martin Jansa <martin.jansa@gmail.com> wro=
te:
> On Tue, Mar 10, 2015 at 09:37:46PM +0100, Frederico Cadete wrote:
>> From: Frederico Cadete <frederico.cadete@awtce.be>
>>
>> Gitorious disabled the git:// protocol, breaking fetches.
>> Also, this service is scheduled to stop in May 2015, so move to
>> code.qt.io.
>>
>> Signed-off-by: Frederico Cadete <frederico@cadete.eu>
>> ---
>>  recipes-qt/examples/qt5everywheredemo_1.0.bb | 2 +-
>>  recipes-qt/qt5/nativesdk-qtbase_git.bb       | 2 +-
>>  recipes-qt/qt5/qt5-git.inc                   | 2 +-
>>  recipes-qt/qt5/qtbase-native_git.bb          | 2 +-
>>  recipes-qt/qt5/qtbase_git.bb                 | 2 +-
>>  5 files changed, 5 insertions(+), 5 deletions(-)
>>
>> diff --git a/recipes-qt/examples/qt5everywheredemo_1.0.bb b/recipes-qt/e=
xamples/qt5everywheredemo_1.0.bb
>> index 4f7022c..60edaa4 100644
>> --- a/recipes-qt/examples/qt5everywheredemo_1.0.bb
>> +++ b/recipes-qt/examples/qt5everywheredemo_1.0.bb
>> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D "file://main.cpp;md5=3D1187cb795a0f=
96bce64e63dd1a67dc2b"
>>  DEPENDS =3D "qtdeclarative qtgraphicaleffects"
>>
>>  SRCREV =3D "9a868f96ee63c21ceda890d8dfc9d33f093d1b6d"
>> -SRC_URI =3D "git://gitorious.org/qt-labs/qt5-everywhere-demo.git"
>> +SRC_URI =3D "git://code.qt.io/qt-labs/qt5-everywhere-demo.git"
>
> This one doesn't work:
> WARNING: Failed to fetch URL git://code.qt.io/qt-labs/qt5-everywhere-demo=
.git, attempting MIRRORS if available
> ERROR: Fetcher failure: Unable to find revision 9a868f96ee63c21ceda890d8d=
fc9d33f093d1b6d in branch master even from upstream
> ERROR: Function failed: Fetcher failure for URL: 'git://code.qt.io/qt-lab=
s/qt5-everywhere-demo.git'. Unable to fetch URL from any source.
> ERROR: Logfile of failure stored in: /home/jenkins/oe/world/shr-core/tmp-=
glibc/work/armv5e-oe-linux-gnueabi/qt5everywheredemo/1.0-r0/temp/log.do_fet=
ch.12973
> NOTE: recipe qt5everywheredemo-1.0-r0: task do_fetch: Failed
> ERROR: Task 6740 (/home/jenkins/oe/world/shr-core/meta-qt5/recipes-qt/exa=
mples/qt5everywheredemo_1.0.bb, do_fetch) failed with exit code '1'
>
> SRCREV 9a868f96ee63c21ceda890d8dfc9d33f093d1b6d doesn't exist on code.qt.=
io
>
> It was initial commit in gitorious repo:
> commit 9a868f96ee63c21ceda890d8dfc9d33f093d1b6d
> Author: Sergio Ahumada <sergio.ahumada@digia.com>
> Date:   Wed Jul 3 12:09:40 2013 +0200
>
>     Initial commit
>
> This is exactly matching with this commit in code.qt.io:
> commit c17fe9e0ec0882ac4c4dc1168095f569acab5d09
> Author: Kimmo Ollila <kimmo.ollila@digia.com>
> Date:   Wed Jun 19 13:02:05 2013 +0300
>
>     Fixed radio crash on application close
>
>     Change-Id: Iaae40f9112e70ac9ac09b7127128560470e5ca91
>     Reviewed-by: Lasse R=C3=A4ih=C3=A4 <lasse.raiha@digia.com>
>
> So I'll update SRCREV in this recipe, you don't need to resend.
>
>>  S =3D "${WORKDIR}/git/QtDemo"
>>
>> diff --git a/recipes-qt/qt5/nativesdk-qtbase_git.bb b/recipes-qt/qt5/nat=
ivesdk-qtbase_git.bb
>> index 9194a83..df80407 100644
>> --- a/recipes-qt/qt5/nativesdk-qtbase_git.bb
>> +++ b/recipes-qt/qt5/nativesdk-qtbase_git.bb
>> @@ -5,7 +5,7 @@ require ${PN}.inc
>>  FILESEXTRAPATHS =3D. "${FILE_DIRNAME}/${BPN}-git:"
>>
>>  SRC_URI =3D "\
>> -    git://qt.gitorious.org/qt/${QT_MODULE}.git;branch=3D${QT_MODULE_BRA=
NCH} \
>> +    git://code.qt.io/qt/${QT_MODULE}.git;branch=3D${QT_MODULE_BRANCH} \
>>  "
>>
>>  # common for qtbase-native, qtbase-nativesdk and qtbase
>> diff --git a/recipes-qt/qt5/qt5-git.inc b/recipes-qt/qt5/qt5-git.inc
>> index da962b8..84ddf49 100644
>> --- a/recipes-qt/qt5/qt5-git.inc
>> +++ b/recipes-qt/qt5/qt5-git.inc
>> @@ -5,7 +5,7 @@ QT_MODULE_BRANCH ?=3D "5.4"
>>
>>  # each module needs to define valid SRCREV
>>  SRC_URI +=3D " \
>> -    git://qt.gitorious.org/qt/${QT_MODULE}.git;branch=3D${QT_MODULE_BRA=
NCH} \
>> +    git://code.qt.io/qt/${QT_MODULE}.git;branch=3D${QT_MODULE_BRANCH} \
>>  "
>>
>>  S =3D "${WORKDIR}/git"
>> diff --git a/recipes-qt/qt5/qtbase-native_git.bb b/recipes-qt/qt5/qtbase=
-native_git.bb
>> index cebc021..5a308d4 100644
>> --- a/recipes-qt/qt5/qtbase-native_git.bb
>> +++ b/recipes-qt/qt5/qtbase-native_git.bb
>> @@ -2,7 +2,7 @@ require qt5-git.inc
>>  require ${PN}.inc
>>
>>  SRC_URI =3D "\
>> -    git://qt.gitorious.org/qt/${QT_MODULE}.git;branch=3D${QT_MODULE_BRA=
NCH} \
>> +    git://code.qt.io/qt/${QT_MODULE}.git;branch=3D${QT_MODULE_BRANCH} \
>>  "
>>
>>  # common for qtbase-native, qtbase-nativesdk and qtbase
>> diff --git a/recipes-qt/qt5/qtbase_git.bb b/recipes-qt/qt5/qtbase_git.bb
>> index d33eb68..549c92a 100644
>> --- a/recipes-qt/qt5/qtbase_git.bb
>> +++ b/recipes-qt/qt5/qtbase_git.bb
>> @@ -2,7 +2,7 @@ require qt5-git.inc
>>  require ${PN}.inc
>>
>>  SRC_URI =3D "\
>> -    git://qt.gitorious.org/qt/${QT_MODULE}.git;branch=3D${QT_MODULE_BRA=
NCH} \
>> +    git://code.qt.io/qt/${QT_MODULE}.git;branch=3D${QT_MODULE_BRANCH} \
>>  "
>>
>>  # common for qtbase-native, qtbase-nativesdk and qtbase
>> --
>> 2.1.4
>>
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

