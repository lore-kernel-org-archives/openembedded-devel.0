Return-Path: <anders@chargestorm.se>
Received: from mail-lb0-f175.google.com (mail-lb0-f175.google.com
	[209.85.217.175])
	by mail.openembedded.org (Postfix) with ESMTP id 357C375C51
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Feb 2016 10:04:53 +0000 (UTC)
Received: by mail-lb0-f175.google.com with SMTP id bc4so78898817lbc.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Feb 2016 02:04:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=chargestorm-se.20150623.gappssmtp.com; s=20150623;
	h=date:from:to:subject:message-id:mail-followup-to:references
	:mime-version:content-type:content-disposition:in-reply-to
	:organization:user-agent;
	bh=iJ9km/P60vhnuUkLicwF4tLiGfXcNuNamSYZcnAbOkA=;
	b=hGv5cRXnbZlDB2q8jIqPceNinFp2mMDtTewmS7XE+RqpUVg2VmXrd1c9ZyVvEHbM1x
	12+NwYU1ZP8uEywBm7Ear3h2+iQZzdkI4O1fSFhKdq6gLNSNOwmXBgJRvq5goVGWxlxC
	UMzXO36kZLA5EDyXJPGbRrVDzqXpi3DCsKY6xim6vXzYFqWsgf+UAroMSurawhYpbq+e
	j4U0HO1sdfSrnKv33aFrFdVVLCpxJM5tRV627R5xH6FNvjPAz1kDM+xLMLNJMRktU42b
	2TY40xx01+0oc6syjTj7epuw/I8Uev1SZI9n9JLzTZzhq2io1M+9MwnnyIq29y43Cu3x
	Ij1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:subject:message-id:mail-followup-to
	:references:mime-version:content-type:content-disposition
	:in-reply-to:organization:user-agent;
	bh=iJ9km/P60vhnuUkLicwF4tLiGfXcNuNamSYZcnAbOkA=;
	b=Too/CgYmMMYMPrSFpmh0PPu7IX/4dwIo+q4l7PsBdzMj+aUQ2xHvMkdz3f0Irr4PWM
	Z1EH3gLS4UgSR1wAZ8A9tRvMHvOqUoBRV9QaTH2beLNwTDXjvkLz+ZDyMTql8MW+CY+J
	LJwlZLk5PZ/OXRzlUiZ45LKROFt8XqW7OJSFIhol7JMK+XuZMH9iTghUvw38cbU09V6e
	A/xuITUobHEC/zC+FkR5VBHriq0E7wuTH82n9ZQQs3VboJXwzfso/awqOlaBCYU4w0yb
	hqDmUri9XfWYtt3b5KBnGVCzIk4CDgRAaY8pOImXBei4jcJ+NLO/ZvLX/b/feptZwn3I
	WHdw==
X-Gm-Message-State: AG10YOTPHaJYc4QK2SVTJ7Nb6LHlZ0wzir0ew5GDHec5+GUwRnXrT92uu0jPNoASuxAYxQ==
X-Received: by 10.112.14.39 with SMTP id m7mr9950155lbc.20.1456135493546;
	Mon, 22 Feb 2016 02:04:53 -0800 (PST)
Received: from ad.chargestorm.se (213-64-219-84-no126.business.telia.com.
	[213.64.219.84])
	by smtp.gmail.com with ESMTPSA id i2sm3111053lfd.43.2016.02.22.02.04.52
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 22 Feb 2016 02:04:52 -0800 (PST)
Date: Mon, 22 Feb 2016 11:04:51 +0100
From: Anders Darander <anders@chargestorm.se>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160222100451.GA5300@ad.chargestorm.se>
Mail-Followup-To: openembedded-devel@lists.openembedded.org
References: <CAAPZna3WT_cz9YpCaE0iueYXCYxNd0ONRCu0=yuHLcrqUdoKaw@mail.gmail.com>
	<6E3439D2-FEE9-4286-88C5-0D7E3E2AF4B2@gmail.com>
	<CAP9ODKpXkzdSki8exzpbge08Uns1M3rQcc2C1UTPGpuA-WUKOQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP9ODKpXkzdSki8exzpbge08Uns1M3rQcc2C1UTPGpuA-WUKOQ@mail.gmail.com>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.24 (2015-08-30)
Subject: Re: [meta-python] Python Flask recipes
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
X-List-Received-Date: Mon, 22 Feb 2016 10:04:54 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

* Otavio Salvador <otavio.salvador@ossystems.com.br> [160219 14:32]:

> On Fri, Feb 19, 2016 at 1:46 AM, Khem Raj <raj.khem@gmail.com> wrote:
> >> On Feb 18, 2016, at 10:33 AM, Fabio Berton <fabio.berton@ossystems.com.br> wrote:
> >> I noticed that a few days ago were added some python-flask recipes.

> >> I've been maintaining a layer with python-flask recipes, hosted here
> >> http://code.ossystems.com.br/gitweb?p=meta-python-flask.git;a=summary

> >> There are recipes in meta-python-flask that were added to meta-python
> >> and I want to simplify maintenance and avoid duplicate recipes.

> >> So, do I send recipes from meta-python-flask to meta-python or we move all
> >> python-flask recipes from meta-python to meta-python-flask, using a layer
> >> only for Flask web framework?

> > Here is a hierarchy one can envision

> > 1. Core python runtime support - Oe-core
> > 2. python extended modules and infrastructure - meta-python

> > now if you think this framework is quite commonly used and is kind of core
> > to python world, its fine to have it in meta-python, if you think its
> > too specific then move the common packages to meta-python
> > and maintain it as a separate layer

> Agreed but this is a specific framework which is not 'core' to python.
> Do you think we ought to merge those on meta-python or keep them split
> out?

I'd lean towards merging them in meta-python.

Currently (according to the layerindex) we have python-flask in:
* meta-virtualization
* meta-uav
* meta-python

and if I understood your other email correct, there's also your
meta-python-flask layer.

I'd think that this makes flask used enough to warrant having it
directly in meta-python.

Cheers,
Anders

-- 
Anders Darander, Senior System Architect
ChargeStorm AB / eStorm AB

