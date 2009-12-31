Received: from mail-yx0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1NQI2u-0004Nj-P5
	for openembedded-devel@lists.openembedded.org;
	Thu, 31 Dec 2009 11:14:24 +0100
Received: by yxe5 with SMTP id 5so7908000yxe.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Dec 2009 02:12:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=ZTeyVJXG60Zr9wPawZsVh+AGBqkU/AMF1UHB309E9lk=;
	b=lMEzLBVcn3Mxj1gM8kCnW5oyUQRr2mtIJckRu+9MXgzNZ/eKBavG2mbcoVLHZI0IN2
	uwFZQ/iTor87w/+NPVsislaWWRyXDzpsEoE71h359VnmqG9JlGsT7KMdxt25sLVoZgMB
	FnMtZXImVvq2dX5SmGHynRiR7XLYYCXI7/BT8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=sc4jjLPMwZie3FvDjbTMZVuyv9EA95H3YBwHWVBl7qyLFIG5p892UlwJ45hCufMigT
	9vfcs4cn+DzZQa/dY7cIwlAUlhRP1k6SU2+j7fLdweSb5AjqZilDBSytlegRPEfeyrPE
	zrrIfZkVKcI1MUeWKzEDcje7pqFAQDBR9H6gI=
MIME-Version: 1.0
Received: by 10.101.139.20 with SMTP id r20mr13133458ann.100.1262254340919; 
	Thu, 31 Dec 2009 02:12:20 -0800 (PST)
In-Reply-To: <c384c5ea0912301137r4990f109kd0db648bd2b1a546@mail.gmail.com>
References: <c384c5ea0912290715l24b705fat6700077741b1cc5b@mail.gmail.com>
	<hhdipd$25q$2@ger.gmane.org>
	<c384c5ea0912291144p3c800d9fq4975f94494a04e1f@mail.gmail.com>
	<19c1b8a90912291442q426ddd95n9acff7b8df592092@mail.gmail.com>
	<hhf457$n7h$2@ger.gmane.org>
	<c384c5ea0912301137r4990f109kd0db648bd2b1a546@mail.gmail.com>
Date: Thu, 31 Dec 2009 11:12:20 +0100
Message-ID: <ac9c93b10912310212m11a02f01g3831f92b4473d11@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.210.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Move IMAGE_BOOT stuff into distro's?
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
X-List-Received-Date: Thu, 31 Dec 2009 10:14:24 -0000
Content-Type: text/plain; charset=ISO-8859-1

2009/12/30 Leon Woestenberg <leon.woestenberg@gmail.com>:
> Hello,
>
> On Wed, Dec 30, 2009 at 9:48 AM, Koen Kooi <k.kooi@student.utwente.nl> wrote:
>>>> OK understood, apparantly we want to have a generic image base
>>>> containing udev, a login, shadow etc.
>>>> that is distro-indepent.
>>>>
>>>> Can we remove that from the image class, and move into a
>>>> image-boot.inc or something?
>>
>> What's the problem with setting 3 vars to "" in your helloworld image?
>>
> Let me counter that question: What's the problem with bitrot and poor
> design if the end result still works?
>
> Of course it's easy to add 3 vars, that's not my point. The point is
> those 3 vars do not need to be hard coded by
> default in a class.
>
>
> Design:
>
> The class implements the work to be done.
> The recipes describe what work has to be done indirectly.
>
> Design problem:
>
> The class now contains hard-coded package names directly.
>
> The image recipes have to know the internals of the class in order to
> revert to fully customizable behaviour.
>
>
> Of course I could stop being frustrated about this and happily add 3
> vars to my image and not care about this anymore.
>
>
> Regards,
> --
> Leon

Leon, I agree with your line of reasoning. Classes specify the how and
recipes specify the what.

May I propose to put this on the agenda of the TSC ?

Frans.


