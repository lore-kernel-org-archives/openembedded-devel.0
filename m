Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1RFZmb-0007Br-Um
	for openembedded-devel@lists.openembedded.org;
	Mon, 17 Oct 2011 01:06:18 +0200
Received: by ggnq1 with SMTP id q1so2362976ggn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 16 Oct 2011 16:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=QIIGuu+2yvTzu10Fq2enw8ufTK4xfdTYbNro1+MvqZQ=;
	b=ZkMqYDkQPP/O42kwxiYeUObr2oCT3NPxy4CqVE6QUsR/mZ8kHN64jolmAjI3nbYn6m
	9/bSRZ8c8K1/OscxO4dJMdRt8u569sbZKcLmb9kn//dkBeWk5CmObyrRGicign0ovGZi
	CajQyWIYcvRyMa37thAcgUxAgS7SYfCjT0MK8=
MIME-Version: 1.0
Received: by 10.236.76.38 with SMTP id a26mr23335445yhe.53.1318806029826; Sun,
	16 Oct 2011 16:00:29 -0700 (PDT)
Received: by 10.147.124.18 with HTTP; Sun, 16 Oct 2011 16:00:29 -0700 (PDT)
In-Reply-To: <CAAQYJAt+o+Wcp1aSa5pxSd_FAHYVJv-ZYLfKLYUt6n+tdkjjQw@mail.gmail.com>
References: <CAAQYJAt+o+Wcp1aSa5pxSd_FAHYVJv-ZYLfKLYUt6n+tdkjjQw@mail.gmail.com>
Date: Mon, 17 Oct 2011 01:00:29 +0200
Message-ID: <CAAQYJAvZy8Xw0Wnd9_4m82fgrF1kLxHyrxK_DpVjoVa22gMjag@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: xserver-common and x11-common conflicting
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
X-List-Received-Date: Sun, 16 Oct 2011 23:06:18 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Oct 17, 2011 at 12:42 AM, Andrea Adami <andrea.adami@gmail.com>wrote:

> Hello,
>
> using oe-core and meta-oe my xserver settings are "touched" by two
> packages:
>
> xserver-common: seems more complete, provides some xmodmaps (should be in
> BSP layers). Though it invocates fbset which is not in path.
> x11-common: needs maybe care but is using the formfactor settings from BSP
> so obviously is more modular
>
> I suppose once the merge is finished we'll have sane default settings.
> (atm the xserver-common is providing some extra cruft)
>
> Keep on the great unification work!
>
> Regards
>
> Andrea
>
> PS, I've noticed many modules are missing and have to be installed (extmod,
> dve, dri, ...)
>
>
fwiw the issues is originated by the xserver-nodm-init in meta-oe, which
RDEPENDS_${PN} = "xserver-common (>= 1.30) xinit"

We should aim at having *one* single recipe...

Regards

Andrea

