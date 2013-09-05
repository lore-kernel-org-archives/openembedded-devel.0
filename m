Return-Path: <lpapp@archlinux.us>
Received: from mail-pb0-f41.google.com (mail-pb0-f41.google.com
	[209.85.160.41])
	by mail.openembedded.org (Postfix) with ESMTP id 4A68562273
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Sep 2013 17:26:54 +0000 (UTC)
Received: by mail-pb0-f41.google.com with SMTP id rp2so2066312pbb.28
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Sep 2013 10:26:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=6SOZCD1nWpRhH+lcmtQqk5to9Ia0qSqo4QenxyUe08c=;
	b=K6IFikVxdOib6/i2IT9/VPN2c8bmLPanEAmdAzKU9DiDSBj8siJ6cVg5liyYY4JxMa
	SDa0hRaQ/Tl9p8+RVhpdbkFYtrr80+3pntcdHUeFapiIP+ROIDJsJYRz5cIMJ3GYd10b
	4+wSrm+Jj65o7VEJGh6HNqljoZt3MKli8HhNklzG4TH/xTf7fCm2u+bIlHce1kqxAqbu
	/o4aUDbtn85rpVF+CVJIsPQneEU5wrlV8f58xUekjClP7egypRMxEsEaE9Y5z0xIW2Vm
	gQ5yTqJdKPPCmEcM6Y0wwTOcX287wJNb8v/CZwClrWhrM/TRlN1P0mAB0uxWSNRtWq4n
	aKbA==
X-Gm-Message-State: ALoCoQl9GVSuyDnuMP5iyq+fgCD/OKiUIG3R3r1rhkKUvdv/G857Xy6WdbE9Zgjj0i48eqiKMxzW
MIME-Version: 1.0
X-Received: by 10.66.118.204 with SMTP id ko12mr4663436pab.184.1378402016084; 
	Thu, 05 Sep 2013 10:26:56 -0700 (PDT)
Sender: lpapp@archlinux.us
Received: by 10.70.57.234 with HTTP; Thu, 5 Sep 2013 10:26:56 -0700 (PDT)
In-Reply-To: <20130905172239.GB27479@deserted.net>
References: <CAOMwXhNZ+gPnaDF20MaXAQLUkEf_7w19pzt4PCS=JLM7_8=g-w@mail.gmail.com>
	<20130905172239.GB27479@deserted.net>
Date: Thu, 5 Sep 2013 18:26:56 +0100
X-Google-Sender-Auth: 12QcMX0DdEjuLGoxI7XkcxXYTME
Message-ID: <CAOMwXhPPvkT-V+rKCmsCOo8KJCZWTpK53OO4VdR8vjzMFoYd5g@mail.gmail.com>
From: Laszlo Papp <lpapp@kde.org>
To: Joe MacDonald <joe@deserted.net>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Dropped libnl fix for net-snmp: Why?
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
X-List-Received-Date: Thu, 05 Sep 2013 17:26:55 -0000
Content-Type: text/plain; charset=ISO-8859-1

OK, thanks. I am just trying to make sure not to break anything for libnl
3.x.

Here is the old upstream report:
https://sourceforge.net/p/net-snmp/bugs/2238/


On Thu, Sep 5, 2013 at 6:22 PM, Joe MacDonald <joe@deserted.net> wrote:

> [Dropped libnl fix for net-snmp: Why?] On 13.09.05 (Thu 16:43) Laszlo Papp
> wrote:
>
> > Hi Joe and co,
> >
> > what exactly is the reason for this patch having been dropped?
> >
> > http://patches.openembedded.org/patch/20563/
> >
> > This was not so thoughtful decision. The current net-snmp version will
> not
> > build against denzil, and in fact, this patch should be even upstreamed.
> I will
> > take care about that one, but is there any objection against me
> submitting this
> > change for net-snmp in meta-networking?
>
> Nope, no objection from me.  It appears to be reasonable.  I think the
> only reason it doesn't appear in meta-net today is it was sent against
> OE Classic and perhaps never sent for inclusion in meta-openembedded.
> That's just a wild guess, though, it looks like the whole thing
> may pre-date my involvement with the project.
>
> --
> -Joe MacDonald.
> :wq
>

