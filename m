Received: from [209.85.220.222] (helo=mail-fx0-f222.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1N1GH1-0003QA-DD
	for openembedded-devel@lists.openembedded.org;
	Fri, 23 Oct 2009 11:17:30 +0200
Received: by fxm22 with SMTP id 22so9467092fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Oct 2009 02:16:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=JnhsBjgBgWfHfA8PSlwU6UNfkuuQSD6tvVIU7Ee7SVM=;
	b=Admku/5+yXx8fFIXdhnNoXCvC/7LAVj7Rmmn8JGouWRH3UklGJF+x/JyUs9dojF4k2
	ftSzGM/GSuph3P1A/Q38sma2ioHTZEljx39lL4pRuYh/iXgQcn+jmbcAx4G2ry8Azlid
	eSyVFnw1HNtJumyFh6jFgCFsQskB8hu4zLvuE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=H9MzwFC8AHj5Df1j83l3P8hAeZM8fPruO5fni9yGKQW0/cWZl8sV6uEgUtJ+NxuKeq
	FV6HHdk+nsHGMXzHVVTi0Dgaq1o5TT8GGsqHuM1RC7vb2ia1KSVYOf/WH5yU4pWcmofg
	1ckeJMgmxg6WOgfbNjE4HfggH0GT9wWJJsADo=
MIME-Version: 1.0
Received: by 10.239.183.141 with SMTP id u13mr985254hbg.10.1256289383343; Fri, 
	23 Oct 2009 02:16:23 -0700 (PDT)
In-Reply-To: <200910222119.40861.marcin@juszkiewicz.com.pl>
References: <c384c5ea0910221208y3efee675t6c292de20ed1d8f1@mail.gmail.com>
	<200910222119.40861.marcin@juszkiewicz.com.pl>
Date: Fri, 23 Oct 2009 11:16:23 +0200
Message-ID: <c384c5ea0910230216o227b6c45p23649489df8778b3@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.220.222
X-SA-Exim-Mail-From: leon.woestenberg@gmail.com
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
X-List-Received-Date: Fri, 23 Oct 2009 09:17:30 -0000
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 22, 2009 at 9:19 PM, Marcin Juszkiewicz
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
>
Good point, so the package order should change to:

PACKAGES =3D "PN-dbg PN-doc PN-dev PN-locale PN"

Regards,
--=20
Leon


