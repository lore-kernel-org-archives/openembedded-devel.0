Received: from mail-px0-f197.google.com ([209.85.216.197])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1NgKPW-00038G-Os
	for openembedded-devel@lists.openembedded.org;
	Sat, 13 Feb 2010 17:00:01 +0100
Received: by pxi35 with SMTP id 35so1468861pxi.16
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 13 Feb 2010 07:57:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:from:date:x-google-sender-auth:message-id:subject:to
	:content-type; bh=+pgb3V+qU4gV7mc7RVvkCS3TUE+SrsxxbuEUs9HQF74=;
	b=Vvq+7HE0cCpR9ymdUG7dFCEiKFCYzX7FmK9AWZy8eFQHOHdTSRCqGT+KV+hwXK7uO3
	bhcOgX1OVZmDBIT6vsc2RBV3zZUm0o8qPEzw75uKATOdJde3geB6JXB/MVn/CaHLMF9x
	SDVg+FphD9uFUWV5ebwcoP83lfYGoCVP5dX1w=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=xvqtPliWOuwQZOwlNtM/olPjaWfn3EPC4sospfiNkoM6Xzajras9eyVLngt3ws1XI1
	SG3wDoNUK3mbZTvm5157iyp0DxFbuM4dVlWDYffPwS80MysT8L6O3JopPdNLrRoOo3zX
	YSiu+ncS7ydPn+Eu+RdNJzM8z1plCR2yJ5t4w=
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.142.196.10 with SMTP id t10mr1514455wff.98.1266076641634; Sat, 
	13 Feb 2010 07:57:21 -0800 (PST)
In-Reply-To: <ade1bdc1002130752j4e773410s2ace075b90fbb206@mail.gmail.com>
References: <ac9c93b11002130655p454b5931od630b58e995772a1@mail.gmail.com> 
	<ade1bdc1002130717v2573bd35m165c6c887ca408e3@mail.gmail.com> 
	<ac9c93b11002130725h19c5ee93t867da2d889811a9f@mail.gmail.com> 
	<ade1bdc1002130752j4e773410s2ace075b90fbb206@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Sat, 13 Feb 2010 08:57:01 -0700
X-Google-Sender-Auth: ac356532eb3cd13a
Message-ID: <b6ebd0a51002130757p5125ce53h999263dfcd45c66d@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.216.197
X-SA-Exim-Mail-From: kergoth@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: {RFC} rootfs directory path
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
X-List-Received-Date: Sat, 13 Feb 2010 16:00:02 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, Feb 13, 2010 at 8:52 AM, Raffaele Recalcati
<lamiaposta71@gmail.com>wrote:

> Hi Frans,
>
> > That is also where it eventually ends up for me, but the image is
> > constructed in ${TMPDIR}/rootfs/console-image (without the work subdir
> > inbetween as I accidently wrote before).
> > That is where the clash is happening (especially if you keep rootfs,
> > but also if you don't and start parallel builds for different systems)
>
> ${TMPDIR}/rootfs/${DISTRO}-${MACHINE}/console-image
>
> seems to isolate the building of rootfs in order to allow parallel builds.
>
> But isn't a similar problem in the compilation?
>
> For example,
> if you are building two tmp/work/armv5te-angstrom-linux-gnueabi
> systems you'll have a disaster because the same package will be
> re-written by the last build.
>
> But I guess you are building different (different architecture) systems.
>
> My small knowledge is improving a little bit.
>
>
Given that the rootfs dir used in the image creation process is of limited,
if any, use, it makes most sense to just put it under the WORKDIR of the
recipe.

IMAGE_ROOTFS = "${WORKDIR}/rootfs"
-- 
Chris Larson
clarson at kergoth dot com
clarson at mvista dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Software Engineer
MontaVista Software, Inc.

