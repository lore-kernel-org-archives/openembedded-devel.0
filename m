Received: from mail-yx0-f180.google.com ([209.85.210.180])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1NacST-00077d-7U
	for openembedded-devel@lists.openembedded.org;
	Thu, 28 Jan 2010 23:03:28 +0100
Received: by yxe10 with SMTP id 10so1087309yxe.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Jan 2010 14:01:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=1cFBDXAA8+ySEaN4yOe2tfvngXC5OKNrKYO3QhFCs40=;
	b=nLOCC178r141+nu7g5kW0PPHSTUdZUu/W8Gl94ilDfPQLzchS9Pdu9UVqgENQfAQF0
	9zL+RRlBkLUwwBWQPfgafXoMn3CeOHMQUfb+p9MAAPTOAfpbA3TBc0pTWeW8DxuDOvAX
	7yd+zX16vtWyQuLr1jCJtXyU7wo31VZnxFp/c=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=xsgnzCKB+rDduZiGpq6ANwI5CPqTMt+EH2EXQBSVVkaQ/a0K8VMZsCDFjvnO0WOBj+
	VSFG8ntws9s9ssbWuL30m9/dUc9PGfCftk0vgESYeUv1/dlQ7xT5d2o1YtQXgQAhveHQ
	W0/nbjFpaEtOreSp5EjoIlcYKKJdj+ZalKcVU=
MIME-Version: 1.0
Received: by 10.101.142.14 with SMTP id u14mr1891758ann.244.1264716061751; 
	Thu, 28 Jan 2010 14:01:01 -0800 (PST)
In-Reply-To: <1264715530.9974.436.camel@lenovo.internal.reciva.com>
References: <20100128200049.GA4958@gmail.com>
	<1264715530.9974.436.camel@lenovo.internal.reciva.com>
Date: Thu, 28 Jan 2010 23:01:01 +0100
Message-ID: <ac9c93b11001281401l3b7d20dfoff45632461802c37@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.210.180
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: update hook for git to check push commit message
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
X-List-Received-Date: Thu, 28 Jan 2010 22:03:28 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/1/28 Phil Blundell <philb@gnu.org>:
> On Thu, 2010-01-28 at 12:00 -0800, Khem Raj wrote:
>> Attached is a small hook for updates that are pushed into repo.
>> Right now it only checks the first line of the commit and expects
>> module: summary
>
> I'm not really in favour of applying the commit message policy quite
> that harshly. =A0The wiki page that you linked to doesn't really seem to
> support this kind of check: the actual guidance it gives about checkin
> messages is:
>
> * Have a clear commit message (example):
> =A0 =A0- The first line of commit is a summary of the changes.
> =A0 =A0- The first line should start with the name of the recipe the chan=
ge affects.

What if a commit is not about a recipe but e.g. about a class file
and what if a commit changes multiple recipes ? (i had this one once
when eliminating lots of perl native recipes replacing them with
BBCLASSEXTEND=3D"native")
This was a pain editing already. I think I would have stopped doing it
if I had to commit each individual patch

> =A0 =A0- The rest of the message should give more details on the change a=
s appropriate.
> =A0 =A0- Mention the affected bug numbers if appropriate.
> =A0 =A0- Give credit where credit is due. If you commit someone else's wo=
rk more or
> =A0 =A0 =A0less verbatim, you should use git commit --author $mail-of-aut=
hor. If pulling
> =A0 =A0 =A0changes from somewhere like Poky or OpenMoko there is no probl=
em with that
> =A0 =A0 =A0but mention where the changes came from.
> =A0 =A0- Include a Signed-off-by: line indicating the change has valid ce=
rtificate
> =A0 =A0 =A0of origin as per the Linux kernel

Not sure if we can influence the template that you get with git commit
but I would surely like to learn if one way or another I can add a
Signed-off-by lne automatically

>
> ... which is nowhere near as prescriptive as the rule that you seem to
> be implementing in your script. =A0Also, the wiki page has an explicit
> statement that "[these] rules are not hard fast rules", which would
> suggest that even such guidance as it does provide is not intended to be
> taken too dogmatically.
>
> Personally I think that the current situation of the TSC applying
> pressure to those people who seem to be chronically unable to write
> suitable checkin comments is a perfectly fine way of solving the
> problem.

Agree

FM

>
> On a technical level, I think you could probably do without the sed
> subprocess, and "summary =3D rev.split(1)" doesn't look quite right
> either.
>
> p.
>
>
> p.
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


