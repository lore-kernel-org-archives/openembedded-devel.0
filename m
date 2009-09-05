Received: from [74.125.92.146] (helo=qw-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Mk2Fa-000607-Jk
	for openembedded-devel@lists.openembedded.org;
	Sat, 05 Sep 2009 22:52:46 +0200
Received: by qw-out-1920.google.com with SMTP id 4so406494qwk.36
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 05 Sep 2009 13:33:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=SIbnynCnO5qjqzqZk920KlaG+CtqKtgnVCQpKZS1J7o=;
	b=KjC3VinSsn81msrg0oZBdK+W4YdQhDDsXmLed3H4CehQhVay5zcCzz6n7ymoMF8peS
	0Sc/P924A5H/+NTKYILJy4+7GGhkrGFUXYvGQSENM3fYJtpPbW11/vS7lk6vm4/VPqCz
	KE1Kxu3pnXc6DtVI0eU17dsFQ888Hfc9Zvo2U=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=eG4rr7V4tT7PKGU2jMl7CKV0mIPdTMWB1DxxkSkzCYJZNPzm2a7cBV1B4bZ8d+DUK7
	nqCmMyWceJzq/o+cXvNcYuC/ewiImyMj9oHa1Dd2vBqA/8XdISkVdaQm1Vl/fqjlbOBW
	lxRQLw+we9srcWmoEO/krW+NCupdQjdx5qo+Q=
MIME-Version: 1.0
Received: by 10.229.53.76 with SMTP id l12mr3476138qcg.105.1252182820823; Sat, 
	05 Sep 2009 13:33:40 -0700 (PDT)
In-Reply-To: <1252181038.4490.142.camel@lenovo.internal.reciva.com>
References: <1252105390-3800-1-git-send-email-raj.khem@gmail.com>
	<1252139910.22587.317.camel@kc.internal.reciva.com>
	<19c1b8a90909051055o2788f221y7cc272588ab726cb@mail.gmail.com>
	<1252181038.4490.142.camel@lenovo.internal.reciva.com>
Date: Sat, 5 Sep 2009 13:33:38 -0700
Message-ID: <19c1b8a90909051333o447b8cc0mfc1e91a0de240847@mail.gmail.com>
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
X-List-Received-Date: Sat, 05 Sep 2009 20:52:46 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 5, 2009 at 1:03 PM, Phil Blundell<philb@gnu.org> wrote:
> On Sat, 2009-09-05 at 10:55 -0700, Khem Raj wrote:
>> On Sat, Sep 5, 2009 at 1:38 AM, Phil Blundell<philb@gnu.org> wrote:
>> > On Fri, 2009-09-04 at 16:03 -0700, Khem Raj wrote:
>> >> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-e 's,/usr/,${layout_exec_=
prefix}/,g' \
>> >
>> > Why not ${prefix}?
>>
>> Nothing against it. I just used whatever distro conf override said.
>> prefix and layout_exec_prefix are same as bitbake tells me.
>
> It's generally a bit unwholesome for recipes to be using the layout_xxx
> variables. =C2=A0Semantically, it sounds like ${prefix}, or maybe
> ${exec_prefix}, is probably what you want.

OK I will use exec_prefix

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


