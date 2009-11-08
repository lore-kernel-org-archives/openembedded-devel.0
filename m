Received: from [209.85.218.217] (helo=mail-bw0-f217.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1N76uj-0002pW-En
	for openembedded-devel@lists.openembedded.org;
	Sun, 08 Nov 2009 13:30:40 +0100
Received: by bwz9 with SMTP id 9so2430806bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 08 Nov 2009 04:29:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to:cc
	:content-type; bh=awIpiQeY59fX3K620g7dlatj/IGDSRlrfaAjyAFpqzA=;
	b=koOlq34VY7hb9WvclXPZYVlAFCFCuU9p1B7HLXI7FxlM0P5uxwR37Z+vMnO2eaVEHE
	VY6JOdJ0SUEmfAYCDUe42HydyLAnCLL32Dnj4dN/NFaPFRw8QRZfNm/DEQCZKmJch40i
	TxF9SGXJuMxtRs4pT/ilwk0pCWzbkgo6lXxD4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	b=NQhc6p6kIEJmAEhVtp5WwPdDTeRi95uun+qOoYlg/kOfITA/sdZJ4VmTVvmD/Vkr4A
	OLYor6wbOObqiJqy8dJExQ8BrvmskOJjjHfRh2XAqFMgTv2oB52zVLTmzC95VWoUSGRS
	oAzOGE/OdB5/qUb0/uyfXSVeJL2c72T38G3e4=
MIME-Version: 1.0
Sender: otavio.salvador@gmail.com
Received: by 10.239.182.137 with SMTP id q9mr719337hbg.72.1257682935117; Sun, 
	08 Nov 2009 04:22:15 -0800 (PST)
In-Reply-To: <c384c5ea0911071703o4aec5583w140a128328b5bdcc@mail.gmail.com>
References: <c384c5ea0911071703o4aec5583w140a128328b5bdcc@mail.gmail.com>
Date: Sun, 8 Nov 2009 10:22:15 -0200
X-Google-Sender-Auth: 5f566a99775d17df
Message-ID: <be7a9f3d0911080422q13f8d4dj7c70da47f03ce9ba@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Leon Woestenberg <leon.woestenberg@gmail.com>
X-SA-Exim-Connect-IP: 209.85.218.217
X-SA-Exim-Mail-From: otavio.salvador@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: Machines/users of squashfs 4.0 with lzma?
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
X-List-Received-Date: Sun, 08 Nov 2009 12:30:40 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello Leon,

On Sat, Nov 7, 2009 at 11:03 PM, Leon Woestenberg
<leon.woestenberg@gmail.com> wrote:
> Hello Otavio, all,
>
> I saw you as the committer/author for the current bitbake for squash
> 4.0 stuff with lzma patches, thanks for that.
>
> As lzma support is now (almost!) landed upstream, I would like to see
> what the impact is of moving to the upcoming 4.x release.

I guess it is compatible with current squashfs available on 2.6.31
right? In this case it is OK I guess.

Do you have a backport of the lzma support in kernel to 2.6.31?

> I have a patch on standby that moves from 4.0+patches to the current
> SVN where lzma is built-in.

Please do.

> However, first, who is using this??

I use it to our OS with a setup similar to Koen's.

-- 
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


