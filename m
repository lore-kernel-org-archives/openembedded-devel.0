Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1PTypA-00089b-8T
	for openembedded-devel@lists.openembedded.org;
	Sat, 18 Dec 2010 16:35:56 +0100
Received: by wwi17 with SMTP id 17so1622228wwi.24
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Dec 2010 07:35:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:cc:content-type:content-transfer-encoding;
	bh=jffUIy8ITamqQlzZm7S+ex6/K1YkaAv8LCSsOTc9SfA=;
	b=xQRvswozLsL5of81JLtEiP8Aob8cXfVaJcecRd7vLhSatQC1DlmTzldqcbC9t6nmI7
	/mO8IDo+5GPZEOT2SIHkq32DIDGOaQ40j7f3v36BXuoQTZlxKBmmcKIG+3w+FRhK3f77
	KP7Z0HdC25yb97dRQuvyCjnf4OVsCYKsv4+ns=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type
	:content-transfer-encoding;
	b=tBICbwFMHC1++1WrBrRPKoku7MaEfP+uXkmrj+Bhowui7cONJZNmLvnOOuENZ75jwj
	YTxpQWPy4Fjmcip8GcwwBeiMFXLYDQamKOuXlQMliz18wE0Lih29AN0At50SbYGTNLRy
	PW2RrxMEQzqE3AUYO89W/5jcOSOSg5SSvKYac=
Received: by 10.216.220.219 with SMTP id o69mr2605598wep.57.1292686552845;
	Sat, 18 Dec 2010 07:35:52 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.67.67 with HTTP; Sat, 18 Dec 2010 07:35:04 -0800 (PST)
In-Reply-To: <AANLkTim1ZFrjZuvJgKGB-+2wTNUAx5cdiNsRXK8bvRf9@mail.gmail.com>
References: <AANLkTim1ZFrjZuvJgKGB-+2wTNUAx5cdiNsRXK8bvRf9@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Sat, 18 Dec 2010 08:35:04 -0700
X-Google-Sender-Auth: t9LHxIZCLCsl5scheVlFpuR4s3k
Message-ID: <AANLkTimkoAmu_Qy=t635mP3ufHTqhUbQbr4PTpMjFBLq@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: bitbake-dev@lists.berlios.de
Subject: Re: bitbake git head issue
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
X-List-Received-Date: Sat, 18 Dec 2010 15:35:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 18, 2010 at 4:16 AM, Frans Meulenbroeks
<fransmeulenbroeks@gmail.com> wrote:
> If I use bitbake git head I get:
>
> frans@linux-suse:~/oe/openembedded> bitbake james-image
> Process ProcessServer-1:
> Traceback (most recent call last):
> =C2=A0File "/usr/lib/python2.6/multiprocessing/process.py", line 231, in =
_bootstrap
> =C2=A0 =C2=A0self.run()
> =C2=A0File "/home/frans/oe/bitbake/lib/bb/server/process.py", line 95, in=
 run
> =C2=A0 =C2=A0[NULL, NULL, NULL]):
> =C2=A0File "/usr/lib/python2.6/contextlib.py", line 16, in __enter__
> =C2=A0 =C2=A0return self.gen.next()
> =C2=A0File "/home/frans/oe/bitbake/lib/bb/utils.py", line 805, in redirec=
ted_fds
> =C2=A0 =C2=A0old_fds.append(os.dup(fd))
> OSError: [Errno 9] Bad file descriptor
>
> I did not fully bisect it but rev
> 144887553097a288a76b8de78f71548d5ef9a350 still works fine with me.
> The problem seems to be introduced in one of the next 5 or so commits
> after that one.

There are 32 commits after that one, not 5 ;)
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics


