Return-Path: <twoerner@gmail.com>
Received: from mail-vk0-f50.google.com (mail-vk0-f50.google.com
	[209.85.213.50])
	by mail.openembedded.org (Postfix) with ESMTP id E03927199D
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 20 May 2017 15:21:12 +0000 (UTC)
Received: by mail-vk0-f50.google.com with SMTP id p85so24350261vkd.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 20 May 2017 08:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=lyflJTKi+ulo13kkig2euLh3T4u2DuEdhK9GLOu55is=;
	b=h4eEuOqvVCvmeRbDol685i+NPhD4hxTZnm50VhPfPM23rawtVmda+zFPZca66mJM+8
	n6D/I7OGg3W7CpGwdqab4wNjWwPry+E2fGBmQZehHaHYf9bIjcgQrRjdx6Jxf7PRZNhs
	L/6PVWUss6ZoBIck34zlj78FULqN6y9SqhWwOHMKLpo/jChn3svUH+VVV0PSASQwQ3d7
	3mCO7yJdmp2mUrSu51+bBli3ywf73ojjpPz/X9QRILy6iLlmDPMEtefsPkEg35gP8KnW
	rwzWMvFzsjVrhuGX97wRy/2VSjcUEDiHoynH878EoNmsgBEcRwlwQpEvswD8TUlnDpMb
	Dz8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=lyflJTKi+ulo13kkig2euLh3T4u2DuEdhK9GLOu55is=;
	b=AlzTVS4hiY3zoyMWP19nsuh7p3cftVvxAYrhC8XzOXpC/DW5b/ouTGTPJrXRsGQ7wK
	FlSWm35WlSnzIt9dP7/mM+JnRBuzCJtsu5RbU2JnntBn4MJ9+u7cEFTCN91iX/qIbdMe
	c7hMsmf8FAdJvOSZ6fjX+Bkz8qzmFWudqls6C+6H97tbymEJ4dAZHSSZy5OuzjyCs8Up
	vwYmJKOym7gZiVbycCim6okc3cQ2Z5mU+AxKfX9a7YIsu4gIsBfLQKsSmOLHZDZ/id/o
	d6p6BcvJxvYrjm99MjuRZ1emjugZNgHT7YlP7ligkUohyzh3oudNsf1mAiZThcvI8WQD
	b0dA==
X-Gm-Message-State: AODbwcCKJUzSE0u5puVzmRGHBTCGadlUcrs2P9175le07y2c9Y0q3h64
	/4KvcnCjWqML97CdJYSsj85/mziNzPe0
X-Received: by 10.31.89.68 with SMTP id n65mr3600372vkb.71.1495293673354; Sat,
	20 May 2017 08:21:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.67.199 with HTTP; Sat, 20 May 2017 08:21:12 -0700 (PDT)
In-Reply-To: <6b90bfd5-3dd1-572c-9a63-2f9399737824@ubiant.com>
References: <6b90bfd5-3dd1-572c-9a63-2f9399737824@ubiant.com>
From: Trevor Woerner <twoerner@gmail.com>
Date: Sat, 20 May 2017 11:21:12 -0400
Message-ID: <CAHUNapRhwKpbR0nXyre4nV+fPgC6XR3QFNq4DhtfSO0zzRv7=Q@mail.gmail.com>
To: Romain Bazile <romain.bazile@ubiant.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-java] rxtx fails to build because of upstream website dead
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
X-List-Received-Date: Sat, 20 May 2017 15:21:13 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, May 19, 2017 at 11:07 AM, Romain Bazile
<romain.bazile@ubiant.com> wrote:
> Due to the chronic instability of this website, would it make sense to
> include the source file directly into the meta-java layer as a zip file?

My guess is the project would not be happy about a large zip file in a
git repository. If a patch becomes too big, or if a recipe needs too
many patches, the general consensus is to create a repository with the
patches and keep the metadata small. On the other hand, exceptions
abound.

> I don't know about best practices surrounding this, I kindly apologize if
> it's strictly forbidden! Otherwise, I'm happy to submit a PR including the
> file and the necessary changes to the recipes (in concerned branches).

The yoctoproject maintains a source mirror, the best bet is to ask
that the sources be mirrored there. The recipe will probably be
expected to stay as-is, and the yocto backup used if/when the primary
is down.

