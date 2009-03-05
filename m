Received: from [209.85.128.185] (helo=fk-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1LfFfR-0004G8-LC
	for openembedded-devel@lists.openembedded.org;
	Thu, 05 Mar 2009 16:39:25 +0100
Received: by fk-out-0910.google.com with SMTP id f40so1488023fka.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Mar 2009 07:35:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:sender:received:from:to:cc
	:subject:organization:references:user-agent:x-url:x-attribution:date
	:in-reply-to:message-id:mime-version:content-type;
	bh=P/phZaGD3H7ZPoPkaJCmObaTyMYAi7DcOHCxy18q5kY=;
	b=qDBVqA384TlqFS42DDwWo7dH1gFbiW+h1c3bh5bHk0XlB1JdoTnu3wRT+CBUxTdxW/
	MDcvQ0SjfGIgzu3IJXuznE5r3VDgzX/6Q6niecKGSSz+xYW94cUBKMq95s7PTEl1fw+9
	VVrD/nkoFkeA5Qg7Tz2ofyDHzZ4Vi34ttsaIQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:organization:references:user-agent:x-url
	:x-attribution:date:in-reply-to:message-id:mime-version:content-type;
	b=WgcuoIUtkVCbZllzItLwPQ4iyZIzviSMlothnkJe8rl7AXn1maogFH+hm41u/liyVA
	mcaAgFurZ3t6jS7Ad6jVlhijkb9ONbntx1kvVnOBGLCh7OUGBqidYTqC1g+y+pZKazZA
	zwnEm7scSaYJIIBI/Tif5YbMpLEF3fdMyd7Q0=
Received: by 10.103.193.13 with SMTP id v13mr617091mup.1.1236267305342;
	Thu, 05 Mar 2009 07:35:05 -0800 (PST)
Received: from ossystems.com.br (201-40-162-47.cable.viacabocom.com.br
	[201.40.162.47])
	by mx.google.com with ESMTPS id b9sm163539mug.32.2009.03.05.07.35.03
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 05 Mar 2009 07:35:04 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by ossystems.com.br (Postfix, from userid 1000)
	id 9BCB96101CE; Thu,  5 Mar 2009 12:35:01 -0300 (BRT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Organization: O.S. Systems Ltda.
References: <go498c$bqq$1@ger.gmane.org> <golnv0$h4r$1@ger.gmane.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/23.0.91 (gnu/linux)
	(x86_64-pc-linux-gnu)
X-URL: http://www.ossystems.com.br/
X-Attribution: O.S.
Date: Thu, 05 Mar 2009 12:35:01 -0300
In-Reply-To: <golnv0$h4r$1@ger.gmane.org> (Koen Kooi's message of "Wed, 04 Mar
	2009 12:16:48 +0100")
Message-ID: <877i342day.fsf@neumann.lab.ossystems.com.br>
MIME-Version: 1.0
Cc: openembedded-devel@openembedded.org
Subject: Re: [RFC] renaming packages/ to recipes/
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
X-List-Received-Date: Thu, 05 Mar 2009 15:39:25 -0000
Content-Type: text/plain; charset=us-ascii

Koen Kooi <k.kooi@student.utwente.nl> writes:

> On 25-02-09 21:21, Koen Kooi wrote:
>> Hi,
>>
>> I keep trying to teach people the difference between recipes (what's in
>> OE) and packages (what you install on the target) and keep getting
>> reactions like "ok, but why is the dir called packages?", which are
>> completely valid.
>>
>> Proposal:
>>
>> mv packages recipes ; git commit .
>
> Only positive replies sofar, so when do we want to schedule this
> commit? My proposal is somewhere in april, since I'm too busy this
> month with bossaconference and university work to deal with the
> fallout properly.
> Also, shall we restructure TMPDIR at the same time?

[...]

Let's do it step by step. It is much easier and nicer to our users if
they don't have to handle a completely different tree to get theirs work
done.

-- 
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


