Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1OKbUF-0002zG-Un
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Jun 2010 20:19:21 +0200
Received: by gwb20 with SMTP id 20so77133gwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Jun 2010 11:15:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=GLNW+s1pbFbN14KueFJbxA1kSRxWLgsA8g4JbPhX0wo=;
	b=jV1p1bff2HINcgp3rTA1xOKjSs/2jsFF/LFfKj1isi0bsmtmpGSSwDAi8DkQAwqqzx
	2hMVLJdCBWN+4kTxB4iWgeFT77Vo4zb60EsEhWby29lgBu1gWAvZp+a+0cp2uN2jItwS
	s5aqCqk9vDdm2YQhlJquayEtZ78+48qta50bI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=qFSWsKCnfxQYqoBF5pOgjJ85X62v/Bur1YgWjhsPtKDaGY21+67mQSfQabVdYFgJY7
	EJ/eHubunUBo05uP8i7NZiUYT+ZrhgxYYUt0tj6ryVKfpudUhzLfSn1e1Q6UCRsCxu9v
	4pCKgLxIXwfhItYnJQepSAn1AOCXIhxaw1PhE=
Received: by 10.224.53.155 with SMTP id m27mr6364777qag.181.1275675302313; 
	Fri, 04 Jun 2010 11:15:02 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.3.133 with HTTP; Fri, 4 Jun 2010 11:14:42 -0700 (PDT)
In-Reply-To: <4C093879.7020109@mentor.com>
References: <AANLkTikyR0VhEu_Ex4JcaJ1bDHLK2Rh6NyVF801VtlVy@mail.gmail.com> 
	<AANLkTimKfsHgJIGlyzsX9tneLob9uyQo5riVZ5mbxqQj@mail.gmail.com> 
	<4C093879.7020109@mentor.com>
From: Chris Larson <clarson@kergoth.com>
Date: Fri, 4 Jun 2010 11:14:42 -0700
X-Google-Sender-Auth: JyUofuCnlkuXcFpK4nWe5_guOkY
Message-ID: <AANLkTindt22pJT2QVVYhPOvK0JVUlz3EM341JVBVmY6f@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH 1/2] Rename url params patch=<ignored>/pnum=<n> to apply={yes, no}/striplevel=<n>
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
X-List-Received-Date: Fri, 04 Jun 2010 18:19:21 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Jun 4, 2010 at 10:31 AM, Tom Rini <tom_rini@mentor.com> wrote:

> Chris Larson wrote:
>
>> On Fri, Jun 4, 2010 at 5:52 AM, Frans Meulenbroeks <
>> fransmeulenbroeks@gmail.com> wrote:
>>
>>  Apologies for not replying to the original message, but that one is
>>> already deleted.
>>>
>>> Just bumped into this after doing a pull.
>>>
>>> A few comments:
>>>
>>> I would suggest if doing something like this that it is announced
>>> somewhat more explictly so people are well aware of it. Since it was
>>> brought as a patch it escaped my attention, and in fact it is not only
>>> a patch but also a change of policy.
>>>
>>>
>> Personally, I'd think people should always read any patches to the main
>> classes, including patch.bbclass.  Any change to a core class or config
>> file
>> has the potential for large impact, and it would benefit everyone to be
>> aware of those things.
>>
>> That said, I'll be sure to send out an RFC to try to draw more attention
>> to
>> it next time around.
>>
>>
>>  Also I'd like to suggest to complete the change by also updating the
>>> manual, otherwise this could become confusing.
>>>
>>>
>> Yes, I know, I intended (and still do intend) to update the manual, but
>> haven't gotten to it yet.  I apologize for the delay.
>>
>
> Maybe we should start saying "no changing how stuff is documented WITHOUT
> changing the documentation".  It's not like we keep the docs in some hard to
> edit format and I think other projects work the same way.


That sounds like a good policy to adopt.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

