Received: from mail-pw0-f53.google.com ([209.85.160.53])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dothemango@gmail.com>) id 1NSSEL-0003T7-O7
	for openembedded-devel@lists.openembedded.org;
	Wed, 06 Jan 2010 10:31:08 +0100
Received: by pwi18 with SMTP id 18so10902049pwi.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Jan 2010 01:29:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to
	:content-type; bh=H9RMY+ve/8OT+luVXxRtJmoRYK/khQoTbEmp97pPnII=;
	b=DyCkclJlu6+G2dxKxGkkOIk7LeobuYzBM/UfKy3v+F4yy/nBzomADx0FHSiyEdlBPz
	5n3qXWa/1IcfGC4i2jW3NOhuLXHxsEWKPr9G45S3HS0grCSVwSWEPvdVQuQCHwSyoP9z
	hOUzdBRB0agFJe4MwDaSxrXqC/vxm0KEros2s=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	b=ZjXJ3njRwEspVew7Tso2nkHHRFrqPk7dnBgfMFCe0nwsh8VuzbhkGxJ7vZiO4zd+EG
	fj0IT4g2nF0wlssJd9OnpA/4ggPhb8i0qswpThY5l8IALkATqzJ3WY0ZrXYyCXwsGE9T
	ud1X9t52u3OBhjDQukH8LJIAZ0LbNtq1PjW+w=
MIME-Version: 1.0
Sender: dothemango@gmail.com
Received: by 10.141.89.15 with SMTP id r15mr1796689rvl.252.1262770140700; Wed, 
	06 Jan 2010 01:29:00 -0800 (PST)
In-Reply-To: <20100105182044.GB21048@gmail.com>
References: <325d766d1001050900y3eef724eu5eb68fc04ec969d7@mail.gmail.com>
	<20100105182044.GB21048@gmail.com>
Date: Wed, 6 Jan 2010 10:29:00 +0100
X-Google-Sender-Auth: 6724ec94cd9ac525
Message-ID: <325d766d1001060129j7b63dd3bj1f4e039ff38513e7@mail.gmail.com>
From: martin mangard <martin@mangard.at>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.53
X-SA-Exim-Mail-From: dothemango@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Error building gcc-cross
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
X-List-Received-Date: Wed, 06 Jan 2010 09:31:09 -0000
Content-Type: text/plain; charset=ISO-8859-1

> gcc 3.4 will not build libstdc++.so.5. You have to use gcc 3.3
> try to build one of those. They may be rusted over a long time.
> You can also take a prebuild ipk
>

I tried to build other versions but they also failed with the error:
"./read-rtl.c:653: error: lvalue required as increment operand"

After a little Googling, I found out that this is a common issue
caused by an incompatibly between gcc 4.3 and gcc 3.3. It is not
possible to build gcc 3.3 with gcc 4.3.

A possible solution for my problem, which is also mentioned at
http://en.gentoo-wiki.com/wiki/VirtualBox would be to just build
"libstdc++-v3" which seems to be build able with gcc 4.x.

But for today I think the prebuild libstdc++.so.5 will do the job as well ;-).

thanks for your help

Martin


