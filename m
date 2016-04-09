Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pa0-f41.google.com (mail-pa0-f41.google.com
	[209.85.220.41])
	by mail.openembedded.org (Postfix) with ESMTP id EAB5C77181
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  9 Apr 2016 11:07:38 +0000 (UTC)
Received: by mail-pa0-f41.google.com with SMTP id bx7so73881279pad.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 Apr 2016 04:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to; 
	bh=gKsUVTVKDPMNdR/+6xnjq8j0e+BlhUtvDB3zJ0nin68=;
	b=FHKra3trTDP6D/K9DESvFJ4Ruq+Yq3BSjLdhxlpww2hEaXKk9yc9xA2ETjgBBGLY70
	OJr4YM49sRrdWiHn8xmUs9DSSTyOXC6nrYn1/iY+JWkLILiVfGZxj+pWwO8X5ouqRs81
	CfcN7rfOLhwlbc9KlBqspkbWPVSh/T+Gso14Y6CqUjBXe6Gd+EyKKw/EisDRN9pgwqRC
	VZ9hlINsF8D0M/iTEQqKAweRgLYaDSkrPKXOtOZH9a2e8r6USBqi9mIorWlCVfZhXAax
	3QfHCkxGNkmp0yksE5X9c60tVjwrGgi969KjgSx+CLS/Pk3mu5GIwYvQo8wqBS1lJHDD
	yTjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to;
	bh=gKsUVTVKDPMNdR/+6xnjq8j0e+BlhUtvDB3zJ0nin68=;
	b=h3oTgtTQEk1hAbsN1Rf9KISQ5HTIwA74hNyHoMmdRpp8YBfubl1Y38HrXlaXdOy2Rv
	mDdRcncSGyMo+fRE2/a3h6sXhf2AEb+nmCP6Rdg0BjVxY10Y9CqAsSNsGQqjeSFJXhHB
	+eObu01M3hhH9o6UY3YbYu4DAocp0+PuAdTQ0rxVHxj5SRcTmksHxJ/FszTjmlYmZyio
	l3r1i99sUXcv1wVrIQciDvVvKt6cXahewJ4szXbLHifM6BjGQLsVs7Ni3XI9DvvMaWSK
	QWHusV1ea5fPhgPbQzqC+a3PK4XS1Nv5PzFsZtdd6owA5Zlh92Jjp+qSkVdmJ/3XVD86
	BA5Q==
X-Gm-Message-State: AD7BkJIgnuVvkhmAYr71jvBHrKxdNOjQJU80CW5iOPK+Zr6MQ558oLiIDDGnhT7cn9KNwQ==
X-Received: by 10.66.249.166 with SMTP id yv6mr18909588pac.91.1460200059053;
	Sat, 09 Apr 2016 04:07:39 -0700 (PDT)
Received: from mail-pf0-f177.google.com (mail-pf0-f177.google.com.
	[209.85.192.177]) by smtp.gmail.com with ESMTPSA id
	ch2sm24412141pad.28.2016.04.09.04.07.37
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 09 Apr 2016 04:07:37 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-pf0-f177.google.com with SMTP id 184so91892325pff.0
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 Apr 2016 04:07:37 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.98.74.200 with SMTP id c69mr18927542pfj.129.1460200057114;
	Sat, 09 Apr 2016 04:07:37 -0700 (PDT)
Received: by 10.67.3.163 with HTTP; Sat, 9 Apr 2016 04:07:37 -0700 (PDT)
In-Reply-To: <1459785179-27170-1-git-send-email-eu@felipetonello.com>
References: <1459785179-27170-1-git-send-email-eu@felipetonello.com>
Date: Sat, 9 Apr 2016 08:07:37 -0300
X-Gmail-Original-Message-ID: <CAP9ODKqiMmpjvWikzXauEsfsbnzOQDYVAD2JifWnsFDS4cQ7JA@mail.gmail.com>
Message-ID: <CAP9ODKqiMmpjvWikzXauEsfsbnzOQDYVAD2JifWnsFDS4cQ7JA@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] protobuf: add protobuf-c recipe
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
X-List-Received-Date: Sat, 09 Apr 2016 11:07:39 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Apr 4, 2016 at 12:52 PM, Felipe F. Tonello <eu@felipetonello.com> wrote:
> Initial version of recipe. The main package could be split into two to
> separate the compiler. This also applies to protobuf recipe.
>
> Signed-off-by: Felipe F. Tonello <eu@felipetonello.com>

So split it; it makes sense to include it splitted.


-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

