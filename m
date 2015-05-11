Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f174.google.com (mail-ig0-f174.google.com
	[209.85.213.174])
	by mail.openembedded.org (Postfix) with ESMTP id B3EF76013D
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 May 2015 19:44:10 +0000 (UTC)
Received: by igbhj9 with SMTP id hj9so81371144igb.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 May 2015 12:44:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=Sibx9A8AsumXY2Q2uexJxuF1m1N9ZSKP5Qq6eMiUmQ8=;
	b=dItCwXv3yjYoP8itmj1xGYbT11l+S3l2vhMXWMYRYnjWe3GvvvES1c3eo9ku9D9LdL
	pGbnFC6YYkG3iXJyQjCWTgc+jir5FMANV23atsYbU8do3DBdMQ4+faGn4KUaeqtAVIZB
	b0GW8LWokf3d61jAbPVxppbg8CbX3oaeQ1ZnXFZLeX8Fu7r0Lo6dgaylpWWHKneCiRUg
	PKAbwvzR0FbSRc2helHwTbrWoi5F3K8WpCWjXvFHHkNOvdUWNC+S5L9PbIVm2U+9ju6y
	KgoFLSjK30CeCr85Ydz8Rf4GvKAwegZlPiO9e9mzpEj+AaFXo1jT8YG9r+LjrY0iCDA2
	hCSQ==
X-Received: by 10.107.18.170 with SMTP id 42mr15389441ios.38.1431373451614;
	Mon, 11 May 2015 12:44:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.112.34 with HTTP; Mon, 11 May 2015 12:43:41 -0700 (PDT)
In-Reply-To: <20150511190027.GK2400@jama>
References: <1430795900-25986-1-git-send-email-akuster808@gmail.com>
	<20150511090952.GF2400@jama>
	<CAMKF1sp5Vg3U6kWfRfJgCZki-EKpmSmYCJiizS6K5GnkzSKb5g@mail.gmail.com>
	<20150511190027.GK2400@jama>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 11 May 2015 12:43:41 -0700
Message-ID: <CAMKF1srdavBqMeeuu-FThmD27WsA-Xiirf8KGi24rCMA-J1vgw@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] networkingmanager: QA warning for rdepends on polkit
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 11 May 2015 19:44:14 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, May 11, 2015 at 12:00 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
>
> RDEPENDS adds dependency only between do_package tasks for build time
> dependency you need do_configure depending on do_populate_sysroot

its do_build which will depend on do_package_write task in case of RDEPENDS
and do_package_write task will then recurse further to build it.

