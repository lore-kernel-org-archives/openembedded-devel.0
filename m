Received: from [209.85.218.217] (helo=mail-bw0-f217.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1N8w1Z-0001r2-Mo
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Nov 2009 14:17:17 +0100
Received: by bwz9 with SMTP id 9so3202534bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Nov 2009 05:15:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=QmefIR5Nqk8zFXwiKrjhdPni1OdL7Qn+heXcdAfo7fI=;
	b=A0RL98y0W839mdwks+DWY3bMyZ/6wl08x+EMMlpMNO2Ov/PWBbBwloZhI7paeChrqf
	4rLAnw2OAmLPlIWmXLU79ri3q1+ow6TC46Si3ARnz4jWnlXKmXqWefwbQETuKNgZE/xz
	IfXNCK0Ie7DdsKkGLc2998z7OewkCKx9RQG8o=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=FhDHmWTweQ0CrNBcMyV6ZM1Lz5udG3QbLuRezLitTEqye/0F1W3syIzR/3rvRDfLOE
	br5kq7J5J40a5Q+gz/GTy/gb0z6KfkkpmkgkQIesjL+Xjs4gDSlnVaK3ln+61l68t3hP
	EOOJd0IOs7t0okhtOsrcAqlZan3qUDABQ13cY=
MIME-Version: 1.0
Received: by 10.223.143.68 with SMTP id t4mr626961fau.20.1258118153612; Fri, 
	13 Nov 2009 05:15:53 -0800 (PST)
In-Reply-To: <20091111203332.GC11484@jama>
References: <1257959521.25369.393.camel@lenovo.internal.reciva.com>
	<20091111203332.GC11484@jama>
Date: Fri, 13 Nov 2009 14:15:53 +0100
Message-ID: <141020e30911130515v3c931de5ja0f7009a7d6931ae@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.218.217
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: OEDEM 2009 summary: Package management
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
X-List-Received-Date: Fri, 13 Nov 2009 13:17:17 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Nov 11, 2009 at 9:33 PM, Martin Jansa <martin.jansa@gmail.com>wrote:

> On Wed, Nov 11, 2009 at 05:12:01PM +0000, Phil Blundell wrote:
> > This was the last session of the OEDEM schedule and the number of
> > participants was much reduced compared to the previous ones.  Partly as
> > a result of that it was also very short.
> >
> > Key issue: opkg is the defacto standard for package management in
> > OE-derived distros but its quality is perceived as low.  What can we do
> > about this?
>
> Today I've "fixed" one problem we had with opkg in shr.
>
> opkg installs own version of update-alternatives
>
> its the same script as the one packaged as update-alternatives-cworth
>
> its installed to /usr/bin (update-alternatives-cworth is using
> /usr/sbin so in PATH is after version from opkg)
>
> I've patch for update-alternatives-cworth to use alternative which was
> installed last if there is no alternative with higher priority (see
>
> http://cgit.openembedded.net/cgit.cgi/openembedded/commit/?h=shr/merge&id=6c1ed757c1498aff5b4b1b876332d2981f0855a1
> )
>
> And it was really confusing to have 2 simillar update-alternatives
> scripts in image.
>
> So it should be removed from opkg as I did in
>
> http://cgit.openembedded.net/cgit.cgi/openembedded/commit/?h=shr/merge&id=376cca189eed7a13de5a348e630c0af274c4704b
>
> http://cgit.openembedded.net/cgit.cgi/openembedded/commit/?h=shr/merge&id=416f6e5f5cfa23f0b3ae731af5c2a1dcd1e27189
>
> or opkg should provide virtual/update-alternatives as distros are using
> preferred_provider for that already.


with update-alternatives removed from opkg-native I noticed that

virtual/update-alternatives-native defined in sane-feed-ipk.inc is not
installed at all before building any image, so created image is not
bootable, because there are missing links for busybox and kernel image etc.

where should be "DEPENDS = virtual/update-alternatives-native" to make sure,
that it is pulled before any package calls update-alternatives?

maybe tasks/task-boot.bb where is just virtual/kernel now?

Regards,

