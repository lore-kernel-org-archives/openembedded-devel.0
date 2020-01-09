Return-Path: <schnitzeltony@gmail.com>
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
	[209.85.166.68])
	by mail.openembedded.org (Postfix) with ESMTP id 8B5B77FEE6
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Jan 2020 22:33:23 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id z193so8981900iof.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 Jan 2020 14:33:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=LFVnXjppc6d2POxdS4754ME436siE9BPF8CWnaA0skU=;
	b=rzde8SrIUjfhrcKHjaoAZy7sjpy1u1EqwjpYb+emU96hV2PAzijwSzGP6tHgU9sFQd
	fZHTTQrkQy7I8ULyyIxmocEsSCEmly20ZI9ZmepuxFcG944e0+qoOr2Mgdqtv7gPJ+wK
	M0/jjFlTvoZPbr2FlxKwJ6fYxsYlycNej00uyx+UtXhCwi3fXqL/PP/AuN6rxMVfMvUT
	D5birDpPr/BOiOPtNJ9AgHmgYQDw5/i6dAUs0zEtjRnhkwdUcIdAWpUTQUP4Djzh3VyJ
	xZsyfhb+CQ6rKCONUWDq+PbFjw5y9RVHlkkXgGXw7hR62j91TWiVihO2Rf1V99vDiTRC
	wwQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=LFVnXjppc6d2POxdS4754ME436siE9BPF8CWnaA0skU=;
	b=cnot3y33VCtlNFvuSciRxW6yTQvCcw5PsSYyUCEzbtc4sPwT1l0kqlT2M5f/HcyJTJ
	Zzw8gBr9E04mdVgddRgKRLUbrfzNyS1rJom//W0GhGBBz7QWejknCPgA4ErXfA2zj5MX
	91eCzD+FJ6SzFlOXUI0mssSSAxJanT2M1YzLn5TVTF2UjAnBvN+mPbCpA50riRwmAGuw
	8wUBAglPwqhF3IAZ/tL7pQBrBmtPe6B1gzi0ByQPBUPIZkLEqg+G+8BrMrynHVrpy1KE
	Fcf+WNAX6UD9buyaNtd65bfolBunhq3vZC0CqI+wUNN0HDbd2BzO/l8dMFN7zE9X3omt
	ATDQ==
X-Gm-Message-State: APjAAAXlLqzR1qgE1Kry7NGZwA0vVUMMpUuViEGYt1pdzi8iL/iRS+Ok
	dLSA/ujbydKkSSzklmMUkwAsRD/VlxqaCHuhpEA=
X-Google-Smtp-Source: APXvYqw2KEZOwt+HUqt3fla5Mu0FAZLVLQE1WiTE9icg0oP8h8qDxpPEbhvG57g9t79CNNeLecOVeFjMwKQlcExD71Q=
X-Received: by 2002:a5d:9ecc:: with SMTP id a12mr9962855ioe.267.1578609204376; 
	Thu, 09 Jan 2020 14:33:24 -0800 (PST)
MIME-Version: 1.0
References: <20200109210518.22451-1-schnitzeltony@gmail.com>
	<20200109210518.22451-8-schnitzeltony@gmail.com>
	<CAMKF1sru3Jm-AbJJziRycvs7gRCwuiyLsVhX-FmE0rgaj-PrbA@mail.gmail.com>
In-Reply-To: <CAMKF1sru3Jm-AbJJziRycvs7gRCwuiyLsVhX-FmE0rgaj-PrbA@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Thu, 9 Jan 2020 23:33:12 +0100
Message-ID: <CALbNGRRZPGkcO5cZUUqnfYaVHtwWkjwDNpUYwgfqMtLVfvY0uQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 8/9] libsigc++-3: upgrade 3.0.0 -> 3.0.2
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
X-List-Received-Date: Thu, 09 Jan 2020 22:33:23 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Jan 9, 2020 at 11:07 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> you have good commit msg so I merged this with earlier patch proposed here
>
> https://patchwork.openembedded.org/patch/168647/

missed that patch - sorry. I fell over this one by GNOME 3.34.3 [1]
and just cross-checked it against layerindex.

[1] https://download.gnome.org/core/3.34/3.34.3/sources/

Andreas


Andreas

