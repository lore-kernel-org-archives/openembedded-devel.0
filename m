Received: from mail-yx0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1NAnCV-0005IR-7C
	for openembedded-devel@lists.openembedded.org;
	Wed, 18 Nov 2009 17:16:14 +0100
Received: by yxe5 with SMTP id 5so1158854yxe.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Nov 2009 08:14:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=5LJFP5rI7Oy3uoAQkj3fA0iS9yw5u39aE51MFyhC36s=;
	b=lUW3PeI+Th8VNTv2lWAxRbjIJ3i0GSRTl6RKJMgNiNbbtpmXP73bLNW5OOD82nG38G
	J10Tg51E6rnLQDRiuS3y98KgMzbVrQrg/7Ziqcr2vaCse9N5yQHiCHVGWQRNvSLjYsFN
	h+wLQCLP3xv0+wUr9uCslm6icecgIX43mP+uQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=QxJSNEnMG2tfRzV+C+2bNxYPyhLKWSIMAJ8X84pnnh1MRMCc9Q2wyuAgt0AtHbpu+o
	C2iGPzUG4gGdxH75AljDncn8HE5lkI5V7Beuh4GcxEToyt9AWNIG72cgDc7fGX2TqDIv
	p1HqEBpRj4mepQuQ/2XOuVh2x6/dYMI4n0x6k=
MIME-Version: 1.0
Received: by 10.239.158.7 with SMTP id s7mr1087912hbc.53.1258560885916; Wed, 
	18 Nov 2009 08:14:45 -0800 (PST)
In-Reply-To: <be7a9f3d0911180509x7df420cetc4ed1575602b68e2@mail.gmail.com>
References: <1258504413-25056-1-git-send-email-leon@sidebranch.com>
	<be7a9f3d0911180509x7df420cetc4ed1575602b68e2@mail.gmail.com>
Date: Wed, 18 Nov 2009 17:14:45 +0100
Message-ID: <c384c5ea0911180814sc16a03dt3a829c5e5a8f9a@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.210.175
X-SA-Exim-Mail-From: leon.woestenberg@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] squashfs-4.0: update squashfs-tools to include upstream LZMA inclusion.
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
X-List-Received-Date: Wed, 18 Nov 2009 16:16:14 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello Otavio,

On Wed, Nov 18, 2009 at 2:09 PM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> On Tue, Nov 17, 2009 at 10:33 PM, Leon Woestenberg
> <leon.woestenberg@gmail.com> wrote:
>> In OpenEmbedded we used squashfs 4.0 with external patch for LZMA
>> compression support. In the meantime, squashfs has mainlined LZMA
>> support in its CVS version.
>>
>> This patches switches to the upstream squashfs-tools and modifies
>> bitbake.conf to match the slightly different arguments to mksquashfs.
>
> I agree with the move to mainline version however your recipe changes
> might need some improvement. You don't use the lzma recipe available
> in OE and instead grab it again ... IMO this is wrong since it
> duplicates the lzma source and also make more difficult to us to
> "share" fixes.
>
Yes, I noticed this.

However, this is *exactl*y how the squashfs author designed his
integration of LZMA; simply referring to a specific extracted archive
of the LZMA SDK.

(consider this is a lazy man's way of static linking)


> Besides that =A0I think it is ok. Can you fix it and send a new patch for=
 review?
>
I will not fix it. Instead I will contact the squashfs author to ask
if he want to consider the neat approach (if of course LZMA provides
this).


In the meantime, should I apply the patch as-is?


Regards,
--=20
Leon


