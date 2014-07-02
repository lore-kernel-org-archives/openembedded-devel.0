Return-Path: <ka6sox@gmail.com>
Received: from mail-ob0-f170.google.com (mail-ob0-f170.google.com
	[209.85.214.170])
	by mail.openembedded.org (Postfix) with ESMTP id 3F31B6ACEA;
	Wed,  2 Jul 2014 07:03:53 +0000 (UTC)
Received: by mail-ob0-f170.google.com with SMTP id uz6so11877456obc.1
	for <multiple recipients>; Wed, 02 Jul 2014 00:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=5O40vUDs7E+2J2pTeGvGUSjXIUzGSgnYbP6FZMhn/0w=;
	b=Ec/4un4DjHpi1C71fnod162mTd3he+YoTP/qgH1Cd9wdUYT/Cj8h17oGcBhgPqruLD
	n7hgHS09uBDTndmbLScGWUya5dLfJppTFgckAQbpq18UIdR+yZHoTVU4pyZ61vj9LS3r
	/gB6G2eUUCE6BWBxPpHfxTWGl9dl5/HS8mcesRLSkWcdlW5QOjF/AuFcS/ZY1/OBM8jx
	LrR1AkUfHr1qyO+BHARYIKaZ0sjqTojpUh+owTcIa4744oJCH/MH1ovmT1ATtKV7Z8hi
	K9fitUt9oR3s4Gpnmm+wzRNKEafS/6v1NA9lvxyBbiP+0UUrR6KO3EGS3mww+CyMlH8Q
	/h5A==
MIME-Version: 1.0
X-Received: by 10.60.16.72 with SMTP id e8mr48538597oed.11.1404284634402; Wed,
	02 Jul 2014 00:03:54 -0700 (PDT)
Received: by 10.76.128.201 with HTTP; Wed, 2 Jul 2014 00:03:54 -0700 (PDT)
In-Reply-To: <20140701105815.GF2437@jama>
References: <20140619113451.GO2117@jama> <20140624101443.GO2437@jama>
	<CAHQecY6eQfhY4hY_EEUmXd5MEA2_fDb5yfj7YP0i1gg=dKFQ7Q@mail.gmail.com>
	<20140701105815.GF2437@jama>
Date: Wed, 2 Jul 2014 00:03:54 -0700
Message-ID: <CAHQecY4dLUKL_48e5_CEiwsxS_HR_+0Wy85pyNMcMdwtT6TAUw@mail.gmail.com>
From: Tom King <ka6sox@gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Few archives to add on sources.oe.org
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
X-List-Received-Date: Wed, 02 Jul 2014 07:03:58 -0000
Content-Type: text/plain; charset=UTF-8

Done


On Tue, Jul 1, 2014 at 3:58 AM, Martin Jansa <martin.jansa@gmail.com> wrote:

> On Tue, Jun 24, 2014 at 07:36:59AM -0700, Tom King wrote:
> > done
>
> Thanks,
>
> I've found another one in daisy:
>
> barnyard2-1.8.tar.gz
>
> I've verified that
> wget http://ftp.psu.ac.th/pub/snort/barnyard2-1.8.tar.gz
> provides correct checksum or you can fetch it from aruba
> (/home/jenkins/oe/world/downloads-missing).
>
> SRC_URI[md5sum] = "72fc6c490db6ea6a0f46c27d24998067"
> SRC_URI[sha256sum] =
> "1abfe6530d721debd98921421722b02c844c289564730b1e85729e4915b2bb7a"
>
> > On Tue, Jun 24, 2014 at 3:14 AM, Martin Jansa <martin.jansa@gmail.com>
> > wrote:
> >
> > > On Thu, Jun 19, 2014 at 01:34:51PM +0200, Martin Jansa wrote:
> > > > Hi Tom,
> > > >
> > > > can you please add:
> > > > IO-Tty-1.10.tar.gz
> > > > SQLAlchemy-0.7.9.tar.gz
> > > > fetchmail-6.3.26.tar.xz
> > > > usb-modeswitch-2.0.1.tar.bz2
> > > > usb-modeswitch-data-20130807.tar.bz2
> > > >
> > > > to sources.oe.org? I can send you tarballs (or fetch them from
> > > > /home/jenkins/oe/shr-core-branches/downloads-missing/ on aruba)
> > > >
> > > > The most annoying is fetchmail which is now fetching HTML page from
> > > > berlios (so checksum check fails instead of showing 404) :/. And user
> > > > needs to download it manually or use sources.oe.org as PREMIRROR,
> but
> > > > still better than nothing.
> > >
> > > I've found only one more missing in upstream sites and used from dora
> > > branch
> > >
> > > daq-2.0.1.tar.gz
> > >
> > > I've verified that
> > > http://download.lunar-linux.org/lunar/mirrors/daq-2.0.1.tar.gz
> > > provides correct checksum or you can fetch it from aruba as before.
> > >
> > > SRC_URI[md5sum] = "044aa3663d44580d005293eeb8ccf175"
> > > SRC_URI[sha256sum] =
> > > "ebba87c2ec76ac65d2980934423b0597909caead3a86ce5d1ba1ea6ce518ec6d"
> > >
> > > Thanks
> > >
> > > --
> > > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> > >
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>

