Received: from [209.85.198.251] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <felipe.contreras@gmail.com>) id 1KeZMU-0006De-QN
	for openembedded-devel@lists.openembedded.org;
	Sat, 13 Sep 2008 19:56:47 +0200
Received: by rv-out-0708.google.com with SMTP id f25so1776387rvb.12
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 13 Sep 2008 10:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:references;
	bh=/eJRzRUgqk39faxB9Q54cZtILjnlDXW1T6BVoYvqMRI=;
	b=syPwHKM3j7sTD6KuMjZgtaJF4TdfqXPphHLa40NbU8a3ms4JlGsl5+PEdGv2QvTqlU
	kV+1kk1JoewI4lM+qU1fMtW335sQF0SIRPGEsGXqM2sHIqa5YZjjUZ5lDpc7fn+skZnp
	Ls7I0UBvJVx43wkbdA2YmtNBGjK+ERSSgLF/0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:references;
	b=cFu8VxItTKhiw+B0kkYjP71+8YA/ZbMrD3q5ceJ2Dyk1axiT7UC3QI9DFZiKIuZZsB
	73qweRBpzNpVnEN5rU8iXo3GIvRhnj6hRPwwPZ2MhydOJtXWdFzL/nccUK+mZi/k9/zz
	psA92Ql0u49ERDYzAxWXSxpOwn4FzyiZX/o9E=
Received: by 10.140.125.4 with SMTP id x4mr3498907rvc.229.1221328434067;
	Sat, 13 Sep 2008 10:53:54 -0700 (PDT)
Received: by 10.140.166.19 with HTTP; Sat, 13 Sep 2008 10:53:53 -0700 (PDT)
Message-ID: <94a0d4530809131053u7c2f2c1chb33e5da39c4450aa@mail.gmail.com>
Date: Sat, 13 Sep 2008 20:53:53 +0300
From: "Felipe Contreras" <felipe.contreras@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <48CBFBBC.7050102@klever.net>
MIME-Version: 1.0
References: <94a0d4530809121559w5f644174j461ec61cb2327fd8@mail.gmail.com>
	<48CBE436.9050500@laposte.net>
	<94a0d4530809130942n3a6c2095t7018ecbfff9387f4@mail.gmail.com>
	<48CBFBBC.7050102@klever.net>
Subject: Re: [ANN] mtn2git v0.1
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
X-List-Received-Date: Sat, 13 Sep 2008 17:56:47 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Sat, Sep 13, 2008 at 8:43 PM, Michael Krelin <hacker@klever.net> wrote:
>>
>> I did look at it, but there are some issues. For starters it seems to
>> be using extensively the manifest, which would probably make it very
>> slow. Also, it seems to be keeping the trees of all the revisions.
>
> Back when mtn2git script was on the early stages of development and I've had
> some time I've started doing my own mtn2git gateway in c++ (never finished
> it, though). For what I remember using manifest was the only way, because
> the changes information mtn automate returns was incomplete or simply wrong,
> I don't remember the details... Do check your results carefully if you're
> trying to go this way. Luckily, being slow due to use of manifest should
> only matter on initial import.

It's complicated, but hopefully doable.

That's why there are two methods; one that does a full checkout of the
revision and imports it into git, and the other one that uses mtn
automate and fast-import.

I'm able to import about 60% of the Pidgin code correctly, but after
that there are issues. That's the benefit of having two modes... I can
compare the fast one with the exact one and improve the fast one.

-- 
Felipe Contreras


