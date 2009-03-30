Received: from [74.125.92.145] (helo=qw-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1LoG01-0003yb-HE
	for openembedded-devel@openembedded.org; Mon, 30 Mar 2009 13:49:53 +0200
Received: by qw-out-1920.google.com with SMTP id 5so1465808qwf.6
	for <openembedded-devel@openembedded.org>;
	Mon, 30 Mar 2009 04:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:sender:received:from:to:cc
	:subject:organization:references:user-agent:x-url:x-attribution:date
	:in-reply-to:message-id:mime-version:content-type;
	bh=mgtMXEvdO2GfuCZGRP9NFfW4L5MJjb1tyqplbXn50qQ=;
	b=ZLiNbBWIsN1BuyiL3acgbCPyz9pmlOqQzrPww01BPkupk9cTfDlaWcn0GmDK3ze4Uv
	bftfjJUshum9Bj+nb58O8d2dCP3US7NHmy6cGsoBHuyUzXPiCuhuXUhH5AgBXNli0Unn
	G0u7q/3rXPBZnvp93UaWPToFw++6Mv8Cntkhg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:organization:references:user-agent:x-url
	:x-attribution:date:in-reply-to:message-id:mime-version:content-type;
	b=lMli0JY8SP0JRIrNyKCq8xTr6iaX6VypxbFj13U+482/VaFWugW8rANV+Txb4QtOJ5
	MszyD3965V2Z2nmwWm3wHp5vVNj1a/JEudFUHKsUVbYA9se7uzQU6TZ51nllAbwR3WGI
	XvLIoHdcOuQGuGg4k2+z5908hDG9CqCC+D6+0=
Received: by 10.224.15.10 with SMTP id i10mr6059678qaa.11.1238413667592;
	Mon, 30 Mar 2009 04:47:47 -0700 (PDT)
Received: from ossystems.com.br (201-40-162-47.cable.viacabocom.com.br
	[201.40.162.47])
	by mx.google.com with ESMTPS id 9sm3924893ywf.16.2009.03.30.04.47.46
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 30 Mar 2009 04:47:47 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by ossystems.com.br (Postfix, from userid 1000)
	id 9CE24610096; Mon, 30 Mar 2009 08:47:52 -0300 (BRT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Organization: O.S. Systems Ltda.
References: <cover.1238025789.git.andrea.adami@gmail.com>
	<eaff36cccf868e5b367b402fb61451bf8f681bd8.1238025789.git.andrea.adami@gmail.com>
	<gqfc5g$411$1@ger.gmane.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/23.0.91 (gnu/linux)
	(x86_64-pc-linux-gnu)
X-URL: http://www.ossystems.com.br/
X-Attribution: O.S.
Date: Mon, 30 Mar 2009 08:47:52 -0300
In-Reply-To: <gqfc5g$411$1@ger.gmane.org> (Koen Kooi's message of "Thu, 26 Mar
	2009 08:51:12 +0100")
Message-ID: <87fxgv44gn.fsf@neumann.lab.ossystems.com.br>
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
X-List-Received-Date: Mon, 30 Mar 2009 11:49:53 -0000
Content-Type: text/plain; charset=us-ascii

Koen Kooi <k.kooi@student.utwente.nl> writes:

> On 26-03-09 01:10, Andrea Adami wrote:
>
>> +#Silence warning during parsing
>> +PREFERRED_PROVIDER_virtual/psplash ?= "psplash-angstrom"
>
> NACK, the 'psplash' package should get deleted and replaced with
> psplash-oe' or something. It was left in place to give people time to
> switch to the new way of installing branded psplash images.

Hello Koen but I belive those are two different issues.

I added the virtual/psplash package to allow others to properly depends
on an alternative. Currently the only recipe using it is
initramfs-module-psplash but others may come.

I fully agree that we should drop plain psplash recipe and have
people to use the branded one but I also think angstrom needs to
properly set the preferred version since it will then allow that
its users to use it without much hassle.

My 2c.

-- 
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


