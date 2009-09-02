Received: from [209.85.221.186] (helo=mail-qy0-f186.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1MixLm-0003js-N0
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 Sep 2009 23:26:42 +0200
Received: by qyk16 with SMTP id 16so605718qyk.20
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 02 Sep 2009 14:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=MnmACZT6xZIa5kwwW+EQL8BFyPLawFNbkf73XsZcueE=;
	b=jPGYQqY2FzN0AWzJNNm10Uu/zQ16C4ljUSkHoykCnPaxmXVX4q9xZ08/q9clZ8wlqn
	zmamdjx4UzfNgF47efLbVmjsxtD+T/JSFVG0bPsE8sTjCaYjll7oFXMlAGp3E5tu6Vgc
	JRoMLpxwXGJ7pbmW47bZ956ljR6f/Rtq5Xaiw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=enLOODrbriLEBaVK31Q3yOaviFkuUZHVxjqTsc/WQ8rF3EIY13zGqo5X3XAz1AHmlM
	yUgA/tjhemnm6/yfFX+1uX7Fg9Sg7xsHa62ikghrDWlwYOyXfULOkUe/jBohGdJ/XWIV
	AUDilZRIkqI/6EmfFN7HeBgsK/NoYRd7YSBJI=
MIME-Version: 1.0
Received: by 10.229.39.201 with SMTP id h9mr2609104qce.4.1251925674791; Wed, 
	02 Sep 2009 14:07:54 -0700 (PDT)
In-Reply-To: <1251923389.4490.20.camel@lenovo.internal.reciva.com>
References: <1251504044-2315-1-git-send-email-raj.khem@gmail.com>
	<1251620948.4215.673.camel@lenovo.internal.reciva.com>
	<20090830094809.GB26823@gmail.com>
	<200908311333.20189.marcin@juszkiewicz.com.pl>
	<20090901055731.GA22534@gmail.com>
	<57768.87.139.24.177.1251793302.squirrel@home.opfer.tk>
	<20090901153102.GA12420@gmail.com> <20090901230722.GA25864@gmail.com>
	<20090902192044.GA18621@gmail.com>
	<1251923389.4490.20.camel@lenovo.internal.reciva.com>
Date: Wed, 2 Sep 2009 14:07:54 -0700
Message-ID: <19c1b8a90909021407k5610f615q41c7d13bc3b38ff0@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] sane-toolchain-eglibc.inc: Set TARGET_OS?= linux-gnuspe for e500
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
X-List-Received-Date: Wed, 02 Sep 2009 21:26:43 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 2, 2009 at 1:29 PM, Phil Blundell<philb@gnu.org> wrote:
> On Wed, 2009-09-02 at 12:20 -0700, Khem Raj wrote:
>> This also changes the target triplet for linux-uclibgnueabi to
>> uclibc-uclibcebi. So I have also bumped up the OELAYOUT_ABI
>
> Ah, that doesn't sound so good. =C2=A0Changing OELAYOUT_ABI will be a
> nuisance for everyone, even if they aren't using either uclibc or the
> TARGET_OS auto-generator. =C2=A0Is there a way to avoid that?

It changes from linux to linux-gnu for non uclibc systems too which I
forgot to mention

>
> p.
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


