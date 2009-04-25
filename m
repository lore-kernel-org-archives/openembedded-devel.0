Received: from [209.85.132.244] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1LxnEu-00057X-MH
	for openembedded-devel@lists.openembedded.org;
	Sat, 25 Apr 2009 21:08:40 +0200
Received: by an-out-0708.google.com with SMTP id b6so1045845ana.42
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 25 Apr 2009 12:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=Nbu43Wy2PjSmZtlBD2m8XibE1NhGKEdv8ne5x395Kck=;
	b=YEtMz76vdjbtZw25e9HAXl1dhL8TvdFdjCCeTsIYL1bMqKYNjce7pn5i5KGoR86IdT
	lXtxph9UgTEWFCet2k5e9hA02uwWTR3BsqJkzzHo6iaYg8aPTVouXY9JOGC++eY29AtO
	cPu9bMjA1SISRQqKS4au2GWlwhRU6iLaYjveM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=rtwWt1i14FdA+Aa+vuB8zuTrx3xH+VPZrD4qH11auZzfgRFcNduyFuJIAKM6LzifDE
	NeF8MLYMASQ7Wr/1s/9hrYBEW4W8T2ZGu7UeeEZ6/tB10NPYaF+gQ0fNvsRx6eJuaxtc
	ilL8/9dXrGFSeIbG18zuPk7EtWff7LzFEDpss=
MIME-Version: 1.0
Sender: otavio.salvador@gmail.com
Received: by 10.100.213.18 with SMTP id l18mr5405862ang.59.1240686228675; Sat, 
	25 Apr 2009 12:03:48 -0700 (PDT)
In-Reply-To: <20090425190009.GI15489@smtp.west.cox.net>
References: <20090425075933.E6E18188456@amethyst.openembedded.net>
	<200904251304.17624.mickey@vanille-media.de>
	<49F310E0.6030909@balister.org>
	<200904251540.40566.mickey@vanille-media.de>
	<be7a9f3d0904251117p5b0df982wb20f861bb90d9270@mail.gmail.com>
	<20090425182756.GH15489@smtp.west.cox.net>
	<be7a9f3d0904251151n6d733c7ds10ed3f2b43a1c8ab@mail.gmail.com>
	<20090425190009.GI15489@smtp.west.cox.net>
Date: Sat, 25 Apr 2009 16:03:48 -0300
X-Google-Sender-Auth: 73cc078e7427baa7
Message-ID: <be7a9f3d0904251203td3071f6l4ae57ada6468a296@mail.gmail.com>
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
X-List-Received-Date: Sat, 25 Apr 2009 19:08:41 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello Tom,

On Sat, Apr 25, 2009 at 4:00 PM, Tom Rini <trini@embeddedalley.com> wrote:
> On Sat, Apr 25, 2009 at 03:51:21PM -0300, Otavio Salvador wrote:
>> I also don't think that if a patch has broken a thing we ought to go
>> and fix it. The first thing to do is to revert it and keep things
>> going while the issue is solved, preferrable in a branch.
>
> OK. =A0Shall we move the GNU_HASH QA error being fatal over to a branch
> until Khem is happy with the changes required to make gcc package again
> then? =A0All of the meta target are quite broken (and I still need some
> ack's on my change to insane.bbclass to fix the devdbg check for sdk
> packages too).

I believe that it was the correct way of doing it.

That's the beauty of branches ... we have the power of move things at
same time and do not "break" things during the development for it.

--=20
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


