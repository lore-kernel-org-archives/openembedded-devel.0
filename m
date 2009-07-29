Received: from [74.125.92.149] (helo=qw-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1MWDZP-0002Aa-3K
	for openembedded-devel@lists.openembedded.org;
	Wed, 29 Jul 2009 20:08:07 +0200
Received: by qw-out-1920.google.com with SMTP id 4so507734qwk.36
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Jul 2009 10:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=herF9EB4fIM+LsgmtNHwiqCH7muvMnQa6JggutIamR8=;
	b=odu1VMW17Lq731hCjTBQRQs0d2hLg6Rbnykh/1vtCWXGiDbjQzpybauEbtsc59XrOD
	WxcGZ1wWr64bh0I1EySqyy8hHtwZxwUcbOp71BB0u1GHtCxpr5l2QEEW9N9M8ZzTh2Ir
	AVFpruhVLxoSnLZu8kBsXIK6zS22McU2btmr4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=Je81d4HCsZNUeHqMzqSODq4jEvShBXjUDcCNSEZ0bncx8ESWZEr3KTddTxGF/PPvsw
	K+vwyhqSQDtdycHaw8bvYZVTstzG5+9Z2BsGtfaBteGF/jhkTZiqkTJ1PKwpROKvpPIL
	7Lc6Uz+AFo2LIS2cCSyKqV0TIu/gPr3hCiOtU=
MIME-Version: 1.0
Received: by 10.220.86.131 with SMTP id s3mr167507vcl.16.1248889991731; Wed, 
	29 Jul 2009 10:53:11 -0700 (PDT)
In-Reply-To: <20090729082338.GA30288@mi.fu-berlin.de>
References: <200907271203.05641.holger+oe@freyther.de>
	<20090729082338.GA30288@mi.fu-berlin.de>
Date: Wed, 29 Jul 2009 10:53:11 -0700
Message-ID: <19c1b8a90907291053s1f246f0as759e219d65e207a1@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] gcc: Pass --enable-tls=no on uclibc builds
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
X-List-Received-Date: Wed, 29 Jul 2009 18:08:07 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On Wed, Jul 29, 2009 at 1:23 AM, Henning
Heinold<heinold@inf.fu-berlin.de> wrote:
> Hm.
>
> might we easier we relay on the tls.m4 marco as before which finds out if the libc is tls-aware. It was broken for cross-compiling and shared library,
> but there are fixes now available according to this thread:
> http://www.nabble.com/Improve-TLS-link-test-for-cross-compiling-td24312975.html
>
> I have adopted this patch to fix the tls.m4 macro for pulseaudio which now works nice.

You need to backport tls.m4 change to gcc version you are using as
well so that libstdc++
is build correctly. Then there might be other packages like
latest util-linux-ng etc.

>
> Bye Henning
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


