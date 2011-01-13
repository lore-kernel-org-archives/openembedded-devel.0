Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1PdVFo-0001Df-6k
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 Jan 2011 23:02:48 +0100
Received: by bwz10 with SMTP id 10so1951071bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Jan 2011 14:02:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=+8YFjXkjQquql3MpH7Ix1T5tcmF45TSHnMyEJQczobA=;
	b=K5fbJjPFU9NXxA5EvzKvRpnZb2tvsJJkU1Hvve+T3WBdJkSyxE9x9W3oJr2bpX4xgr
	+atTyP/BTT8Z6+MKRe7b39wMfyM6qyu0Ftd1DqRSzOyjmcsVcD9BwDpfiGz+bj9Qmwgx
	UJEiaPcEQIxDYardhpxBnwgm2+Hj3TJ8/5MaM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=feF1WMdrfjnqzgl2xAaULUI3PRrXCkH1+SCoOorERkWRMPs3FU3oN90bYFsD8qYYZF
	YW4h4hnM0dpjNEfaWur7hfCUoe00gScLgF8Na/AewOuyEcSjh9sVLPH0Gusti2SGMDd5
	j9vprpKFL2RmwMHXuTApSp4gvyRuLAo6xshio=
MIME-Version: 1.0
Received: by 10.204.102.206 with SMTP id h14mr3291bko.45.1294956135633; Thu,
	13 Jan 2011 14:02:15 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.59.147 with HTTP; Thu, 13 Jan 2011 14:02:15 -0800 (PST)
In-Reply-To: <AANLkTi=p4U3CFO1sMP5mW-EKC-R5nHLqC=0QrN4kXnZK@mail.gmail.com>
References: <AANLkTi=npHcRdA9ehZLYendfUinkE30X_1L6DOLYGBBB@mail.gmail.com>
	<AANLkTi=p4U3CFO1sMP5mW-EKC-R5nHLqC=0QrN4kXnZK@mail.gmail.com>
Date: Thu, 13 Jan 2011 20:02:15 -0200
X-Google-Sender-Auth: tnbcThyO5nfP171Og58lblqOADA
Message-ID: <AANLkTink4Hrjj0dCqj6j=4wMrrX13VrLmHxZiVNy_Dqw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Use of 'sem_open' failing
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
X-List-Received-Date: Thu, 13 Jan 2011 22:02:48 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 13, 2011 at 19:56, Khem Raj <raj.khem@gmail.com> wrote:
> It has been reported more than once for arm architecture. I think
> there could be issue in the way we build eglibc
>
> For test purposes can you try it using uclibc and see if you still get sa=
me
> failure ?

It looks like it is due OLDEST_KERNEL being undefined by some machines.

Mine (i586-generic based) didn't have it (I will push a fix for it
later tomorrow).

It seems that if OLDEST_KERNEL is older then 2.6.13 eglibc ends not
enabling sem_open.

Checking it.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


