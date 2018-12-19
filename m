Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 3DF056C226
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Dec 2018 15:59:54 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id q18so20039857wrx.9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Dec 2018 07:59:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=5y4O9Wq9tbssVKgwwhvwdGmGk/VMMmTWwuki+A5CxC8=;
	b=AObzBuhrZysnYRz998Gx9GhGTEG4eZuKKBHtJQMtxL+b++ZstROBQ62Gco/dK6AwVd
	5s+aj3+je2rGX8Qgvxlyu+r4Px6K46qiyDnzDzoM+RoWChj6smkWMoW8jWJ10mUTQacT
	uuaj6hKHCLBp09KgoyLHXVJAO85N+KqiIxiN1AZ8VAReO7eKoi66OKeQ5amQAfM6Sj9d
	qO8RMslHmEwopJjvwSd7u4wYkxqNHcNP9TZwvKc2nhp+2WjcgSDMQiwb59z/xX46+bF2
	nTqqKkZKsFNYNOtneOHYOBGFnATXIMa3Nm/KARzDmfFfqkk8aY+wpcRGmsO0xO3jZbtD
	8rVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=5y4O9Wq9tbssVKgwwhvwdGmGk/VMMmTWwuki+A5CxC8=;
	b=B1oQggT+TmPPLYaqeGw9PK7ygb1zSYXNuMBuZUYcrHtL+dHpBpta18kXV5TzDv5tja
	JylOfyQ6Dko6r1bnrobaUI2BUrxZJBdFaWVXs0s+W31gVI8HMRpU2FXHn9y9uM5pDRhA
	M4mc+Ig2mBbWemMGSqOfI9468hg0cUpQNWpw0RXMHdXw7sm/WSs5R8cA9ZB6tW0IN4L7
	6Yl+mgEdH4N2FqHuhscmAm8laMwqRV6rk3UoQqjoGMZt5QaRykYo1cfjO3OBHRnGUNyw
	WhP4fjsQIyaYD6C1XGnzfOBgA9099KV9pSCjOoSlB65lxUhv1KLZAz/Kp4gURbK3DUrL
	y80w==
X-Gm-Message-State: AA+aEWbBWmo1vn+Yb763FlH3Lgz8Aiz+mx8AutwYD7uVMklIF+RJY2PV
	Q/C2vsx/2UiHd8bARul9pHoVl1m6ZlrJdqnlPe8=
X-Google-Smtp-Source: AFSGD/VKY/nMdK65XmSQdlDVS2NQdOzeptX1SiHL63r9r1q7Fn0NuBngayVNWR+bQbFiXP4R86oH721w8O9o3lgDoZg=
X-Received: by 2002:adf:93e2:: with SMTP id 89mr19986624wrp.129.1545235194877; 
	Wed, 19 Dec 2018 07:59:54 -0800 (PST)
MIME-Version: 1.0
References: <20181219144155.31236-1-Martin.Jansa@gmail.com>
	<7ecb1c69-dfc4-1e08-391f-78c48bd43bea@gmail.com>
In-Reply-To: <7ecb1c69-dfc4-1e08-391f-78c48bd43bea@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 19 Dec 2018 16:59:48 +0100
Message-ID: <CA+chaQeL4kwrOZHp1LN6=8RThxZSBtF-2cuBq3gUBXbXR+yMJA@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [sumo][meta-oe][PATCH 1/6] geoip: upgrade 1.6.11 -> 1.6.12
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
X-List-Received-Date: Wed, 19 Dec 2018 15:59:54 -0000
Content-Type: text/plain; charset="UTF-8"

The v1.6.11 version fails to fetch the db, that's the only reason why I've
included this upgrade for the follow-up commits to apply cleanly.

The included changes look like bug fixes only:
https://github.com/maxmind/geoip-api-c/compare/v1.6.11...v1.6.12

Changelog lists only one change:

1.6.12 2018-01-17

* Populate metro and area code when performing lookups in IPv6 City
databases.
  Previously this was only done when using IPv4 City databases.

The commit does apply cleanly, you can add my signoff, but I'm not sure if
it would be necessary.

On Wed, Dec 19, 2018 at 4:44 PM akuster808 <akuster808@gmail.com> wrote:

>
>
> On 12/19/18 6:41 AM, Martin Jansa wrote:
> > From: Changqing Li <changqing.li@windriver.com>
> >
> > Signed-off-by: Changqing Li <changqing.li@windriver.com>
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Do you want me to add your signoff?
>
> is this a bugfix only update?
>
> - armin
> > ---
> >  .../recipes-support/geoip/{geoip_1.6.11.bb => geoip_1.6.12.bb}  | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >  rename meta-networking/recipes-support/geoip/{geoip_1.6.11.bb =>
> geoip_1.6.12.bb} (98%)
> >
> > diff --git a/meta-networking/recipes-support/geoip/geoip_1.6.11.bb
> b/meta-networking/recipes-support/geoip/geoip_1.6.12.bb
> > similarity index 98%
> > rename from meta-networking/recipes-support/geoip/geoip_1.6.11.bb
> > rename to meta-networking/recipes-support/geoip/geoip_1.6.12.bb
> > index 3527d0cba7..4e717e4b95 100644
> > --- a/meta-networking/recipes-support/geoip/geoip_1.6.11.bb
> > +++ b/meta-networking/recipes-support/geoip/geoip_1.6.12.bb
> > @@ -15,7 +15,7 @@ SRC_URI = "git://github.com/maxmind/geoip-api-c.git \
> >
> http://geolite.maxmind.com/download/geoip/database/GeoLiteCityv6-beta/GeoLiteCityv6.dat.gz;apply=no;name=GeoLiteCityv6-dat
> \
> >             file://run-ptest \
> >  "
> > -SRCREV = "3169a8a88808c8df862e0b0355f99c738cce9f7e"
> > +SRCREV = "4b526e7331ca1d692b74a0509ddcc725622ed31a"
> >
> >  SRC_URI[GeoIP-dat.md5sum] = "37c84ead332dda0362a5ac7b049b72d4"
> >  SRC_URI[GeoIP-dat.sha256sum] =
> "79ff1099e96c2dc1c2539c9a18aaa13a9afd085cae477df60d95f1644d42bc07"
>
>

