Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OVTRw-0008UU-5E
	for openembedded-devel@lists.openembedded.org;
	Sun, 04 Jul 2010 19:57:53 +0200
Received: by iwn34 with SMTP id 34so4853772iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 04 Jul 2010 10:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=B2q10L+T1dpgpXoEL+ICCbM/sFI3YONSiOw4ZCLdDoM=;
	b=PuMtXRCVSxpSjZ6KSv3Q1gVkAFppniaaGLXg08WgkkxZ98gYBvrfWATxCslh9AEYZZ
	PDFlRVclrA5QMqTKStILDgqJO+gNQOy0L7QVfmrt5dWM+znvADSBm5piGusO9GAcFdBN
	wDs2zRtKoGidVRO02Lb0pl0TajVJXzJbkLavs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=q5PxjOkCeNLFoCRiIXukzc8sF0zEIV9KJxzrOfzi2elTsHGB+AJ9nkBDLxuG10abS5
	NL0WRpM5T689gUx/cXfmNGY08EE9OpSVLLF/N0O4ziWXtKbVPnSr2kYaVMTqykjh/+HI
	uOJhmgiRgH7m2TrRWQSnkm4JEN1EEr+gh962E=
Received: by 10.231.166.72 with SMTP id l8mr2130536iby.95.1278265985193; Sun, 
	04 Jul 2010 10:53:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.14.131 with HTTP; Sun, 4 Jul 2010 10:52:45 -0700 (PDT)
In-Reply-To: <4C3093B0.5090603@vollmann.ch>
References: <AANLkTilva4t_1fBYfzHthbUInh43adY9VYbU9EjgZL7V@mail.gmail.com> 
	<1278021694.30247.438.camel@rex> <4C3093B0.5090603@vollmann.ch>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 4 Jul 2010 10:52:45 -0700
Message-ID: <AANLkTilFDDCYu-dFabnPFc34UwJGTIlwuMy1WcxPlUA_@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC} Disable multilib in gcc recipes
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
X-List-Received-Date: Sun, 04 Jul 2010 17:57:53 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 4, 2010 at 6:59 AM, Detlef Vollmann <dv@vollmann.ch> wrote:
> On 07/02/10 00:01, Richard Purdie wrote:
>>
>> On Thu, 2010-07-01 at 00:14 -0700, Khem Raj wrote:
>>>
>>> I would like to propose to remove building multilib with gcc recipes.
>>> It creates problems
>>> and we do not package correct bits on some platforms. As we tend to
>>> build toolchains keeping in mind the machine it is targetting I think
>>> multilib is not that significant
>>>
>>> Concerns ? comments?
>>
>> I'm backing this. Currently multilib is broken and for a good
>> implementation we really needs a ground up proposal for how to handle it
>> well. I'm starting to look into the problem FWIW so I'd appreciate being
>> in the loop in any discussions.
>
> I've run into multilib issues as well, but could always solve it on a
> case by case base (e.g. on powerpc). =A0But I agree it's currently a mess=
.
> But what you need to keep in mind if you actually drop multilib support
> is that you need to rename the prefix for the SDK toolchains.
> It would be bad if PowerPC 32-bit and 64-bit toolchains were both named
> powerpc-angstrom-linux-

I think that does not happen. toolchain prefix is generally ${TARGET_ARCH}-=
x-x
for 64 bit powerpc TARGET_ARCH =3D "powerpc64"

>
> =A0Detlef
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


