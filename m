Received: from [74.125.46.157] (helo=yw-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1Lxn2r-0004jK-47
	for openembedded-devel@lists.openembedded.org;
	Sat, 25 Apr 2009 20:56:13 +0200
Received: by yw-out-1718.google.com with SMTP id 9so1058067ywk.42
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 25 Apr 2009 11:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=QtVpeZJOa3nuNuIE8ASz7+5tCItyUM5TI0PV+ErUcas=;
	b=jBMFVFlKlwvLfUHxZzP+a/htMEjBdl8Z7+j4sPO6aPQC/AY/vXa5zGYulv3uw+dy3+
	9QszfT5WrdHwvATp7dFuIcW1p7d2iydnZWCT74NWVp3bsmDhcp/Py5307Ohr+F+Fm02W
	Ya2r5SrWjPd1PwmswkpqvHIsxOjmayIcJ6eBw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=g4QRY3mRDFMj233lcRVRWsLvSJY4IECbRf39ZuzcuYM1ejvPokJJU/2Y21AkR7h2Ts
	zolNAInKj1FfcpwKRZFqZXMNQIhg1fU4yZap04xm1tNC2kpoSdJEEOPoA7tAi8/IU1j3
	T+Y402BV8rx3YXHBda15WvyGJPx8ZbABc1SS4=
MIME-Version: 1.0
Sender: otavio.salvador@gmail.com
Received: by 10.101.71.3 with SMTP id y3mr5205100ank.158.1240685481100; Sat, 
	25 Apr 2009 11:51:21 -0700 (PDT)
In-Reply-To: <20090425182756.GH15489@smtp.west.cox.net>
References: <20090425075933.E6E18188456@amethyst.openembedded.net>
	<200904251304.17624.mickey@vanille-media.de>
	<49F310E0.6030909@balister.org>
	<200904251540.40566.mickey@vanille-media.de>
	<be7a9f3d0904251117p5b0df982wb20f861bb90d9270@mail.gmail.com>
	<20090425182756.GH15489@smtp.west.cox.net>
Date: Sat, 25 Apr 2009 15:51:21 -0300
X-Google-Sender-Auth: c5d35fd4287caf99
Message-ID: <be7a9f3d0904251151n6d733c7ds10ed3f2b43a1c8ab@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [oe-commits] Koen Kooi : Revert "ecore: catch up with the new SONAMEs; move to autosplitting"
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
X-List-Received-Date: Sat, 25 Apr 2009 18:56:13 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello Tom,

On Sat, Apr 25, 2009 at 3:27 PM, Tom Rini <trini@kernel.crashing.org> wrote=
:
> If I can sum up what it sounds like mickey is saying, he fixed some
> issues that Koen didn't yet (and thus are back now that his changes are
> committed). =A0So is .dev where we need to freak out and revert things
> that do fix some issue but open another?

Obviously not BUT we need to consider the effects of each change.

Having problems with RRECOMMENDS and like are surely less boring to
break a whole upgrade path. I do believe that the fixes need to be
bringed back but we should really see if we can get the upgrade path
sorted out. If it shows to be rather difficult to get it done so
believe that this needs to be automated in some way (like providing a
script that removes the old packages and install the equivalent new
ones or like).

I also don't think that if a patch has broken a thing we ought to go
and fix it. The first thing to do is to revert it and keep things
going while the issue is solved, preferrable in a branch.

--=20
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


