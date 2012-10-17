Received: from mail-pa0-f47.google.com ([209.85.220.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TORHs-0004jm-TE
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Oct 2012 12:55:45 +0200
Received: by mail-pa0-f47.google.com with SMTP id fa11so6126082pad.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Oct 2012 03:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=FmXeVgk+0ildcAQjGb4m/Nwuy1R75vOImNyIz4KBcMs=;
	b=zBOtfAmEJUDE6L7dkz+Q9uJGqpdH0zFvGPRFjoPyAwjgGdqH04qti41SPZdNIJBr9X
	DKZfd8hudIcUPalQ9QwzpGo5U3OuJV/0jgcTD7t2nK5lJYSaE2M2fHUov1Q+5T6MPOa2
	S/u6bWqZZIAch+/uVuk44HcG3tk6JEL9/arcu1gUYPhDxFqU6w0E5vKqmbuId8MTEIUl
	0fYvxNtp7m6HdrZ97ZALz36Q9+Oaxo83/6SQXYWINszogChXsu8hqHLMmofjw19ADf7Y
	fYz87Sah0S3xWrcB8dNsLpnTcJ3uvOIpFIk52yuLE4CteVWXS5IlE5hu9N1J7uyWtaFE
	oYpw==
MIME-Version: 1.0
Received: by 10.66.78.198 with SMTP id d6mr49395993pax.61.1350470546103; Wed,
	17 Oct 2012 03:42:26 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.68.40.201 with HTTP; Wed, 17 Oct 2012 03:42:26 -0700 (PDT)
In-Reply-To: <CAGiJk9d+OabH=fROOS6Y8w-GNs8STaYgFVCBLZisKv2VDAd7JA@mail.gmail.com>
References: <1349166535-14325-1-git-send-email-s.stirtzel@googlemail.com>
	<CAP9ODKrNWnk_H0GjfM6sP8KNApRr=bGT0YaSEXp-8qMNq_GfZQ@mail.gmail.com>
	<CAGiJk9d+OabH=fROOS6Y8w-GNs8STaYgFVCBLZisKv2VDAd7JA@mail.gmail.com>
Date: Wed, 17 Oct 2012 07:42:26 -0300
X-Google-Sender-Auth: sWgYyrhyB5xaRmR-9NGERMF_zXU
Message-ID: <CAP9ODKrZ65fRPq7q8=u2VrBgqyCukgohoXuBng0Mbv0u4=wJaA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH] Maliit: Add initial recipes
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 17 Oct 2012 10:55:45 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Oct 17, 2012 at 5:29 AM, Samuel Stirtzel
<s.stirtzel@googlemail.com>wrote:

> 2012/10/16 Otavio Salvador <otavio@ossystems.com.br>:
> > On Tue, Oct 2, 2012 at 5:28 AM, Samuel Stirtzel
> > <s.stirtzel@googlemail.com> wrote:
> >> Maliit is a Qt based virtual keyboard under liberal license (LGPLv2.1 /
> BSD)
> >> The inputmethod framework from Qt is used and it supports gtk-immodules.
> >> It can also be used without dependencies to GTK+ (separate package for
> GTK+)
> >>
> >> Signed-off-by: Samuel Stirtzel <s.stirtzel@googlemail.com>
> >
> > Thanks by working on this. Bellow my comments ...
> >
> > ...
> >> diff --git a/meta-oe/recipes-support/maliit/maliit-framework_git.bbb/meta-oe/recipes-support/maliit/
> maliit-framework_git.bb
> >> new file mode 100644
> >> index 0000000..3f50d1b
> >> --- /dev/null
> >> +++ b/meta-oe/recipes-support/maliit/maliit-framework_git.bb
> > ...
> >> +
> >> +# Maliit needs Qt configured with -accessibility, a patch for that was
> already sent and will get merged in post 1.2.
> >> +RDEPENDS_${PN} = "qt4-plugin-inputmethod-imsw-multi libqtsvg4"
> >
> > In this case, maliit is a post 1.2 package.
> >
> > ...
> >> +EXTRA_QMAKEVARS_PRE = "\
> >> +    PREFIX=${prefix} \
> >> +    LIBDIR=${libdir} \
> >> +    QT_IM_PLUGIN_PATH=${libdir}/qt4/plugins/inputmethods \
> >> +    MALIIT_INSTALL_PRF=${datadir}/qt4/mkspecs/features \
> >> +    SCHEMADIR=${sysconfdir}/gconf/schemas \
> >> +    CONFIG+=disable-gconf \
> >> +    CONFIG+=disable-gtk-cache-update \
> >> +    CONFIG+=local-install \
> >> +    "
> >
> > Really need to disable gtk-cache-update? Why?
>
> This option is for packaging, it disables running gtk-query-immodules
> on the build-host
>

Are you sure it is about gtk-query-immodules, it seemed to be icon-cache
related from  the option name.


>
> >
> > ...
> >> +# Update the inputmethod modules in gtk
> >> +pkg_postinst_${PN}-gtk() {
> >> +if [ "x$D" != "x" ]; then
> >> +    exit 1
> >> +fi
> >> +gtk-query-immodules-2.0 > /etc/gtk-2.0/gtk.immodules
> >> +}
> >> +
> >> +pkg_postrm_${PN}-gtk() {
> >> +if [ "x$D" != "x" ]; then
> >> +    exit 1
> >> +fi
> >> +gtk-query-immodules-2.0 > /etc/gtk-2.0/gtk.immodules
> >> +}
> >
> > You might add a gtk-immodules.bbclass to allow it to be put out of the
> recipe.
>
> FYI: I have a class for this, but the only other recipe using
> gtk-query-immodules is
> openembedded-core/meta/recipes-sato/matchbox-keyboard/
> matchbox-keyboard_git.bb
> Should I send a patch with the .bbclass to oe-core?
>

I think so. It is easier to read and avoid code duplication.


>
> >
> > As said by Martin, please read the README and follow the steps to send
> > the patch...
>
> Seems to be a classic case of -ENOCOFFEEYET
>
> Will re-send with the right prefix
>

hehe, right ...

Take a double expresso coffee and try again ;-)

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

