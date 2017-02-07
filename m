Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ua0-f169.google.com (mail-ua0-f169.google.com
	[209.85.217.169])
	by mail.openembedded.org (Postfix) with ESMTP id 6C7896B6EA
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Feb 2017 15:56:22 +0000 (UTC)
Received: by mail-ua0-f169.google.com with SMTP id y9so87980230uae.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Feb 2017 07:56:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=KeJNb3nsNbZjyWBGLyR2naMOjFUU5sbeoeNijrslyrY=;
	b=XeIuU7ZsOgpTYRsQSpDdZ/qOSn4oNyPbg3v4GbtQDoaLtBliDAiFFo58Krj0P2k7TJ
	mle0q/Jk1ZQihcpQIqZCrpjcFI9QT6M4ytSNA0Hjvmv2ZNVM4iAq1sefKJD8eKjsFSXu
	ryO+EeRV6wmRBipV4SeYvC/jV6MRru552MOuVynfpHwJj/rltKLnfVknIscG0mDUZoJh
	ZCcszi7sCCrfZavyBSAUs4AyfUkfiKozT5HqKG/6MsBr/k3+dj+D2+AnY1sdU1+L1aHe
	zgQdl00Bw8zqaYp3FfXOY1KQ8THOWgxAVOYuiXe7ABi2/i+qxhIjb6eUHs8OyaYhsCBM
	Vkaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=KeJNb3nsNbZjyWBGLyR2naMOjFUU5sbeoeNijrslyrY=;
	b=rQ5rr5cbmLRhN3UMhR2gI/fEkMzHrgwg6qSiPegnkH4U9GY7atpgpUdF2NbyPlAkZa
	KkSPCpqVnRUZrY55or4PJDFWpLfwGy/qZTTGdAHF0uZJOfFiE06MJAUnkEWbaSu6lgkq
	0zH4dds8LH7bnxdY1DTKZaKCY0ghD3AAtYVoIQYCvZKvJaFpp5xqVhOSXQH4JHxuZjW4
	nrPeD4167S37FtgHxFGcLKbdHHY9y5vS3lwqZNvuAy97vJ2lJ/xk4V05PI7hHl0pmXED
	yYYdGlzmMlFOUZ95CeGMLRg/bHilNTZP5BH+iBlcP3uZjqg+Nt1h/DPJRDcjgpkbzgyl
	dbug==
X-Gm-Message-State: AIkVDXLhAQuwTACNkEQ0zMRY/Jg793MHQzNC2qBwPy7AzR++GGkSat6pZSf+4AHxA62sJbYChXfpX97vnUxJsw==
X-Received: by 10.176.3.46 with SMTP id 43mr8377474uat.79.1486482982381; Tue,
	07 Feb 2017 07:56:22 -0800 (PST)
MIME-Version: 1.0
Received: by 10.176.91.68 with HTTP; Tue, 7 Feb 2017 07:56:21 -0800 (PST)
In-Reply-To: <1485442490-2464-1-git-send-email-samuli.piippo@qt.io>
References: <1485442490-2464-1-git-send-email-samuli.piippo@qt.io>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Tue, 7 Feb 2017 16:56:21 +0100
Message-ID: <CALbNGRQbxuLx-T0BEyoFCDuyM00zef5wQieEF-Rv6Sht-KMorQ@mail.gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH v6] Upgrade to Qt 5.8
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
X-List-Received-Date: Tue, 07 Feb 2017 15:56:32 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Jan 26, 2017 at 3:54 PM, Samuli Piippo <samuli.piippo@qt.io> wrote:
> The linux-oe-g++ mkspec is changed to use $$(...) operator to obtain
> the contents of an environment value when qmake is run instead of when
> Makefile is processed. All OE_QMAKE_xxx variables need to be exported
> for qmake to find them. configure's setBootstrapVariable function needs
> to change $$(..) to normal $(...) operator to work with qmake's Makefile.
>
> qt.conf generation for qtbase recipes is not needed, as configure will
> generate its own version based on configure arguments. Skip running
> qmake, since configure is now automatically invoked when it's run in
> qtbase's root folder.
>
> Update PACKAGECONFIGs for qtbase to match current configure options.
>
> The new Qt configuration system [1] can be used with a new variable
> EXTRA_QMAKEVARS_CONFIGURE, which takes both command line and feature
> arguments.
>
> Merge the two qtwayland recipes to one that supports all three targets
> (target, native, nativesdk) without need for additional patch.
>
> Recipes for new Qt modules: QtSCXML, QtNetworkAuth, QtGamepad.
> Removes qtdeclarative-render2d
>
> [1] https://www.mail-archive.com/development@qt-project.org/msg25257.html
>
I have two issues/questions regarding this patch;

1. This patch changes the way qmake finds qt.conf. For 5.7 qmake was
checking if QT_CONF_PATH was set in environment and if so did the
right thing without further quirks. This is gone now and we have to
pass with -qtconf ${OE_QMAKE_QTCONF_PATH}. This causes additional
efforts for packages using qmake from within autotools e.g all the
synth-stuff found at [1]. Is this change really necessary?

2.
>+generate_qt_config_file_effective_paths() {
>+    cat >> ${OE_QMAKE_QTCONF_PATH} <<EOF
>+[EffectivePaths]
>+HostBinaries = ${OE_QMAKE_PATH_EXTERNAL_HOST_BINS}
>+HostData = ${OE_QMAKE_PATH_HOST_DATA}
>+HostPrefix = ${STAGING_DIR_NATIVE}${prefix_native}

^^ This does not look sane to me - shouldn't this be
HostPrefix = ${STAGING_DIR_HOST}${prefix}

Sorry for entering this late but I had other tasks the recent weeks

Andreas

[1] http://www.rncbc.org/drupal/

