Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f170.google.com (mail-wr0-f170.google.com
	[209.85.128.170])
	by mail.openembedded.org (Postfix) with ESMTP id 38E8B7760E
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Apr 2017 07:25:03 +0000 (UTC)
Received: by mail-wr0-f170.google.com with SMTP id g19so3068540wrb.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 Apr 2017 00:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=KRXxzNBkGeAVFB1Q7GBsNGo5OQpqLa66qksVBgBDIlo=;
	b=r1izCi4vifTSeiugnTSGg+oLqCLLmbClNaAH4/9L4n4gUrMiwcJ77CNbJ/UKqpF3SO
	u3v+Bz7l4bYvERemA/we7oEGq6DCheU3ioJmUM8202ftU6GIPreKl0I6WmcDh7RNAx9V
	XZoYXgaIuII/5cUN+ZkBu92Ye6VHUU0Nf4aRs70oVBWPB19yADfGeOARAzRGRREMrHrc
	YUCge/KZZQwfUMJpUsxFrJMOi3wherDWpXf3IWDW5KOMr2dm/5VcLrfOkdf1j3Zttv8c
	ivgWSQ8DLb+bJ6GjQeGKnYoMXHbwPsxH9M9JZa9teIFPiGjdXP8lwCLA4pK6R7HdERCp
	CWhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=KRXxzNBkGeAVFB1Q7GBsNGo5OQpqLa66qksVBgBDIlo=;
	b=pBFD/KtiO3Fgb1jubhZcRveFFyS6pO9dmlG3BMzzN1dX1FibCsPbiVOGUbT88nY/ll
	46oB/bXgEAEmR5R6yzLwOW5U6qU/Tax1k9Ymqc3+98ouNNXuToayXvF1JBRkanRa6ZXB
	VD+HCRLpaK0knm602KGBzJVL3yfwD6TApt9m18v8HxhLAr6MPN/+GysWzZWJD2mXmF3b
	ZOy1JKIqRX1SeWk/Re5ibI8ZwoTHo5emu4vdTQm3UvYrZwKfCV7oiKADxJPBU16T5WE1
	0RQJgvtOtui9mH4iHRIvWSp76lAvZqkrMBr1CDVwKSKQvSdHerQt2PHnYHaKKF0osRKD
	+yNg==
X-Gm-Message-State: AFeK/H03EKLGsy3L+iAxKPqYrgX5Ann7RdNA0gIopNgOWjKgIDnzvHzB40iE7/mLhKkvNTSCfCjy+krGgBIjEA==
X-Received: by 10.223.160.168 with SMTP id m37mr30102627wrm.196.1491463505008; 
	Thu, 06 Apr 2017 00:25:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.145.24 with HTTP; Thu, 6 Apr 2017 00:25:04 -0700 (PDT)
In-Reply-To: <20170405183640.GB3301@jama>
References: <5822cba9-6a76-4555-a772-d862f216e0cf@nedap.com>
	<20170405183640.GB3301@jama>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 6 Apr 2017 09:25:04 +0200
Message-ID: <CA+chaQdW2QUS7-JBSKPH6LxqMpOCvCcufdUX_47xkSGitxSiow@mail.gmail.com>
To: Jaap de Jong <jaap.dejong@nedap.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][morty][PATCH] uftp: Add recipe
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
X-List-Received-Date: Thu, 06 Apr 2017 07:25:04 -0000
Content-Type: text/plain; charset=UTF-8

And it also fails to build in master:
http://errors.yoctoproject.org/Errors/Details/139079/

On Wed, Apr 5, 2017 at 8:36 PM, Martin Jansa <martin.jansa@gmail.com> wrote:

> On Mon, Apr 03, 2017 at 12:54:49PM +0200, Jaap de Jong wrote:
> >
>
> I don't see this recipe in master branch...
>
>
> > From cba20c0df65dcdd711009c5587142d2606deb1a9 Mon Sep 17 00:00:00 2001
> > From: Jaap de Jong <jaap.dejong@nedap.com>
> > Date: Mon, 3 Apr 2017 12:47:17 +0200
> > Subject: [meta-networking][morty][PATCH] uftp: Add recipe
> > To: openembedded-devel@lists.openembedded.org
> >
> > ---
> >  meta-networking/recipes-support/uftp/uftp_4.9.3.bb | 15 +++++++++++++++
> >  1 file changed, 15 insertions(+)
> >  create mode 100644 meta-networking/recipes-support/uftp/uftp_4.9.3.bb
> >
> > diff --git a/meta-networking/recipes-support/uftp/uftp_4.9.3.bb
> b/meta-networking/recipes-support/uftp/uftp_4.9.3.bb
> > new file mode 100644
> > index 0000000..a6eeceb
> > --- /dev/null
> > +++ b/meta-networking/recipes-support/uftp/uftp_4.9.3.bb
> > @@ -0,0 +1,15 @@
> > +DESCRIPTION = "Encrypted UDP based FTP with multicast"
> > +HOMEPAGE = "https://sourceforge.net/projects/uftp-multicast"
> > +SECTION = "libs/network"
> > +
> > +LICENSE = "GPLv3"
> > +LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=
> d32239bcb673463ab874e80d47fae504"
> > +
> > +SRC_URI = "${SOURCEFORGE_MIRROR}/uftp-multicast/source-tar/uftp-${
> PV}.tar.gz"
> > +
> > +SRC_URI[md5sum] = "231d6ba7820d89a712fe7d727ab0f8e6"
> > +SRC_URI[sha256sum] = "9e9215af0315257c6cc4f40fbc6161
> 057e861be1fff10a38a5564f699e99c78f"
> > +
> > +do_install () {
> > +     oe_runmake install DESTDIR=${D}
> > +}
> > --
> > 2.7.4
> >
>
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>

