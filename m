Received: from mail-da0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TO5EW-0006Xq-0d
	for openembedded-devel@lists.openembedded.org;
	Tue, 16 Oct 2012 13:22:48 +0200
Received: by mail-da0-f47.google.com with SMTP id s35so2709599dak.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Oct 2012 04:09:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=bPAEhlJmMkWUv5ikb5JZx7XXBx1KqYg6E1XZSkYd1Kg=;
	b=gfgBsGEucYbm3apWeGreCnHBxAhYYtc11OEiXG+NUSF7Ip5k2lk8Zkax19Kgwj7tDs
	KZMtnvsM4F9zc5j7NmMWvHozTw3J8xEtsW4sLqCU+FyS2P9YkWEyiyCMZnanKIIiXifJ
	gs7wWzLQj7dfU8b3wCVCrstjUlDfAMnRQpBa6Kb8ErGdcSHshZwZkvm2rH7s+rb443SY
	xvv/rkKQRNWyKpM+6Ift4UmS4xoskhCR9K/3thgRtzmmCJg4086/aPnz/aJswdTR5z1V
	2tDMMu8KBN8ZRp82sf8hZXFH+o/xzclJlrcHUgPxMbd5UkXGH5fn6xCV8qxS1XQH0e7/
	njGg==
MIME-Version: 1.0
Received: by 10.66.75.73 with SMTP id a9mr40807053paw.43.1350385770584; Tue,
	16 Oct 2012 04:09:30 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.68.40.201 with HTTP; Tue, 16 Oct 2012 04:09:30 -0700 (PDT)
In-Reply-To: <1349166535-14325-1-git-send-email-s.stirtzel@googlemail.com>
References: <1349166535-14325-1-git-send-email-s.stirtzel@googlemail.com>
Date: Tue, 16 Oct 2012 08:09:30 -0300
X-Google-Sender-Auth: Cvaz1Qb-2yBfRI-iVqaWvrnqE_E
Message-ID: <CAP9ODKrNWnk_H0GjfM6sP8KNApRr=bGT0YaSEXp-8qMNq_GfZQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Tue, 16 Oct 2012 11:22:48 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Oct 2, 2012 at 5:28 AM, Samuel Stirtzel
<s.stirtzel@googlemail.com> wrote:
> Maliit is a Qt based virtual keyboard under liberal license (LGPLv2.1 / BSD)
> The inputmethod framework from Qt is used and it supports gtk-immodules.
> It can also be used without dependencies to GTK+ (separate package for GTK+)
>
> Signed-off-by: Samuel Stirtzel <s.stirtzel@googlemail.com>

Thanks by working on this. Bellow my comments ...

...
> diff --git a/meta-oe/recipes-support/maliit/maliit-framework_git.bb b/meta-oe/recipes-support/maliit/maliit-framework_git.bb
> new file mode 100644
> index 0000000..3f50d1b
> --- /dev/null
> +++ b/meta-oe/recipes-support/maliit/maliit-framework_git.bb
...
> +
> +# Maliit needs Qt configured with -accessibility, a patch for that was already sent and will get merged in post 1.2.
> +RDEPENDS_${PN} = "qt4-plugin-inputmethod-imsw-multi libqtsvg4"

In this case, maliit is a post 1.2 package.

...
> +EXTRA_QMAKEVARS_PRE = "\
> +    PREFIX=${prefix} \
> +    LIBDIR=${libdir} \
> +    QT_IM_PLUGIN_PATH=${libdir}/qt4/plugins/inputmethods \
> +    MALIIT_INSTALL_PRF=${datadir}/qt4/mkspecs/features \
> +    SCHEMADIR=${sysconfdir}/gconf/schemas \
> +    CONFIG+=disable-gconf \
> +    CONFIG+=disable-gtk-cache-update \
> +    CONFIG+=local-install \
> +    "

Really need to disable gtk-cache-update? Why?

...
> +# Update the inputmethod modules in gtk
> +pkg_postinst_${PN}-gtk() {
> +if [ "x$D" != "x" ]; then
> +    exit 1
> +fi
> +gtk-query-immodules-2.0 > /etc/gtk-2.0/gtk.immodules
> +}
> +
> +pkg_postrm_${PN}-gtk() {
> +if [ "x$D" != "x" ]; then
> +    exit 1
> +fi
> +gtk-query-immodules-2.0 > /etc/gtk-2.0/gtk.immodules
> +}

You might add a gtk-immodules.bbclass to allow it to be put out of the recipe.

As said by Martin, please read the README and follow the steps to send
the patch...

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


