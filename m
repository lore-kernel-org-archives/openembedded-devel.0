Received: from mail-yx0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1NApJ2-0005d9-NI
	for openembedded-devel@lists.openembedded.org;
	Wed, 18 Nov 2009 19:31:07 +0100
Received: by yxe5 with SMTP id 5so1303491yxe.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Nov 2009 10:29:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=Hwv5TC3t0xUzwa/adLSzJ7z/ZLFlJpMtiPmkNh/qwUw=;
	b=lwVokH8fuC3EZZNjcriXB+ui1RMBKv0UWNDut1RZJt2uTG7w8kqk2dvSDbFx+cpQXh
	bYDAGSlvxWWCNYM7Xte85FRnAu1tRTpsr2FN77XM255Kfk3gVYoCXkspR2AJM5s5Jv2A
	SMZVnD7qlnQJFh7IX31DB3gLgWFluVNpBKaM8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=EnX8xl3QAsLx+q74219b9UHiVG5J/sj+0US5A+IFwN8rZxywW4+JSzcvGctPTnHlip
	nG3Df7VPXXmoyCl9KbJCv+YPgOrY5skpjRZJbS9GTZeKP2XEGn14VpFAVNhz7WovqjWd
	eqLaF6AWSKXc/a0ba9GYlx90LfOTMWiixMQsI=
MIME-Version: 1.0
Sender: otavio.salvador@gmail.com
Received: by 10.239.179.97 with SMTP id c33mr537539hbg.157.1258568979252; Wed, 
	18 Nov 2009 10:29:39 -0800 (PST)
In-Reply-To: <c384c5ea0911180814sc16a03dt3a829c5e5a8f9a@mail.gmail.com>
References: <1258504413-25056-1-git-send-email-leon@sidebranch.com>
	<be7a9f3d0911180509x7df420cetc4ed1575602b68e2@mail.gmail.com>
	<c384c5ea0911180814sc16a03dt3a829c5e5a8f9a@mail.gmail.com>
Date: Wed, 18 Nov 2009 16:29:39 -0200
X-Google-Sender-Auth: 8ff72ce9a48150f6
Message-ID: <be7a9f3d0911181029u57f93a50y1715d81701191323@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.210.175
X-SA-Exim-Mail-From: otavio.salvador@gmail.com
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
X-List-Received-Date: Wed, 18 Nov 2009 18:31:07 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello,

On Wed, Nov 18, 2009 at 2:14 PM, Leon Woestenberg
<leon.woestenberg@gmail.com> wrote:
>> I agree with the move to mainline version however your recipe changes
>> might need some improvement. You don't use the lzma recipe available
>> in OE and instead grab it again ... IMO this is wrong since it
>> duplicates the lzma source and also make more difficult to us to
>> "share" fixes.
>>
> Yes, I noticed this.
>
> However, this is *exactl*y how the squashfs author designed his
> integration of LZMA; simply referring to a specific extracted archive
> of the LZMA SDK.
>
> (consider this is a lazy man's way of static linking)

Anyway I think it is worth fixing it.

Duplicating sources (and the needed fixes, in case LZMA requires one)
is wrong if avoidable so I'd say it would be nice to fix it.

>> Besides that =A0I think it is ok. Can you fix it and send a new patch fo=
r review?
>>
> I will not fix it. Instead I will contact the squashfs author to ask
> if he want to consider the neat approach (if of course LZMA provides
> this).

Look above.

> In the meantime, should I apply the patch as-is?

You already did but I'd expect some time to reply before you pushing it.

:-(

--=20
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


