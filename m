Received: from [74.125.92.145] (helo=qw-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1MVNKE-0001hq-Dm
	for openembedded-devel@lists.openembedded.org;
	Mon, 27 Jul 2009 12:20:58 +0200
Received: by qw-out-1920.google.com with SMTP id 4so1421269qwk.36
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Jul 2009 03:06:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=0V+cOiQ/aAVpHGmF+0I9nQnM+MoDlD5LZ9HybapODm4=;
	b=NAlvXrjmgpObAKAFFJk2KhQ0ph4SoR7dduS5KODBIWU5l8JXeyP7pnWWbtPgu8WzDl
	f2BAEMtZvMxi4IEfCsCeXTNSpMwZPkiH0Gi/WYNA//kc5o8bLGWVUDfbrHX8fJISszz6
	ma0FZzLMAWwuSULV0GRiwsg/HnqP72D3KOBfA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=Lof9Whl0QLO437KZ9dDzAkEXjLHRWoIFbi6wbuVHspx5gZqMwUizy0p62vUf446ZtW
	B1nSNhNlFAC1wwThoqPvRrTtDSYCsoa+4jVc4hc5ap6fPZRwyyiFuoxz94CbF+ufZL0l
	mwEwioubgx09fRPZ3E4tioOXJdi+zGOxi6A54=
MIME-Version: 1.0
Received: by 10.229.97.80 with SMTP id k16mr1377695qcn.17.1248689178130; Mon, 
	27 Jul 2009 03:06:18 -0700 (PDT)
In-Reply-To: <aa8983610907270146n6c3f6fe8ucc2f63b3ff32aa@mail.gmail.com>
References: <4A6D5C5A.2010003@gmail.com>
	<aa8983610907270146n6c3f6fe8ucc2f63b3ff32aa@mail.gmail.com>
Date: Mon, 27 Jul 2009 19:36:18 +0930
Message-ID: <6ec4247d0907270306n6892c3b4g9da71f8e5f60add9@mail.gmail.com>
From: Graham Gower <graham.gower@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: linux recipe selected despite ASSUME_PROVIDED += "virtual/kernel"
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
X-List-Received-Date: Mon, 27 Jul 2009 10:20:58 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

2009/7/27 Patrick Bellasi <derkling@gmail.com>:
> On Mon, Jul 27, 2009 at 09:50, Graham Gower<graham.gower@gmail.com> wrote:
>> Hi,
>> I wish to build an Angstrom based console-image for mipsel from the
>> org.openembedded.dev branch. I maintain a kernel for the device but am
>> not yet ready to integrate this into an OE recipe. The default
>> linux_2.6.30.bb
>> fails to build for me, thus I wish to not build the kernel at this point
>> in time.
>>
>> My local.conf contains the following lines,
>> STAGING_KERNEL_DIR = "/home/grg/jz/linux"
>> ASSUME_PROVIDED += "virtual/kernel"
>
> I guess that a kernel is required to build an image: in instance to
> compile libc which relay on some kernel headers.
>
>> However, when i run 'bitbake console-image the default linux_2.6.30.bb
>> recipe
>> is still selected and the build procedes to fail.
>>
>> Is this the correct procedure to avoid building a kernel? If so, what else
>> could I be doing wrongly?
> So: if you ASSUME_PROVIDED a kernel, at least you should provide a
> reference to you kernel tree... but the main poin is: is it possible
> to reference a kernel outside OE?

Yes, I had hoped setting the STAGING_KERNEL_DIR would do what you say.


