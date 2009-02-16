Received: from [209.85.221.22] (helo=mail-qy0-f22.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1LZ2VO-0001wZ-67
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Feb 2009 13:23:22 +0100
Received: by qyk3 with SMTP id 3so680088qyk.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Feb 2009 04:21:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:sender:received:from:to
	:subject:organization:references:user-agent:x-url:x-attribution:date
	:in-reply-to:message-id:mime-version:content-type;
	bh=vm+nUilffNv/yZZpEe/BpooGwyIc+9ibGCKTrxn3kzg=;
	b=nlOJtRaxzecfDxoTECaV6sDDD5f34rIYe5P1RSWX6kg7hjmj6tmy2sw2+ryolq4c0s
	bzGPUo8dDP8g+hvaAgf9LC/8FK+RyyGKp1i3zcsprb+1jrzU/bDkJM86t4jYnolFd5ty
	GcQItlSgWZ8vCwC6doBJ0kBwuaHd83Ur2zMlU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:subject:organization:references:user-agent:x-url
	:x-attribution:date:in-reply-to:message-id:mime-version:content-type;
	b=HW+B68uVxKH8wOkT7ecdhzXlalrU1Mak5pxewskwlmjpJfQ8UI2/MaxvIO+y/cmge1
	R3MGFzCTtUcbGvhhFAg4aQZYyzaR073awSuK7pdBgl78uyK/9jX+xguq3JeV7ZDQiEj7
	OJR38SldXV61WrBgLfXy2rsPGGnicpKegBFrA=
Received: by 10.224.28.138 with SMTP id m10mr7877023qac.79.1234786889043;
	Mon, 16 Feb 2009 04:21:29 -0800 (PST)
Received: from ossystems.com.br (201-40-162-47.cable.viacabocom.com.br
	[201.40.162.47])
	by mx.google.com with ESMTPS id 2sm4315221qwi.58.2009.02.16.04.21.27
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 16 Feb 2009 04:21:28 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by ossystems.com.br (Postfix, from userid 1000)
	id E3D50610067; Mon, 16 Feb 2009 09:21:30 -0300 (BRT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Organization: O.S. Systems Ltda.
References: <200902140035.13820.khimov@altell.ru>
	<20090215211330.GB11815@smtp.west.cox.net>
	<87hc2vi3wy.fsf@neumann.lab.ossystems.com.br>
	<200902161228.26942.khimov@altell.ru>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/23.0.90 (gnu/linux)
	(x86_64-pc-linux-gnu)
X-URL: http://www.ossystems.com.br/
X-Attribution: O.S.
Date: Mon, 16 Feb 2009 09:21:30 -0300
In-Reply-To: <200902161228.26942.khimov@altell.ru> (Roman I. Khimov's message
	of "Mon, 16 Feb 2009 12:28:26 +0300")
Message-ID: <873aeeh8s5.fsf@neumann.lab.ossystems.com.br>
MIME-Version: 1.0
Subject: Re: [PATCH] New package: siproxd
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
X-List-Received-Date: Mon, 16 Feb 2009 12:23:22 -0000
Content-Type: text/plain; charset=us-ascii

Roman I Khimov <khimov@altell.ru> writes:

> Otavio Salvador:
>> Basically we could suggest following workflow for regular users:
>>
>>  - when going to make any change at OE, start a personal branch
>>
>>    $: git checkout -b local master
>
> Here is when the problem starts. Currently we have overlay setup, so I'm 
> extracting everything I'm pushing now from overlay (which itself is managed 
> in git, but that's another story since at least one thing is not managed at 
> all in overlay - checksums).
>
>>    $: git format-patch master..
>>
>>  - mail them to ml
>
> And this is another thing I'm not sure about, there might be a lot 
> of 'intermediate' commits leading to nice-upstream-acceptable package, 
> pushing them all in series is kinda wrong, IMHO.
>
> There is of course some git kung fu that might help doing one patch for one 
> thing regardless of the number of intermediate results. But then again 
> there is reviewing process that leads to more changes and more git kung fu 
> to make single patch for single package again.
>
> Does it make any sense? Currently I'm trying to push new things in 'one 
> package - one patch' model, extracting package patch from overlay as `git 
> diff some_commit..` plus adding checksums to local OE tree and doing `git 
> diff` there (not commiting it at all). Then after new package is in, I'm 
> able to pull from main OE and remove things from overlay.

You need to created another temp branch and cherry-pick the changes to
it; after grabbing them you can use:

 $: git format-patch master..temp

-- 
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


