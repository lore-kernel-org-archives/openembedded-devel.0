Received: from [200.17.161.174] (helo=listas.ossystems.com.br)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio@freedom.ind.br>) id 1LKGmH-0001YS-3S
	for openembedded-devel@lists.openembedded.org;
	Tue, 06 Jan 2009 19:35:45 +0100
Received: from internet.ossystems.com.br
	(201-40-162-47.cable.viacabocom.com.br [201.40.162.47])
	by listas.ossystems.com.br (Postfix) with ESMTP id 11607400CF;
	Tue,  6 Jan 2009 14:29:58 -0200 (BRST)
Received: from ossystems.com.br (unknown [10.1.0.243])
	by internet.ossystems.com.br (Postfix) with ESMTP id 8F4D72253A;
	Tue,  6 Jan 2009 14:29:39 -0200 (BRST)
Received: by ossystems.com.br (Postfix, from userid 1000)
	id 8181E610057; Tue,  6 Jan 2009 16:24:43 -0200 (BRST)
To: openembedded-devel@lists.openembedded.org
References: <87r63gseu6.fsf@neumann.lab.ossystems.com.br>
	<gjvu32$7dh$1@ger.gmane.org>
From: Otavio Salvador <otavio@debian.org>
Organization: O.S. Systems Ltda.
X-URL: http://www.debian.org/~otavio/
X-Attribution: O.S.
Date: Tue, 06 Jan 2009 16:24:43 -0200
In-Reply-To: <gjvu32$7dh$1@ger.gmane.org> (Koen Kooi's message of "Tue\,
	06 Jan 2009 16\:41\:22 +0100")
Message-ID: <87mye4nvh0.fsf@neumann.lab.ossystems.com.br>
User-Agent: Gnus/5.11 (Gnus v5.11) Emacs/22.2 (gnu/linux)
MIME-Version: 1.0
Cc: openembedded-devel@openembedded.org
Subject: Re: [RFC] bitbake git fetcher fix
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
X-List-Received-Date: Tue, 06 Jan 2009 18:35:45 -0000
Content-Type: text/plain; charset=us-ascii

Koen Kooi <k.kooi@student.utwente.nl> writes:

> On 06-01-09 15:12, Otavio Salvador wrote:
>> Hello,
>>
>> I've found a issue when using current GIT fetcher and bellow patch
>> fixes it for me; could someone take a look at it and commit if it does
>> look fine?
>
>> +        elif tag and tag != "1":
>
> That looks to be a hack for lazy people that don't specify a SRCREV
> nor set AUTOREV. Such a fetch failure is intended behaviour.

Since I'm this lazy people, could you tell me what I'm suppose to put
in SRCREV to use AUTOREV and solve this?

-- 
        O T A V I O    S A L V A D O R
---------------------------------------------
 E-mail: otavio@debian.org      UIN: 5906116
 GNU/Linux User: 239058     GPG ID: 49A5F855
 Home Page: http://otavio.ossystems.com.br
---------------------------------------------
"Microsoft sells you Windows ... Linux gives
 you the whole house."


