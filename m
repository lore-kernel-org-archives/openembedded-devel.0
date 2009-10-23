Received: from [74.125.78.145] (helo=ey-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1N189h-00065v-Ov
	for openembedded-devel@lists.openembedded.org;
	Fri, 23 Oct 2009 02:37:24 +0200
Received: by ey-out-1920.google.com with SMTP id 3so95182eyh.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Oct 2009 17:36:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=imLma2wgJWAaXDZO2OpBa5rnUoBxRPikiRO71BKtpkY=;
	b=hGiNHgkNaQ4mY+KPecCWNJFPyu2YQoX/2QX6FAGvArBeTGk9o2coIDtKa2NUr3GNZ7
	p+QVIuLLMFlufCbWHdoYzwPMvhAUvHpJ0MmMUnLO0YKEcPAbnEc2XHz3N8QNI3W5PQI0
	AUGqhjCfVVqfGRtIn7peAOSObgMuqJuR3CWUg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=xNBMiqDB8cexHH0JdfdiitiKg+9PRJRozYouo9oh/DHo+tOfh18NVwIes2rBH7qnco
	e7W+h3Y5FrZAIUMcKvOblzsffhPBD2BrAlCVB+53GUOnjiNAX21XmAbbEcspiNMz4lu1
	IsmqMHiEUYebZOi4+zzxcOieq4OBKrulLkfQM=
MIME-Version: 1.0
Received: by 10.210.4.23 with SMTP id 23mr43386ebd.96.1256258181346; Thu, 22 
	Oct 2009 17:36:21 -0700 (PDT)
In-Reply-To: <4AE0C0AE.20305@eukrea.com>
References: <4AE0BEFA.4020905@mlbassoc.com> <4AE0C0AE.20305@eukrea.com>
Date: Thu, 22 Oct 2009 17:36:21 -0700
Message-ID: <19c1b8a90910221736j70fce8cag1ed17dd058c9a48@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.78.145
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: SDK problems
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
X-List-Received-Date: Fri, 23 Oct 2009 00:37:25 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 22, 2009 at 1:29 PM, Eric B=C3=A9nard <eric@eukrea.com> wrote:
> Hi Gary,
>
> Gary Thomas wrote :
>>
>> I tried to build the QTE SDK using
>> =C2=A0git://git.openembedded.org/openembedded
>> =C2=A09e54aa00b3de07933fabf5f6193a4f40af3b54f9
>>
>> When I try the example
>> =C2=A0(http://docs.openembedded.org/usermanual/html/ch05s08.html),
>> I get:
>>
>> init.c:(.text+0x2c): undefined reference to `__libc_csu_fini'
>> init.c:(.text+0x34): undefined reference to `__libc_csu_init'
>> collect2: ld returned 1 exit status
>> make: *** [qte-example] Error 1
>>
>> Any ideas what I need to do to fix this?
>>
> same thing here. Following an advice on IRC, I tried to switch to eglibc
> without success (eglibc didn' build)

Cant help unless you disclose what errors are.

 and still haven't found a solution to
> generate a working QT SDK for a Cortex A8.
>
> Eric
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


