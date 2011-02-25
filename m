Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Pt45D-00010Z-3k
	for openembedded-devel@lists.openembedded.org;
	Fri, 25 Feb 2011 21:16:11 +0100
Received: by bwz10 with SMTP id 10so2347082bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Feb 2011 12:14:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=V4NegpGRL2HGRLiYFq0QQ7xSbCKP/uPvhvYplfwBtVk=;
	b=Elv6/NxCjUfi2tAtAVTlXZF4WOxy0JsCCcfJzHIByWlPV0k2waxGPGb0YMu8VXXNVv
	LY2tmLCNRi9Yz3Gu3OENrJ9tBnekHbScaILHvBx4wijYANG8c+jGR40K3Ed6fPSQOr4N
	usdSIM86ZtIEoVhgwDUGkUeXMEu7OaTWrdgB8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	b=hHxWAGdH2EU0aLMRwLDsPfb7qdd8jZIbofps66Mun5UYE1M9vcUZ46rx2DL482V4+N
	QbcwJ7JCk1MLmBEgShUeDWQAFjBSxvxwTHA3t2t60aGn8ieYLSj2635yph2jYoRVWOk8
	HCwDoZkJOJFjviDtcn6PBa5YlQIFFS8me9JgQ=
MIME-Version: 1.0
Received: by 10.204.12.84 with SMTP id w20mr2517681bkw.43.1298664863123; Fri,
	25 Feb 2011 12:14:23 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.119.207 with HTTP; Fri, 25 Feb 2011 12:14:23 -0800 (PST)
In-Reply-To: <1298664057.3818.0.camel@lenovo.internal.reciva.com>
References: <AANLkTiknqQ6xLj8LFv4=17ymwSbVhD3C9kVe2qkviXhX@mail.gmail.com>
	<1298664057.3818.0.camel@lenovo.internal.reciva.com>
Date: Fri, 25 Feb 2011 20:14:23 +0000
X-Google-Sender-Auth: WNY_MEaz7pqb1smGuTzhaEqu0r0
Message-ID: <AANLkTin2WuKF=f_aOzi=28FmVTaxFVJa0uNb9TjfL2SB@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Missing GLIBC_<version> tags on binaries
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
X-List-Received-Date: Fri, 25 Feb 2011 20:16:11 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 25, 2011 at 20:00, Phil Blundell <philb@gnu.org> wrote:
> On Fri, 2011-02-25 at 19:03 +0000, Otavio Salvador wrote:
>> I am fighting with an issue for last cuple of days and after checking
>> a lot of weird stuff it seems that the root cause of problem is a
>> linking issue.
>>
>> I am having trouble with apps using semaphores. Those are lacking the
>> GLIBC_2.1 or similar tags and then doesn't work. I rebuilt the
>> application to check and it keep doing the linking wrong.
...
> Can you be more specific about what's going wrong? =A0I guess you are
> saying that your libc lacks the GLIBC_2.1 version of some symbol, but
> which one? =A0Does the problem show up during linking or at run time?
> Which binaries in particular?
...

It fails at runtime. The application I am compiling is freerdp and
sem_ symbols are not versioned, dunno why.

Cheers,

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


