Received: from mail-fx0-f42.google.com ([209.85.161.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1PUwYB-0003qL-LV
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Dec 2010 08:22:23 +0100
Received: by fxm11 with SMTP id 11so3506702fxm.29
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Dec 2010 23:22:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=dRrLZKjYA/rbvM8Idl95Jf6g2VybvGDZc6rviMo9KjQ=;
	b=DBpAOgovSylFy09BwZaGeLgLK6LERYxBap+1t3IJTDCt+VHlhBdIH/204ETlvL6niF
	GzGxI/tks9ftXTE/kdxsiwF5ltZ6geTQjTte/cCGti1a3oFJ433+mfUVKYbD6d6hWKIE
	0SciMxfJ4J6tgVqwWj1JSkvyJwZKGF0iaG3dY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=iBUtQy7/ubXltN0i+IseqfH/1Xh+hE5pDGRwXocIhBEMZ3PTmVB4tP0cZe8FHZ4UrY
	56C8eXmHlH3Oap/h3H6g/z5PAW/DP4IhvklzwtkAGyE+Bq2CSnavvYrJtIHrm9ntPnwg
	X3msYG3B6/TZAqHIwJJvwI0659oZ0ul+FhjLk=
Received: by 10.223.113.65 with SMTP id z1mr2588071fap.18.1292916136631;
	Mon, 20 Dec 2010 23:22:16 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id a6sm842183fak.3.2010.12.20.23.22.14
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 20 Dec 2010 23:22:15 -0800 (PST)
Date: Tue, 21 Dec 2010 08:21:58 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101221072158.GF3282@jama>
References: <1292507333-20222-1-git-send-email-Martin.Jansa@gmail.com>
	<20101221063638.GA23041@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20101221063638.GA23041@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [RFC] xorg: upgrade to X11R7.6 and remove preferred-xorg-versions*.inc files
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
X-List-Received-Date: Tue, 21 Dec 2010 07:22:23 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Dec 20, 2010 at 10:36:38PM -0800, Khem Raj wrote:
> On (16/12/10 14:48), Martin Jansa wrote:
> > * X11R7.6-RC1 was already released
> >   http://www.x.org/releases/X11R7.6-RC1/doc/xorg-docs/ReleaseNotes.html
> >   so it's IMHO time to start migration there
> > * preferred-xorg-versions-live.inc was tracking latest stable released
> >   tarballs, but only reason I was maintaining it was to overwrite older
> >   preferred-xorg-versions-X11R7.5.inc if your distribution included ie
> >   X11R7.5.inc and you wanted live.inc from local.conf
> > * default recipe versions without any preferred-xorg-versions include
> >   are now the same as live.inc
> > * we will get better test coverage if we use same versions
> > * if someone really needs older release then pinning only core stuff
> >   like xserver/libx11 will be probably better, than pinning every xorg
> >   app/proto/font etc.
> > * I can slow down adding newest xorg stuff or ie keep it everytime for
> >   at least a week on ML for another review and test on more targets
> >   (I'm testing it only on om-gta02/spitz/nokia900)
> > 
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> 
> FWIW my uclibc builds of x11-image built for qemumips, qemuarm, qemux86 and
> qemuppc. Seems good to me.

Thanks a lot for testing Khem!

For this one I'll wait a lot longer and for few more ACKs, would be
great if maintainer for every changed distro.conf sends his ack too.

Regards,
-- 
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


