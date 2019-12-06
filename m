Return-Path: <schnitzeltony@gmail.com>
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com
	[209.85.166.53])
	by mail.openembedded.org (Postfix) with ESMTP id 2EED27FC06
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Dec 2019 09:00:44 +0000 (UTC)
Received: by mail-io1-f53.google.com with SMTP id c16so6593777ioh.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Dec 2019 01:00:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=8ruFK0QgDATTGbsa8PhnMSnViQhzPPXkuulUQW0NLLE=;
	b=mwNv2q4a0ZB9FHiFfptWLjtxpY7XrS8bAoLVfWpK7dsyA31e/a0lDI86g+XSLPYJyA
	a1XMnR6qt0jIyocFXzQE8ky4GxmpsLjRVrc2VY0hICTdwMdPsTtGIHTpyk+VY9ggLmqm
	+Q3+xZ7o/p6LS1BOb9PIsK7NqPKNys0zRwQHmAZKx3BHLjHFxUpkiBCCqNFin29ohCZ2
	6gCJoGAlRmv+KKyb+3rZBJVNUOCUUQPdeo2DcxZoRLzOLJNg52PZ+wQyOiw2qsPeurzl
	5gD84jJ/getrfqZ7rCU4+epD4lwTydX62+PbS+zcTMfCF+z3S6C1S2gc3AXlIqxMA1M/
	174w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=8ruFK0QgDATTGbsa8PhnMSnViQhzPPXkuulUQW0NLLE=;
	b=uc8KQEwBH4s3lOSrfiaRpmY3cOBBLqU32qGgeYE1C986hyge6wPWqQNP7/AfEfPz0L
	vV+j6QlXtzV19yLuY8354F7rWkalAXqPTXGI8yUyts/C9nuf08wdQwhcV/u6D5l9s0UY
	f/a5qvyl4D5c61AVG9tAgZdloF1GmJWSjUOtMWiwXHw4knvzY+XhDM4ytUPDAArhqyKW
	d9fqhJqU3CS7wMFLWkBDoMHwsnC0snFFPLjPBMa3RQ+QANQBOG9Ewefxo9EAVNjOe3Ov
	TmLzIF9+Z99ZcQw7lN1WjdAzpWxPpXFzVKQSpD/NC04WQFYoJsQt41EMfc7IrIzCVvMI
	Rd9Q==
X-Gm-Message-State: APjAAAWYlvxGDDTztk7FOFyLrIth1x1A+nv/M1giYscgEDc6LHxLgmSp
	RdVtd0AdSBzcHEkpWgCraJLKnbgvQ1rwvBT+0KE=
X-Google-Smtp-Source: APXvYqxQKoG9buP47Nk1rcy4cQKyRO9HyvtfqtVQOFhB98QM3o65E73X8Ez2h9hJ+icJOinhB0ODEBnD+88AJ4OOPr8=
X-Received: by 2002:a5d:9ecc:: with SMTP id a12mr10007048ioe.267.1575622845216;
	Fri, 06 Dec 2019 01:00:45 -0800 (PST)
MIME-Version: 1.0
References: <20191206082100.14071-1-kai.kang@windriver.com>
	<20191206082100.14071-2-kai.kang@windriver.com>
In-Reply-To: <20191206082100.14071-2-kai.kang@windriver.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Fri, 6 Dec 2019 10:00:34 +0100
Message-ID: <CALbNGRQJMmJ270c5_Ez24GhhP=hBL3rMzd2sZVu+bbS2TzFGAQ@mail.gmail.com>
To: Kang Kai <kai.kang@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-xfce][Patch 2/2] exo: 0.12.9 -> 0.12.10
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
X-List-Received-Date: Fri, 06 Dec 2019 09:00:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 6, 2019 at 9:21 AM <kai.kang@windriver.com> wrote:
>
> From: Kai Kang <kai.kang@windriver.com>
>
> Upgrade exo from 0.12.9 to 0.12.10.
>
> Release notes:
> * Bug Fixes:
>   - Fix typeahead search regression (Xfce #16191)
> * Translation Updates: Spanish
>
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
Acked-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>

