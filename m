Return-Path: <schnitzeltony@gmail.com>
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66])
	by mail.openembedded.org (Postfix) with ESMTP id 62ECD7F7E2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Nov 2019 10:21:13 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id i13so13303241ioj.5
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Nov 2019 02:21:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=i4z4L/uGJ9/usF9zSnLTXaUvRiv0b23YrD5KWzqpR/Q=;
	b=uFnb/webszNmRhHdLVJmuwz9px2X6wCvSf5tI10ugU2hckUfNkpSOmKuMz6hqLFrn3
	vS+B/qH3hS4qrtIWdgMNXk0o5i/FSK+L9inQ0upVYy/T027d7NIN19/96xVFGtHhnqYe
	Hbj5D4AOfvOqWiIJLBTcWLROuOJI0TwzOHNZFCi93U3+P9hdEjQ3GodlLhMtVMyBoKkP
	GvWxLBhPFVtk+GfH4sDfMvIZRRe0mag377yCscS/wLgRx0+N6inx89ZnS9WaNQHzjE/Y
	NPyzZPx8v4AtVogN6gNIk0e5JnaKMaNxSMAK4hlvJWj/41sn9d9Bten+HyQgBDkkHJuE
	m0Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=i4z4L/uGJ9/usF9zSnLTXaUvRiv0b23YrD5KWzqpR/Q=;
	b=hgqf6Bcqw5mU+1IGP5UC8HbJufrR27cIks65jUILpZR0xp8veI4fxcLgMrxwdad1mD
	aas+qvAKxMjaOLbuXEiCQOT8V0ntmFon/3++kWK+Nx20F99U2uLBrtW4BOUent55W/1H
	e8Gw+ZkdPJ5uBquWleXmZKHxtDQyiSBfQ5VgjReyuMHIl5r6Cs5iT6dtgY0hCDGNpXIM
	j8OTQg9Anmb/tU0wiPD1pjl8Ygh0nvaAxvryrJF5uwCaAGdtIOHnzKGl9593jpL/Smc/
	PVY/lJ+WONwPyqjCpBdwuL6SrOuAY3P/r0VFLmxf65kp+6BdT4dFz1xV2qd69DA1yxZ/
	KQ5Q==
X-Gm-Message-State: APjAAAU+w7dWQHWFMa8sMIPP2KPdoaUAv0JV8UDlrdDOVhPFxufBod9O
	F68q/SAUDKRHpPMWnN+Wy64nypMl4lxGEWnA854=
X-Google-Smtp-Source: APXvYqwMdH+9o3A3nEwcuOM/RLFYMu85bqdVxTI8PsOTg3stw18bolM0qYb+EMD1ImLpeIKbXx741jmnG2FNAFmx4W8=
X-Received: by 2002:a6b:c916:: with SMTP id z22mr2169411iof.267.1573899674216; 
	Sat, 16 Nov 2019 02:21:14 -0800 (PST)
MIME-Version: 1.0
References: <20191115204720.1294151-1-raj.khem@gmail.com>
In-Reply-To: <20191115204720.1294151-1-raj.khem@gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Sat, 16 Nov 2019 11:21:02 +0100
Message-ID: <CALbNGRSFN3mFfrwg1wtOde2z4BFYBYv8=xUei6Vvyy3CnLa_dg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-gnome][PATCH] evince: Fix build with clang
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
X-List-Received-Date: Sat, 16 Nov 2019 10:21:13 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 15, 2019 at 9:47 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> Enhance the patch for printf format checking to make clang work as well
Thanks for taking care - time to mention that you do a fantastic job :)

Hope I'll find some time to fix the other issues you reported during
this weekend.

Andreas

