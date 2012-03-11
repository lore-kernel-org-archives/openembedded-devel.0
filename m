Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1S6qj4-0008JM-L9
	for openembedded-devel@lists.openembedded.org;
	Sun, 11 Mar 2012 22:54:50 +0100
Received: by vcbfl13 with SMTP id fl13so3664690vcb.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Mar 2012 14:46:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=wTfNlI/FAZLv9ql0qzhAVeTu0ggdL2oAbx6JKFvZ9gU=;
	b=0idzqhqJN2v0hQkvlufbuWY6kMh0SzRn5PX3EE3EzQK+V5e+MyatUTzE/OGoR2kEvC
	wcfVwE+D4RQCOoQYiCLnzKPvwsxhkoikRttdelh+MYrVI82y1TJA+ixaYIw2hs8PHE0v
	PWvWqDFTDOprIesxgNq+Gegf6qFVtYJtbeqtDBbrg3uuxQMvblM4WddAGZ/p9Ygr0h7z
	LD+MTb2yFyCl2s8IqBrXPCn6dvrfLswWf+X+Rdpd9Vq/JXFMKK64YJe1xyHpcocAVIoQ
	R6SYTibi1gb8lbkTQpDItZhIzRD2cMzBoaNW2gbEXr9io+wGP0Nsj/KjdrpHLxY/qbY2
	RVZw==
MIME-Version: 1.0
Received: by 10.52.95.74 with SMTP id di10mr12928440vdb.46.1331502367851; Sun,
	11 Mar 2012 14:46:07 -0700 (PDT)
Received: by 10.52.30.98 with HTTP; Sun, 11 Mar 2012 14:46:07 -0700 (PDT)
In-Reply-To: <4F5CAA16.3090209@dynamicdevices.co.uk>
References: <1331464418-6339-1-git-send-email-ajlennon@dynamicdevices.co.uk>
	<CACW_hTaHRCEGf5YqdCAh549KVquJJ8H6YUKNK5084ObURdRLQA@mail.gmail.com>
	<4F5CAA16.3090209@dynamicdevices.co.uk>
Date: Sun, 11 Mar 2012 22:46:07 +0100
Message-ID: <CACW_hTZXXb=3jjmi=hKYEL-_8fb0xQf-bGzQkRbhgtrvCo9xLA@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] Replaced libpng 1.2.47 recipe with 1.2.48 as source tarball no longer available from SRC_URI
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
X-List-Received-Date: Sun, 11 Mar 2012 21:54:50 -0000
Content-Type: text/plain; charset=ISO-8859-1

2012/3/11 Alex J Lennon <ajlennon@dynamicdevices.co.uk>:
>
>> Pushed, thanks.
>
>
> No problem Frans. Out of interest I thought the build environment was
> supposed to
> fall back to an OE/Angstrom caching server to ensure this type of thing
> didn't happen
> when the primary sources disappeared?
>
This depends on conf files and specification of the mirrors.
I haven't really build angstrom for oe-classic; our latest product is
build around minimal
IMHO better configurability and dragging in less stuff I do not need.
The system I'm building for is quite resource constrainged.

Maybe the old sources are not in the mirror.
And often people do not discover this because the file is in the
downloads dir. I only noticed the libpng defect when I was building on
a different machine and didn't have our local mirror configured.

As it stands most people use oe-core, but some of us are still bound
to oe-classic for maintenance purposes.

Enjoy! Frans


