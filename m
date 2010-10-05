Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1P3CTE-0004kr-4x
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Oct 2010 20:42:38 +0200
Received: by iwn2 with SMTP id 2so8613967iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Oct 2010 11:42:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=peBJ0QbKzhLZrnufjZkl32keLvUTaCTQQ6wyRW1nP+E=;
	b=h8Z97TjgmKX63UyhkfscEt/uuB8y6gTe/06N1RsiBenmJCFziPzMKb7suIfNzhuh2/
	qfDEAYo8/9q/udu5exCdG9M8eTCW8FHSEBIrYrPKFf52QgFuiFWaAYI+lENu1AsMTU03
	0ecVi/A9LnkMmLyRfYd6aBoBCfSJRnoou0Ugo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=SAlwx4yRq3xit1R7IEmNZIIjJSchbQnrvZObFZrvKUD1QadCbinhIJQDDZ8MH3PmsT
	1k+2n+9Jl0QCGxUyMuhglBLOaajJ9H/i0eR6r2BXMEXGFr+TvnLS/zJ979uIKLOMqTAH
	o4vhUvokiE9h5UmqXsSSfb3gLsetoIpmjG6N4=
Received: by 10.231.59.13 with SMTP id j13mr12577361ibh.77.1286304138437; Tue,
	05 Oct 2010 11:42:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.199.1 with HTTP; Tue, 5 Oct 2010 11:41:57 -0700 (PDT)
In-Reply-To: <4CAB4112.3070505@mentor.com>
References: <1286264643-6352-1-git-send-email-raj.khem@gmail.com>
	<i8ev7s$ts9$1@dough.gmane.org> <4CAB4112.3070505@mentor.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 5 Oct 2010 11:41:57 -0700
Message-ID: <AANLkTikseyM1539c+yp0w2_Vtg0wSWjJYeNhBN+iuX_1@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 0/6] libtool 2.4 upgrade
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
X-List-Received-Date: Tue, 05 Oct 2010 18:42:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 5, 2010 at 8:15 AM, Tom Rini <tom_rini@mentor.com> wrote:
> Koen Kooi wrote:
>>
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>>
>> On 05-10-10 09:43, Khem Raj wrote:
>>>
>>> Hi
>>>
>>> Following set of patches is intial support for getting libtool 2.4 into
>>> openemebedded. I have so far built minimal-image for two machines
>>> successfully
>>>
>>> The big change that libtool 2.4 brings is sysroot support and I have
>>> added
>>> support to use this feature. It should make our life easier.
>>
>> I'm a bit concerned about the way this is implemented, it seems to for
>> libtool 2.4 onto everyone since it changes e.g. autotools.bbclass. Is
>> that intended? If so we need signoffs from each and every distro
>> maintainer *and* from the maemo-compat folks as well.
>> Unless there is a way to make the new features conditional on the
>> libtool version.
>
> It shouldn't be too bad, implementation wise, to set LIBTOOL_HAS_SYSROOT =
or
> similar and test for that.

yes some sort of knob to differentiate 2.4 from rest

=C2=A0But can we also set a phase out date for older
> libtool, even if maemo-compat isn't possible (given chinhook pins to 1.5,=
 I
> bet it's not) ?
>
> --
> Tom Rini
> Mentor Graphics Corporation
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


