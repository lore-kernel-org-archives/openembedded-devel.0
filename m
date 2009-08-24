Received: from [74.125.92.147] (helo=qw-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1MfelI-0008QV-8p
	for openembedded-devel@lists.openembedded.org;
	Mon, 24 Aug 2009 20:59:24 +0200
Received: by qw-out-1920.google.com with SMTP id 4so1344048qwk.36
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Aug 2009 11:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=N1Gffx8OwDHVYlurzFArBJ7ZiRGLOOwZBvv0ner81Sg=;
	b=r+LCJ9vxGembXYvh2PhrmCgJV6VLFL2VNchgwXTHvKqMV/xp0yPJ827itZHQYe6gYU
	iBmT2dBsNn86mxapaKdVb0ehmRA+/eVkYtNXKrHUN/IGT64s6MllBroYcfVpNSwtHltj
	+c2QKkuCgh3O4Yqm7PhLFsewj54ZG6jJ84olY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=Mf7/blDVpJpeTbfOFcDdGrwzFe/qSysLcRRv1jKN27i3mTFzwZZ0OkqzFVA4/mXDyi
	7qUhRgHYOYflqxWkzO7GjhuvuoYpJV45WdPGOkJJNYC4ko+U/mw8rbQDLUZZwiMntDiv
	OJSSUkDXTK+E0tbzcI7+mBhB/GOPjPXmIkQGU=
MIME-Version: 1.0
Received: by 10.229.93.4 with SMTP id t4mr1098333qcm.93.1251139298957; Mon, 24 
	Aug 2009 11:41:38 -0700 (PDT)
In-Reply-To: <200908240848.32719.mickey@vanille-media.de>
References: <1251081101-18925-1-git-send-email-raj.khem@gmail.com>
	<200908240549.09079.holger+oe@freyther.de>
	<200908240848.32719.mickey@vanille-media.de>
Date: Mon, 24 Aug 2009 11:41:38 -0700
Message-ID: <19c1b8a90908241141r6dd31d9fo574da6e77d3494e1@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] base.bbclass: Replace os.system with subprocess call.
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
X-List-Received-Date: Mon, 24 Aug 2009 18:59:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On Sun, Aug 23, 2009 at 11:48 PM, Michael 'Mickey'
Lauer<mickey@vanille-media.de> wrote:
> As a general reminder, please avoid import statements in functions. They're
> just wasting cycles. Put them into global scope.

OK. I will redo this part.

>
> :M:
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


