Received: from [209.85.221.106] (helo=mail-qy0-f106.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1LoJWu-0006h4-PK
	for openembedded-devel@openembedded.org; Mon, 30 Mar 2009 17:36:05 +0200
Received: by qyk4 with SMTP id 4so3270635qyk.0
	for <openembedded-devel@openembedded.org>;
	Mon, 30 Mar 2009 08:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:sender:received:from:to:cc
	:subject:organization:references:user-agent:x-url:x-attribution:date
	:in-reply-to:message-id:mime-version:content-type;
	bh=HWU9qGHomBv51UnyzH1QhtlWmtOELtXT5AQB9jFHrqg=;
	b=ZLBRHlmrm4C8tdFN72KH/cU2XMcOh4/KtjBQfAEZhIV4LxDlgdeoT88JWB+dtqZGXU
	nt5Cb5p7qmTwYPa/o5HjXdlY+ZLBEcZZUCzi6emQNzZsH1zgi77zsJEAM5WMP68xfsi1
	6uT10/5Pl6LHHz5S8QQjII8x3yjs9Harkbxhc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:organization:references:user-agent:x-url
	:x-attribution:date:in-reply-to:message-id:mime-version:content-type;
	b=NUce+/Tb9iwLeS+nsUNvnNPQW7kS9BEw1x8XGSbFE+4p/qI2YHGyru4J4heyBdQLCd
	imNqqKjo6mbtibDFT8bryuvXp9d4dWQpT9flHQTYvCEAPMItGmweMDSeCoWlGsiOwxNv
	QCNF2ZVbunNGDQCbo+/bSAPIOlm2X6YZlZ6dc=
Received: by 10.220.70.213 with SMTP id e21mr1460001vcj.93.1238427233936;
	Mon, 30 Mar 2009 08:33:53 -0700 (PDT)
Received: from ossystems.com.br (201-40-162-47.cable.viacabocom.com.br
	[201.40.162.47])
	by mx.google.com with ESMTPS id 9sm4248512ywf.46.2009.03.30.08.33.52
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 30 Mar 2009 08:33:53 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by ossystems.com.br (Postfix, from userid 1000)
	id 4ECD0610096; Mon, 30 Mar 2009 12:33:58 -0300 (BRT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Organization: O.S. Systems Ltda.
References: <cover.1238025789.git.andrea.adami@gmail.com>
	<eaff36cccf868e5b367b402fb61451bf8f681bd8.1238025789.git.andrea.adami@gmail.com>
	<gqfc5g$411$1@ger.gmane.org>
	<87fxgv44gn.fsf@neumann.lab.ossystems.com.br>
	<gqqcmo$63n$1@ger.gmane.org>
User-Agent: Microsoft Gnus Express, Build 5.13 (5.13)
X-URL: http://www.ossystems.com.br/
X-Attribution: O.S.
Date: Mon, 30 Mar 2009 12:33:58 -0300
In-Reply-To: <gqqcmo$63n$1@ger.gmane.org> (Koen Kooi's message of "Mon, 30 Mar
	2009 14:07:50 +0200")
Message-ID: <87wsa72ffd.fsf@neumann.lab.ossystems.com.br>
MIME-Version: 1.0
Cc: openembedded-devel@openembedded.org
Subject: Re: [PATCH 1/1] angstrom-2008.1.conf: add PREFERRED_PROVIDER_virtual/psplash -silence warning during parsing
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
X-List-Received-Date: Mon, 30 Mar 2009 15:36:05 -0000
Content-Type: text/plain; charset=us-ascii

Koen Kooi <k.kooi@student.utwente.nl> writes:

> On 30-03-09 13:47, Otavio Salvador wrote:
>> Koen Kooi<k.kooi@student.utwente.nl>  writes:
>>
>>> On 26-03-09 01:10, Andrea Adami wrote:
>>>
>>>> +#Silence warning during parsing
>>>> +PREFERRED_PROVIDER_virtual/psplash ?= "psplash-angstrom"
>>>
>>> NACK, the 'psplash' package should get deleted and replaced with
>>> psplash-oe' or something. It was left in place to give people time to
>>> switch to the new way of installing branded psplash images.
>>
>> Hello Koen but I belive those are two different issues.
>
>> I added the virtual/psplash package to allow others to properly depends
>> on an alternative. Currently the only recipe using it is
>> initramfs-module-psplash but others may come.
>
> I don't think virtual/psplash is the way to go, but I don't have a
> better suggestion.

So what we should do? IMO if there's no better solution we use this
until we find one.

>> I fully agree that we should drop plain psplash recipe and have
>> people to use the branded one but I also think angstrom needs to
>> properly set the preferred version since it will then allow that
>> its users to use it without much hassle.
>
> Unfortunately this will end up with people spreading FUD like "can't
> change psplash logo in angstrom" just because they see that line in
> angstrom.conf.

Well, we could add a comment for that in the angstrom.conf file.

Something like:

# This enforces a specific brand to be used, in our case the angstrom
# one. In case you want to change the logo or something like that we
# suggest you to create another recipe (e.g: psplash-<brand>) for that
# and change this line according.
PREFERRED_VERSION_...

> But then again, people are still claiming angstrom is bloated and
> minimal isn't when minimal is currently angstrom.conf with sed
> s/angstrom/minimal/ applied to it...

I think this is another problem; even minimal isn't in a useful state
and it does need to be fixed, this doesn't fix the virtual dependency
problem.

So?

-- 
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


