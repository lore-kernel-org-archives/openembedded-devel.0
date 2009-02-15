Received: from [209.85.221.22] (helo=mail-qy0-f22.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1LYlg8-0007Nq-Dd
	for openembedded-devel@lists.openembedded.org;
	Sun, 15 Feb 2009 19:25:20 +0100
Received: by qyk3 with SMTP id 3so596897qyk.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Feb 2009 10:23:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:sender:from:to:subject
	:organization:references:x-url:x-attribution:date:in-reply-to
	:message-id:user-agent:mime-version:content-type;
	bh=QNBv2e3Fy6k3sCtxxvn4GWFFkZZXQ0n8ASBLndSmtw8=;
	b=sOa/eFvQtIpUg0Jc7JzQfub1UHl5+oyyjzXJP7h6N4rSgEfGMh/dkwml1GhnGYthOe
	vZEl5IGrm5GGwKRfNqPAvMfMD3bB0ft6NtbQiKmqGiPZBVvTo9Fx/7Y1JJ1OmJltla4e
	zZiN1ZeRYXR/p9mw3kQYWXqc7IuzeaqeSopX0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:subject:organization:references:x-url:x-attribution
	:date:in-reply-to:message-id:user-agent:mime-version:content-type;
	b=KAk1hnVriyrjPb46JTT7AsatX1+bYZC8RGDPPzG/uZdlbR2FX08wYYj6HNhhVdOXIc
	c7DAz7C4hHeuYXg/8wSoXRlSUvk8m7WMEn2FnQZ5RIjczK0LY8wl9/rA2wIMvE4Cbxqj
	ZZT0Kv+/VgJ9NNwNTWLdeilP2An575iv1DwH4=
Received: by 10.224.37.138 with SMTP id x10mr6663192qad.145.1234722213787;
	Sun, 15 Feb 2009 10:23:33 -0800 (PST)
Received: from neumann.lab.ossystems.com.br.ossystems.com.br
	(201-40-162-47.cable.viacabocom.com.br [201.40.162.47])
	by mx.google.com with ESMTPS id 8sm4033600qwj.56.2009.02.15.10.23.31
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 15 Feb 2009 10:23:33 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@debian.org>
To: openembedded-devel@lists.openembedded.org
Organization: O.S. Systems Ltda.
References: <200902140035.13820.khimov@altell.ru>
	<200902140730.32782.openembedded@haerwu.biz>
	<200902141715.56797.khimov@altell.ru>
X-URL: http://www.debian.org/~otavio/
X-Attribution: O.S.
Date: Sun, 15 Feb 2009 15:23:25 -0300
In-Reply-To: <200902141715.56797.khimov@altell.ru> (Roman I. Khimov's message
	of "Sat, 14 Feb 2009 17:15:56 +0300")
Message-ID: <87ocx3y2xu.fsf@neumann.lab.ossystems.com.br>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/23.0.90 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [PATCH] New package: siproxd
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
X-List-Received-Date: Sun, 15 Feb 2009 18:25:20 -0000
Content-Type: text/plain; charset=us-ascii

Roman I Khimov <khimov@altell.ru> writes:

> Marcin Juszkiewicz:
>> On Friday 13 of February 2009 22:35:13 Roman I Khimov wrote:
>> > diff --git a/packages/siproxd/siproxd.inc
>> >
>> > +RDEPENDS = "libosip2"
>> >
>> > diff --git a/packages/siproxd/siproxd_0.7.1.bb
>> >
>> > +PR = "r0"
>>
>> Drop those two lines. You should not add libs to RDEPENDS (OE takes care
>> of it) and "r0" is default PR value.
>
> OK.

It would be quite nice if you could send a git exported patch since it
makes the life eaiser for anyone going to apply your commit (locally or
for pushing it) and also keeps the credit for you.

If you doesn't know to do that, some guidance can be find at:

http://www.kernel.org/pub/software/scm/git/docs/git-format-patch.html

Cheers,

-- 
        O T A V I O    S A L V A D O R
---------------------------------------------
 E-mail: otavio@debian.org      UIN: 5906116
 GNU/Linux User: 239058     GPG ID: 49A5F855
 Home Page: http://otavio.ossystems.com.br
---------------------------------------------
"Microsoft sells you Windows ... Linux gives
 you the whole house."


