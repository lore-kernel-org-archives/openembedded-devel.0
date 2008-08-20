Received: from [209.85.132.251] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1KVvZB-00050e-Vf
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 Aug 2008 23:50:10 +0200
Received: by an-out-0708.google.com with SMTP id b38so105553ana.83
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Aug 2008 14:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:references;
	bh=JhXGjmnhKgyh07cQX1mfeVsBSLTlWUMPdz86mPBOWBE=;
	b=Nt0lpV8uo40uSsYxWamPyF+CfRtkc75rU6YqhHuXHMeRVWXFNkKosNYpN8exZ7pV4W
	dUusUk7HHzUE0EJRNPvKqAaiOo7GrZZFO+xBxuHKLhbbgPWEK60pKJZ+KhRdqZEvD98u
	Hd+Qrnqw7e51jG7ca57vzEElu01aaSCD8iKAM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:references;
	b=H2+adJvQE5I5FCN1eFN3wTnlG+ZdJNecAENvg3uc7M87MwodZ3KYEQiYSe3sR6a1Mo
	oE94/+I5z2xyMRoPpjJT0d9nYOJT3Q69dFfAGWcoQBj598W1ZBaw9YQ5h5XgFMo8XDKK
	0EDwo/aJej0dqR1+ZpJo1tTeTp7LAZjcOnoqU=
Received: by 10.100.91.17 with SMTP id o17mr995189anb.13.1219268942259;
	Wed, 20 Aug 2008 14:49:02 -0700 (PDT)
Received: by 10.100.174.18 with HTTP; Wed, 20 Aug 2008 14:49:02 -0700 (PDT)
Message-ID: <c384c5ea0808201449i951a3fdwce3c3d91f4863861@mail.gmail.com>
Date: Wed, 20 Aug 2008 23:49:02 +0200
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1219219108.5479.0.camel@dax.rpnet.com>
MIME-Version: 1.0
References: <20080819235307.DD481188083@amethyst.openembedded.net>
	<g8fp0e$upk$1@ger.gmane.org> <g8gej0$i1l$1@ger.gmane.org>
	<1219219108.5479.0.camel@dax.rpnet.com>
Subject: Re: : gnash-minimal: Add libltdl DEPENDS.
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
X-List-Received-Date: Wed, 20 Aug 2008 21:50:10 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello,

On Wed, Aug 20, 2008 at 9:58 AM, Richard Purdie <rpurdie@rpsys.net> wrote:
> On Wed, 2008-08-20 at 08:45 +0200, Koen Kooi wrote:
>> Rolf Leggewie wrote:
>> > OE GIT Trial wrote:
>> >> Author: <likewise@openembedded.org>
>> > [...]
>> >> gnash-minimal: Add libltdl DEPENDS.
>> >
>> > That would be OK, I guess, if we had libltdl in OE, but we don't. So
>> > right now, it breaks.
>>
Yes, but I think it was broken already. If it worked for you, let me
know, because it did not for me (avr32).

>> We do have libltdl in OE, it's part of libtool
>
> It should be a DEPENDS = "libtool"...
>
Indeed, my fix attempt was bogus. And DEPENDS on libtool was already there.

The problem is, the *R*DEPENDS to the library isn't picked up
automatically. If I install libltdl manually afterwards, things work.

-rw-rw-rw- 1 leon leon 12280 2008-08-20 11:22
tmp/deploy/uclibc/ipk/avr32/libltdl7_2.2.4-r14_avr32.ipk

The real problem is, I currently lack enough knowledge of the
libtool/autoconf/automake stuff to fix this properly. I thought
toolchains were hard...

The libtool upgrade has proven a very intrusive change for me from
which I am still recovering. :-)

Currently I am fighting the vnc/libvncserver packages and
vnc/fbvncserver packages. They are broken due to the libtool upgrade.

Regards,
-- 
Leon


