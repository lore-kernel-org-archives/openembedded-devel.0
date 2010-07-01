Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OUP74-0003zE-BE
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Jul 2010 21:07:55 +0200
Received: by iwn34 with SMTP id 34so2368771iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Jul 2010 12:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=z9vjP4fWA8j+qyuiSSTFuUQ3ZUQN7r1zW8DOl8ZxPr0=;
	b=a7q1LLf+XhxfqgSssiteWWEss5JQk64s0GlnMY9E6WjRziXKZd3FnWZdgTLZ50Lupx
	V40cJmarmgORsM4XJVOB5HSSrVi/e8lnzDGKjSrBD8rrX/DRRjG1pn2TlWMAjWWX0OzB
	d58dB6dZqLWiRzP90z1OaPHrrAbwT5cQZobnc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=ixzMToMcS+DmbukYdtyz5FsDO7mEO7lMWKuVTz9TdrduftL21PgoWJO3T3ENTuf13q
	y0BQlDkG4s/kPxoj1+WhxjlfZGKRk7DxGVfvu5lMUoDP8SDbATXqawKCSMtm+85UGg3G
	TOGFh8W37F0UuUr3IRNjzlIDQAG72SHuPWCVw=
Received: by 10.231.10.137 with SMTP id p9mr9060464ibp.91.1278010990316; Thu, 
	01 Jul 2010 12:03:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.14.131 with HTTP; Thu, 1 Jul 2010 12:02:50 -0700 (PDT)
In-Reply-To: <4C2C55B4.2080601@jak.nl>
References: <4C289700.1000409@jak.nl> <4C289A86.5010508@freyther.de> 
	<AANLkTinkr9YuMo0z6wxJuIPfcPLzJ6TPYuzPWsInAA8N@mail.gmail.com> 
	<4C2C55B4.2080601@jak.nl>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 1 Jul 2010 12:02:50 -0700
Message-ID: <AANLkTikrOBfLSjzjkBsyTzfi9HvoMnJfHWwXDxDK4a2g@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: FeeBSD as OE build host
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
X-List-Received-Date: Thu, 01 Jul 2010 19:07:55 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 1, 2010 at 1:45 AM, Arjan <arjan@jak.nl> wrote:
> On 28-6-2010 19:24, Khem Raj wrote:
>>
>> On Mon, Jun 28, 2010 at 5:50 AM, Holger Freyther<holger+oe@freyther.de>
>> =A0wrote:
>>
>>>
>>> On 06/28/2010 08:35 PM, Arjan wrote:
>>>
>>>>
>>>> Hello,
>>>>
>>>> I read here
>>>> [http://wiki.openembedded.net/index.php/OEandYourDistro#FreeBSD] FreeB=
SD
>>>> was/is supported as build host. Is this still true?
>>>> Are there pitfalls or other prerequisites beside the ones mentioned?
>>>>
>>>
>>> I haven't tried for quite a while so there might be some more issues
>>> again.... The most common thing is replacing cp -a with cp -pFR (IIRC).
>>>
>>>
>>
>> there is a branch koen/darwin-host-fixes which should also have some fix=
es
>> that could help you. I have not tried mac osx or freebsd build in long
>> time.
>>
>>
>
> OK thanks for the hints. I will give it a try.

and please update the wiki if you find something new that needs to be docum=
ented

thanks
-Khem

>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


