Return-Path: <twoerner@gmail.com>
Received: from mail-ua0-f180.google.com (mail-ua0-f180.google.com
	[209.85.217.180])
	by mail.openembedded.org (Postfix) with ESMTP id 8530B779C3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Apr 2017 16:12:24 +0000 (UTC)
Received: by mail-ua0-f180.google.com with SMTP id h2so116030134uaa.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Apr 2017 09:12:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to:cc;
	bh=u3iWTowB4tGD+rZ0oK5PPeqi1GDdOyDQOS4m5QMx/us=;
	b=jNtktMSUAxKxX4wOSSxxaJGa012yES0KUlplqM0M2wdoZluxVFW+u/2PS6Feq7QeZa
	NMwwiYNsJUk+QbGJklEWZvOMI70h3C6cJizXyP7qldAop2yorp0kVB4QOpWEYrAJouRT
	ol+Elan16g/T+de1MZM01XFuaz5xOogjy80zqq1K7ld+iL2tYm3fQNcHgOCdVPUYHE8M
	gohuYszZzr0/6L+QhVxOHqzvkDYbV2oSV9QHW7/JBOWvicHOFG73jntGDCcYqYRnOKa0
	MUXbITNiL0PPTMRBA22ZIGjxdd52qUnYyX3/bXMcmSwZoS7iqU2zPBmsSXAWeEeK4feb
	YWPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
	bh=u3iWTowB4tGD+rZ0oK5PPeqi1GDdOyDQOS4m5QMx/us=;
	b=rNjtOVKG0x+HlzdMzuu2sTJpSNErTr9yx6xOAKM75b0/HB8vNtpoD6E1Y13BTtoFaH
	GvqfsF9bJBcT9dFQbFhKhB82esPZ6bbomn/iuuN9udhpCDJembWEzWFIIIjGT3vI0abk
	y6HTzXIlAj1y0t8LOTBVpLoTNg61tJ/8XiKU0X65EJdXyAmWR0xhlbbeShaSJKzgcbmx
	jGzcgkWcB/NZvBIy0y2hUxEiRz6kbDf4gmSmaAG4eSiVdzqT5dPha5BbO1bgzOL0t/zt
	l9Z38FKgdi4oWeWCSeDt5LVgK5ZnH20LY0SSrBlGkOUwodOm30qA445c50p6cbrYGiRT
	WMjA==
X-Gm-Message-State: AN3rC/6usHrbXMgNggZzBPLbFzqhW/UiTJtk//PTymsV13/tMyG6HH7d
	sUEd+wxFuE078/enLB/AZpBgXfrfRU0q
X-Received: by 10.159.33.133 with SMTP id 5mr13413026uac.179.1493050345467;
	Mon, 24 Apr 2017 09:12:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.67.65 with HTTP; Mon, 24 Apr 2017 09:12:25 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
Date: Mon, 24 Apr 2017 12:12:25 -0400
Message-ID: <CAHUNapRLYpv4xS=tzsJrL4r5GCMWzKr3NVDwmwgffec8XDyXZQ@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: more info in layerindex Was: Full Python3 Installation
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
X-List-Received-Date: Mon, 24 Apr 2017 16:12:24 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Apr 12, 2017 at 2:53 PM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> Regarding the layer index, we don't actually index packages or anything on the
> runtime side, since you would have to actually run a build to get full
> information there, and it can easily change depending on configuration. It's
> possible we may add that in future but we'd have to ensure everyone understood
> those limitations that mean that the information might not directly match what
> they see when they do a build locally.


As for knowing what files will go where I can see that you could only
really know that once a recipe is built (since the FILES_..._${PN}
allows wildcards). But as for the list of packages created by a
recipe, isn't that deterministic from looking at the (full) recipe
information (including inherits etc)?

Also, would having the layerindex list PACKAGECONFIG options per
recipe be possible?

