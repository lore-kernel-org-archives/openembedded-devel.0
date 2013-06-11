Return-Path: <kergoth@gmail.com>
Received: from mail-la0-f48.google.com (mail-la0-f48.google.com
	[209.85.215.48])
	by mail.openembedded.org (Postfix) with ESMTP id 55B546AA19
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jun 2013 15:37:04 +0000 (UTC)
Received: by mail-la0-f48.google.com with SMTP id lx15so5892103lab.21
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jun 2013 08:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	bh=papden5lShPgE5cL2wF5URVE4On4gpl8Ci0E6v4QPIQ=;
	b=HaQ6BHqv7ipGqFMAibSAnl0pRmxsH47WIOgcGb7joFzXNWd+39PJ/+lwEz1AfLdXAX
	MhFPxeAQt5layDtZDxtW8j4yDVsToxNMNUwr/Pg+9aS0Q08ioCU+sRR8JzisHmWYFrEx
	8LSwz0fpHqVpqabk95G/KNbMMig1s+hfgPmtmQirLQBtXI0tkiEq3Z1nrkTEb2tu3Rtt
	7ENXZ00ibfHPzsSY1R/GBu/x2mkE3/UDB7MwxYdXSmnG81UW7GvcggFZTWTzR+s7kG5G
	CAqeXhGkHeRGdTD2nNZ9jTYD1Zp9NEp4Pb12WKv+s/kz8WDSi/QUbiW8BPKcA0W/9y+V
	Jqdw==
X-Received: by 10.152.20.66 with SMTP id l2mr5673241lae.30.1370965024423; Tue,
	11 Jun 2013 08:37:04 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.112.4.66 with HTTP; Tue, 11 Jun 2013 08:36:44 -0700 (PDT)
In-Reply-To: <20130611153339.GF3233@jama>
References: <1370647783-7693-1-git-send-email-kergoth@gmail.com>
	<20130611153339.GF3233@jama>
From: Christopher Larson <chris_larson@mentor.com>
Date: Tue, 11 Jun 2013 08:36:44 -0700
X-Google-Sender-Auth: VdVjv7RomOefBAw0Kw_6_UNNwGU
Message-ID: <CABcZANkC+Ku83hdGkzjHXfAt2jzB-0tuNfBc6WPQJ71cW5CvMA@mail.gmail.com>
To: Openembedded Discussion <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-gnome][PATCH] gnome-disk-utility: use PACKAGECONFIG for nautilus extension
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
X-List-Received-Date: Tue, 11 Jun 2013 15:37:04 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Jun 11, 2013 at 8:33 AM, Martin Jansa <martin.jansa@gmail.com>wrote:

> On Fri, Jun 07, 2013 at 04:29:43PM -0700, Christopher Larson wrote:
> > From: Christopher Larson <chris_larson@mentor.com>
> >
> > Signed-off-by: Christopher Larson <chris_larson@mentor.com>
> > ---
> >  .../recipes-gnome/gnome-disk-utility/gnome-disk-utility_2.32.0.bb    |
> 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta-gnome/recipes-gnome/gnome-disk-utility/
> gnome-disk-utility_2.32.0.bbb/meta-gnome/recipes-gnome/gnome-disk-utility/
> gnome-disk-utility_2.32.0.bb
> > index a0fd9bd..1bdae34 100644
> > --- a/meta-gnome/recipes-gnome/gnome-disk-utility/
> gnome-disk-utility_2.32.0.bb
> > +++ b/meta-gnome/recipes-gnome/gnome-disk-utility/
> gnome-disk-utility_2.32.0.bb
> > @@ -3,7 +3,7 @@ DESCRIPTION = "GNOME disk utility"
> >  LICENSE = "GPLv2+"
> >  LIC_FILES_CHKSUM = "file://COPYING;md5=e9115d11797a5e6b746b4e9b90194564"
> >
> > -DEPENDS = "glib-2.0 gtk+ libnotify libunique udisks avahi-ui
> virtual/libx11 libatasmart nautilus"
> > +DEPENDS = "glib-2.0 gtk+ libnotify libunique udisks avahi-ui
> virtual/libx11 libatasmart"
> >
> >  PR = "r3"
>
> Was this patch created from dylan branch?
> patching file
> meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_2.32.0.bb
> Hunk #1 succeeded at 3 with fuzz 2.
> Hunk #2 succeeded at 20 (offset 1 line).
>
> PR is r4 since:
> commit 4791fb851eb96d5785616b1793d4e6367aa52ad9
> Author: Andreas M<C3><BC>ller <schnitzeltony@googlemail.com>
> Date:   Fri May 3 12:31:05 2013 +0000
>
>     gnome-disk-utility: backport property DeviceAutomountHint
>
> but resolved and now in queue for jenkins


Hmm, I didn't think so, but perhaps my juggling of 4+ topic branches failed
somewhere :)

