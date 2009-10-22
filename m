Received: from [209.85.218.217] (helo=mail-bw0-f217.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1N15zD-0001uE-GM
	for openembedded-devel@lists.openembedded.org;
	Fri, 23 Oct 2009 00:18:26 +0200
Received: by bwz9 with SMTP id 9so854787bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Oct 2009 15:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=0PunT85/daFIocF8Y03nc+U9LyG0KuIJb7BndoEZncg=;
	b=T9Z9IG0OxYUSmFUqrSxaBR2AjYUFIHuCInGvDw8RCK/WdPzmGHbTdml4bcpEnAXCEv
	t2t0BU7MwZpMrzQAKemnhdcEugx8/AiNRxdmF+ITYwyxcSWM8XDL1u2oMdsRNIoJupwC
	INK6eGKKwINKTcVYK+H4+vLiv7a3c3QGvwzTk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=eM1XhINVfm9mRqEfkX17Uh96SjKi/YyNQIkXp3voDPA61WhIUeL524Wow2pTYY2OdS
	uEK79hLitgxwhs449AtfyInaq8LAve4vnx+UsrVT0kyNWWdsBMVM7P9+2M6QUgIjJbHK
	B/Ghx4BCH+pEXA5E0kY62YrnOu6YclY+XCsiM=
MIME-Version: 1.0
Sender: otavio.salvador@gmail.com
Received: by 10.239.139.17 with SMTP id r17mr820942hbr.140.1256249840947; Thu, 
	22 Oct 2009 15:17:20 -0700 (PDT)
In-Reply-To: <200910222119.40861.marcin@juszkiewicz.com.pl>
References: <c384c5ea0910221208y3efee675t6c292de20ed1d8f1@mail.gmail.com>
	<200910222119.40861.marcin@juszkiewicz.com.pl>
Date: Thu, 22 Oct 2009 20:17:20 -0200
X-Google-Sender-Auth: 1474b27cf8108429
Message-ID: <be7a9f3d0910221517g2bc6d91k55e18e9d3c5e6604@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.218.217
X-SA-Exim-Mail-From: otavio.salvador@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [RFC] package complete ${datadir} ${libdir} by default
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
X-List-Received-Date: Thu, 22 Oct 2009 22:18:26 -0000
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: quoted-printable

Hello,

On Thu, Oct 22, 2009 at 5:19 PM, Marcin Juszkiewicz
<marcin@juszkiewicz.com.pl> wrote:
> Dnia czwartek, 22 pa=BCdziernika 2009 o 21:08:27 Leon Woestenberg napisa=
=B3(a):
>> Why does FILES_${PN} have ${PN} after ${datadir} and ${libdir}?
>>
>> I would propose to just package ${datadir} and ${libdir} as-is.
>> Or am I overlooking something?
>
> PACKAGES =3D "PN-dbg PN PN-doc PN-dev PN-locale"
>
> With your suggestion PN-doc and PN-locale starts to be useless as PN will=
 get
> /usr/share/{doc,man,info}/ which are part of PN-doc and /usr/share/locale=
/
> which is packaged to PN-locale.

Even more; it can "hide" contents inside of the package without
further noticing.

IMO everything that is not _standard_ ought to be explicited add.

Regards,

--=20
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


