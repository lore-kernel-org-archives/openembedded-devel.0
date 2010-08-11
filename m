Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Oj3dv-0001Fu-Lh
	for openembedded-devel@lists.openembedded.org;
	Wed, 11 Aug 2010 07:14:26 +0200
Received: by eyx24 with SMTP id 24so42111eyx.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Aug 2010 22:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=oewwP0Q60WjdEE1BOp5zHUpr9OhLGeTE5VQPTZAfAQY=;
	b=Xa1ppUao9168ggw2xsUy3ebsaSDze3SWf2VwJ1MU6/7Ubt4AtyCaQzNm+a6qUdumt9
	ye1IsGlK4SkTWapsTR4DvPWaIDDXrDeBJO6aPDhRp8Uc+ZDUcYlRWKMKIyNNy37jfiL0
	QGTzG8jXdxlPTLbwHuFfiyg9Ty0deyhPeyciY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=jB3so7kz5RYhdzy0e829L8NarJSYBAu/Oj0sC8Ew+EQFT4T99ue/U2dQceTJTR4l2+
	r7H8QYJK+5v5bmJbtrjbtG8rwRRngFP5Oe5H9JSgRA3DClHnhFu0xiRJni2LT6OAN6yu
	bTCuhmgJ2ujxPcn+rqSLoHFZWnWJHFuvcfG8I=
Received: by 10.213.48.193 with SMTP id s1mr5313125ebf.20.1281503647288; Tue,
	10 Aug 2010 22:14:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.213.35.135 with HTTP; Tue, 10 Aug 2010 22:13:47 -0700 (PDT)
In-Reply-To: <20100811024533.GA28059@game.jcrosoft.org>
References: <20100810093550.GE10920@game.jcrosoft.org>
	<AANLkTi=KL6T1jja4umSRjzSyk8iuj9dMb9fwKK7YO6au@mail.gmail.com>
	<20100811024533.GA28059@game.jcrosoft.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 10 Aug 2010 22:13:47 -0700
Message-ID: <AANLkTinS+SQCyndCG82OiJzKa=w3LNd-7jkHjPKrmY35@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.215.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: gcc-cross-initial-4.3.3-r14.1 failed on SH4 angstrom
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
X-List-Received-Date: Wed, 11 Aug 2010 05:14:26 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 10, 2010 at 7:45 PM, Jean-Christophe PLAGNIOL-VILLARD
<plagnioj@jcrosoft.com> wrote:
> On 11:27 Tue 10 Aug =A0 =A0 , Khem Raj wrote:
>> On Tue, Aug 10, 2010 at 2:35 AM, Jean-Christophe PLAGNIOL-VILLARD
>> <plagnioj@jcrosoft.com> wrote:
>> > HI,
>> >
>> > =A0 =A0 =A0 =A0I'm currently trying to use OE for a titan (SH4) board =
with Angstrom distrib
>> >
>> > =A0 =A0 =A0 =A0I've attached my conf and log
>> >
>> > =A0 =A0 =A0 =A0gcc-cross-initial-4.3.3-r14.1 failled to compile due to=
 the fact that
>> > =A0 =A0 =A0 =A0it's include /usr/include
>> >
>> > =A0 =A0 =A0 =A0is some have any idea?
>>
>>
>> Please use gcc 4.4.4 for SH platform.
> How can we update oe to do it automaticly for SH?
>
> I known how to do in my conf or the machine but not in the distro for a
> specific arch

e.g. for angstrom you will add
ANGSTROM_GCC_VERSION_sh4 ?=3D "4.4.4"
to angstrom-2008.1.conf

>
>
> Best Regards,
> J.
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


