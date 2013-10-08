Return-Path: <eu@felipetonello.com>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id 4924D6CF63
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Oct 2013 21:03:32 +0000 (UTC)
Received: by mail-wi0-f173.google.com with SMTP id hq15so7304308wib.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Oct 2013 14:03:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=OyLLnofqVVc3LLLD3KR0r8KMDaIwqRH0C/hEQMFLlKs=;
	b=AdNg83rb9a/OHIbW3lPXfg5druwTxgJEi4XTFLG2QPpBSOYzH4+RNiVYJFyzJ8G+0D
	d3rfqvUmVXrmlnx6SFcPZENvePJtVI2cOAzPm3RBtNhaqINm7ubdO5aqGD8PqO5g+SgM
	w1HFSSm7QQQAKv+DeSn1l0nQ6b5DactZOg58KSWaF+m01EoWUNYZJ9PfsKjzJio+ykuw
	NPaAXWDLMPqNr2VKTIzyzGpISUQ8ltRcNCj+uk8C28bz/NHbVRnJsu825gPcXYUrCMTp
	79Xiv9XGxZRnG6JAjheAOxre2Bo4VBa0RGaWLPcnCaf1SnZBAe7GHdcwlc4Mw0fKIF3H
	eqaQ==
X-Gm-Message-State: ALoCoQklOa3fv/2Y4GFWc4twzNmc603n7BPCzaOqURyNVBNf10y83TXZvat73vtRQ2u/vUyI6ohJ
MIME-Version: 1.0
X-Received: by 10.180.229.103 with SMTP id sp7mr3522018wic.2.1381266213621;
	Tue, 08 Oct 2013 14:03:33 -0700 (PDT)
Received: by 10.194.240.201 with HTTP; Tue, 8 Oct 2013 14:03:33 -0700 (PDT)
In-Reply-To: <20131004142146.GJ6240@jama>
References: <1380561400-574-1-git-send-email-eu@felipetonello.com>
	<20131004142146.GJ6240@jama>
Date: Tue, 8 Oct 2013 14:03:33 -0700
Message-ID: <CAGrhNMyaauXyRX1+XUhq64_Sddc+3whLd3=sHGW0_k-NO0wf8Q@mail.gmail.com>
From: Felipe Tonello <eu@felipetonello.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] ofono: libqofono: Added libqofono recipe
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
X-List-Received-Date: Tue, 08 Oct 2013 21:03:33 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi Martin,

On Fri, Oct 4, 2013 at 7:21 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Mon, Sep 30, 2013 at 10:16:40AM -0700, Felipe F. Tonello wrote:
>> From: "Felipe F. Tonello" <eu@felipetonello.com>
>>
>> libqofono is a Qt library for oFono that provides easy to use Qt library and
>> QML components to use oFono.
>>
>> OBS: This recipe provides the Qt4 support only, but the library also works
>> with Qt5.
>>
>> Signed-off-by: Felipe F. Tonello <eu@felipetonello.com>
>> ---
>>  meta-oe/recipes-qt/libqofono/libqofono_0.4.bb | 88 +++++++++++++++++++++++++++
>>  1 file changed, 88 insertions(+)
>>  create mode 100644 meta-oe/recipes-qt/libqofono/libqofono_0.4.bb
>>
>> diff --git a/meta-oe/recipes-qt/libqofono/libqofono_0.4.bb b/meta-oe/recipes-qt/libqofono/libqofono_0.4.bb
>> new file mode 100644
>> index 0000000..7c34db2
>> --- /dev/null
>> +++ b/meta-oe/recipes-qt/libqofono/libqofono_0.4.bb
>> @@ -0,0 +1,88 @@
>> +DESCRIPTION = "Qt Library for oFono"
>> +HOMEPAGE = "https://github.com/nemomobile/libqofono"
>> +LICENSE = "Apache-2.0"
>> +LIC_FILES_CHKSUM = "file://README;endline=3;md5=8a15bce3921d1238d9a9f23828612947"
>> +
>> +SECTION = "qt/lib"
>> +
>> +PR = "r0"
>> +
>> +inherit qt4x11 pkgconfig
>> +
>> +RDEPENDS_${PN} = "ofono"
>> +RDEPENDS_${PN}-plugin = "${PN}"
>> +
>> +PROVIDES += "${PN}-plugin"
>> +
>> +PACKAGES =+ "${PN}-plugin ${PN}-plugin-dbg ${PN}-test"
>> +RRECOMMENDS_${PN} = "${PN}-plugin"
>> +
>> +BRANCH = "master"
>> +TAG = "${PV}"
>> +
>> +SRC_URI = " \
>> +  git://github.com/nemomobile/${PN}.git;branch=${BRANCH};tag=${TAG} \
>> +"
>> +
>> +S = "${WORKDIR}/git"
>> +
>> +QT_IMPORTS_DIR = "${libdir}/qt4/imports"
>> +PLUGINS_TARGET = "${QT_IMPORTS_DIR}/MeeGo/QOfono"
>> +
>> +FILES_${PN} = " \
>> +  ${libdir}/libqofono${SOLIBS} \
>> +"
>> +
>> +FILES_${PN}-dev = " \
>> +  ${includedir}/qofono/* \
>> +  ${includedir}/qofono/dbus/* \
>> +  ${libdir}/libqofono${SOLIBSDEV} \
>> +  ${libdir}/libqofono.prl \
>> +  ${libdir}/pkgconfig/qofono.pc \
>> +  ${datadir}/qt4/mkspecs/features/qofono.prf \
>> +"
>> +
>> +FILES_${PN}-plugin = " \
>> +  ${PLUGINS_TARGET}/qmldir \
>> +  ${PLUGINS_TARGET}/lib*.so \
>> +"
>> +
>> +FILES_${PN}-plugin-dbg = " \
>> +  ${PLUGINS_TARGET}/.debug \
>> +"
>> +
>> +FILES_${PN}-test = " \
>> +  /opt/ofonotest/bin/ofonotest \
>> +  /opt/ofonotest/qml/ofonotest \
>> +  ${libdir}/libqofono/tests/tst_qofonotest \
>> +"
>> +
>> +FILES_${PN}-dbg += " \
>> +  /opt/ofonotest/bin/.debug \
>> +  ${libdir}/libqofono/tests/.debug \
>> +"
>> +
>> +EXTRA_QMAKEVARS_PRE = " \
>> +  PREFIX=${prefix} \
>> +"
>> +
>> +do_configure_prepend() {
>> +  # Hack *.pro variables
>> +  find . -iname '*.pro' -exec sed -i -e 's,$$\[QT_INSTALL_IMPORTS\],${QT_IMPORTS_DIR},g' '{}' ';'
>> +  find . -iname '*.pro' -exec sed -i -e 's,$$\[QT_INSTALL_PREFIX\],$$INSTALL_ROOT$$PREFIX,g' '{}' ';'
>> +}
>> +
>> +do_install() {
>> +  cd ${S} && (INSTALL_ROOT=${D} oe_runmake install)
>> +
>> +  cd ${D}/${datadir}/qt4/mkspecs/features
>> +
>> +  sed -i -e '/DEPENDPATH.*/d' qofono.prf
>> +  sed -i -e '/INCLUDEPATH.*/d' qofono.prf
>> +  sed -i -e '/LIBS.*/d' qofono.prf
>> +
>> +  # to make it work with the SDK
>> +  echo 'DEPENDPATH += $(OE_QMAKE_INCDIR_QT)/../qofono' >> qofono.prf
>> +  echo 'INCLUDEPATH += $(OE_QMAKE_INCDIR_QT)/../qofono' >> qofono.prf
>> +  echo 'LIBS += -lqofono' >> qofono.prf
>> +}
>
> It's trying to install in root, do you know why?

Maybe because you are using dash. This recipe doesn't work in dash,
you can fix it just by removing the INSTALL_ROOT=${D} on the same line
as the make command. Just add export INSTALL_ROOT=${D} one line above.

If you want I can fix it, or you can.. I don't mind.

BR

Felipe Tonello

