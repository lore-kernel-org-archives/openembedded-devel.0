Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SI35j-0002mR-Bx
	for openembedded-devel@lists.openembedded.org;
	Wed, 11 Apr 2012 21:20:31 +0200
Received: by lbky2 with SMTP id y2so931381lbk.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Apr 2012 12:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=sykZTADipchNKruh3bh7BlvtATqZ8u5dfH/s4pJ+zuI=;
	b=BIoEo5+zGM5ZrbgT6XvHsf2tDReWHGNTtLgGnmVMg4IOlDsK8sReJGobbjlFgsckCl
	OhqiI3NMZlg8l0fss5TcINurUZDdVMzxn7sWt1oH6EgaNB6Os6NY/bMtZ+IpbgQLdN9j
	ePeYk61YU9nwWs+I1GFiFxnosOjRiukGOR//pMQusOEzu7YqAhs8HfavVz13FI9umgYy
	11Oy9DAUW3q8hHOmGo0rRYOm9udprUfDmvwQw5qxHKQVGpoxIde0zN9e9iV/fUo+Szw2
	oXr/u4bQO0awefJxWouhB92ZA0r6UjVWs+oXY8k5MOBIHUSvkLXH5HGA2YBPt8eH8zf4
	QLBQ==
Received: by 10.152.113.229 with SMTP id jb5mr19136018lab.45.1334171472050;
	Wed, 11 Apr 2012 12:11:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.152.129.134 with HTTP; Wed, 11 Apr 2012 12:10:41 -0700 (PDT)
In-Reply-To: <CAEsOVNdvazASp=afD+2mk+6Jw3qE_efF2T5ojys8ox5nzDYV+A@mail.gmail.com>
References: <4F80ACD6.8080901@gmail.com>
	<CAEsOVNdvazASp=afD+2mk+6Jw3qE_efF2T5ojys8ox5nzDYV+A@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 11 Apr 2012 12:10:41 -0700
Message-ID: <CAMKF1sqM2_qeGH9gso0==Oa6fdVLZzJtP3rd+Pu=HtvXe1rTcA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: meta-linaro and toolchain-layer
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 11 Apr 2012 19:20:31 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Apr 11, 2012 at 8:59 AM, McClintock Matthew-B29882
<B29882@freescale.com> wrote:
>
> What is the harm in saving off the 4.6 toolchain recipes off in a
> layer that we other users could later add back in if they needed it? I
> for see issues where folks will insist on using the same toolchain
> they have been using for years to come.

usually the users who want that toolchain would than use a given
release of OE-Core
keeping many versions functional is a lot of work. Someone has to
constantly make
sure that metadata/recipes are working with the old toolchain all the
time master
changes.


