Received: from [74.125.92.147] (helo=qw-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1LcUcW-0006qp-Kh
	for openembedded-devel@lists.openembedded.org;
	Thu, 26 Feb 2009 02:01:04 +0100
Received: by qw-out-1920.google.com with SMTP id 5so292719qwf.36
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Feb 2009 16:56:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:sender:received:from:to:cc
	:subject:organization:references:user-agent:x-url:x-attribution:date
	:in-reply-to:message-id:mime-version:content-type;
	bh=U9wVuXnmHwiVOAPk1/tsllAsVNJCbRsk+juH44+dkBc=;
	b=DnSbHU78wuzWppnaIg2AwFV+z1SsnUqH7cLVB6vVwM0R9YyU4HR3oaSXcoTeQtg89U
	E5jlP2FUJVUu9onPrLzLE9ssWOCJtvigtPzf0aGzkePipy+JnIehjV6BSu+B5jJRaT2N
	j3OuzSS5rSXlBFTO/uU29+qfzYFfNUc4lmlfc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:organization:references:user-agent:x-url
	:x-attribution:date:in-reply-to:message-id:mime-version:content-type;
	b=Sx4l8aqILBZdbd3U3Mmuv6P9zJz6wFmg6d+NQtLAeoL14SfT8BCmICfYIxKtbJcF7m
	HKdkTHEuRlSAHSUW8IXNWQcwFxf39rpE0kzoaJpiu3PzrEUvnf5ZC2BVI14wCnfoMFJ3
	dg5k8J9tSuVsgvl2BiGuNmf2jesCzwUKGa44s=
Received: by 10.224.67.193 with SMTP id s1mr1343121qai.291.1235609765650;
	Wed, 25 Feb 2009 16:56:05 -0800 (PST)
Received: from ossystems.com.br (201-40-162-47.cable.viacabocom.com.br
	[201.40.162.47])
	by mx.google.com with ESMTPS id 8sm490444qwj.56.2009.02.25.16.56.02
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 25 Feb 2009 16:56:05 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by ossystems.com.br (Postfix, from userid 1000)
	id DA7D5610267; Wed, 25 Feb 2009 21:56:03 -0300 (BRT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Organization: O.S. Systems Ltda.
References: <go498c$bqq$1@ger.gmane.org> <go4a60$eh8$1@ger.gmane.org>
	<49A5AEB8.7080909@dls.net> <go4bh1$kbu$1@ger.gmane.org>
	<1235596554.2621.50.camel@andromeda> <go4cq2$og6$1@ger.gmane.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/23.0.90 (gnu/linux)
	(x86_64-pc-linux-gnu)
X-URL: http://www.ossystems.com.br/
X-Attribution: O.S.
Date: Wed, 25 Feb 2009 21:56:03 -0300
In-Reply-To: <go4cq2$og6$1@ger.gmane.org> (Koen Kooi's message of "Wed, 25 Feb
	2009 22:22:10 +0100")
Message-ID: <877i3evwws.fsf@neumann.lab.ossystems.com.br>
MIME-Version: 1.0
Cc: openembedded-devel@openembedded.org
Subject: Re: Merge windows, was: Re: [RFC] renaming packages/ to recipes/
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
X-List-Received-Date: Thu, 26 Feb 2009 01:07:40 -0000
X-List-Received-Date: Thu, 26 Feb 2009 01:07:40 -0000
Content-Type: text/plain; charset=us-ascii

Koen Kooi <k.kooi@student.utwente.nl> writes:

> On 25-02-09 22:15, Michael 'Mickey' Lauer wrote:
>> Sounds good for me on a stable branch, not so much on a development
>> branch.
>
> A perptually broken development branch is no good. The current .dev is
> unbuildable literally every other day, so I'm not a fan of keeping
> .dev the free-for-all it is now.
> And Mikes proposal was holding off *disruptive* changes, not *all* changes.

[...]

Yes from my POV it does make sense and it could also help derivatives to
plan their development according to it.

For example if you have a distro that is based on dev branch you should
avoid merging it at start of mounth since it has high risk to be broken
or with still unknown bugs.

With GIT it is quite easy to hold changes for a while and merge them all
together when done. We could even build a "oe-next" try that merges
automatically from people trees and catch conflicts. This could make
whole merging easier when next mounth arrives ;-)

Cheers,

-- 
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


