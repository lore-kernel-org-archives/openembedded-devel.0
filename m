Return-Path: <eduardo@monkey.io>
Received: from mail-we0-f182.google.com (mail-we0-f182.google.com
	[74.125.82.182])
	by mail.openembedded.org (Postfix) with ESMTP id 1096960E23
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Jun 2014 19:53:54 +0000 (UTC)
Received: by mail-we0-f182.google.com with SMTP id t60so7494016wes.27
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Jun 2014 12:53:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=zey79Umk2hzvcCBzsGAHfXzuhGIo8ifZf4H/Wap5mlA=;
	b=eBfsgQ5QhwAWQRinZThDsN3mUPzeGMkOT2cAjgdtjkpHQ2bOO03353jsdM0DGZsgnE
	9j2JeoFapIL961THd8HZ6sd2YvmB8sz/CtH+QbCXzefxoGW/4kPAHFv8Vzjq/yEVn48q
	R0pOYoAELtdbJFRx1paQ3cWF3Br5PD2oNgZhF2u4Eu9NIbs8vvYNmecFi7YDnsbHHlhh
	tbTgiWL6LhZjuxwT/RM1pU6wkKiYzQdXKdgs7gLYcQu8cj7/4v07lLYU+tkZpNDpARiZ
	HDU3t18uXn04F2L9ZvW+XXg9DaKZ1tVQWjEJyXOZNMwhjdmL0sEr0+NKQFd6CY0/Luw8
	PEBg==
X-Gm-Message-State: ALoCoQnV/y+JUWTBxKxPDUUXFOqxzh1lAnYDbPx8dGAP4/a1xhsoceBHSrnxMZpY79zP/5k10xde
MIME-Version: 1.0
X-Received: by 10.194.57.225 with SMTP id l1mr64744985wjq.25.1401825234257;
	Tue, 03 Jun 2014 12:53:54 -0700 (PDT)
Received: by 10.194.88.135 with HTTP; Tue, 3 Jun 2014 12:53:54 -0700 (PDT)
X-Originating-IP: [186.32.221.184]
In-Reply-To: <lmjpkv$ajq$1@ger.gmane.org>
References: <1401743690-25537-1-git-send-email-eduardo@monkey.io>
	<lmjpkv$ajq$1@ger.gmane.org>
Date: Tue, 3 Jun 2014 13:53:54 -0600
Message-ID: <CAEaCVQj5v-rW5--wrWMb4NuT-PBa4xf59UjDUwdhGVFnNdgYNQ@mail.gmail.com>
From: Eduardo Silva <eduardo@monkey.io>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [PATCH] [meta-webserver]: add Monkey HTTP Server.
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
X-List-Received-Date: Tue, 03 Jun 2014 19:54:04 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Jun 3, 2014 at 12:23 AM, Koen Kooi <koen@dominion.thruhere.net>
wrote:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Eduardo Silva schreef op 02-06-14 23:14:
> > This patch add the initial recipe for Monkey HTTP Server v1.5.0.
> >
> > Signed-off-by: Eduardo Silva <eduardo@monkey.io> ---
> > .../recipes-httpd/monkey/monkey_1.5.0.bb           | 36
> > ++++++++++++++++++++++ 1 file changed, 36 insertions(+) create mode
> > 100644 meta-webserver/recipes-httpd/monkey/monkey_1.5.0.bb
> >
> > diff --git a/meta-webserver/recipes-httpd/monkey/monkey_1.5.0.bb
> > b/meta-webserver/recipes-httpd/monkey/monkey_1.5.0.bb new file mode
> > 100644 index 0000000..25a9530 --- /dev/null +++
> > b/meta-webserver/recipes-httpd/monkey/monkey_1.5.0.bb @@ -0,0 +1,36 @@
> > +SUMMARY = "Fast and Lightweight HTTP Server for Linux" +HOMEPAGE =
> > "http://monkey-project.com" +BUGTRACKER =
> > "https://github.com/monkey/monkey/issues" + +LICENSE = "Apache-2.0"
> > +LIC_FILES_CHKSUM =
> > "file://LICENSE;md5=2ee41112a44fe7014dce33e26468ba93" + +SECTION = "net"
> > + +SRC_URI =
> > "http://monkey-project.com/releases/1.5/monkey-${PV}.tar.gz"
> > +SRC_URI[md5sum] = "9123fc371334621fde1c060ab17adcd3" +SRC_URI[sha256sum]
> > = "f7a5e4839822750930a723f63a4edbf700e0fb8299a4b3637bd8bab5b1d098a7" +
> > +EXTRA_OECONF = " \ +             --plugdir=${libdir}/monkey/ \ +
> > --logdir=/var/log/monkey/ \ +             --pidfile=/var/run/monkey.pid
> > \ +             --default-user=www-data \ +
> > --datadir=/var/www/monkey/ \
>
> /var -> ${localstatedir} ?
>
>
> > +             --sysconfdir=${sysconfdir}/monkey/ \ +
> > --enable-plugins=* \ +             --disable-plugins=polarssl \ +
> > --debug \ +             --malloc-libc \ +" + +inherit autotools pkgconfig
> > update-rc.d systemd + +INITSCRIPT_NAME = "monkey" +INITSCRIPT_PARAMS =
> > "defaults 70" + +SYSTEMD_SERVICE_${PN} = "monkey.service" + +FILES_${PN}
> > += "/www" + +CONFFILES_${PN} = "${sysconfdir}/monkey/"
> >
>
>
thanks to all for the feedback!.

Before to submit a new patch, would you please verify if it now looks
correct now ?:

   https://github.com/monkey/monkey-yocto/blob/master/monkey/monkey_1.5.0.bb

if it's ok i will submit a new one.

best

