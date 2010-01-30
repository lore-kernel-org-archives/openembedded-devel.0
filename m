Received: from mail-iw0-f187.google.com ([209.85.223.187])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Nb3DM-000514-8q
	for openembedded-devel@lists.openembedded.org;
	Sat, 30 Jan 2010 03:37:39 +0100
Received: by iwn17 with SMTP id 17so2884415iwn.25
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Jan 2010 18:35:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=MPVrMwXhRKXyxC7nCbfa9u9ZkS4hFc7WhK5DKjxb+0w=;
	b=GPJ9KCN7H+DPRY5ybFZv0zZzZT8EBgNcFvXomEGoreZPYLPWLFBSm0Jb8jBPKNj3WJ
	FOPwXV2FDT2QlDJ8azLeM5mDBkv9QLU60dt2EVhTRB1+wL+lLkNTmM8hTWOPaq5q1jo5
	MeRzVKk+mdJ4Be6dGYwgvgn39XVSlkuT8tN70=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=cXjRTi7OpnKsFaQC1xkEOi15uF4/z/JOzfOEnta1xbhq6WKgyTkkhAmezRlmkF4u+0
	NrPrljFQ9rx4xH02Vfpq4tQ+CO+Q9ESxwR7PFiGoPoQh5zCTmKcwl8ZEojhvG1oWV1hr
	gDtW+Q1JixAnHvzuGiCOa1oiy48RprjG0/g3A=
MIME-Version: 1.0
Received: by 10.231.157.131 with SMTP id b3mr607724ibx.19.1264818910560; Fri, 
	29 Jan 2010 18:35:10 -0800 (PST)
In-Reply-To: <ac9c93b11001291357qce6ea6eka4a7e3726ab041@mail.gmail.com>
References: <1264289812.3738.265.camel@mattotaupa.wohnung.familie-menzel.net>
	<ac9c93b11001291357qce6ea6eka4a7e3726ab041@mail.gmail.com>
Date: Fri, 29 Jan 2010 18:35:10 -0800
Message-ID: <19c1b8a91001291835u79b5fd07ldb4db290ce18f268@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.223.187
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [RFC] Perfect(?) workflow for patches.
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
X-List-Received-Date: Sat, 30 Jan 2010 02:37:39 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

there is a script in contrib/patchwork
you can call it

pw-am.sh n1 n2 ....

where n1 n2 are the patch id from patch work.
e.g.
http://patchwork.openembedded.org/patch/1532/
would be
pw-am.sh 1532



On 1/29/10, Frans Meulenbroeks <fransmeulenbroeks@gmail.com> wrote:
> 2010/1/24 Paul Menzel <paulepanter@users.sourceforge.net>:
> ?
>>
>> 4. Commit (if not go to 5.)
>> =A0a) If the reviewer has commit access and accepts the patch, s/he can
>> push it. A hook then changes the Patchwork state to =BBApplied=AB with t=
he
>> appropriate commit id and archived(?).
>
> What is the best way to commit a patch from patchwork?
> I've peeked at pwclient, but ended up with python errors.
>
> FM
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


