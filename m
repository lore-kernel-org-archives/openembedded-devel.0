Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id 223226BCA9
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  3 Dec 2018 21:28:17 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id v11so15636471qtc.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Dec 2018 13:28:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=74tV9RucKmdAaohtauY2m/J0BRC3FiNVa50cDHuiTS8=;
	b=oz8iIa3G8QMCg1IQWUQHBM/hKvYnQlgiD4pCHl+qoaNLMsrDLG38cURayYB9RTAYEW
	g8GeVK03gH2ohd2BSG6OnfE1YivGzCew7Y/gURmcnQmPh7LMnVqIlbX177adfZq9enuA
	bZJIgs4f1ixKP8Blzvrc/Sas6pl4F9EiPTpz6xK/0FPFBZTkXgqqxx8xpPBmGsTFbI9A
	6MBfwUzTArC3LPetZQd+RLg+xzHkM+rHAzzdqZ2wLUAx1L/PvV+zU2aDTzwI3kQu3fuN
	8Lt5MRsrCsjbHYHr7hNj5bRk5C7HV137tmEVXf8dT/yXbReUybaS6quLMIVMkbp7EYef
	omoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=74tV9RucKmdAaohtauY2m/J0BRC3FiNVa50cDHuiTS8=;
	b=A431hzqYAuamyfZY/lqdRr8nRfNodafDYxb3BwzRry4+cO+Q/wk9pvK8VDkHPspTMK
	r97E32zAf6TQIU4RAdXLkyrMhv+yW8EJvBoODtVFu+E33LM4oDJJO6mltHVZ6REgm2v4
	gQHu+UC13rRvImEhEujJVCm8//1BfuXh4cdJkObNGwUWWZc4vKEVBzrDUcyJhdsQTzaE
	2rIatjtzJAJcNQwcmsFWyDCaUJ/O7jQ68knf10xY5i+Y3XfTpLSmo+N4XGQykxRZL4rr
	TFYIvqAtoN9Bjfo1zNSRfHTLLnE0uD0xP0mE4IZyjbQjyyDx0icLYjXJROjLWzzTOnEF
	o8Gw==
X-Gm-Message-State: AA+aEWbb50pZRKFrZvhQ9VdIw/XAWJUyfEZQtEuAEpBXU2IASdEF6Y9l
	uDxj4x2aBvCBfOb1BDQ44uxFD9Y2lBaVBGUDOgk=
X-Google-Smtp-Source: AFSGD/VQZfiP1NFpKcK16cVvYn8YNYwDJYwX/K6L6Aq/QHzlbaNQhQVcuiwBARa+fDuZcaFqs2IUIkFRW23ujyRNBGQ=
X-Received: by 2002:ad4:41d0:: with SMTP id a16mr17410310qvq.55.1543872498750; 
	Mon, 03 Dec 2018 13:28:18 -0800 (PST)
MIME-Version: 1.0
References: <20181202191346.15104-1-raj.khem@gmail.com>
	<20181202191346.15104-3-raj.khem@gmail.com>
	<CANNYZj9g4mW=tk0fTYzK7rHes5GDVVgXtm2wNeE0eLoOOC3X7w@mail.gmail.com>
In-Reply-To: <CANNYZj9g4mW=tk0fTYzK7rHes5GDVVgXtm2wNeE0eLoOOC3X7w@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 3 Dec 2018 13:27:52 -0800
Message-ID: <CAMKF1sqKgPCtQKHSM4s8b3W7n3kZW6nDjXAvquqaPBDDzJ4MKg@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 3/3] packagegroup-meta-oe.bb: Exclude from world builds
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
X-List-Received-Date: Mon, 03 Dec 2018 21:28:18 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Dec 3, 2018 at 2:47 AM Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>
> My patches fix this issue though, no need to exclude if you take them.
>

Am afraid they don't see
http://jenkins.nas-admin.org/view/OE/job/oe_world_qemuarm/945/consoleFull

> Alex
> On Sun, 2 Dec 2018 at 20:14, Khem Raj <raj.khem@gmail.com> wrote:
> >
> > It does not parse, since it has many unmet rdepends
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> > index 08b4bbfc48..2d24653b1d 100644
> > --- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> > +++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> > @@ -1,5 +1,7 @@
> >  SUMMARY = "Meta-oe ptest packagegroups"
> >
> > +EXCLUDE_FROM_WORLD = "1"
> > +
> >  inherit packagegroup
> >
> >  PROVIDES = "${PACKAGES}"
> > --
> > 2.19.2
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel

