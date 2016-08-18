Return-Path: <martin.jansa@gmail.com>
Received: from mail-lf0-f66.google.com (mail-lf0-f66.google.com
	[209.85.215.66])
	by mail.openembedded.org (Postfix) with ESMTP id 6317E76B7C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Aug 2016 17:02:21 +0000 (UTC)
Received: by mail-lf0-f66.google.com with SMTP id f93so2048603lfi.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 18 Aug 2016 10:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=S4Qpw3GTWMD8ym4/GwiaHE1/gw+wO5P6AAGlsQ6ZK0Q=;
	b=mENalvSAIAxGIsmeJEfJrcMiv9wZABbSHKa4srRo7bY1n7B39lBe7swwiHCc59AzBM
	Ek//vYllT1bIB4qezkQ2S5fViK1oMmBc21NlYfqeHiSdmLdxfVbSW29+Ir+wMaxtETjv
	rPmil3PmGhsFFGBGr2TUeuYv4KXeIJSDNWsbSIOPiz43Y+IAXJGBrBlNKwqTQokDWrFZ
	d9BJPGc8JEwLxyv06Acidpg7BE1cnJz59unYM8M8nXGecbcoSaPPzxGeOeKqjj0l/Yaj
	9kjXf0C5Wcugan3qrCyS+JO720y2CuAZ9IPC3DpN4178m5EtQL+XmKhwTGnI4giJSb1X
	S2ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=S4Qpw3GTWMD8ym4/GwiaHE1/gw+wO5P6AAGlsQ6ZK0Q=;
	b=BidQYZHmNaD2ECW013Rve32ACTzQQi5pKhjqae5l4Y12kizgTN8tMzOz5kNPRu5SbC
	e4SahegkiOAtGNhEesOx04mK7QOH3kj79WWPwlWfsNE6A95HjPRRptMjzt4gNUk3z9hP
	SqR84t6ojnYNi7l0/FV9sFLniviV68xA7ucmWjZG5P7P9qN6lJvqXKBI3vo7Bu7SLR4K
	OIx3mKJCktAqIT8bfsmoXoCL3YMma4vyDs1Db6ev+PR9U5EQG/O2oItm0LUvUUKFYGRa
	AYJKL159cVta/on0W/3+KEZlKekc2tZl2n8lCqgHy/uiG4pfwUxlSCMHib/k3dVnYgsr
	9KZw==
X-Gm-Message-State: AEkooutGgbttxeoXPpnbkp+T/2gMr7AR1oPuclUOzSYveqQSxUlOef5y6wtWg4ytzxG7maEn/j26JKfoir/QCQ==
X-Received: by 10.25.19.32 with SMTP id j32mr1032991lfi.204.1471539740753;
	Thu, 18 Aug 2016 10:02:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.25.87.12 with HTTP; Thu, 18 Aug 2016 10:02:19 -0700 (PDT)
In-Reply-To: <86563065.BT55Dkadr2@gyurco.localdomain>
References: <20160818160002.ydacjrbdyknjmcwa@jama>
	<20160818160939.4390-1-Martin.Jansa@gmail.com>
	<86563065.BT55Dkadr2@gyurco.localdomain>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 18 Aug 2016 19:02:19 +0200
Message-ID: <CA+chaQeuNw0_=XUw7XBLb2a=dooNr+A0ZFj7vb=qhgU+cXKVKg@mail.gmail.com>
To: =?UTF-8?Q?Szombathelyi_Gy=C3=B6rgy?= <gyurco@freemail.hu>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-webserver][PATCHv2 1/2] nginx: optimize systemd unit file
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
X-List-Received-Date: Thu, 18 Aug 2016 17:02:21 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Then please send tested v3.

Thanks

On Thu, Aug 18, 2016 at 6:41 PM, Szombathelyi Gy=C3=B6rgy <gyurco@freemail.=
hu>
wrote:

> Hi,
>
> Sorry for the wrong patch, but this has also some problems (inlined):
>
> On Thursday, August 18, 2016 6:09:38 PM CEST Martin Jansa wrote:
> > From: Szombathelyi Gy=C3=B6rgy <gyurco@freemail.hu>
> >
> > - Call the nginx binary directly, no need to wrap the SysV init file.
> > - Create /var/log/nginx with tmpfiles, like volatiles without systemd.
> > - Run nginx with ${NGINX_USER} (user ${NGINX_USER} in nginx.conf)
> >
> > Signed-off-by: Gyorgy Szombathelyi <gyurco@freemail.hu>
> > ---
> >  meta-webserver/recipes-httpd/nginx/files/nginx.service | 9 ++++-----
> >  meta-webserver/recipes-httpd/nginx/nginx.inc           | 5 +++--
> >  2 files changed, 7 insertions(+), 7 deletions(-)
> >
> > diff --git a/meta-webserver/recipes-httpd/nginx/files/nginx.service
> > b/meta-webserver/recipes-httpd/nginx/files/nginx.service index
> > 9926a4b..ce99061 100644
> > --- a/meta-webserver/recipes-httpd/nginx/files/nginx.service
> > +++ b/meta-webserver/recipes-httpd/nginx/files/nginx.service
> > @@ -3,10 +3,9 @@ Description=3DNginx Server
> >  After=3Dnetwork.target
> >  [Service]
> >  Type=3Dforking
> > -PIDFile=3D@SYSCONFDIR@/nginx/run/nginx.pid
> > -ExecStartPre=3D@BASEBINDIR@/mkdir -p @LOCALSTATEDIR@/log/nginx
> > -ExecStart=3D@SYSCONFDIR@/init.d/nginx start
> > -ExecStop=3D@SYSCONFDIR@/init.d/nginx stop
> > +PIDFile=3D/run/nginx/nginx.pid
> > +ExecStart=3D@SBINDIR@/nginx
> > +ExecStop=3D@SBINDIR@/nginx -s stop
> > +ExecReload=3D@SBINDIR@/nginx -s reload
> >  [Install]
> >  WantedBy=3Dmulti-user.target
> > -
> > diff --git a/meta-webserver/recipes-httpd/nginx/nginx.inc
> > b/meta-webserver/recipes-httpd/nginx/nginx.inc index fe51ca0..334a6d8
> > 100644
> > --- a/meta-webserver/recipes-httpd/nginx/nginx.inc
> > +++ b/meta-webserver/recipes-httpd/nginx/nginx.inc
> > @@ -73,8 +73,8 @@ do_install () {
> >       rm -fr ${D}${localstatedir}/run ${D}/run
> >       if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true',
> 'false',
> > d)}; then install -d ${D}${sysconfdir}/tmpfiles.d
> > -             echo "d /run/${BPN} - - - -" \
> > -                  > ${D}${sysconfdir}/tmpfiles.d/${BPN}.conf
> Don't remove the /run/nginx directory, please
>
> > +             echo "d /${localstatedir}/log/${BPN} 0755 root root -" \
> > +                     >> ${D}${sysconfdir}/tmpfiles.d/${BPN}.conf
> >       fi
> >       install -d ${D}${sysconfdir}/${BPN}
> >       ln -snf ${localstatedir}/run/${BPN} ${D}${sysconfdir}/${BPN}/run
> > @@ -90,6 +90,7 @@ do_install () {
> >       install -d ${D}${sysconfdir}/nginx
> >       install -m 0644 ${WORKDIR}/nginx.conf
> ${D}${sysconfdir}/nginx/nginx.conf
> >       sed -i 's,/var/,${localstatedir}/,g' ${D}${sysconfdir}/nginx/ngin=
x.
> conf
> > +     sed -i 's/^user.*/user ${NGINX_USER};/g'
> > ${D}${sysconfdir}/nginx/nginx.conf install -d
> > ${D}${sysconfdir}/nginx/sites-enabled
> >
> >       install -d ${D}${sysconfdir}/default/volatiles
> This is missing from the end, since the unit file refers to SBINDIR now,
> and
> no BASE_SBINDIR.
>
> @@ -101,7 +104,7 @@ do_install () {
>              install -m 0644 ${WORKDIR}/nginx.service
> ${D}${systemd_unitdir}/
> system/
>              sed -i -e 's,@SYSCONFDIR@,${sysconfdir},g' \
>                      -e 's,@LOCALSTATEDIR@,${localstatedir},g' \
> -                    -e 's,@BASEBINDIR@,${base_bindir},g' \
> +                    -e 's,@SBINDIR@,${sbindir},g' \
>                      ${D}${systemd_unitdir}/system/nginx.service
>          fi
>  }
>
>
>

