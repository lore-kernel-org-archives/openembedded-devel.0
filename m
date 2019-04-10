Return-Path: <ram.subramanian@meraki.net>
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com
	[209.85.166.43])
	by mail.openembedded.org (Postfix) with ESMTP id 67AA67D304
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Apr 2019 20:12:54 +0000 (UTC)
Received: by mail-io1-f43.google.com with SMTP id v4so3320683ioj.5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Apr 2019 13:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meraki.com; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=lrTNboSGMQoxSULIb0gjo6JsBSHTqzzsje9KH2oyk5M=;
	b=VOLR8F933qKDwoTmK85cPX+L0iL/uExTGr+W214sCin3Q9A8RRJfCppYltqqwJb6n6
	bxhp7FzEu3shM9cMkhtOGLecyoK/9/POPefzE5IVuoirqDtkRH2Q7o9uomrfscLxZUMG
	rgCk8aM4YrZrUHAr0+ndgYMbCK55P8vkfmX3E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=lrTNboSGMQoxSULIb0gjo6JsBSHTqzzsje9KH2oyk5M=;
	b=tYvCYq5xRmQOwvxfsyTAfDpLGoVbJwdx7EjM1O9DzKvogTIgHTksMEEVphbSvPRz6v
	fjKz6st75sZ1kqhJChpPnOBbMqorvazhjvdNl/4PApYUkvJxTqhHvfW7caErnzCXwVbv
	2gKL0Vn9nAcoXZlkT1XyVTWRhlCxX6OyAEN45shGU559AyoLPJkQoNtuYoMfJ/glbWLQ
	tYFimers9/pfZ9iL4ibhLru+kuhV4S6h2YVh9aZcohlSBb+W4xfCBI0xPyTj3ChnGI28
	auFtg0LZvoQKvSNsJgXILKX4ENY6+TWZ/NmsDK2mlN9MoIMZD34KnDL0HMcRGYOGzzhq
	K1qQ==
X-Gm-Message-State: APjAAAWUcm9k15Dt8aYnR7WolMIsobZ3sfcuWUJyetlMyT2PoRx4hQdR
	tVWrXdOgn70vfDgVaHXbgEwKD1C4lIU/W5uXO68PVQ==
X-Google-Smtp-Source: APXvYqxGl97sn7DKhcFR8P2la3yYbJjaq+ljLXJYoxdPMkoPuCXqEjXgkShH5WqBfNL24Z7zjGoe9D2zL2CRggY9+3Y=
X-Received: by 2002:a6b:510f:: with SMTP id f15mr28908210iob.59.1554927175260; 
	Wed, 10 Apr 2019 13:12:55 -0700 (PDT)
MIME-Version: 1.0
References: <CAMSkS0hfFUKN4Z3hQvindomzUeTnTJpmQeNVmTMOSG2+jstr8Q@mail.gmail.com>
	<CAMKF1soBXtA5KpXprtEydJ-qC6tNSymvnNczFDLL1+eRzuDegA@mail.gmail.com>
In-Reply-To: <CAMKF1soBXtA5KpXprtEydJ-qC6tNSymvnNczFDLL1+eRzuDegA@mail.gmail.com>
From: Ram Subramanian <ram@meraki.com>
Date: Wed, 10 Apr 2019 13:12:44 -0700
Message-ID: <CAMSkS0hUKA+W_9WmtVmVUb48EzoymqrYwcNK76idU2kPOVr5gA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: Will a commit currently on master make it to a specific future release branch
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
X-List-Received-Date: Wed, 10 Apr 2019 20:12:54 -0000
Content-Type: text/plain; charset="UTF-8"

Khem,

Thank you for the confirming! I just noticed squid was bumped again to
version 4.5, but in master-next branch. Will that also make warrior, or
will it be saved for zeus?

Ram

On Wed, Apr 10, 2019 at 8:57 AM Khem Raj <raj.khem@gmail.com> wrote:

> we have not yet branched warrior and it will be in warrior.
>
> On Tue, Apr 9, 2019 at 10:29 PM Ram Subramanian <ram@meraki.com> wrote:
> >
> > Hi oe-devel,
> >
> > I was wondering if the following commit that is currently on the master
> > branch is slated to be cherry-picked to either the (upcoming) warrior or
> > zeus branch(es) (or both)? I noticed that new branches aren't always
> > created at the HEAD of origin/master.
> >
> > b42de097d - Pascal Bach - squid: upgrade 3.5.27 -> 3.5.28 (4 weeks ago)
> >
> > Currently neither of those branches exist in the upstream repo, and
> knowing
> > this information will make it easier to plan for it accordingly;
> especially
> > since we're close to the next release going by the yocto releases page.
> >
> > Thank you,
> > Ram
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

