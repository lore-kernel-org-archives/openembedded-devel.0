Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f176.google.com (mail-wr0-f176.google.com
	[209.85.128.176])
	by mail.openembedded.org (Postfix) with ESMTP id 64B38782CE
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Mar 2018 14:39:14 +0000 (UTC)
Received: by mail-wr0-f176.google.com with SMTP id n7so6588156wrn.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Mar 2018 06:39:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=McmSUQqjfVygGjL9gvXV0E21BC3PSF3bkGVnGZADPVs=;
	b=nsqtqbi0K2lEqEzVb7rBcgrA/otIUXh4JySV+LKfDJIHUkKQD6aMv5O/AWXoJ69b2M
	82DVCh+pdeSrk1l9DgXY5Da52ZIouu+rEiP/SEqIXkhtF+/+3ROL1/jLrheYk2C9WU4J
	9KR/y0Lp/skSR19iykR1PJinCmMeaXXB2AfTiWwTT7f6Pi7nzDNRWEtElrf01tjphDn3
	sEmF6/W2U7F9N9yaaat+PrgzIIvaNV5eVsVXSqjxkW7O/0gy0ATWTf+EUWj/oc5S2LI5
	OrH0Y+5gJOih+jQSq4k+IEF6cDtFErNjoJ3lrW+zyg9aa+ya7T4O+/cmqt3Aud2+Grvp
	eUow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=McmSUQqjfVygGjL9gvXV0E21BC3PSF3bkGVnGZADPVs=;
	b=myUQcV49PNo0JqP2RbQU7wvXZ9tnjRAmUvUoa3gtjx7PFaIo5BStlcFFsTC6sWZzOi
	lzytRhqL6ZwFMRXc7LP8zPkxnRizS67P66qDul84iSA4/GTJO4VcXSi4IEnmD4Plqqa0
	utQ3urBPFlrpR6R8nuwsrVMkYDUJyEUtQWn4Eb7qqlA3rodlertYIzN00yiLL+rEKmpX
	4elpZCkAaUZ2vsREck/cbQA3tNbXJOjKC9LZWdoMwsZCO/AH3lGvrrpAnbl37FElYNiO
	tUdBVWFuwxfl0Ro45xHNF83SbwxNeSFn1sXHzO5Y6wXaalVBJU5FyyiOv7DyEcIL7YCL
	23iQ==
X-Gm-Message-State: APf1xPDThojwjMJJLFziCmlpx4idhZZEDUjAQM8Ag1nIg04z8Nvwg/oO
	0aDUbEoo+pDd6NSrCOgPy8XLDg/v+km1FHBEKfc=
X-Google-Smtp-Source: AG47ELu8b+5XLRK1AouqRS0wqZUEfIAxfZhdrN2LBkOuQwZsXGyT8wtxZPJN/99tdaCeUpjM+6QeMfmuW7hfJQtjY6E=
X-Received: by 10.223.160.42 with SMTP id k39mr2186928wrk.138.1519915155212;
	Thu, 01 Mar 2018 06:39:15 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.74.211 with HTTP; Thu, 1 Mar 2018 06:39:14 -0800 (PST)
In-Reply-To: <96413928-3e82-ef2d-d0ba-99666167ccb3@balister.org>
References: <96413928-3e82-ef2d-d0ba-99666167ccb3@balister.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 1 Mar 2018 15:39:14 +0100
Message-ID: <CA+chaQe6Wj5gz-ARk+CEBHB2ymWS2ccEvtSs6w05rtcmpN_izQ@mail.gmail.com>
To: Philip Balister <philip@balister.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: meta-python/rocko
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
X-List-Received-Date: Thu, 01 Mar 2018 14:39:14 -0000
Content-Type: text/plain; charset="UTF-8"

Read this thread:
http://lists.openembedded.org/pipermail/openembedded-devel/2018-February/116622.html

On Thu, Mar 1, 2018 at 3:22 PM, Philip Balister <philip@balister.org> wrote:

> I'm trying to build some gnuradio related stuff and am running into
> issues in meta-python with DEPENDS and missing recipes. Does anyone
> understand what is going on and have a plan to fix it, or do I need to
> dig further and figure out what needs doing?
>
> Philip
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

