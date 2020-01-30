Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195])
	by mail.openembedded.org (Postfix) with ESMTP id F0FDC60609
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Jan 2020 19:08:16 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id q15so4014944qke.9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Jan 2020 11:08:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=nhqcMYL4OJGak/iimWFLCbIxKJ0LCyUWXdPWbJE9Eho=;
	b=dFl0mUsSPEJDjlkG4VqHAbH/ss9q698P6V0Ch2hr9m8SRfCoUvb6YwuVkLPnE79H8C
	b0rW8w7nZoYir6w0Q2EHOWYlS8Q9nBzoQiiZMuV7SkcRayJ+w04xnPkNzCMyG8bf9db9
	naOX2vrNkxGDStZxDpPMQSjnB0kMnYl0x+kjrZyugeWEbPm+mr2mmboo9OcUBfbi5zae
	y9oaEbn7w5hxXx6y6HAAV3UdSTGtRytu5fUOA+kgUbeNpCnCYERsNFaEJaWcRyCqLG/r
	l3c1iA/toFTaSZJUEHGPC54KF2ceU7d4G0iuXAWk6QH9OPui8q662CDSETKKKFjBRBw0
	GSFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=nhqcMYL4OJGak/iimWFLCbIxKJ0LCyUWXdPWbJE9Eho=;
	b=b8eIGOZiUXcY3ymj2Z5IfF5SYs9B7DYDE+MpP2IuG1JS8dF4154OEhOIDySNq/Pbzy
	gAn723+7zOYwzDozPG2JrV9HTF/w5JECLCN7S0Nm9uRSUgKpfI2/csPTUZ+vt2TIanzK
	WO+QBq086AGzY767zMS+HYGjiy6bL7i3fptdzL/Dbq0j5q1ppGIYc87NqgPS2Dx77lM4
	o5nbLc8fRDwTlbpWsrIn+Qv8up2Gk4E//P9a1A5mnKVA2hxOKTjy46/AcCbF1mtV7Lmf
	sE0nfy18VAhGTO6ck+eWGiUxxWkszimkLICgvW07zVgQmwZ5PCxsKfFDEhol8vBVQpLW
	bijg==
X-Gm-Message-State: APjAAAX5ZqWEZfzMYeHebEwd5ZJ64PeANp4FZ/MM0kLTjQlYzhoBT2zC
	XIj9bpCSLOWiadWDN3zyn1JE3ajlDF9pnC8UnRA=
X-Google-Smtp-Source: APXvYqwOkeFymkm1OJM/2MYQz67WdRS6uyK4zwd/e6o4FuetQfqOQiJD3QvO0PwlV7jD4A114U/AMMIvp5ycRv2gTB4=
X-Received: by 2002:a05:620a:6b8:: with SMTP id
	i24mr7025643qkh.9.1580411297529; 
	Thu, 30 Jan 2020 11:08:17 -0800 (PST)
MIME-Version: 1.0
References: <20200128215353.3594210-1-raj.khem@gmail.com>
	<fc466017-0803-06e9-ebc5-d8c6867a5229@gmail.com>
	<CAMKF1speJWXaYYMPzTvARDDbAQG=RGv6mRJJ15iO+3acriWR+Q@mail.gmail.com>
	<60591793-daaa-9487-5861-7473931b9108@gmail.com>
In-Reply-To: <60591793-daaa-9487-5861-7473931b9108@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 30 Jan 2020 11:07:51 -0800
Message-ID: <CAMKF1spW9a_eSur7hdEJKX53FURhrPQK8PQpwpMZPM+aUDPW9w@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH 1/3] squid: Link with libatomic on riscv
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
X-List-Received-Date: Fri, 31 Jan 2020 09:28:05 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Jan 30, 2020 at 11:01 AM akuster808 <akuster808@gmail.com> wrote:
>
>
>
> On 1/29/20 10:14 PM, Khem Raj wrote:
> > On Wed, Jan 29, 2020 at 9:32 PM akuster808 <akuster808@gmail.com> wrote:
> >>
> >>
> >> On 1/28/20 1:53 PM, Khem Raj wrote:
> >>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >> Is this for the same reason as for nodejs Cento7 fix ?
> >>
> > pretty much same problem, although a better fix is to detect it
> > during build but every build system has its own nuance.
> ok. backport worthy then.
yes

thanks

