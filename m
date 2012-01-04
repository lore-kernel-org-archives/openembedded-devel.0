Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mgargela@gmail.com>) id 1RiaCe-0003NM-6h
	for openembedded-devel@lists.openembedded.org;
	Thu, 05 Jan 2012 00:25:04 +0100
Received: by vcbf1 with SMTP id f1so13555917vcb.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Jan 2012 15:17:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=kVcJO1phXfdbGDhNEJmTEmdI4yPY1zg2AJbQOfdUB9o=;
	b=Z56ffkdzI/PSkcmfZGHvuwHxCnkuFon2pseMFF+eX6FICd1jO1PjzTGTOaSdqCkAw6
	/QiB+Fru5k/E5d2UICRt4cipwpW2VCbV2hd/Gzh5L6L1h9ilJOg1oQuHGdmCgHqRUnCK
	H16aNeWx4PgkWDc/jWoR0AnSB2wRkfXODELuk=
MIME-Version: 1.0
Received: by 10.220.156.81 with SMTP id v17mr29193345vcw.68.1325719061487;
	Wed, 04 Jan 2012 15:17:41 -0800 (PST)
Sender: mgargela@gmail.com
Received: by 10.52.160.165 with HTTP; Wed, 4 Jan 2012 15:17:41 -0800 (PST)
In-Reply-To: <CAMKF1spZGshc70t3e3dUjfckxEVFg0UX+Wtga7GJssFPuEugDg@mail.gmail.com>
References: <CAObi9r-QdBpK9hzwQr1M1tjjKW1F+qLfr2CLbjyWCAuSuEUKAQ@mail.gmail.com>
	<20120104180932.GD32676@sakrah.homelinux.org>
	<CAObi9r_A=fv0Q4QQMxzXTLmsdS1yb4y+9EApxrCkGiX53L70=g@mail.gmail.com>
	<CAMKF1spZGshc70t3e3dUjfckxEVFg0UX+Wtga7GJssFPuEugDg@mail.gmail.com>
Date: Thu, 5 Jan 2012 01:17:41 +0200
X-Google-Sender-Auth: U34aJhc9SOkiWhqHdQdxDkIoGpg
Message-ID: <CAObi9r-Gm9_ORVY--3dyrgaAts3AEprr7jxfv8-WNJRr1aqKUw@mail.gmail.com>
From: mgundes <mgcse@hotmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: some ipk contents missed in rootfs - fuse_2.7.4
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
X-List-Received-Date: Wed, 04 Jan 2012 23:25:04 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Jan 5, 2012 at 12:40 AM, Khem Raj <raj.khem@gmail.com> wrote:

> On Wed, Jan 4, 2012 at 2:00 PM, mgundes <mgcse@hotmail.com> wrote:
> > At that point, can I say this as a result: "IMAGE_INSTALL is checked by
> > bitbake and just only ipks of in that variable are added to rootfs. In my
> > case, I had added fuse to IMAGE_INSTALL and just fuse*.ipk was added to
> > rootfs, so that I needed to adding fuse-utils to IMAGE_INSTALL to get
> > contents of fuse-utils*.ipk in my rootfs."
> >
> > Is that conclusion true?
> >
>
> you have to understand the difference between recipe name and output
> package name
> one recipe may emit multiple packages. What goes into image is picked
> from output package
> names and not recipe names. By default bitbake translates recipe name
> to be one of packages
> name as well. e.g. if you have foo.bb then there will be a foo.ipk
> generated but there might
> be more like foo-utils.ipk etc. if you did that in the recipe.
>
>
Yes, one bb can generate many ipks as defined by PACKAGES variable.
Just I want to be sure; up to your example, If I need foo.ipk and
foo-utils.ipk contents in my rootfs do I need to add "foo foo-utils" or
just "foo" to IMAGE_INSTALL?


> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>


-- 
MahmutG

