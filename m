Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PBM7A-0005oc-4O
	for openembedded-devel@lists.openembedded.org;
	Thu, 28 Oct 2010 08:37:33 +0200
Received: by gyf3 with SMTP id 3so1028102gyf.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Oct 2010 23:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=npL2R8Z85dP2zza3dbemkV8ahKP+eNGxFQTkr9Fz7z4=;
	b=SLzGCDSHWZvHwC7Is47b9MczCswArxiBMNF7L9pGIB8sPW4b81zEo9/kQBp8LBigI5
	J8BXKL6EkKzEzC2Q/LYGYljRs7mHBJecIPEeQBeiJD60v8dfPhkmAoa0UPVadNhMeJ0I
	ejTxJZifnjSBG4/ESRJqyHscWmwXzY3GabVjo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=efFMjaGS2zsIwesCjI8fmpveTAxF3qJwQnLaRHIUDjHewGWNvIRI/a/QJycLT9nhYt
	qvY+jYDWHG2earsuM9HwrMVL6x/5zraI4VlOz00TdvXShqJbSN2StsBEd8g6Y6bA2N6t
	hyGcSsDC5jEUwzBIjuZkWv9KkjxtSPg4dM4rc=
Received: by 10.90.2.20 with SMTP id 20mr2269241agb.69.1288247804652; Wed, 27
	Oct 2010 23:36:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.90.105.8 with HTTP; Wed, 27 Oct 2010 23:36:24 -0700 (PDT)
In-Reply-To: <20101028062422.GJ3311@excalibur.local>
References: <4CC14738.9070309@nedap.com>
	<20101028062422.GJ3311@excalibur.local>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 27 Oct 2010 23:36:24 -0700
Message-ID: <AANLkTim8XTQBvv0vsZ6w4RwFWHDC3cnxa-NAa7BZcZUK@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] cacaoh: patches to get do_install do its work
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
X-List-Received-Date: Thu, 28 Oct 2010 06:37:34 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Oct 27, 2010 at 11:24 PM, Stefan Schmidt
<stefan@datenfreihafen.org> wrote:
> Hello.
>
> On Fri, 2010-10-22 at 10:11, Jaap de Jong wrote:
>> From 60a5f60af4ad65112452f98d99350fce45332e8e Mon Sep 17 00:00:00 2001
>> From: Jaap de Jong <jaap.dejong@nedap.com>
>> Date: Fri, 22 Oct 2010 09:28:25 +0200
>> Subject: [PATCH] cacaoh: patches to get do_install do its work
>>
>> Signed-off-by: Jaap de Jong <jaap.dejong@nedap.com>
>
> This patch broke the openjdk-6 testing build for me. Openjdk did not compile due
> to missing header files.
>
> This is with angstrom-2008.1 so no libtool 2.4. I guess that you are using
> angstrom-2010 and therefor the 2.4 libtool?
>

I tested it with both 2.2 ad 2.4 libtools but what Enrico suggested
might be a better fix.

> I will start a fresh build on master instead testing-next now and then we need
> to see how we could handle this regression.
>
> regards
> Stefan Schmidt
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


