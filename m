Return-Path: <gaylord.charles@veo-labs.com>
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
	[209.85.208.67])
	by mail.openembedded.org (Postfix) with ESMTP id 110347DD44
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Sep 2019 15:32:13 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id c4so2544316edl.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Sep 2019 08:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=veo-labs-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=hPFmFLMq8uN807gkGtcKfQgUlmeLZDNyMzsN6XdSxsY=;
	b=kMW4NElRVIctfa4gMGkA5KbLXdCkQns33lT+auY8JarnrwUtVWtkA0pHwSwYkacG/n
	S2P9ybq1DFZbkI8GvbvZr/G9L2jdPTJOpqHPzkI6o/3w+KZDvvgghLlsyrSF4E09DZTf
	BsTbBIufpeJw880hBKBWGw09Yge4du098ZItftJM03qdu0N2gIMTVmExUAWEvD6L/nMZ
	YvSFD5jzkbSHirlCAfXGnYQ1mmSgXTj12dZUJGqu/H+HfhZJIyo1Ivo35h5klXNu3lY5
	1w3UAXcu9UWaw1FX3dfn7NRy6Rk5ZxNjRNj3+jAiz1+NpzpEkhu9kYKAXxDqT1poJ9qV
	5Bqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=hPFmFLMq8uN807gkGtcKfQgUlmeLZDNyMzsN6XdSxsY=;
	b=r8y4ZqnvVtf/7J+IiqumvA6a0fQ8Yhm5hUN9kwSu6FS3MSH+Y1k2qLXIOPnAwlPGEs
	Fmi85OBWnHdxudwQDOexCygusujLzfm7+UEM9woAlfXt/XyREHfQ8ySh+Tf/GL5BaEOl
	f/nEblBvVjMWvNmV25OkWxngniAmYd39xMgWq1jibOGpfZHPXS+2TRc4pVW8xPRVeu2R
	sq0dqIj8H5/PhAt2H9qheFhv9tlfrW/y+krk+K2m9c6hEygIT2K0HN5s4mAd7U6v4dEI
	iDtZaP1zwP/kELfXpQnDrw/84hQuG2ol5TEjcNQ1d3aPN6tatmixvD7dDhGTY2G3pgnY
	F20Q==
X-Gm-Message-State: APjAAAXFwO6Z89y4zmRmC/8LZ8+loAG4BjIAQoxQbjfj9eO4PUH5IgrB
	Hh3v7HdJwIbTPZCSpKpgtRv8siMlTFYmEu9Kg6EsmQ==
X-Google-Smtp-Source: APXvYqxvA3p9VD4rUl0vgn60Iujvfy+zaNRTOtLgWrShZNT0Y8p7lJnIhDfRIOTShsZyOify+bQKdQS3fq20r1l1DCU=
X-Received: by 2002:a17:906:7245:: with SMTP id
	n5mr3695605ejk.173.1569511934560; 
	Thu, 26 Sep 2019 08:32:14 -0700 (PDT)
MIME-Version: 1.0
References: <CAAqXYd28BP4hUHjs215ebh+JOp04hHEaK0jxSmfJYosWZfYYeQ@mail.gmail.com>
	<ee3c08d0-c2bf-70e5-ae8b-3aa29b260ae4@gmail.com>
	<CAAqXYd3OvmuaYtUKmpCegXnYupz6xWDrZQrsiu+QnEFxM62xYA@mail.gmail.com>
	<CAMKF1sr2nE7w=XVxRGoxdjF2pERe6Qcy1gA3KBv-zTpSM4frOg@mail.gmail.com>
In-Reply-To: <CAMKF1sr2nE7w=XVxRGoxdjF2pERe6Qcy1gA3KBv-zTpSM4frOg@mail.gmail.com>
From: Gaylord Charles <gaylord.charles@veo-labs.com>
Date: Thu, 26 Sep 2019 17:31:47 +0200
Message-ID: <CAAqXYd1eu6eynW9ozdgQVboYJV6O8prixJcHQoXd7kpQa3W9JA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-webserver][PATCH] nginx: fix install paths
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
X-List-Received-Date: Thu, 26 Sep 2019 15:32:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Yes, thanks.

From c936d2d6f9db956432b187c0ca28cecd3ffc3bb2 Mon Sep 17 00:00:00 2001
From: Gaylord CHARLES <gaylord.charles@veo-labs.com>
Date: Tue, 24 Sep 2019 18:56:45 +0200
Subject: [PATCH] nginx: fix install paths

- Use path variable instead of /usr
- Replace the absolute path symlink with a relative one (using lnr)

Signed-off-by: Gaylord CHARLES <gaylord.charles@veo-labs.com>
---
 meta-webserver/recipes-httpd/nginx/nginx.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-webserver/recipes-httpd/nginx/nginx.inc
b/meta-webserver/recipes-httpd/nginx/nginx.inc
index 29e7efc14..6af42d72d 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx.inc
+++ b/meta-webserver/recipes-httpd/nginx/nginx.inc
@@ -92,9 +92,9 @@ do_install () {
             >> ${D}${sysconfdir}/tmpfiles.d/${BPN}.conf
     fi
     install -d ${D}${sysconfdir}/${BPN}
-    ln -snf ${localstatedir}/run/${BPN} ${D}${sysconfdir}/${BPN}/run
+    lnr ${D}${localstatedir}/run/${BPN} ${D}${sysconfdir}/${BPN}/run
     install -d ${D}${NGINX_WWWDIR}
-    mv ${D}/usr/html ${D}${NGINX_WWWDIR}/
+    mv ${D}${exec_prefix}/html ${D}${NGINX_WWWDIR}/
     chown ${NGINX_USER}:www-data -R ${D}${NGINX_WWWDIR}

     install -d ${D}${sysconfdir}/init.d
--=20
2.20.1

Le jeu. 26 sept. 2019 =C3=A0 15:11, Khem Raj <raj.khem@gmail.com> a =C3=A9c=
rit :

> On Thu, Sep 26, 2019 at 2:47 AM Gaylord Charles
> <gaylord.charles@veo-labs.com> wrote:
> >
> > Ok, thank you. I was not sure of this part.
> > I was trying to fix this error :
> >
> > ERROR: nginx-native-1.15.7-r0 do_populate_sysroot: sstate found an
> absolute path symlink
> /home/gaylord/Projets/box/bbb/tmp/work/x86_64-linux/nginx-native/1.15.7-r=
0/sysroot-destdir/home/gaylord/Projets/box/bbb/tmp/work/x86_64-linux/nginx-=
native/1.15.7-r0/recipe-sysroot-native/etc/nginx/run
> pointing at
> /home/gaylord/Projets/box/bbb/tmp/work/x86_64-linux/nginx-native/1.15.7-r=
0/recipe-sysroot-native/var/run/nginx.
> Please replace this with a relative link.
> >
>
> right. Perhaps use lnr since that will work across all distros
>
> > Le mer. 25 sept. 2019 =C3=A0 15:22, Khem Raj <raj.khem@gmail.com> a =C3=
=A9crit :
> >>
> >>
> >>
> >> On 9/25/19 2:20 AM, Gaylord Charles wrote:
> >> > Hello,
> >> >
> >> > This patch fixes Nginx install paths. I tried to build the native
> variant
> >> > for testing purpose and had errors.
> >> >
> >> > Regards,
> >> > Gaylord Charles
> >> >
> >> > From b6dc845b645cc8667b2d89412c292c0801de9270 Mon Sep 17 00:00:00 20=
01
> >> > From: Gaylord CHARLES <gaylord.charles@veo-labs.com>
> >> > Date: Tue, 24 Sep 2019 18:56:45 +0200
> >> > Subject: [PATCH] nginx: fix install paths
> >> >
> >> > - Use path variable instead of /usr
> >> > - Replace the absolute path symlink with a relative one
> >> >
> >> > Signed-off-by: Gaylord CHARLES <gaylord.charles@veo-labs.com>
> >> > ---
> >> >  meta-webserver/recipes-httpd/nginx/nginx.inc | 4 ++--
> >> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >> >
> >> > diff --git a/meta-webserver/recipes-httpd/nginx/nginx.inc
> >> > b/meta-webserver/recipes-httpd/nginx/nginx.inc
> >> > index 29e7efc14..1e9d2e1a4 100644
> >> > --- a/meta-webserver/recipes-httpd/nginx/nginx.inc
> >> > +++ b/meta-webserver/recipes-httpd/nginx/nginx.inc
> >> > @@ -92,9 +92,9 @@ do_install () {
> >> >              >> ${D}${sysconfdir}/tmpfiles.d/${BPN}.conf
> >> >      fi
> >> >      install -d ${D}${sysconfdir}/${BPN}
> >> > -    ln -snf ${localstatedir}/run/${BPN} ${D}${sysconfdir}/${BPN}/ru=
n
> >> > +    ln -snf ../../var/run/${BPN} ${D}${sysconfdir}/${BPN}/run
> >>
> >> localstatedir variable could have stayed there, any particular reason =
to
> >> drop it in favor of hardcoding /var
> >>
> >> >      install -d ${D}${NGINX_WWWDIR}
> >> > -    mv ${D}/usr/html ${D}${NGINX_WWWDIR}/
> >> > +    mv ${D}${exec_prefix}/html ${D}${NGINX_WWWDIR}/
> >> >      chown ${NGINX_USER}:www-data -R ${D}${NGINX_WWWDIR}
> >> >
> >> >      install -d ${D}${sysconfdir}/init.d
> >> >
>

