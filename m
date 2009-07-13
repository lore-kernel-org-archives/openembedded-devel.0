Received: from [209.85.210.193] (helo=mail-yx0-f193.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1MQR5i-00077X-Kl
	for openembedded-devel@lists.openembedded.org;
	Mon, 13 Jul 2009 21:21:34 +0200
Received: by yxe31 with SMTP id 31so3937088yxe.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Jul 2009 12:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=xznTvQIrEb/2ry9/u8EceMMcVqdx/IHNSL2hybh0boc=;
	b=ZY2bZuI51egUBr0XCQZ3T6Rhlepj8bEIHlYBkGbodoq2o3+GK6DmT2Due69+5LUxOp
	bMJ+hDi4icNCghX/fVL4CwlkrLm4AHUx8ri1CzCiAmmxP9uD0uxX4yWaYS8Ef3PzV6O8
	gucinKMRkmKjK/6/MZGN6l/f2nRh0f9KAFuNM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=VkHBJ6Cc67xzlsMoGLTgsKCTzY4Bp73gpPFFcpnQnerwJw2J97bFjLHX2Nw4g4CRuG
	h9hnD/U0pK7uCauVQbFmapv3I5181fyuKNI6pGgiIUPm7Vt0o5mis06i8TSS7Cb/8Vlt
	v9YCWQeXTD4Vr8hgEu7ZXKu3LxSrNXIprkwJ4=
MIME-Version: 1.0
Sender: otavio.salvador@gmail.com
Received: by 10.100.38.4 with SMTP id l4mr7551058anl.189.1247512097959; Mon, 
	13 Jul 2009 12:08:17 -0700 (PDT)
In-Reply-To: <c384c5ea0907121115p4d30e756he86bba75c66cc9e5@mail.gmail.com>
References: <4A5A1705.5050302@gmail.com>
	<c384c5ea0907121115p4d30e756he86bba75c66cc9e5@mail.gmail.com>
Date: Mon, 13 Jul 2009 16:08:17 -0300
X-Google-Sender-Auth: 812026768682f992
Message-ID: <be7a9f3d0907131208n9c59601pe0a8b4ae963ca7af@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Using git tags with OE
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
X-List-Received-Date: Mon, 13 Jul 2009 19:21:35 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hello,

I'm also opposite to the idea to make it public in the official
branch. We use tags here at O.S. Systems but those are kept in our
local repository only.

On Sun, Jul 12, 2009 at 3:15 PM, Leon
Woestenberg<leon.woestenberg@gmail.com> wrote:
> Hello,
>
> On Sun, Jul 12, 2009 at 7:01 PM, Marco Cavallini<koansoftware@gmail.com> wrote:
>> Hello,
>> anybody knows if is possible to use git tags with OE ?
>>
>> I'd like to tag a patch (SHA-1) identifying a particular 'state of the
>> art' like it was a 'stable' version.
>> At the moment I save the last patch SHA-1 and I use it as reference.
>> For example if I successfully build just now a particular version, then
>> I tag it mck-0.0.1 into OE so everybody can refer to such tag in the future.
>>
>> I thought it could be a good idea, what do you think?
>>
> Hmm, I think it would clutter up too much.
>
> And if we use it, the tag should be self-describing.
>
> If you built a particular version succesfully, it doesn't mean someone
> else also can build that version
> succesfully; anything outside GIT is also a dependence for a succesful build.
>
> For example, today we have some packages that sometimes break a build
> (probably due to a race condition).
>
> I'ld say, keep with the commit hash for a known-good-build.
>
> Regards,
> --
> Leon
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



-- 
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


