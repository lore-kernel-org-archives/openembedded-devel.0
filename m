Received: from [209.85.221.197] (helo=mail-qy0-f197.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Mamfw-00011g-JM
	for openembedded-devel@lists.openembedded.org;
	Tue, 11 Aug 2009 10:25:44 +0200
Received: by qyk35 with SMTP id 35so3207281qyk.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Aug 2009 01:09:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=UEN+TBXLdKriwteSu+qLJkBAjWVJBVAcxI8siboqqCI=;
	b=dtcP3Kp8TMkHO+bM3DGtzincK+OMrEA8nG3spkVb1TBCI8DQGl7jJo30Iof/VeZqgy
	0IQ22CCqHkckY5VPdqaHNcGQhX8Mp7/7q6Clw6eA0R4g53rR08iLuZnmiuPBdAfvfUsr
	kHvH5rOAlZz++uRQQaZQWyhbG7UxrhIeutL0Y=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=kz6406ryZyMhu6bMNR+01KRaujh+oNM+upciDNOFETO1rQl4Y35viWYLVffjhd0FmO
	l7DoSj12d3R8tgtZst3UvRAUDz0BoGz0QkJ68YL1VTeA/rx1rDC0xdYXoCZpT6IkHfOd
	NPIMH9rhkYTC6dlNRgwmvp7FF2KiGj1fI+T+M=
MIME-Version: 1.0
Received: by 10.229.96.16 with SMTP id f16mr1677875qcn.85.1249978165822; Tue, 
	11 Aug 2009 01:09:25 -0700 (PDT)
In-Reply-To: <200908110501.11808.holger+oe@freyther.de>
References: <1248042838-7496-1-git-send-email-otavio@ossystems.com.br>
	<1248042838-7496-2-git-send-email-otavio@ossystems.com.br>
	<200908110501.11808.holger+oe@freyther.de>
Date: Tue, 11 Aug 2009 01:09:25 -0700
Message-ID: <19c1b8a90908110109x6f2bf329ib8794224b1ee98a@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 2/3] uClibc: use __always_inline instead of __inline__
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
X-List-Received-Date: Tue, 11 Aug 2009 08:25:44 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On Mon, Aug 10, 2009 at 8:01 PM, Holger Hans Peter
Freyther<holger+oe@freyther.de> wrote:
> On Monday 20 July 2009 00:33:57 Otavio Salvador wrote:
>> From: Mario Domenech Goulart <mario@ossystems.com.br>
>>
>> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
>
> Why? what does it fix?

For now I think it fixes nothing. just replaces __inline__ with
__inline which essentially has same semantics
but probably  it is intended to have a 'must inline' semantics for
these functions. in this case we need to fix
the defines in uclibc. I will see to it

>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


