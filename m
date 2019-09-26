Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by mail.openembedded.org (Postfix) with ESMTP id 1C7047C426
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Sep 2019 13:10:59 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id r5so2809861qtd.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Sep 2019 06:11:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=KP7UuFht2rYUqxASHWXOcF2/nCPTHLSzXruuPIK/yAc=;
	b=NBRtSGKykWWMb/Qkw0SmzMy3pZsVIGlrJX6oGE/wXQttXQs5uxSEC5dr23Mig+NhjW
	LhOM+Vne/0wDOzU1wOA3hMo7OyWCjekRygd5cwLiRTlBoj0xW9GmT9jEm/1FQLlahKuA
	w6P+346ObudyTXjAldDBPqGTfZMEfJj8QZnoUIAbUzSFRciznoVMb/sVEmBILMQrn5AF
	wSxRQheF0GPRPUfXyR1PjfQb5d/bIHMi7cnT2mkCtrNZO/6KGSdYAKwConwflqt9fwHR
	J6fWmI718qCmXWRsnehniXR4TQ5t+6QAIArJAPASTLOdTgrKpgaa09qS7aBP+/g0oSbN
	6cjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=KP7UuFht2rYUqxASHWXOcF2/nCPTHLSzXruuPIK/yAc=;
	b=ZvA997Licb34YdhdFD7bdu8W3ILeg6fbfZfhK2jjSL0+G2DG0D0zWgXyazx3CPP6U0
	p07wHZAQ/ITlhX1rUfxbTh9mJGhxbYzkyluHDRyt9pcOx1e7ma86VC+vGAesYGQtw1Jk
	HaJpumf3Z630c0/4FWUGrMP8vtNvAVW+VF08utIqxRyD6RIY8HVbu2w01bhmoh06wuJP
	A6106vJA7UsfSzs+CAqCSiWp4/hhu/D85eNanq4fHkmJVaBfbRwap0yPTB3SWhRYg5qV
	dakMPdjoI9VH3n8iLb8VM4BqIpWce9e2gccPwYy3g2wrisbpTTa2UBa4PgOKuY3fOdFo
	mcjA==
X-Gm-Message-State: APjAAAXOQ/NeZ33LTNErnTXRafBU7oN4cl/w+y3eYD52Pc6VVGDmNMUq
	Llr8J+JBcpipO/IeVCx3GNMQULdd3t3cKdLbMF75yqfy
X-Google-Smtp-Source: APXvYqxzjBfpwlQBw7bapAxDbStFXdXrPXUArlUixSlplhgGSGelpcWiRgoArf9KOgZd+sBvQQCF9f6OTSXXcz8+vJI=
X-Received: by 2002:ad4:5551:: with SMTP id v17mr2515007qvy.65.1569503459484; 
	Thu, 26 Sep 2019 06:10:59 -0700 (PDT)
MIME-Version: 1.0
References: <CAAqXYd28BP4hUHjs215ebh+JOp04hHEaK0jxSmfJYosWZfYYeQ@mail.gmail.com>
	<ee3c08d0-c2bf-70e5-ae8b-3aa29b260ae4@gmail.com>
	<CAAqXYd3OvmuaYtUKmpCegXnYupz6xWDrZQrsiu+QnEFxM62xYA@mail.gmail.com>
In-Reply-To: <CAAqXYd3OvmuaYtUKmpCegXnYupz6xWDrZQrsiu+QnEFxM62xYA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 26 Sep 2019 06:10:33 -0700
Message-ID: <CAMKF1sr2nE7w=XVxRGoxdjF2pERe6Qcy1gA3KBv-zTpSM4frOg@mail.gmail.com>
To: Gaylord Charles <gaylord.charles@veo-labs.com>
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
X-List-Received-Date: Thu, 26 Sep 2019 13:10:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 26, 2019 at 2:47 AM Gaylord Charles
<gaylord.charles@veo-labs.com> wrote:
>
> Ok, thank you. I was not sure of this part.
> I was trying to fix this error :
>
> ERROR: nginx-native-1.15.7-r0 do_populate_sysroot: sstate found an absolu=
te path symlink /home/gaylord/Projets/box/bbb/tmp/work/x86_64-linux/nginx-n=
ative/1.15.7-r0/sysroot-destdir/home/gaylord/Projets/box/bbb/tmp/work/x86_6=
4-linux/nginx-native/1.15.7-r0/recipe-sysroot-native/etc/nginx/run pointing=
 at /home/gaylord/Projets/box/bbb/tmp/work/x86_64-linux/nginx-native/1.15.7=
-r0/recipe-sysroot-native/var/run/nginx. Please replace this with a relativ=
e link.
>

right. Perhaps use lnr since that will work across all distros

> Le mer. 25 sept. 2019 =C3=A0 15:22, Khem Raj <raj.khem@gmail.com> a =C3=
=A9crit :
>>
>>
>>
>> On 9/25/19 2:20 AM, Gaylord Charles wrote:
>> > Hello,
>> >
>> > This patch fixes Nginx install paths. I tried to build the native vari=
ant
>> > for testing purpose and had errors.
>> >
>> > Regards,
>> > Gaylord Charles
>> >
>> > From b6dc845b645cc8667b2d89412c292c0801de9270 Mon Sep 17 00:00:00 2001
>> > From: Gaylord CHARLES <gaylord.charles@veo-labs.com>
>> > Date: Tue, 24 Sep 2019 18:56:45 +0200
>> > Subject: [PATCH] nginx: fix install paths
>> >
>> > - Use path variable instead of /usr
>> > - Replace the absolute path symlink with a relative one
>> >
>> > Signed-off-by: Gaylord CHARLES <gaylord.charles@veo-labs.com>
>> > ---
>> >  meta-webserver/recipes-httpd/nginx/nginx.inc | 4 ++--
>> >  1 file changed, 2 insertions(+), 2 deletions(-)
>> >
>> > diff --git a/meta-webserver/recipes-httpd/nginx/nginx.inc
>> > b/meta-webserver/recipes-httpd/nginx/nginx.inc
>> > index 29e7efc14..1e9d2e1a4 100644
>> > --- a/meta-webserver/recipes-httpd/nginx/nginx.inc
>> > +++ b/meta-webserver/recipes-httpd/nginx/nginx.inc
>> > @@ -92,9 +92,9 @@ do_install () {
>> >              >> ${D}${sysconfdir}/tmpfiles.d/${BPN}.conf
>> >      fi
>> >      install -d ${D}${sysconfdir}/${BPN}
>> > -    ln -snf ${localstatedir}/run/${BPN} ${D}${sysconfdir}/${BPN}/run
>> > +    ln -snf ../../var/run/${BPN} ${D}${sysconfdir}/${BPN}/run
>>
>> localstatedir variable could have stayed there, any particular reason to
>> drop it in favor of hardcoding /var
>>
>> >      install -d ${D}${NGINX_WWWDIR}
>> > -    mv ${D}/usr/html ${D}${NGINX_WWWDIR}/
>> > +    mv ${D}${exec_prefix}/html ${D}${NGINX_WWWDIR}/
>> >      chown ${NGINX_USER}:www-data -R ${D}${NGINX_WWWDIR}
>> >
>> >      install -d ${D}${sysconfdir}/init.d
>> >

