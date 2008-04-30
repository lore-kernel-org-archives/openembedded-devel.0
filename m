Received: from [64.233.178.245] (helo=hs-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <papercrane@gmail.com>) id 1Jr343-0005NO-6A
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 Apr 2008 05:33:03 +0200
Received: by hs-out-0708.google.com with SMTP id 23so354073hsn.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Apr 2008 20:32:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:reply-to:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
	bh=UW8/7V7Vh6w41NUt6YvZ+zpzz/Qg7fMFV7dzhG7XVfo=;
	b=QMSLph94aWOhT9mt4mahL17Zi1FQv+ZJg9drwFN8DrZy0D6GJ6eB6ze6XgHYJE+b0S7HfBqJk5JV/9Ngc/pTsTKGWfw1Z5i30cW9+Cwe/M3eQ93uaOZhtKSLNNC+hrQs0UoVwbJJTujxQMepm67RkO7MVdDtEYvYrapq4ITP3c4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:reply-to:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
	b=SQn/Hw9ChddAdkkj0XoYIdyYT/Fmz4i/6IF4RBWigrIxZ8hOdYoBb72jRy9WmDKJN9wvFIFFSFUhhMgMUpKpJrphgEDkkdquKFb4hwndVmKdkoUF5VQSiMpmULaPtcUoriQJEpB01w+AniqwsasVmg0Xl33EEhQnKP93sgHBe6Q=
Received: by 10.90.113.11 with SMTP id l11mr365368agc.65.1209526352577;
	Tue, 29 Apr 2008 20:32:32 -0700 (PDT)
Received: by 10.90.95.14 with HTTP; Tue, 29 Apr 2008 20:32:32 -0700 (PDT)
Message-ID: <432beae0804292032h6cf21619v39bcb8ec742e48e6@mail.gmail.com>
Date: Tue, 29 Apr 2008 20:32:32 -0700
From: "Justin Patrin" <papercrane@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <c384c5ea0804291711v184b9826k99fd9e899f0289f8@mail.gmail.com>
MIME-Version: 1.0
References: <8609a9b90804291337m5d580672qb16413c2d675cd1e@mail.gmail.com>
	<c384c5ea0804291711v184b9826k99fd9e899f0289f8@mail.gmail.com>
Subject: Re: merge mutiple heads...
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10b4
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
X-List-Received-Date: Wed, 30 Apr 2008 03:33:03 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Tue, Apr 29, 2008 at 5:11 PM, Leon Woestenberg
<leon.woestenberg@gmail.com> wrote:
> Hello,
>
>
>  On Tue, Apr 29, 2008 at 10:37 PM, Johannes Paechnatz
>  <jpaechnatz@gmail.com> wrote:
>  >  when I try to checkout org.openembedded.dev I get the following error=
...
>  >
>  >  mtn: Zweig org.openembedded.dev hat mehrere K=F6pfe:
>  >  mtn:   1a467a7ea8dfd7463354c140383975aa0b8b20e8
>  >  freyther@openembedded.org 2008-04-25T15:51:39
>  >  mtn:   60d4d904e10f8212b1c2242377b31ccc2e29e374
>  >  freyther@openembedded.org 2008-04-25T15:03:16
>  >  mtn: w=E4hlen Sie einen durch 'mtn checkout -r<id>'
>  >  mtn: Fehler: Zweig org.openembedded.dev hat mehrere K=F6pfe
>  >
>  Either synchronize again, say 15 minutes later, and the server will
>  have run a auto-merge of the heads.
>
>  Or, run mtn --db=3DOE.db merge yourself.

Or just choose one of the heads and use -r to check it out. Later once
it's merged you'll still be able to update just fine.

--=20
Justin Patrin


