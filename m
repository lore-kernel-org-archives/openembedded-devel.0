Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1OUSBF-0005Ec-D4
	for openembedded-devel@lists.openembedded.org;
	Fri, 02 Jul 2010 00:24:26 +0200
Received: by pvg13 with SMTP id 13so1130560pvg.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Jul 2010 15:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=W//MuGTJOBn79Mh65xKOMU6ivUQL6MFIIi2EDPIPNjA=;
	b=WNOBYq9FWezbBtTwpaBu2Pe/L6Sc86f1SXg6FO5X1eNu1HdPziQcIBZe1j2UgfdEd+
	EjnGCUJ6BkAEn0JQ57Sb4krOMSrBKr6iIfUDOlSJ6O3V/hYL427Zgr+x3Q7B5RnutLMJ
	AwLTiqDDCfbRIRISUlPWT5wnjrJ2ef+vF/uTU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=u7xMJenHw1Krwk+DYVSNWvXXv/m7Faei9g1l6YQ1AyAEMxH4tQpBU2Ivc+sxhRMA2p
	FFN2Hlm++pZok6VbJ44CxLkMnigxd7fzkK78f2Ow1SAKbRUdh2Okg3hqTArq0bzolcDI
	mZbMfbcT5AqXTSaKoo/Kba/7rGCy2/E4v4FkU=
Received: by 10.142.215.19 with SMTP id n19mr145909wfg.258.1278022779247; Thu, 
	01 Jul 2010 15:19:39 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.142.177.19 with HTTP; Thu, 1 Jul 2010 15:19:18 -0700 (PDT)
In-Reply-To: <4C2D13AE.9030903@mentor.com>
References: <20100701172428.3b2ac88e@xora-desktop.xora.org.uk> 
	<i0iv84$7qt$1@dough.gmane.org> <4C2D13AE.9030903@mentor.com>
From: Chris Larson <clarson@kergoth.com>
Date: Thu, 1 Jul 2010 15:19:18 -0700
X-Google-Sender-Auth: a_ubI0ftT9xC10swHoDOC97oHWI
Message-ID: <AANLkTilir7tASUT09MrRG5ccG2gYvhLEGFLjwEIUd0sz@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.175
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: USE flags mumbling
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
X-List-Received-Date: Thu, 01 Jul 2010 22:24:27 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Jul 1, 2010 at 3:16 PM, Tom Rini <tom_rini@mentor.com> wrote:

> Koen Kooi wrote:
>
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>>
>> On 01-07-10 18:24, Graeme Gregory wrote:
>>
>>> We already have BBCLASSEXTENDS which modifies ${PN} of a package and
>>> can use overrides to change behaviors of recipes.
>>>
>>> Maybe USE flags could be implemented in a similar fashing.
>>>
>>> DISTRO_USE = "nossl nox11"
>>>
>>> EXTRA_OECONF_append_use-nossl = "--disable-ssl"
>>>
>>> ${PN} of the recipe becomes XXXX-nossl
>>>
>>> Thoughts?
>>>
>>
>> Just that USE flags shouldn't be used if seperate recipes can solve it
>> as well.
>>
>
> If I may, I'd like to articulate what I believe to be the technical
> argument behind this statement.
>
> One of the issues with some form of USE flags, and I believe this is one of
> the big ones for Angstrom as well as any other public feed publishing
> distribution is that having a single recipe that does different things based
> on variables makes maintaining their feed (and allowing users to publish
> their own compatible feeds) a nightmare.
>
> This is because there isn't any form of use flag checking (a simple case of
> 1:1 or the more complex case of flagA needs flagB and flagC doesn't care
> about flagD -> flagZ).


Hmm, good point, dealing with dependency between recipes with specific flags
set or unset gets ugly fast.  *ponders*
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

