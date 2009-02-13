Received: from [209.85.220.17] (helo=mail-fx0-f17.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ihar.hrachyshka@gmail.com>) id 1LY23I-0005xu-FA
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Feb 2009 18:42:12 +0100
Received: by fxm10 with SMTP id 10so2537952fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Feb 2009 09:40:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=iCNCI2UUXUF79c2QYPV0kBIwGjQdPFZrIHSyLO/Yue8=;
	b=HPWT3BZGW38hbLGKc2XOFI6NakbONT9kfhupt7O6wNObkxDjVCkOBKRqMLEGNGoTY1
	2zDob492cZ7vLh9lXQCrcEd+/Udd8POtD0E7h0stS+PFwABil2ECeACwCuuWIqNsBAjK
	kR91AVVjCc1FdsH7wCPy/woe+5krisrivcUNo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=Qst/w1STSTP/P55ooqF1hNVAjsAxNaeFANYd1HMdpDQYZyOvHdaFQTncFvPnpcvQRn
	eilm6QvJc/9f+h+dWMW3c1w/vuQGACJf4RLp8x9hqBWL3pSAk7TFdIVFDfbgd6a8EbFF
	upZJAiA9efXTIw3AVWJqnmttG/OYjngdTu3MU=
MIME-Version: 1.0
Received: by 10.181.134.12 with SMTP id l12mr346582bkn.80.1234546779143; Fri, 
	13 Feb 2009 09:39:39 -0800 (PST)
In-Reply-To: <878woae03q.fsf@neumann.lab.ossystems.com.br>
References: <200902131728.08634.openembedded@haerwu.biz>
	<878woae03q.fsf@neumann.lab.ossystems.com.br>
Date: Fri, 13 Feb 2009 19:39:39 +0200
Message-ID: <fce2a370902130939m708ada3dn55be8cdeadacbfbb@mail.gmail.com>
From: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: checksums situation
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
X-List-Received-Date: Fri, 13 Feb 2009 17:42:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On Fri, Feb 13, 2009 at 7:08 PM, Otavio Salvador <otavio@debian.org> wrote:
> Marcin Juszkiewicz <openembedded@haerwu.biz> writes:
>
> <...>
>> This solution also has one nasty part - now we can keep SRC_URI for
>> multiple versions in common file, but if we switch to storing it in
>> SRC_URI we will have to change that.
>>
>> Other solution proposed on IRC was to keep checksums in extra file in
>> each directory of packages/ subdirectory. I think that it is not best
>> but sounds better then one file.
>>
>> What do you think? Which way we should go? Do you have other ideas?
> <...>
>
> What about having a checksums for _each_ recipe?
>
> foo_1.0.bb
> foo_1.0.md5sum

This will waste directories and will make tree navigation harder.

>
> This could have the valid one; this also avoid the sorting problem and
> like.
>
> --
>        O T A V I O    S A L V A D O R
> ---------------------------------------------
>  E-mail: otavio@debian.org      UIN: 5906116
>  GNU/Linux User: 239058     GPG ID: 49A5F855
>  Home Page: http://otavio.ossystems.com.br
> ---------------------------------------------
> "Microsoft sells you Windows ... Linux gives
>  you the whole house."
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


