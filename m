Received: from [209.85.221.200] (helo=mail-qy0-f200.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1MjzmR-00015v-4o
	for openembedded-devel@lists.openembedded.org;
	Sat, 05 Sep 2009 20:14:31 +0200
Received: by qyk38 with SMTP id 38so623376qyk.27
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 05 Sep 2009 10:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=QAklvI2ngvuU6YmO/vNU0kW1k4d53V7E3xijbeOOCQQ=;
	b=N98E/xxBOoGz34vjPnle5xnJpdxRVuQWOEJTxRRBoWXA3QAK/y7CEYRohqHQjVZ2nw
	ejYE6FufP0bjENB2gqw3ZSc6x8K0fJPB2oTef4RjbzLtIHZdC5/FdxK3arp68j1c4Baf
	6tc7KssAdhFc26hiyN0fIEhzzzUOsQkeRBiG0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=d3pEs7dTy+870O3hPfwIba2G97F7GpfCcUAl73iab2THVMm/cvIef6/DDHAgGrVl9t
	AmYrQLl5WhXfdfZp0HuD0DlYQbntHMu/JIfT+UaRrCu/O6B8vKj+mWx06VXLQ3CE/k80
	swBV2Xdzsqw8bWnTTQoTGltOegrbW2cY7vTAM=
MIME-Version: 1.0
Received: by 10.229.53.76 with SMTP id l12mr3461829qcg.105.1252173324067; Sat, 
	05 Sep 2009 10:55:24 -0700 (PDT)
In-Reply-To: <1252139910.22587.317.camel@kc.internal.reciva.com>
References: <1252105390-3800-1-git-send-email-raj.khem@gmail.com>
	<1252139910.22587.317.camel@kc.internal.reciva.com>
Date: Sat, 5 Sep 2009 10:55:23 -0700
Message-ID: <19c1b8a90909051055o2788f221y7cc272588ab726cb@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] perl_5.8.8.bb: Fix compilation when bindir is not /usr/bin
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
X-List-Received-Date: Sat, 05 Sep 2009 18:14:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 5, 2009 at 1:38 AM, Phil Blundell<philb@gnu.org> wrote:
> On Fri, 2009-09-04 at 16:03 -0700, Khem Raj wrote:
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-e 's,/usr/,${layout_exec_pre=
fix}/,g' \
>
> Why not ${prefix}?

Nothing against it. I just used whatever distro conf override said.
prefix and layout_exec_prefix are same as bitbake tells me.

>
> p.
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


