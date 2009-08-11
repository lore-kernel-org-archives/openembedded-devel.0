Received: from [74.125.92.144] (helo=qw-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1MagAe-0005TB-5M
	for openembedded-devel@lists.openembedded.org;
	Tue, 11 Aug 2009 03:29:00 +0200
Received: by qw-out-1920.google.com with SMTP id 4so1186886qwk.36
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Aug 2009 18:12:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=1D1FKi02etBCyWIdMLL9gWVnvV8MwnkOXa+44ZrAOlw=;
	b=Ru289Sgk868PFoVSMW303JpID9pEQSNRBPC2wHfUFLkcU2E4R5Fb6seecCPh0UoeBY
	H6pd5podZwgY13A7f1zVr6YoFjFMBcz5tejjKqHqMpyVgl2F82Nhv4kxrzRJFmNrFQuX
	DspxkrCN6uaYCyQ7+IMwaMM8eaZoN/CrYMBTo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=Bc18nppgH+ZQCn9rNtlWXhAxrUOikOPGI8NH5pjsDQav9CyiidC93JrwE70QmpGl8s
	s0jK+xCn6s7H0SqOwITDO2+HtLIeNaDlxAm1NYS88gl+ljiS1n9qJhs22FenEmx9mYgU
	1Modv42JlTIhFg04oeAio5n6ATqOV9D7daJIg=
MIME-Version: 1.0
Received: by 10.229.96.9 with SMTP id f9mr1684699qcn.78.1249953165156; Mon, 10 
	Aug 2009 18:12:45 -0700 (PDT)
In-Reply-To: <4A808E05.8070302@cbnco.com>
References: <1249923716-19141-1-git-send-email-msmith@cbnco.com>
	<20090810192932.GA8142@gmail.com> <4A808E05.8070302@cbnco.com>
Date: Mon, 10 Aug 2009 18:12:45 -0700
Message-ID: <19c1b8a90908101812v662e21b4h54683ac6fe4380b1@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] pciutils: fix generation of pci.ids.gz
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
X-List-Received-Date: Tue, 11 Aug 2009 01:29:00 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On Mon, Aug 10, 2009 at 2:15 PM, Michael Smith<msmith@cbnco.com> wrote:
> Khem Raj wrote:
>>
>> Some older versions of hal could only use uncompressed version. So may be
>> you
>> could package both versions or leave a possiblity to package
>> uncompressed version somehow.
>
> Hi Khem,
>
> I could put pci.ids into pciutils-ids-uncompressed, would that work? I don't
> see a reference to pciutils-ids in any recipe or image outside pciutils, so
> I'm guessing this is something a hal user would install manually after
> installation?

That would be ok

>
> Thanks,
> Mike
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


