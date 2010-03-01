Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Nm07n-0006Sv-8I
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Mar 2010 08:33:08 +0100
Received: by gyd5 with SMTP id 5so1005015gyd.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 28 Feb 2010 23:30:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=/0PtB8xcTLRNIQEs6BBGlj1NhGNFTyuqY1gtd6DPOI4=;
	b=mnfqxNLogBvtMWIXioavWol5Kop33zkW3cowR1fpZ6zDrWmpc5TVqMNtYLMQRh4NIm
	GCuMqBmooHgIIsKkr5clcHzwfT6BzNXoM6LonUb5x6BfO4MI4aOGPkXgVb0gMecfd+dI
	JiAprtoKVVOwEru58Y9Ozf+IkBLoIpYuzj1PI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=jU6tneW74q6bDuUDY7Vi9YABl3cN+95W+wERuQPueMtW0rBVmdQnZ2P3IRI4JkY/5c
	mCC8BsEENrtdyU6hFp7Y54LC/5pfxqdlRjmPTVRDcJBNfL7K59zHj6/lBUyyxqreB8Q4
	4OtNLRT25Cjh5bkP683+r7AKwRE+Qem+BBBs0=
MIME-Version: 1.0
Received: by 10.100.235.38 with SMTP id i38mr5366301anh.178.1267428617195; 
	Sun, 28 Feb 2010 23:30:17 -0800 (PST)
In-Reply-To: <1267392928.13054.1.camel@andromeda>
References: <ac9c93b11002281139g6963e753w970c97002611c78c@mail.gmail.com>
	<1267392928.13054.1.camel@andromeda>
Date: Mon, 1 Mar 2010 08:30:17 +0100
Message-ID: <ac9c93b11002282330w982f587p739bb0d1f06cbbd6@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_PASS autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC} glib-2.0 cleanup
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
X-List-Received-Date: Mon, 01 Mar 2010 07:33:08 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/2/28 Michael 'Mickey' Lauer <mickey@vanille-media.de>:
> Am Sonntag, den 28.02.2010, 20:39 +0100 schrieb Frans Meulenbroeks:
>> We have 26 glib-2.0 recipes (and 8 native ones). (see ls below)
>> Only a few versions are used (see also the grep below)
>>
>> for glib-2.0:
>> "2.12.12"
>> "2.16.4"
>> "2.18.3"
>> "2.20.3"
>> "2.22.1"
>> "2.22.4"
>> "2.6.4"
>> "2.8.6"
>>
>> for glib-2.0-native:
>> "2.16.1"
>> "2.18.0"
>> "2.22.1"
>> "2.22.4"
>>
>> Both include the last two versions
>> Proposal is to remove all versions that are not used.
>>
>> How do people feel about this?
>
> Sounds good to me, althoug I'd recommend not removing them but just
> moving them out of sight, i.e. in an 'old' folder. That way we could
> please both the lets-keep-everything-no-matter-how-rotten and also the
> lets-strive-for-few-high-quality recipes.

Count me in for the high-quality camp :-)
We could put the legacy recipes in a legacy overlay.
That way they are still there, but if you do not need/want them you
can exclude them.

FM


