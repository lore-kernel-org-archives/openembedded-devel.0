Return-Path: <max.oss.09@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id CEB4171999
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 28 May 2017 18:11:37 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id b84so12634547wmh.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 28 May 2017 11:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=8cz0RG7Jg6mRFL0bpE9a5TqdHUrDcGyV+CpgH6zq6sI=;
	b=YzlQ3xliLfW/k2+7CaDWMxuX82v9rC302qBaaLW4WSlj5rsVQNQPV0Ajpts5lrFndq
	Es590tSMAL3mdDPojQNvHesPlhMoLzJxmBBLruG1F2mefP6Qrq6Jk8HVZ2mGFjxXJiIv
	iSUXXY6+hBjtg25OlWKUJFf9G5jgqkc2NS7cuffs5QUrPUqR1gkAQfZjAUxyVI6/T8mc
	7sjqd6KfnOanWv//u/ZA34NLa6rYufi2vM7H2g7heM5c3SsHoKHCcwc/tTUH1v8lfBGz
	HQQr/LHbidlVASiBdWvoIhC5WAk0UqZj0XH32FAs3QHHkuE1RWgCjdUUClQwg1UOkcDB
	GAWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=8cz0RG7Jg6mRFL0bpE9a5TqdHUrDcGyV+CpgH6zq6sI=;
	b=MviXLgQd+jKOH02plKeTLrj/mdJpNTgZ+QKhNNYA9e8VltuauIzAXweO04XHHNJl1k
	fQMHaPUs6I43OLShIhs13CqxIDCWre/8BRNy6cvsBv1vWBFPXKkp2zWY+SSL2P48EX++
	Nb1ptykO04fMQrc87K/d0IJ4wnV31KUWloDuP6msDDUnipjoKipLPxIBN9zJkgSmB52/
	OSsttKJoZrQjVG8QEBgl35UVfW4q2vomTpIQvW0aFBhR1vY8rcCwDq6O+ZBPv0yGOFHb
	UxnUQd6q0eSW6j+LQ+f0w1jfYdl/qwuIDZRCBlMLz/RUog6BFE9v5gE0qj0onOg8MbF+
	DhdA==
X-Gm-Message-State: AODbwcDr6iFrgmqpNJXv0tP22bYLW54di2lwVfICKFXqk8O+6n+Luobv
	071mofIK5Rb4cQ==
X-Received: by 10.80.129.229 with SMTP id 92mr9740986ede.161.1495995098071;
	Sun, 28 May 2017 11:11:38 -0700 (PDT)
Received: from Saturn.local.all (138-14-48-195.pool.dsl-net.ch.
	[195.48.14.138]) by smtp.gmail.com with ESMTPSA id
	x27sm3440722edb.49.2017.05.28.11.11.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 28 May 2017 11:11:37 -0700 (PDT)
Message-ID: <1495995096.3000.8.camel@gmail.com>
From: Max Krummenacher <max.oss.09@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Date: Sun, 28 May 2017 20:11:36 +0200
In-Reply-To: <CAMKF1sptWiD9vH0CVB86mFhaQMpiSY+3sAGd8E-B+hT2O08O9Q@mail.gmail.com>
References: <20170528111040.22809-1-max.krummenacher@toradex.com>
	<CAMKF1sptWiD9vH0CVB86mFhaQMpiSY+3sAGd8E-B+hT2O08O9Q@mail.gmail.com>
X-Mailer: Evolution 3.16.5 
Mime-Version: 1.0
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Max Krummenacher <max.krummenacher@toradex.com>
Subject: Re: [meta-oe][PATCH 1/2] gpsd: don't compile with gold
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
X-List-Received-Date: Sun, 28 May 2017 18:11:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Am Sonntag, den 28.05.2017, 09:04 -0700 schrieb Khem Raj:
> On Sun, May 28, 2017 at 4:10 AM, Max Krummenacher <max.oss.09@gmail.com> wrote:
> > When linking with gold libgps and libgpsd error out with:
> >  | ./libgpsd.so: error: undefined reference to 'atan2'
> >  | ./libgpsd.so: error: undefined reference to 'pow'
> >  | ./libgpsd.so: error: undefined reference to 'sqrt'
> >  | ./libgpsd.so: error: undefined reference to 'sin'
> >  | ./libgpsd.so: error: undefined reference to 'cos'
> >  | collect2: error: ld returned 1 exit status
> > 
> > Using the bfd linker fixes the issue.
> 
> It seems packages dont have proper linker rules.
> perhaps a better fix is to add -lm to linker cmdline.
-lm is part of the linker cmdline.

 | arm-angstrom-linux-gnueabi-gcc -march=armv7-a -mthumb -mfpu=neon -mfloat-abi=hard -
-sysroot=/home/res/develop/oe-core/build/tmp-glibc/sysroots/apalis-imx6 -o gpsd -Wl,-O1 -Wl,--hash
-style=gnu -Wl,--as-needed --sysroot=/home/res/develop/oe-core/build/tmp-glibc/sysroots/apalis-imx6 
-pthread -Wl,-rpath=/home/res/develop/oe-core/build/tmp-glibc/work/armv7at2hf-neon-angstrom-linux
-gnueabi/gpsd/3.14-r0/gpsd-3.14 gpsd.o timehint.o shmexport.o dbusexport.o sd_socket.o -L. 
-L/home/res/develop/oe-core/build/tmp-glibc/sysroots/apalis-imx6/usr/lib -lrt -lbluetooth -ldbus-1 
-lgpsd -lusb-1.0 -lbluetooth -lgps -lm -ldbus-1

One can get this link by linking the two shared objects '-lgps -lm' swapped '-lm -lgps', however I
do not understand why that order matters.
It does not help to add -lm when linking libgps.so.

gpsd 3.16 seems do not be affected, the scons file however has been given quite same change.

So, IMHO I'd rather use the linker which we now produces working binaries than to add yet one more
patch to the scons file. That gives a commit we can use to backport for pyro and morty.
Going forward we can use the update to 3.16 which allows to drop the majority of the patches we have
now and builds also with gold.

Max

> > 
> > Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
> > ---
> >  meta-oe/recipes-navigation/gpsd/gpsd_3.14.bb | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.14.bb b/meta-oe/recipes
> > -navigation/gpsd/gpsd_3.14.bb
> > index 4d00fea6d..fb02f9598 100644
> > --- a/meta-oe/recipes-navigation/gpsd/gpsd_3.14.bb
> > +++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.14.bb
> > @@ -36,6 +36,8 @@ SYSTEMD_OESCONS = "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true',
> > 'f
> >  export STAGING_INCDIR
> >  export STAGING_LIBDIR
> > 
> > +LDFLAGS_append = "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', ' -fuse-ld=bfd ', '',
> > d)}"
> > +
> >  PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez', '', d)}"
> >  PACKAGECONFIG[bluez] = "bluez='true',bluez='false',${BLUEZ}"
> >  PACKAGECONFIG[qt] = "qt='yes',qt='no',qt4-x11-free"
> > --
> > 2.12.0
> > 
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel

