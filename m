Received: from [209.85.211.187] (helo=mail-yw0-f187.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mario.goulart@gmail.com>) id 1MbZUR-0008Oy-6J
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 Aug 2009 14:33:07 +0200
Received: by ywh17 with SMTP id 17so932033ywh.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Aug 2009 05:16:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:sender:from:to:subject
	:references:date:in-reply-to:message-id:user-agent:mime-version
	:content-type:content-transfer-encoding;
	bh=FQVxjQ6k2g9bnIjz7zaIF4F0SVoMWDGK/VKLkyo2ko4=;
	b=RG9Gy6XB8UDksDOxbmpAIrw/kTcjs//whnddTEAO0Eco+mFRFHdQ3x5F+AilGMc5Kk
	/Ym6NRemXMZ9cbPYuUffg7ml+TnLgdZFq6YR+CiijgpWezlVBNpuml89Z3Wsco9acyv3
	hEdhL1ycP2lxTO0dhqk7lzPVdvp220lHRFbPg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:subject:references:date:in-reply-to:message-id
	:user-agent:mime-version:content-type:content-transfer-encoding;
	b=qH3JtiTKty26q9evjplXGwVAovh/9Z0ho5FgzJv0vopTXPTr3pUZ4IcktPCqQKoUey
	HHu+FpC+7nRv9p82C7+wt+5onKmG16IalQOjdudnYIQiLWXXpiAbE4phttlwcdqUeoZ1
	rpI/BHHYz6HrvTU9iGi5wNfFyYvgmZLjydXZA=
Received: by 10.101.43.8 with SMTP id v8mr918790anj.60.1250165792940;
	Thu, 13 Aug 2009 05:16:32 -0700 (PDT)
Received: from nachos.gmail.com
	(189-10-154-167.pltce701.dsl.brasiltelecom.net.br [189.10.154.167])
	by mx.google.com with ESMTPS id b14sm933440ana.16.2009.08.13.05.16.30
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 13 Aug 2009 05:16:31 -0700 (PDT)
Sender: Mario Domenech Goulart <mario.goulart@gmail.com>
From: Mario Domenech Goulart <mario@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
References: <1248042838-7496-1-git-send-email-otavio@ossystems.com.br>
	<1248042838-7496-2-git-send-email-otavio@ossystems.com.br>
	<200908110501.11808.holger+oe@freyther.de>
	<1249984289.1608.29.camel@mill.internal.reciva.com>
	<19c1b8a90908111715h51cc0060lfd228d1a6db3c52f@mail.gmail.com>
Date: Thu, 13 Aug 2009 09:16:27 -0300
In-Reply-To: <19c1b8a90908111715h51cc0060lfd228d1a6db3c52f@mail.gmail.com>
	(Khem Raj's message of "Tue, 11 Aug 2009 17:15:29 -0700")
Message-ID: <87ws57vrhg.fsf@ossystems.com.br>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/23.0.91 (gnu/linux)
MIME-Version: 1.0
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
X-List-Received-Date: Thu, 13 Aug 2009 12:33:07 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Khem

On Tue, 11 Aug 2009 17:15:29 -0700 Khem Raj <raj.khem@gmail.com> wrote:

> On Tue, Aug 11, 2009 at 2:51 AM, Phil Blundell<philb@gnu.org> wrote:
>> On Tue, 2009-08-11 at 05:01 +0200, Holger Hans Peter Freyther wrote:
>>> On Monday 20 July 2009 00:33:57 Otavio Salvador wrote:
>>> > From: Mario Domenech Goulart <mario@ossystems.com.br>
>>> >
>>> > Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
>>>
>>> Why? what does it fix?
>>
>> There are some functions in the dynamic linker bootstrap code that must
>> (for a variety of reasons) be inlined to operate correctly. =C2=A0Under =
some
>> circumstances, particularly on MIPS for some reason, gcc decided to
>> disregard the normal "inline" qualifier and put these functions out of
>> line which led to disaster.
>
> Which particular gcc version is in question here ?

IIRC, I've tested it with gcc 4.3.2, 4.1.2 and 4.2.4.


> Looking at the code I think if it is gcc 3.2 then it would use the
> 'must align' semantics but I would be surprised for other gcc versions
> because for other versoins __always_inline is simply defined as
> __inline which is equivalent to __inline__

I haven't tried gcc 3.x.

This patch is actually from the uClibc tree
(http://git.uclibc.org/uClibc/commit/?id=3Dc190f738e1b0e87658ea5f86c057fb14=
7dc19428).

Without this patch, dynamic linked applications segfault at least on
MIPS and MIPSEL.

Best wishes.
Mario


