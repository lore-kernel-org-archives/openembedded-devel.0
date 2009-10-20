Received: from [216.239.58.184] (helo=gv-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1N0E6E-000874-PS
	for openembedded-devel@lists.openembedded.org;
	Tue, 20 Oct 2009 14:46:05 +0200
Received: by gv-out-0910.google.com with SMTP id e6so1108179gvc.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Oct 2009 05:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=v8grP1/iw2R+3TCLvA3XXjmIRLpNWNXrRIuSSx4fSEQ=;
	b=Q30ot3LHckelHkIgFiyaJJKAsSmKh56Ts1bm+S5MswVwGdZhGOIHTkEbrVmsYAUx4w
	MmUnBhaV9B4DjVkE5D3ar+TtI1m4f2o7TaCFXhv7r0HhfMfrX5oPA1KcDqaBpFcdN6fX
	PEgu6WErFhEB3/LLbF1sQ16iIPVj8sFDwj7+k=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=lcTFh45D25NyvXpMGQH/aIcn3sDyFem5lFaKG8U/g9P10uhYkt/hfJJWjQapgW1/Pq
	amhdHmVe8c8TaCeSE5UZiS27PtcUJG9ogv+uu4rwHFY3eaWFdG8Iy3ZIiNEtTk36BqB9
	K2YB6FRZK26/94165sWWT6jtpUFD5JGT+ppwY=
MIME-Version: 1.0
Sender: otavio.salvador@gmail.com
Received: by 10.239.182.208 with SMTP id r16mr534811hbg.203.1256042704083; 
	Tue, 20 Oct 2009 05:45:04 -0700 (PDT)
In-Reply-To: <1255982900.21136.6.camel@lenovo.internal.reciva.com>
References: <1255966150-1854-1-git-send-email-marcin@juszkiewicz.com.pl>
	<1255969713.4434.5.camel@hammer.suse.cz>
	<200910191847.30200.marcin@juszkiewicz.com.pl>
	<1255982900.21136.6.camel@lenovo.internal.reciva.com>
Date: Tue, 20 Oct 2009 10:45:03 -0200
X-Google-Sender-Auth: 690aa3d06b00a1dd
Message-ID: <be7a9f3d0910200545l1f816f25raff778f7f005f3c9@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 216.239.58.184
X-SA-Exim-Mail-From: otavio.salvador@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Updating kernels to latest stable versions
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
X-List-Received-Date: Tue, 20 Oct 2009 12:46:05 -0000
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: quoted-printable

Hello Phil,

On Mon, Oct 19, 2009 at 6:08 PM, Phil Blundell <philb@gnu.org> wrote:
> On Mon, 2009-10-19 at 18:47 +0200, Marcin Juszkiewicz wrote:
>> Dnia poniedzia=B3ek, 19 pa=BCdziernika 2009 o 18:28:33 Stanislav Brabec
>> napisa=B3(a):
>>
>> > Maybe it should be 2.6.21.7-r0 instead of 2.6.21-r13 and do the same f=
or
>> > other patched recipes.
>>
>> No, your suggestion will break everyone who uses PREF_VER_linux =3D "2.6=
.21" for
>> example.
>
> I guess that depends on your definition of "breaks". =A0One way of lookin=
g
> at it is that folks who set PREFERRED_VERSION_linux =3D "2.6.21" are
> wanting the actual version 2.6.21, not 2.6.21.7, and might be dismayed
> to find that they have suddenly been bumped to the latter with no way to
> get back to what they had before.
>
> 2.6.21.7 clearly is a new upstream release and I would have thought that
> it is appropriate to reflect that in PV rather than hiding it behind a
> PR increment.

Well, it is mostly bugfixes into a release. It is the same thing we
do when we apply a patch in a package and bump the revision. The only
difference is that there's a team doing it outside of OE and this
patches are huge.

It is NOT a upstream release; it is a stable release being "updated"
to fix critical bugs and regressions.

--=20
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


