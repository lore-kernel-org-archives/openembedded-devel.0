Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f180.google.com (mail-we0-f180.google.com
	[74.125.82.180])
	by mail.openembedded.org (Postfix) with ESMTP id CF8986E593
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Feb 2015 23:52:47 +0000 (UTC)
Received: by mail-we0-f180.google.com with SMTP id k11so157584wes.11
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Feb 2015 15:52:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=oKW1BHd3ecyPtFLkIfxERXd7FxepWpiTw5yTtvS9jRQ=;
	b=GPn3AIX08dEQWx58/69HNKGzRhTVuECsM9VROv4wYv1jtqaObyO/xNUoSR5SN/eSPb
	w837gcz70zhpjzel/Wl0jYiVCWromOIrvC7s05Ghims3qLdbLyA0TmIb6Y5jp1L1OfqL
	v2li5hUWIQ7OFyKu9EXljMcKcE3kb6D+021JQund4U92DO5TvK0j0X03vJeOKDjF/6ek
	byqypHQsqccXa0dE3H5r1eXq55haKTDF0Clr4UasiRZ5v/AP+vWoX8p3E8/Hqq5eAqvK
	eSmaEgmJreees+aKTshmIOuOw0/mvFTJNBxZetNtUhW6zCkcpwpHmSN+of39BN75R8sp
	6HfQ==
MIME-Version: 1.0
X-Received: by 10.180.74.6 with SMTP id p6mr49898867wiv.17.1423612368476; Tue,
	10 Feb 2015 15:52:48 -0800 (PST)
Received: by 10.194.85.225 with HTTP; Tue, 10 Feb 2015 15:52:48 -0800 (PST)
In-Reply-To: <1423431280-890-8-git-send-email-otavio@ossystems.com.br>
References: <1423431280-890-1-git-send-email-otavio@ossystems.com.br>
	<1423431280-890-8-git-send-email-otavio@ossystems.com.br>
Date: Wed, 11 Feb 2015 00:52:48 +0100
Message-ID: <CA+chaQfduKxT=R17gcxpMamtDBRJ3_-3ZAdWNfxwaB7iFLdzgQ@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [meta-qt5][PATCH 8/8] qt5.inc: Fix packaging of architecture independent data
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
X-List-Received-Date: Tue, 10 Feb 2015 23:52:56 -0000
Content-Type: text/plain; charset=UTF-8

This series is causing few new warnings:

qtmultimedia-5.4.0+gitAUTOINC+f420ac286a: qtmultimedia-plugins
rdepends on libgstphotography-0.10, but it isn't a build dependency?
[build-deps]
qtmultimedia-5.4.0+gitAUTOINC+f420ac286a: qtmultimedia-plugins
rdepends on libgstapp-0.10, but it isn't a build dependency?
[build-deps]
qtmultimedia-5.4.0+gitAUTOINC+f420ac286a: qtmultimedia-plugins
rdepends on gstreamer, but it isn't a build dependency? [build-deps]
qtmultimedia-5.4.0+gitAUTOINC+f420ac286a: qtmultimedia-plugins
rdepends on libgstpbutils-0.10, but it isn't a build dependency?
[build-deps]
qtmultimedia-5.4.0+gitAUTOINC+f420ac286a: qtmultimedia-plugins
rdepends on libgstinterfaces-0.10, but it isn't a build dependency?
[build-deps]
qtmultimedia-5.4.0+gitAUTOINC+f420ac286a: qtmultimedia rdepends on
libgstapp-0.10, but it isn't a build dependency? [build-deps]
qtmultimedia-5.4.0+gitAUTOINC+f420ac286a: qtmultimedia rdepends on
gstreamer, but it isn't a build dependency? [build-deps]
qtmultimedia-5.4.0+gitAUTOINC+f420ac286a: qtmultimedia rdepends on
libgstvideo-0.10, but it isn't a build dependency? [build-deps]
qtmultimedia-5.4.0+gitAUTOINC+f420ac286a: qtmultimedia rdepends on
libgstinterfaces-0.10, but it isn't a build dependency? [build-deps]

qttools-5.4.0+gitAUTOINC+33eb6cdf93: qttools: Files/directories were
installed but not shipped
  /usr/share
  /usr/share/qt5
  /usr/share/qt5/phrasebooks
  /usr/share/qt5/phrasebooks/danish.qph
  /usr/share/qt5/phrasebooks/dutch.qph
  /usr/share/qt5/phrasebooks/finnish.qph
  /usr/share/qt5/phrasebooks/french.qph
  /usr/share/qt5/phrasebooks/german.qph
  /usr/share/qt5/phrasebooks/hungarian.qph
  /usr/share/qt5/phrasebooks/italian.qph
  /usr/share/qt5/phrasebooks/japanese.qph
  /usr/share/qt5/phrasebooks/norwegian.qph
  /usr/share/qt5/phrasebooks/polish.qph
  /usr/share/qt5/phrasebooks/russian.qph
  /usr/share/qt5/phrasebooks/spanish.qph
  /usr/share/qt5/phrasebooks/swedish.qph [installed-vs-shipped]

qttranslations-5.4.0: qttranslations: Files/directories were installed
but not shipped
  /usr/share/qt5/translations/qtquickcontrols_de.qm
  /usr/share/qt5/translations/qtquickcontrols_ja.qm
  /usr/share/qt5/translations/qtquickcontrols_ru.qm
  /usr/share/qt5/translations/qtquickcontrols_uk.qm [installed-vs-shipped]


On Sun, Feb 8, 2015 at 10:34 PM, Otavio Salvador <otavio@ossystems.com.br>
wrote:

> The architecture independent data were being added to the '-dev'
> package however it shouldn't be. For example the QtWebEngine had the
> translation and the resources package were not being installed with
> the main package, as it should be.
>
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>  recipes-qt/qt5/qt5.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-qt/qt5/qt5.inc b/recipes-qt/qt5/qt5.inc
> index bb0bcdc..af0a906 100644
> --- a/recipes-qt/qt5/qt5.inc
> +++ b/recipes-qt/qt5/qt5.inc
> @@ -118,7 +118,6 @@ FILES_${PN}-dev += " \
>      ${OE_QMAKE_PATH_LIBS}/cmake/* \
>      ${OE_QMAKE_PATH_LIBS}/*.prl \
>      ${OE_QMAKE_PATH_LIBS}/*.la \
> -    ${OE_QMAKE_PATH_DATA}/* \
>      ${OE_QMAKE_PATH_HEADERS}/* \
>  "
>  FILES_${PN}-dbg += " \
> @@ -129,6 +128,7 @@ FILES_${PN}-staticdev += " \
>      ${OE_QMAKE_PATH_LIBS}/*.a \
>  "
>  FILES_${PN}-examples = " \
> +    ${OE_QMAKE_PATH_EXAMPLES}/README \
>      ${OE_QMAKE_PATH_EXAMPLES}/*/* \
>  "
>  FILES_${PN}-examples-dev = " \
> --
> 2.1.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

