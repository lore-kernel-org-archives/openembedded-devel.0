Return-Path: <gaylord.charles@veo-labs.com>
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
	[209.85.208.66])
	by mail.openembedded.org (Postfix) with ESMTP id 67CDA7EB14
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Sep 2019 09:47:12 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id t3so1340519edw.13
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Sep 2019 02:47:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=veo-labs-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=fgDosDPe3rTCNvNxTEg3eZjNw5fdGvNgAi3XU4bw64Y=;
	b=G5eCrx9xz2z8kBp5tSwhpUIvJwXpu4njgqs1L/Tax9mk95ZNh4WdYW4H20NCyU85uy
	eGLqO5LHKD2elmGyw5BV45FfxFVPXb5EnDbDvY5qXkB98KYgvTIvpmR9pu6MNUmyI1ZG
	/Xn/0lk4i4dR/vx3sztjIHZUJMNhbEh5N8QIWu9BpAKqrnZGdlt6a2cVFSrT+Vlm0MTA
	O+3tKeHx7VnXRdU3REnd7pkYSpMCVtHqAD3Wcrvna+kEXhTbE5PKgzHbyACGYNW99QwW
	+kSxadlczjk2gKq1AsO2tU3/e4OO3jVYFJX42Y4a7BU71NkFuDCO5Gok1AoElCyE2cAD
	495w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=fgDosDPe3rTCNvNxTEg3eZjNw5fdGvNgAi3XU4bw64Y=;
	b=HWj04ILoScbIj0h+108ULWPzCjNAHmH2D8z10ri4It03m5oYjddex2IjpilvhCTuHG
	hLFdo5C44U0juX60nhE3R7MV+9JgwI0FUi+SHyPBTwOQrEqZxaQjMJvKM7He7gtemJSF
	6hXrDrg2LmbgVAAVPk8TifG40sogK6KwiGTi1uwWsGJU05+svWwR3jkBxyP2lry4gZmE
	HCvyNp8HGp3iDPZcDN4JZnvtBOesj+OH+0TEPPfn06G+T5gH2duKZf7MmOFwKbL6PacJ
	aLns1/ESEpd2A6/D/l66OSSd83olB1vxLwSpEclvqKg18elZjbyNrci2o7/+8wqU4CjR
	uG+w==
X-Gm-Message-State: APjAAAXNcNIeVilev6FwYkhWLZx86DF7Mzv4FcQkTfIpMOZ0nyngUG4+
	ubaSTWE6/M9XIVWJKm7+F+4EprEa4riAZFNxvv4JHg==
X-Google-Smtp-Source: APXvYqzrAuBeFr38JriRdJOFwm2eHPQV4kT7qKtXTm7ISTk7YkbWKdHj7BqxmVMHkYpiRbxHV4VLf3IGe9USOAaZGcU=
X-Received: by 2002:a17:906:19d3:: with SMTP id
	h19mr2237015ejd.121.1569491232986; 
	Thu, 26 Sep 2019 02:47:12 -0700 (PDT)
MIME-Version: 1.0
References: <CAAqXYd28BP4hUHjs215ebh+JOp04hHEaK0jxSmfJYosWZfYYeQ@mail.gmail.com>
	<ee3c08d0-c2bf-70e5-ae8b-3aa29b260ae4@gmail.com>
In-Reply-To: <ee3c08d0-c2bf-70e5-ae8b-3aa29b260ae4@gmail.com>
From: Gaylord Charles <gaylord.charles@veo-labs.com>
Date: Thu, 26 Sep 2019 11:46:46 +0200
Message-ID: <CAAqXYd3OvmuaYtUKmpCegXnYupz6xWDrZQrsiu+QnEFxM62xYA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Thu, 26 Sep 2019 09:47:12 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ok, thank you. I was not sure of this part.
I was trying to fix this error :

ERROR: nginx-native-1.15.7-r0 do_populate_sysroot: sstate found an absolute
path symlink
/home/gaylord/Projets/box/bbb/tmp/work/x86_64-linux/nginx-native/1.15.7-r0/=
sysroot-destdir/home/gaylord/Projets/box/bbb/tmp/work/x86_64-linux/nginx-na=
tive/1.15.7-r0/recipe-sysroot-native/etc/nginx/run
pointing at
/home/gaylord/Projets/box/bbb/tmp/work/x86_64-linux/nginx-native/1.15.7-r0/=
recipe-sysroot-native/var/run/nginx.
Please replace this with a relative link.

Le mer. 25 sept. 2019 =C3=A0 15:22, Khem Raj <raj.khem@gmail.com> a =C3=A9c=
rit :

>
>
> On 9/25/19 2:20 AM, Gaylord Charles wrote:
> > Hello,
> >
> > This patch fixes Nginx install paths. I tried to build the native varia=
nt
> > for testing purpose and had errors.
> >
> > Regards,
> > Gaylord Charles
> >
> > From b6dc845b645cc8667b2d89412c292c0801de9270 Mon Sep 17 00:00:00 2001
> > From: Gaylord CHARLES <gaylord.charles@veo-labs.com>
> > Date: Tue, 24 Sep 2019 18:56:45 +0200
> > Subject: [PATCH] nginx: fix install paths
> >
> > - Use path variable instead of /usr
> > - Replace the absolute path symlink with a relative one
> >
> > Signed-off-by: Gaylord CHARLES <gaylord.charles@veo-labs.com>
> > ---
> >  meta-webserver/recipes-httpd/nginx/nginx.inc | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/meta-webserver/recipes-httpd/nginx/nginx.inc
> > b/meta-webserver/recipes-httpd/nginx/nginx.inc
> > index 29e7efc14..1e9d2e1a4 100644
> > --- a/meta-webserver/recipes-httpd/nginx/nginx.inc
> > +++ b/meta-webserver/recipes-httpd/nginx/nginx.inc
> > @@ -92,9 +92,9 @@ do_install () {
> >              >> ${D}${sysconfdir}/tmpfiles.d/${BPN}.conf
> >      fi
> >      install -d ${D}${sysconfdir}/${BPN}
> > -    ln -snf ${localstatedir}/run/${BPN} ${D}${sysconfdir}/${BPN}/run
> > +    ln -snf ../../var/run/${BPN} ${D}${sysconfdir}/${BPN}/run
>
> localstatedir variable could have stayed there, any particular reason to
> drop it in favor of hardcoding /var
>
> >      install -d ${D}${NGINX_WWWDIR}
> > -    mv ${D}/usr/html ${D}${NGINX_WWWDIR}/
> > +    mv ${D}${exec_prefix}/html ${D}${NGINX_WWWDIR}/
> >      chown ${NGINX_USER}:www-data -R ${D}${NGINX_WWWDIR}
> >
> >      install -d ${D}${sysconfdir}/init.d
> >
>

