Return-Path: <gordan.markus@pelagicore.com>
Received: from mail-lf0-f43.google.com (mail-lf0-f43.google.com
	[209.85.215.43])
	by mail.openembedded.org (Postfix) with ESMTP id A956A71A6C
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Dec 2016 10:21:13 +0000 (UTC)
Received: by mail-lf0-f43.google.com with SMTP id t196so192189800lff.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 02 Dec 2016 02:21:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=pelagicore-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:date:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=c6fhvo2fVPsSs5AW1TFLB0zCKZ8wn5LeUMwuGSUGfrM=;
	b=hhZl5HryNud/niWQiWV8JvNeEdtJKsMXJqD8XpPK+wofO2ZcyTHe+Esi0nHW1BmPoB
	78aoQe5oQ3kGOwmsqZ5A8W8ZdCuWhmXYo3efRJGeyzctoQaEJkNNyKY40Fu+l1G/QipY
	EwHaggT2zxZRaWVqAQQ4Mcw548rj1pshym/fVCGD8Yr6hKGKyiIanYNXvg1MtrfsLUaL
	SWAUkIXh1dYV3bLf0t9eexUDSUY+uCguvY4dqryYKpw5anflpbwP07b/9ck//rE5Hw3R
	AJ/xLuRv1p4bx/vM/6N/taXunEMQwepnTkDMIHihBPJwwhqoUeUyJPSh/1dPozZ0kX+P
	CbXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=c6fhvo2fVPsSs5AW1TFLB0zCKZ8wn5LeUMwuGSUGfrM=;
	b=Br+tVXNeRong/04ppyR9O41UCb5yfj5HSP57x+98ZL+2gR8heTKnQETdP/JtR7Bk0I
	fBZEDRJ+sMcijgT9uVomasLlxHTDYpdbZPVa3Zd4V6I7LUT1o/WdKOLlp8HJNhh/yPkF
	4ZmFH4vpjVftPN+XIcSu8RbJRrbp8bZciKgDGEEiVOH3gCP1EyEGHIEUZVmsi7GXjJNl
	/U35XeFQEYozuVWQK60BgNJCiKoJyOoX4cPyJu+b3dZ8qFAXgLCLs/3mKiTpDraBd3RT
	PkeAm3ouMlqs/bntrMArTgjWJ81HTtWyuY+UWS3Do2OR+PO9vAkOF9j1biyds/l+h3Oo
	4Q7A==
X-Gm-Message-State: AKaTC01GwpuV33Sy1X2y316a/u7wQIkSz/cJSmwCn/umNHUnT1KQMLfe8n11Ylq49aHnFBKs
X-Received: by 10.25.24.159 with SMTP id 31mr17721686lfy.101.1480674074920;
	Fri, 02 Dec 2016 02:21:14 -0800 (PST)
Received: from gordanmarkus-XPS13 (static-212-247-53-108.cust.tele2.se.
	[212.247.53.108]) by smtp.googlemail.com with ESMTPSA id
	c2sm678894ljb.8.2016.12.02.02.21.14
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 02 Dec 2016 02:21:14 -0800 (PST)
Message-ID: <1480674073.22967.3.camel@pelagicore.com>
From: Gordan =?UTF-8?Q?Marku=C5=A1?= <gordan.markus@pelagicore.com>
To: Martin Jansa <martin.jansa@gmail.com>, 
	openembedded-devel@lists.openembedded.org
Date: Fri, 02 Dec 2016 11:21:13 +0100
In-Reply-To: <20161202095419.GD3721@jama>
References: <20161202092012.12438-1-gordan.markus@pelagicore.com>
	<20161202095419.GD3721@jama>
X-Mailer: Evolution 3.22.1-0ubuntu2 
Mime-Version: 1.0
Subject: Re: [meta-qt5][PATCH] gdb: Fix QA Warning
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
X-List-Received-Date: Fri, 02 Dec 2016 10:21:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2016-12-02 at 10:54 +0100, Martin Jansa wrote:
> On Fri, Dec 02, 2016 at 10:20:11AM +0100, Gordan Markuš wrote:
> > WARNING: QA Issue: gdb: invalid PACKAGECONFIG: readline [invalid-
> > packageconfig]
> > 
> > Signed-off-by: Gordan Markuš <gordan.markus@pelagicore.com>
> > ---
> >  recipes-devtools/gdb/gdb_%.bbappend | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/recipes-devtools/gdb/gdb_%.bbappend b/recipes-
> > devtools/gdb/gdb_%.bbappend
> > index 3e663e7..41592c4 100644
> > --- a/recipes-devtools/gdb/gdb_%.bbappend
> > +++ b/recipes-devtools/gdb/gdb_%.bbappend
> > @@ -1 +1 @@
> > -PACKAGECONFIG ??= "readline python"
> > +PACKAGECONFIG ??= "python"
> 
> What gdb are you using? The version in oe-core has readline
> PACKAGECONFIG
> 
> meta/recipes-devtools/gdb/gdb-common.inc:PACKAGECONFIG ??= "readline"
> meta/recipes-devtools/gdb/gdb-common.inc:# Use --without-system-
> readline to compile with readline 5.
> meta/recipes-devtools/gdb/gdb-common.inc:PACKAGECONFIG[readline] = "-
> -with-system-readline,--without-system-readline,readline"
> 
We are using the gdb from poky and it's a similar case there. Though, 
the gdb itself doesn't have the readline PACKAGECONFIG. It is enabled
by default in the *.inc files. 

gdb-cross-canadian.inc:PACKAGECONFIG ??= "python readline"
gdb-cross-canadian.inc:PACKAGECONFIG[readline] = "--with-system-
readline,--without-system-readline,nativesdk-readline"
gdb-common.inc:PACKAGECONFIG ??= "readline"
gdb-common.inc:PACKAGECONFIG[readline] = "--with-system-readline,
--without-system-readline,readline"
gdb-cross.inc:PACKAGECONFIG ??= "python readline"
gdb-cross.inc:PACKAGECONFIG[readline] = "--with-system-readline,
--without-system-readline,readline-native"

> > -- 
> > 2.9.3
> > 
> > -- 
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> 
> 

