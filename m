Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1P3VUL-0000ps-IT
	for openembedded-devel@lists.openembedded.org;
	Wed, 06 Oct 2010 17:01:02 +0200
Received: by wwb17 with SMTP id 17so200465wwb.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Oct 2010 08:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=7CobFnXQm4NgJlGbKTFB8dWxccyBwjPOe9z6w6goU/4=;
	b=ru5z6W3HDbGlxUvPkweP3/cT1LWqHVl1nAdxeYPBAvUv5lVlmbpyewnayHIszU94ki
	JHqzL7Jt3zxoFHgP5dcEMCV42u0EPbG4mBp5dLsNfmYDJo+OF8D14sterfGcGkNifMHy
	w0J+abMq6CVLWNqup2ErNYutXz6T9DN9VS6rg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=PXeh2zPS+722XhplxXukUZAxAS1rgxOodkYzY48ii4pYNUhek5ej3Rsv6CQagr3x0z
	glW221CnkNayINjMi1hcWE86ckRTwr8QxlddZUJYqJ9HJTyiWyd7q5ij2rYxOy/n+4K8
	R8UgJgn7tgKH/KHhxe7SGOnQ9enUVHQMiljwo=
MIME-Version: 1.0
Received: by 10.227.142.139 with SMTP id q11mr11155854wbu.103.1286377240293;
	Wed, 06 Oct 2010 08:00:40 -0700 (PDT)
Received: by 10.227.141.70 with HTTP; Wed, 6 Oct 2010 08:00:39 -0700 (PDT)
In-Reply-To: <20101006145051.GK3264@jama>
References: <4CAC8B19.9050502@gmail.com>
	<20101006145051.GK3264@jama>
Date: Wed, 6 Oct 2010 17:00:39 +0200
Message-ID: <AANLkTimJ3fCOZopbAKG7UvszQGNMfnaq1HnAB6mKqmu_@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.43
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: /usr/bin/fop ???
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
X-List-Received-Date: Wed, 06 Oct 2010 15:01:02 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Oct 6, 2010 at 4:50 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Wed, Oct 06, 2010 at 03:43:37PM +0100, Arigead wrote:
>> trying to "bitbake tangogps" and getting errors about /usr/bin/fop
>>
>> I'm searching for a solution but not getting too far with that. I'm not
>> sure why and embedded verison of tangogps would require Apache FOP but
>> I'm on the wrong end of a learning curve.
>>
>> Cheers for any pointers which would get me over this hurdle.
>
> what about providing whole log.do_compile and log.do_configure to be
> sure which recipe has this problem (I see libx11 in log, but you're
> talking about tangogps).
>
> Regards,

In case it fails in libx11 then it's probably because of:
http://cgit.freedesktop.org/xorg/lib/libX11/commit/?id=e14273f44c1501ab51db4adcb83b18a1073787d8
you can force fop disabled with --with-fop=no in EXTRA_OECONF or try
to fix XORG_WITH_FOP (to ignore fop on buildhost and look only in
sysroots)

Regards,


