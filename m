Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philippedeswert@gmail.com>) id 1QkFVE-0008Nz-TS
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 Jul 2011 15:10:53 +0200
Received: by qwh5 with SMTP id 5so1213514qwh.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 22 Jul 2011 06:06:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=JmReigWpFM4cxfYAQ4f0H0ZOc0zkFbXUWclqtXU3WLY=;
	b=yD4mUQr/OPRB2bB/kHd22XRXTrzWfftGdxSTlHf7qoJbl73szjE/WbJHPT/iBHQy/u
	BF6SodzP+G+vRooKZpGqFm6yhx0vwr4G+B5W5fhRyMjwq4PykZ5rpmG1zjSUQTPK8HFg
	ToF9oBZNM058Jm4fEckKkOWpV9nm2fffGV6IM=
MIME-Version: 1.0
Received: by 10.229.229.68 with SMTP id jh4mr1207272qcb.146.1311340003819;
	Fri, 22 Jul 2011 06:06:43 -0700 (PDT)
Received: by 10.229.190.82 with HTTP; Fri, 22 Jul 2011 06:06:43 -0700 (PDT)
In-Reply-To: <20110722123449.GC3767@jama.jama.net>
References: <1311287464-13001-1-git-send-email-philippedeswert@gmail.com>
	<1311288853.7847.6.camel@mattotaupa>
	<CAPsFW+QbVj089SmBAWtMU3xX2yPxghQmpsF=qAUZhpcnVLvKdA@mail.gmail.com>
	<20110722123449.GC3767@jama.jama.net>
Date: Fri, 22 Jul 2011 16:06:43 +0300
Message-ID: <CAPsFW+R4MH_dSPX5sit65u7j7=+pwp5R4dNT9=QQPUcy=-PG5Q@mail.gmail.com>
From: Philippe De Swert <philippedeswert@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] gpe-mini-browser2_svn : remove fixes SRCREV
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
X-List-Received-Date: Fri, 22 Jul 2011 13:10:53 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,

Thanks for clarifying Martin.

On 22/07/2011, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Fri, Jul 22, 2011 at 03:18:37PM +0300, Philippe De Swert wrote:
>> I already wondered who added one (as I originally added the svn
>> recipe). Anyway I thought the whole idea of _svn etc were to have
>> bleeding edge builds. If we wanted stable there would be a versioned
>> recipe.
>
> If you want it bleeding then you or your distribution will set
>
> SRCREV_pn-gpe-mini-browser2 = "${AUTOREV}"
>
> in local.conf or some distro .inc file
> like there is
> conf/distro/include/shr-autorev.inc
> conf/distro/include/fso-autorev.inc
> etc.
>
> but for rest of world is better to say which SRCREV was tested and
> should work for everybody.

Ok so things have changed since I made the recipe. Still catching up
on all the new things in OE.

I'll make a new patch with a fixed up SRCREV then. Discard this one.

Cheers,

Philippe


