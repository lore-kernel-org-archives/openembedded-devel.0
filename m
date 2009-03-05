Received: from [209.85.220.167] (helo=mail-fx0-f167.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1LfFcZ-00043j-BC
	for openembedded-devel@lists.openembedded.org;
	Thu, 05 Mar 2009 16:36:27 +0100
Received: by fxm11 with SMTP id 11so3289731fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Mar 2009 07:32:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:sender:received:from:to
	:subject:organization:references:user-agent:x-url:x-attribution:date
	:in-reply-to:message-id:mime-version:content-type;
	bh=PV8BrTj1l6SImTd7P45VOeVFtsxDC5YBn4Mr7K6HMLg=;
	b=OX0qoEExohev9pyil4ff2GVOMA95wyzj7M1MoL6uraBDbk4qw1dKcKjEubK0qTbtYl
	H0PHHU/o/DazhAhFgfE4J1yhLYTckIlz4ypVZr5fhrzmDY5bEEuAswd/bGAVUX+gIRMH
	DTDVjiXZ0XJCpFqIMFrBxTPXhVyuvvrY9h7bw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:subject:organization:references:user-agent:x-url
	:x-attribution:date:in-reply-to:message-id:mime-version:content-type;
	b=hRt+cYNxX6boLtMSxXwRdxIGrHTg9vi4F+GnZaxwmzKnZtJyKYw57IZ0dEoqQzCocv
	rmvqB6BsUn8IuNAQsLWY6z6ANkwD3b2GnsktUOvb88gOH8A9knZfuo//xAwydzMmsxk/
	Piu1Pw9FaCMx1TZrxF82X3DMQvymC6kQNVswc=
Received: by 10.103.52.7 with SMTP id e7mr590485muk.115.1236267124879;
	Thu, 05 Mar 2009 07:32:04 -0800 (PST)
Received: from ossystems.com.br (201-40-162-47.cable.viacabocom.com.br
	[201.40.162.47])
	by mx.google.com with ESMTPS id 14sm153570muo.20.2009.03.05.07.32.03
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 05 Mar 2009 07:32:04 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by ossystems.com.br (Postfix, from userid 1000)
	id 45B036101CE; Thu,  5 Mar 2009 12:32:01 -0300 (BRT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Organization: O.S. Systems Ltda.
References: <20090303204954.CCB9CE8008@amethyst.openembedded.net>
	<1236119119.10602.62.camel@andromeda> <49ADB183.5070709@balister.org>
	<1236120999.10602.70.camel@andromeda> <49AE5117.5020806@gefanuc.com>
	<1236162102.10602.97.camel@andromeda> <golmkq$cve$1@ger.gmane.org>
	<1236165806.10602.102.camel@andromeda>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/23.0.91 (gnu/linux)
	(x86_64-pc-linux-gnu)
X-URL: http://www.ossystems.com.br/
X-Attribution: O.S.
Date: Thu, 05 Mar 2009 12:32:01 -0300
In-Reply-To: <1236165806.10602.102.camel@andromeda> (Michael Lauer's message
	of "Wed, 04 Mar 2009 12:23:26 +0100")
Message-ID: <87bpsg2dfy.fsf@neumann.lab.ossystems.com.br>
MIME-Version: 1.0
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
X-List-Received-Date: Thu, 05 Mar 2009 15:36:27 -0000
Content-Type: text/plain; charset=us-ascii

Michael 'Mickey' Lauer <mickey@vanille-media.de> writes:

> Am Mittwoch, den 04.03.2009, 11:54 +0100 schrieb Koen Kooi:
>> On 04-03-09 11:21, Michael 'Mickey' Lauer wrote:
>> > Am Mittwoch, den 04.03.2009, 09:59 +0000 schrieb Martyn Welch:
>> >> "Review" is defined as posting it on the mailing lists and getting positive agreement from two or more core developers.
>> >
>> > Let me propose these kinds of patches being promoted in an unstable
>> > branch rather than via mailing list. This eases testing and playing
>> > around with the patch.
>> 
>> Patches posted to the mailinglist get more eyes on them.
>
> More eyes but less actual testing, since it involves patching your
> current tree to be able to see the effects.
>
>> > Although there were 0 comments (among those none in favour, but also
>> > none against), I still think that org.oe.{stable,testing(dev),unstable}
>> > with a strict only-cherry-picking-from-right-to-left-allowed policy
>> > would improve our workflow and overall stability.
>> 
>> That will just boil down to people only using stable or testing
>
> All but those who actually work on the branch -- which sounds like a
> good thing to me, since that's what stable and testing are about.

I belive this can be fixed using a merge window and using a pull based
model.

Instead of we do pushes against devel branch, core devels could do the
pull and we could have a -next tree the pulls automatically and reports
conflicts by mail. This is more or less what is done in Linux nowadays.

-- 
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


