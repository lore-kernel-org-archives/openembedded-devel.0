Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sylvain.pare@gmail.com>) id 1QuX4n-0001rB-Pb
	for openembedded-devel@lists.openembedded.org;
	Fri, 19 Aug 2011 23:58:06 +0200
Received: by qwh5 with SMTP id 5so2330189qwh.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Aug 2011 14:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=W7PrTQExUuJbw2MXeExGrtoorDaCgZm/JJSC0/1bGJg=;
	b=sqv7MHhbn2PjEIWd2+JOdmAap4OvalFH6d1TQQU8N/UNpCxv2dxsr5ZpUGsURB/0Xh
	44d4ZtV/obWiazHY5viXVpMTbPa868NhNMZl/rgoLtrHTf8F5HNzRyxczOopHOva2J66
	pa0JBg1+cnqQlcZDq7p4AJAv3Zz19ayssvOFc=
Received: by 10.224.200.3 with SMTP id eu3mr240464qab.279.1313790804112; Fri,
	19 Aug 2011 14:53:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.229.239.76 with HTTP; Fri, 19 Aug 2011 14:53:04 -0700 (PDT)
In-Reply-To: <20110819214607.GC22251@jama.jama.net>
References: <1313774135-24525-1-git-send-email-sylvain.pare@gmail.com>
	<20110819214607.GC22251@jama.jama.net>
From: =?ISO-8859-1?Q?Sylvain_Par=E9?= <sylvain.pare@gmail.com>
Date: Fri, 19 Aug 2011 23:53:04 +0200
Message-ID: <CACrTVgJe46oh4fzogvR3XS+OVobZ=VgcU3kJVAXkPemvKskq9g@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH] shr : initscripts-shr, changed mountdevsubfs.sh init level from 04 to 05 S to fix issue for machines using udev
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
X-List-Received-Date: Fri, 19 Aug 2011 21:58:06 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

thx!


2011/8/19 Martin Jansa <martin.jansa@gmail.com>

> On Fri, Aug 19, 2011 at 07:15:35PM +0200, Sylvain 'GarthPS' Par=E9 wrote:
> >  * since this commit
> http://git.openembedded.org/cgit.cgi/openembedded/commit/?id=3D974dfb8777=
8a26b80983b44c94922d0acb257e33machines using udev and mountdevsubfs.sh had =
issue of pts not mounted
> >  because both were at init level S04 despite mountdevsubfs.sh was
> depending on udev..
>
> Thanks, applied and PR bumped after that (normally I can do it in the
> same patch but beer level makes me slower to bump PR then type git push)
>
> Regards,
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>

