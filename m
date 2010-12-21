Received: from mail-gw0-f41.google.com ([74.125.83.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PVAiT-0005w1-Qx
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Dec 2010 23:29:57 +0100
Received: by gwj22 with SMTP id 22so2453228gwj.28
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Dec 2010 14:29:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=9ZmHUC53Ugqu4+dRFMu1ziqw2Dit4DkzFQ9LEkNTsWk=;
	b=Qd0IAgAfmRUep9/q+8LhYIvppfFCnl5QMDTtoSb6ap6RwG4q62rq6PZiv8eCSGOa7i
	DUtgp4IPNEsUSPjCPtnPPHV3oK5kkYCl/aaunYQ+Phin9fPE7HqMQToogmxhvzn/ULFw
	Z3Tufb8oTDhWBjCG9BKKIaqQrM4j0NCKN91to=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=wMTJv2BErcjePb/tMsGUPUBrHg2ImfkWcNHjhYTb8vPy43UUucjgxAWFEXjdhH3ab5
	SF7WLcHNQdVq+RO0nWC+Gq1wel+9/9oIJPKNn5d0bMz8+cCxMVnj1i6omQek8j/23RF0
	TOJ9shENwiT2YgpK9Dv+GP/0VlzaZHR73iFk0=
Received: by 10.90.10.21 with SMTP id 21mr7700978agj.112.1292970588951; Tue,
	21 Dec 2010 14:29:48 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.86.4 with HTTP; Tue, 21 Dec 2010 14:29:28 -0800 (PST)
In-Reply-To: <AANLkTingz19yW=dhQnLZeaApvUt-x9Lc9NZ4pf5212AP@mail.gmail.com>
References: <AANLkTin7=Y-zTioQWoMegS4pU3McHnORx-jC+z6petZ-@mail.gmail.com>
	<AANLkTingz19yW=dhQnLZeaApvUt-x9Lc9NZ4pf5212AP@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 21 Dec 2010 14:29:28 -0800
Message-ID: <AANLkTikZJMQKqo7XcOf-gGWJOX9Xn756DHHgXGaprf1f@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: OE git repository organization
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
X-List-Received-Date: Tue, 21 Dec 2010 22:29:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 21, 2010 at 2:12 PM, Chris Larson <clarson@kergoth.com> wrote:
> On Tue, Dec 21, 2010 at 2:53 PM, Cliff Brake <cliff.brake@gmail.com> wrot=
e:
>> Now that we have the capability to do per branch permissions, etc, I
>> would like to discuss what makes sense going forward for repository
>> admin. =C2=A0My initial thoughts:
>>
>> - put all user branches in openembedded-user
>> - restrict branch creation on the main openembedded repo to commonly
>> used branches
>>
>> We can also do things like give users permission to branches that
>> start with their name, etc. =C2=A0This would allow rewriting history on
>> user branches, etc.

hmmm yeah and one could use these branches to share patches without overhea=
d of
branching policy we have today.


=C2=A0That said, it may make more sense to just do user
>> branches on github as some are already doing.
>
> This is a good idea, at least for those who want to use it. =C2=A0It woul=
d
> certainly clean up the branch mess we have in the main repository
> today. =C2=A0We may want to limit tag creation to specific people, to avo=
id
> cluttering the tag namespace.

I agree on that.

> --
> Christopher Larson
> clarson at kergoth dot com
> Founder - BitBake, OpenEmbedded, OpenZaurus
> Maintainer - Tslib
> Senior Software Engineer, Mentor Graphics
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


