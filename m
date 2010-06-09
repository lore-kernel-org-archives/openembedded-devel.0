Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OMF75-0006al-Uq
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Jun 2010 08:50:13 +0200
Received: by yxf34 with SMTP id 34so303125yxf.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Jun 2010 23:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=n9/iLN3CtfWWGf1N51A4u6SXP9ALIet/6l+b4cm7wOs=;
	b=xtiMaY6TIXH+ZrGaXGvI2dZLxPNKqgCFmwU59P5srVyZk/9eJW+g6AmbtRVNTp+YW/
	Yf1PyF+lzh/OK9WgiKzwQsGJb2J3iN2w+VZMVrcNPocYf/TjaK//4HpeaAzF7CLsEB7g
	0mHqJK7Paa0XYGDlf/Aah4dNi22254zG/ypmE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=pnhDTDU+oPrg4LsSzbkCBjPMOCfSHyHmHL7o7L+LBdSozWrTp/e6LLJr1052gqqbpK
	z+IaO+2EDL0KgyjUDB60Ovhxx7s8+llRyN0XesWXh3E4T4uhP3Fsw4fdJJUKkJBc+5LE
	1h5lku+Nsjin6PwjWRSvW+jL67/xXHtrujV5U=
MIME-Version: 1.0
Received: by 10.91.41.17 with SMTP id t17mr326306agj.6.1276065948245; Tue, 08 
	Jun 2010 23:45:48 -0700 (PDT)
Received: by 10.90.88.14 with HTTP; Tue, 8 Jun 2010 23:45:48 -0700 (PDT)
In-Reply-To: <4C0E5585.8010907@mentor.com>
References: <4C0D498A.4030709@mentor.com>
	<AANLkTilJrzCr73GBdsGFgxQl4Gn7FAGj3Aytx1IrzYpS@mail.gmail.com>
	<4C0E5585.8010907@mentor.com>
Date: Wed, 9 Jun 2010 08:45:48 +0200
Message-ID: <AANLkTilQAiax3HXMMKA6yfaM60nQi_0LWzLR-vtW81_4@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH, RFC] Add linux-libc-headers-native, make it default 	dep for native
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
X-List-Received-Date: Wed, 09 Jun 2010 06:50:13 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/6/8 Tom Rini <tom_rini@mentor.com>:
> Frans Meulenbroeks wrote:
>>
>> 2010/6/7 Tom Rini <tom_rini@mentor.com>:
>>>
>>> On some host distributions the provided linux kernel headers are too ol=
d
>>> to compile utilities we need[1]. =A0Given that we need these utilities =
to
>>> run things on the target the best solution is to provide
>>> linux-libc-headers-native. =A0Rather than get things into an inconsiste=
nt
>>> state, we make linux-libc-headers-native be a default dependency.
>>>
>>> [1]: A prime example of this would be mtd-utils-native and UBI
>>
>> I'd say this is heading in the totally wrong direction.
>>
>> Target code should not depend on host headers.
>> And if you need the target headers, you should depend on and use
>> linux-libc-headers.
>>
>> I guess mtd-utils-native is used to make an mtd image for the target
>> and as such I would expect it to use the target headers.
>>
>> What would be the difference between linux-libc-headers and
>> linux-libc-headers-native in the first place?
>> (and if there is a difference, I think a better package name would be
>> linux-libc-headers-cross).
>
> As Khem said, you're thinking in the wrong direction here. =A0Target stuf=
f
> which needs the headers get the headers via linux-libc-headers. =A0The pr=
oblem
> is runs on the host tools that generate things for the target.

I understand what you are saying (I think :-) )
For me ubi stuff (and mkfs.jffs2) in mtd-utils-native are tools which
generate code (in this case an image) for the target. That is why I
assumed them to require target headers (but see below).

(offtopic observation: mtd-utils-native delivers also a lot of stuff
that is not really interesting for native (flash-erase, nandwrite,
...)


>
>> Btw if say mtd-utils-native needs kernel headers to access host
>> functionality using headers for a different kernel version seems to be
>> a no-no either.
>
> mtd-utils is depending on OK to be exported by the kernel information to
> know how to make a UBI image. =A0And again, for the target this just work=
s.

What do you mean with OK?

Actually I guess it is also unclear to me what version of
linux-libc-headers you want to install and I feel if they are from a
different version than the native version, the native code should
*not* depend on it, as it might give rise to wrong assumptions.

And if we are only talking about a missing data structure or define or
so, it might be possible to add a patch to mtd-utils-native to fix
that. (can't judge that as I am lacking info on what part of
linux-libc-headers would be needed).

If the stuff needed is there to miss

>
>> PS: which distributions/distribution versions/kernel versions do have
>> this problem?
>> Ubuntu 8.04 (which has a 2.6.24 kernel) does not seem to exhibit this
>> problem).
>
> RHEL4.

Ouch. That brings up another question.
RHEL4 is 2.6.9 iirc. I can imagine ubi tools and 2.6.9 do not go
together too well.
Do we want to do something as drastic as linux-libc-headers-native to
support a fairly outdated kernel/distro.
I have some doubts here.(btw RHEL4 is already on minimal support and
is EOL feb 29, 2012).(http://www.redhat.com/security/updates/errata/)

I guess this could also be solved locally. E.g. making a RHEL4
specific recipe to install the headers, or to have copies of the
needed headers in some place and add them to the inc search path
Guess this: http://wiki.openembedded.net/index.php/OEandYourDistro#CentOS_4=
.4_.2F_Red_Hat_Enterprise_Linux_4
could be extended with some extra instructions.

Frans.
>
> --
> Tom Rini
> Mentor Graphics Corporation
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


