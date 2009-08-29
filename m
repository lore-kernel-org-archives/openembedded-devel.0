Received: from [209.85.220.224] (helo=mail-fx0-f224.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1MhXSH-0007w2-Vx
	for openembedded-devel@lists.openembedded.org;
	Sun, 30 Aug 2009 01:35:34 +0200
Received: by fxm24 with SMTP id 24so1188030fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 29 Aug 2009 16:17:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=nwbGZEyBT87pLXTc/gkQdoMvI9qYDe8tmbmhIp9dd10=;
	b=XWygRXg3eyvhXaYlEdHpWQniU3U4OGgBsvhOAz5x4K7upPnixxtHr+yyR8bf40PgYp
	MFCLy7XQoungDyt/2/Fgv834PdlBkvtZKFtBLjjZeEPsZS0GpmaGrZ+BwuGZjkTuVL5B
	H8hOxTnHiw2rfGTum6p+DwEB52swdTR7MVa6E=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=fMKhTfCi1DPR3lq/ZsqSyjTFU2EiN0TVQCi19RTmxdXfgJfOiF7ivvwOhR4phU2MGK
	z/3dPgmUDIbOmjrFbMd8xr59rnwMrsg99ptcnQulnYCFwWdWK2dXzIVEyBsy5iRFikVJ
	zp7/CQ0nZOOw8f/fTsGljLrX5SuvZw6y/9srU=
MIME-Version: 1.0
Received: by 10.239.139.132 with SMTP id t4mr272203hbt.88.1251587832442; Sat, 
	29 Aug 2009 16:17:12 -0700 (PDT)
In-Reply-To: <f96d234e0908291351p1843c1ddw4d5e7f8523f21dd0@mail.gmail.com>
References: <f96d234e0908291351p1843c1ddw4d5e7f8523f21dd0@mail.gmail.com>
Date: Sun, 30 Aug 2009 01:17:12 +0200
Message-ID: <c384c5ea0908291617k3e6f3de0j6bfbc0392f1c1737@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: getting back to < 2MB rootfs with mtd-utils
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
X-List-Received-Date: Sat, 29 Aug 2009 23:35:34 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello Cliff,

On Sat, Aug 29, 2009 at 10:51 PM, Cliff Brake<cliff.brake@gmail.com> wrote:
> - minimal-image is not all that minimal any more
> - micro-image is better
>
Better how?

> I work through this, but if anyone has good ideas, they are welcome
>

We suffer from feature creep. A good idea would be to define what goes
in the images, so that we have a few base images people can use as a
basis, and that don't suffer from the developer expansion drifts. :-)

For example:

minimal-uclibc-image:

- Tries to be < 4MB total for boot loader, kernel and rootfs.
- Uses uclibc.
- Uses static device nodes.
- Typically read-only rootfs.
- Should be able to run a few applications.

etc etc.


Regards,
-- 
Leon


