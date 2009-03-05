Received: from [209.85.128.185] (helo=fk-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1LfFb3-0003vO-7V
	for openembedded-devel@openembedded.org; Thu, 05 Mar 2009 16:34:53 +0100
Received: by fk-out-0910.google.com with SMTP id f40so1487237fka.12
	for <openembedded-devel@openembedded.org>;
	Thu, 05 Mar 2009 07:30:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:sender:received:from:to:cc
	:subject:organization:references:user-agent:x-url:x-attribution:date
	:in-reply-to:message-id:mime-version:content-type;
	bh=IVBkw979ej9F9Tj+T9oo/j8mK1VsBnLhLOk/ANvmq+4=;
	b=McVmRskFgmZADFVFKIPu12gnOMtkNAnTkLq+adXU65G4DyUiZ0NIUD8DR8PwupqylZ
	FGX9RY2tqoqQUm+m94gY//2RuPgoSxQa9+lgrVr/wEiH2MqCx9Z0uJ5y7LSDcwN4j3Hb
	5WHEdTq7X3IxXfZNsYLdU3q+0pIYCa7ypqOkQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:organization:references:user-agent:x-url
	:x-attribution:date:in-reply-to:message-id:mime-version:content-type;
	b=bW0l7qBz+56dTdLiXcM/PV0lbo1TOCbaG/pa0qm426UsqyAHwiFfOA94ih84e38OXj
	twIdTGdL7vURF4Z+QBPtOCw+uQrBdOvX53kWF8U/aZAGKEwPZyM+QjnSws4sFXJz/WAv
	O5vxTP2e+ZgyZ1m5mzTsxmOOQL+2+9fuz3LfA=
Received: by 10.103.240.15 with SMTP id s15mr595512mur.82.1236267032677;
	Thu, 05 Mar 2009 07:30:32 -0800 (PST)
Received: from ossystems.com.br (201-40-162-47.cable.viacabocom.com.br
	[201.40.162.47])
	by mx.google.com with ESMTPS id j10sm163447muh.1.2009.03.05.07.30.30
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 05 Mar 2009 07:30:31 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by ossystems.com.br (Postfix, from userid 1000)
	id C1DCA6101CE; Thu,  5 Mar 2009 12:30:29 -0300 (BRT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Organization: O.S. Systems Ltda.
References: <20090303204954.CCB9CE8008@amethyst.openembedded.net>
	<1236119119.10602.62.camel@andromeda> <49ADB183.5070709@balister.org>
	<1236120999.10602.70.camel@andromeda> <49AE5117.5020806@gefanuc.com>
	<1236162102.10602.97.camel@andromeda> <golmkq$cve$1@ger.gmane.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/23.0.91 (gnu/linux)
	(x86_64-pc-linux-gnu)
X-URL: http://www.ossystems.com.br/
X-Attribution: O.S.
Date: Thu, 05 Mar 2009 12:30:29 -0300
In-Reply-To: <golmkq$cve$1@ger.gmane.org> (Koen Kooi's message of "Wed, 04 Mar
	2009 11:54:18 +0100")
Message-ID: <87fxhs2dii.fsf@neumann.lab.ossystems.com.br>
MIME-Version: 1.0
Cc: openembedded-devel@openembedded.org
Subject: Re: [oe-commits] Koen Kooi : angstrom 2009.X: bump automake-native to 1.10. 2 since some idiot deleted 1.10
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
X-List-Received-Date: Thu, 05 Mar 2009 15:34:53 -0000
Content-Type: text/plain; charset=us-ascii

Koen Kooi <k.kooi@student.utwente.nl> writes:

> On 04-03-09 11:21, Michael 'Mickey' Lauer wrote:
>> Am Mittwoch, den 04.03.2009, 09:59 +0000 schrieb Martyn Welch:
>>> "Review" is defined as posting it on the mailing lists and getting positive agreement from two or more core developers.
>>
>> Let me propose these kinds of patches being promoted in an unstable
>> branch rather than via mailing list. This eases testing and playing
>> around with the patch.
>
> Patches posted to the mailinglist get more eyes on them.
>
>> Although there were 0 comments (among those none in favour, but also
>> none against), I still think that org.oe.{stable,testing(dev),unstable}
>> with a strict only-cherry-picking-from-right-to-left-allowed policy
>> would improve our workflow and overall stability.
>
> That will just boil down to people only using stable or testing, so
> unstable won't get any testing. Which means you get a false sense of
> security and get to keep the same breakages we see now.
> So no, I won't support such a move.
>
> Why are people so affraid of getting their patches reviewed on the
> mailinglist?

[...]

I'm on same page as you Koen. I also disagree the idea of having a
branch. A project like OE that takes too long to test some kind of
patches does need a human review before even thinking about pushing a
patch against a core component.

-- 
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


