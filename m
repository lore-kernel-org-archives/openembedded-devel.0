Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1OTvC1-0000jm-6t
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 Jun 2010 13:11:01 +0200
Received: by fxm12 with SMTP id 12so340197fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Jun 2010 04:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=WXVOkmT9cAHTJQOHdtmNyjc30gwtHsz7q150Bey97dQ=;
	b=UfzDDarpUQcJr581b3xca2NifUoXw3sJS/2xYChwGQdEn446P1F9Hr2qFqWIuA1dEo
	pIMyENLyN9EubcHSCS1BWWH4v/YalF0/OVz7wlQjxbgMLen/gkLDC8q+ivVq8AEpdigf
	tYRYSRpZowZEtXjDaJVgNWoJABeLp4sg3swuY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=Y+S4ns6046TLi1LCAYBlNHiFobbD+ePeYflzG2cbs9QshjnQ5M3Ty1i6uah/6ltpV9
	cE3VqDcXbl0fTt/wqygTbHNNtOQyB6PfSS2wdayuH64Hvg6EXt6HQB+Ss8zIHZAOt5cd
	v+85pLh1jtDjObvgNCstnpgvYHxXNsyty+aLM=
MIME-Version: 1.0
Received: by 10.87.40.32 with SMTP id s32mr12201524fgj.21.1277895977650; Wed, 
	30 Jun 2010 04:06:17 -0700 (PDT)
Received: by 10.223.106.138 with HTTP; Wed, 30 Jun 2010 04:06:17 -0700 (PDT)
In-Reply-To: <1277552779-12490-1-git-send-email-Martin.Jansa@gmail.com>
References: <1277552779-12490-1-git-send-email-Martin.Jansa@gmail.com>
Date: Wed, 30 Jun 2010 13:06:17 +0200
Message-ID: <AANLkTikPwgZUakbZFu0Rlmqr-_0NZ5jXwa-R3BTaeOVB@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] preferred-xorg-versions: remove include files for old releases
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
X-List-Received-Date: Wed, 30 Jun 2010 11:11:01 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 26, 2010 at 1:46 PM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> * git grep shows that all distributions (in OE tree) moved to
> =A0preferred-xorg-versions-X11R7.5.inc already
> * would be nice to encourage everybody to use most tested X11R7.5 or
> =A0no preferred-xorg-versions at all (we can keep latest versions working
> =A0and use D_P -1 for stuff which needs more testing first)
> * replace preferred-xorg-versions.inc with link always adjusted to
> =A0latest relase (is there any problem with symlink in OE tree?)
> * this would also make easier to remove really old versions when it's
> =A0hard to test some changes (like converting libx11 staging)
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
> =A0.../include/preferred-xorg-versions-X11R7.0.inc =A0 =A0| =A0342 ------=
--------------
> =A0.../include/preferred-xorg-versions-X11R7.1.inc =A0 =A0| =A0186 ------=
-----
> =A0.../include/preferred-xorg-versions-X11R7.2.inc =A0 =A0| =A0271 ------=
----------
> =A0.../include/preferred-xorg-versions-X11R7.3.inc =A0 =A0| =A0282 ------=
----------
> =A0.../preferred-xorg-versions-X11R7.4-updates.inc =A0 =A0| =A0 =A07 -
> =A0.../include/preferred-xorg-versions-X11R7.4.inc =A0 =A0| =A0257 ------=
---------
> =A0conf/distro/include/preferred-xorg-versions.inc =A0 =A0| =A0112 +-----=
--
> =A07 files changed, 1 insertions(+), 1456 deletions(-)
> =A0delete mode 100644 conf/distro/include/preferred-xorg-versions-X11R7.0=
.inc
> =A0delete mode 100644 conf/distro/include/preferred-xorg-versions-X11R7.1=
.inc
> =A0delete mode 100644 conf/distro/include/preferred-xorg-versions-X11R7.2=
.inc
> =A0delete mode 100644 conf/distro/include/preferred-xorg-versions-X11R7.3=
.inc
> =A0delete mode 100644 conf/distro/include/preferred-xorg-versions-X11R7.4=
-updates.inc
> =A0delete mode 100644 conf/distro/include/preferred-xorg-versions-X11R7.4=
.inc
> =A0mode change 100644 =3D> 120000 conf/distro/include/preferred-xorg-vers=
ions.inc

ping

Silence means that nobody cares about those, right? :)

Regards,


