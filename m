Return-Path: <martin.jansa@gmail.com>
Received: from mail-lb0-f173.google.com (mail-lb0-f173.google.com
	[209.85.217.173])
	by mail.openembedded.org (Postfix) with ESMTP id 0232C61489
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 May 2014 21:41:05 +0000 (UTC)
Received: by mail-lb0-f173.google.com with SMTP id 10so130092lbg.32
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 May 2014 14:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=3HD82fSNleflQVxyiPpsrj5KjX+83Ow9vsG3ihIysT4=;
	b=BB8pPIfc7bqTXIZhAd3Qxv1FtYEGKSQhJwqaZ66N19Xdcv2zNg6JZ5HpIyTSC6tiS9
	EOSmtgZyj8oubxw+jOIK+ZY5sLQMbd63MdUHC1OHnn+w1fk3BGw1fGOwRuRb/NdyfVYm
	nXHWvOHU3ORU7oZYefmb+6+Rf0BtshJUMb39Sk2sEeKKU+7Mc1EzfYLegmtSduzkDexI
	KLgEzZ3/BDFDgftrLmn+ASqZIAjndofbdhGkSnKA9NyKn0Lu7h9ggM7vyakZxTcfjzan
	UIHpvCo3+fKDep4Os04z9XfZfYwH4zB3nM4b8XnwXXOe/Y9DL5N7zkShGbRm1RnCfiXD
	tD1Q==
X-Received: by 10.112.141.130 with SMTP id ro2mr10876787lbb.42.1399412465382; 
	Tue, 06 May 2014 14:41:05 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	rh7sm14977619lbb.10.2014.05.06.14.41.02
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 06 May 2014 14:41:03 -0700 (PDT)
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 6 May 2014 23:41:24 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140506214124.GD30955@jama>
References: <1399305083-21507-1-git-send-email-Matthieu.Crapet@ingenico.com>
	<20140505162916.GL2486@jama>
	<8672BB614B4CCA40A6B3BDD6FD82050B8D34349D@COSNADEXC13.usr.ingenico.loc>
MIME-Version: 1.0
In-Reply-To: <8672BB614B4CCA40A6B3BDD6FD82050B8D34349D@COSNADEXC13.usr.ingenico.loc>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH] tk: cleanup
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
X-List-Received-Date: Tue, 06 May 2014 21:41:06 -0000
X-Groupsio-MsgNum: 49733
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="k4f25fnPtRuIRUb3"
Content-Disposition: inline

--k4f25fnPtRuIRUb3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 06, 2014 at 06:49:50AM +0000, Matthieu CRAPET wrote:
> Hi,
>=20
> > Does it also fix the tk issues which were shown in all world build repo=
rts?
>=20
> I'm afraid not. That was my primary objective, but I was unable to reprod=
uce the issue (even with insane PARALLEL_MAKE parameter).
> It's quite cosmetics, but the BINCONFIG_GLOB/SSTATE_SCAN_FILES fix is wor=
th it.

Well it will be PNBLACKLISTED if it's not fixed, can you please
check/confirm that your build also ends with /usr/lib/ in rpath?

| arm-oe-linux-gnueabi-ar cr libtkstub8.6.a tkStubLib.o ttkStubLib.o ; arm-=
oe-linux-gnueabi-ranlib libtkstub8.6.a
| rm -f libtk8.6.so
| arm-oe-linux-gnueabi-gcc  -march=3Darmv5te -marm -mthumb-interwork --sysr=
oot=3D/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/qemua=
rm -shared -O2  -O2 -pipe -g -feliminate-unused-debug-types -pipe -fvisibil=
ity=3Dhidden   -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -Wl,-rpath,/u=
sr/lib/tcltk/8.6.0/lib -Wl,--export-dynamic  -o libtk8.6.so tk3d.o tkArgv.o=
 tkAtom.o tkBind.o tkBitmap.o tkBusy.o tkClipboard.o tkCmds.o tkColor.o tkC=
onfig.o tkConsole.o tkCursor.o tkError.o tkEvent.o tkFocus.o tkFont.o tkGet=
=2Eo tkGC.o tkGeometry.o tkGrab.o tkGrid.o tkMain.o tkObj.o tkOldConfig.o t=
kOption.o tkPack.o tkPlace.o tkSelect.o tkStyle.o tkUndo.o tkUtil.o tkVisua=
l.o tkWindow.o tkButton.o tkEntry.o tkFrame.o tkListbox.o tkMenu.o tkMenubu=
tton.o tkMenuDraw.o tkMessage.o tkPanedWindow.o tkScale.o tkScrollbar.o tkC=
anvas.o tkCanvArc.o tkCanvBmap.o tkCanvImg.o tkCanvLine.o tkCanvPoly.o tkCa=
nvPs.o tkCanvText.o tkCanvUtil.o tkCanvWind.o tkRectOval.o tkTrig.o tkImage=
=2Eo tkImgBmap.o tkImgGIF.o tkImgPNG.o tkImgPPM.o tkImgPhoto.o tkImgPhInsta=
nce.o tkText.o tkTextBTree.o tkTextDisp.o tkTextImage.o tkTextIndex.o tkTex=
tMark.o tkTextTag.o tkTextWind.o tkStubInit.o ttkBlink.o ttkButton.o ttkCac=
he.o ttkClamTheme.o ttkClassicTheme.o ttkDefaultTheme.o ttkElements.o ttkEn=
try.o ttkFrame.o ttkImage.o ttkInit.o ttkLabel.o ttkLayout.o ttkManager.o t=
tkNotebook.o ttkPanedwindow.o ttkProgress.o ttkScale.o ttkScrollbar.o ttkSc=
roll.o ttkSeparator.o ttkSquare.o ttkState.o ttkTagSet.o ttkTheme.o ttkTrac=
e.o ttkTrack.o ttkTreeview.o ttkWidget.o ttkStubInit.o tkUnix.o tkUnix3d.o =
tkUnixButton.o tkUnixColor.o tkUnixConfig.o tkUnixCursor.o tkUnixDraw.o tkU=
nixEmbed.o tkUnixEvent.o tkUnixFocus.o  tkUnixRFont.o tkUnixInit.o tkUnixKe=
y.o tkUnixMenu.o tkUnixMenubu.o tkUnixScale.o tkUnixScrlbr.o tkUnixSelect.o=
 tkUnixSend.o tkUnixWm.o tkUnixXId.o   -lpthread -lXft  -lX11 -lXss -lXext =
-ldl -lz  -lpthread -lieee -lm -L=3D/usr/lib -ltclstub8.6  -Wl,-rpath,/usr/=
lib
| arm-oe-linux-gnueabi-gcc  -march=3Darmv5te -marm -mthumb-interwork --sysr=
oot=3D/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/sysroots/qemua=
rm -O2  -O2 -pipe -g -feliminate-unused-debug-types -pipe -fvisibility=3Dhi=
dden   -Wl,-O1 -Wl,--hash-style=3Dgnu -Wl,--as-needed -Wl,-rpath,/usr/lib/t=
cltk/8.6.0/lib -Wl,--export-dynamic  tkAppInit.o -L/home/jenkins/oe/shr-cor=
e-branches/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/tk/8.6.0-r0/tk=
8.6.0/unix -ltk8.6 -L=3D/usr/lib -ltcl8.6  -lpthread -lXft  -lX11 -lXss -lX=
ext -ldl -lz  -lpthread -lieee -lm  \
| 		-Wl,-rpath,/usr/lib -o wish
| /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe-li=
nux-gnueabi/tk/8.6.0-r0/tk8.6.0/unix/libtk8.6.so: error: undefined referenc=
e to 'FcCharSetHasChar'
| /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe-li=
nux-gnueabi/tk/8.6.0-r0/tk8.6.0/unix/libtk8.6.so: error: undefined referenc=
e to 'FcFontRenderPrepare'
| /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe-li=
nux-gnueabi/tk/8.6.0-r0/tk8.6.0/unix/libtk8.6.so: error: undefined referenc=
e to 'FcPatternAddMatrix'
| /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe-li=
nux-gnueabi/tk/8.6.0-r0/tk8.6.0/unix/libtk8.6.so: error: undefined referenc=
e to 'FcCharSetDestroy'
| /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe-li=
nux-gnueabi/tk/8.6.0-r0/tk8.6.0/unix/libtk8.6.so: error: undefined referenc=
e to 'FcPatternDestroy'
| /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe-li=
nux-gnueabi/tk/8.6.0-r0/tk8.6.0/unix/libtk8.6.so: error: undefined referenc=
e to 'FcFontSetDestroy'
| /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe-li=
nux-gnueabi/tk/8.6.0-r0/tk8.6.0/unix/libtk8.6.so: error: undefined referenc=
e to 'FcPatternGetString'
| /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe-li=
nux-gnueabi/tk/8.6.0-r0/tk8.6.0/unix/libtk8.6.so: error: undefined referenc=
e to 'FcPatternGetDouble'
| /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe-li=
nux-gnueabi/tk/8.6.0-r0/tk8.6.0/unix/libtk8.6.so: error: undefined referenc=
e to 'FcPatternGetInteger'
| /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe-li=
nux-gnueabi/tk/8.6.0-r0/tk8.6.0/unix/libtk8.6.so: error: undefined referenc=
e to 'FcConfigSubstitute'
| /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe-li=
nux-gnueabi/tk/8.6.0-r0/tk8.6.0/unix/libtk8.6.so: error: undefined referenc=
e to 'FcFontSort'
| /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe-li=
nux-gnueabi/tk/8.6.0-r0/tk8.6.0/unix/libtk8.6.so: error: undefined referenc=
e to 'FcPatternGetCharSet'
| /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe-li=
nux-gnueabi/tk/8.6.0-r0/tk8.6.0/unix/libtk8.6.so: error: undefined referenc=
e to 'FcCharSetCopy'
| /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe-li=
nux-gnueabi/tk/8.6.0-r0/tk8.6.0/unix/libtk8.6.so: error: undefined referenc=
e to 'FcPatternCreate'
| /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe-li=
nux-gnueabi/tk/8.6.0-r0/tk8.6.0/unix/libtk8.6.so: error: undefined referenc=
e to 'FcPatternAddString'
| /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe-li=
nux-gnueabi/tk/8.6.0-r0/tk8.6.0/unix/libtk8.6.so: error: undefined referenc=
e to 'FcPatternAddDouble'
| /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe-li=
nux-gnueabi/tk/8.6.0-r0/tk8.6.0/unix/libtk8.6.so: error: undefined referenc=
e to 'FcPatternAddInteger'
| /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe-li=
nux-gnueabi/tk/8.6.0-r0/tk8.6.0/unix/libtk8.6.so: error: undefined referenc=
e to 'FcPatternAddBool'
| /home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe-li=
nux-gnueabi/tk/8.6.0-r0/tk8.6.0/unix/libtk8.6.so: error: undefined referenc=
e to 'FcUtf8ToUcs4'
| collect2: error: ld returned 1 exit status
| make: *** [wish] Error 1
| ERROR: oe_runmake failed
| WARNING: exit code 1 from a shell command.
| ERROR: Function failed: do_compile (log file is located at /home/jenkins/=
oe/shr-core-branches/shr-core/tmp-eglibc/work/armv5te-oe-linux-gnueabi/tk/8=
=2E6.0-r0/temp/log.do_compile.21584)
NOTE: recipe tk-8.6.0-r0: task do_compile: Failed
NOTE: recipe initramfs-boot-1.0-r2: task do_rm_work_all: Started
NOTE: recipe fso-alsa-data-0.1.0-r0: task do_rm_work: Succeeded
ERROR: Task 11401 (/home/jenkins/oe/shr-core-branches/shr-core/meta-openemb=
edded/meta-oe/recipes-devtools/tcltk/tk_8.6.0.bb, do_compile) failed with e=
xit code '1'

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--k4f25fnPtRuIRUb3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlNpVwQACgkQN1Ujt2V2gBw+lwCgiCIWqmumkWSWG3gFdHViaFVv
9ToAoIULmqrwzXqSIiFTh1q5ve74UC+k
=0+3F
-----END PGP SIGNATURE-----

--k4f25fnPtRuIRUb3--
