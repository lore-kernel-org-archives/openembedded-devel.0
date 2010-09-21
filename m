Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Oy53X-0000Zj-HE
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Sep 2010 17:46:57 +0200
Received: by yxg6 with SMTP id 6so1858176yxg.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Sep 2010 08:46:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=zB38XNUvDPsAGoOHf83pac0FMsN+LJxV/NUX1GM5k98=;
	b=afx+7avQtuFNrL6DA3SBcSmiQ6sS6ODYLj03DCvgvSwes7bZy8SBD+8JpShZE3F908
	WDXGDBBqPerwz/BLqp6lk4s6RQrJZr9PYn/F+YyqeZUX2/TetSZ0gcPPeieJ2zaXiobk
	cZjb47J+eLP5NaYuLCGoXlZR3ajCxa8mkqaUw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=w9nxayVGa3zGqB9BKPOyjVoT0kLpU7Xq0EV9N8bdKrK3ZUxLvNUp/kzfTD7XvoQnLF
	mC10x/0bttmHY1J5WL2BujRACdk8AnJuAayf9psQrwcl8DYbvipp+gGqiKAKyXYTqcVs
	paH5SnahnbNj4gbd4PMnCgdjuPWVP5o0JT4ao=
Received: by 10.101.153.33 with SMTP id f33mr11358313ano.92.1285084006556;
	Tue, 21 Sep 2010 08:46:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.200.194 with HTTP; Tue, 21 Sep 2010 08:46:26 -0700 (PDT)
In-Reply-To: <20100921073508.GA5506@thinky>
References: <1284228112.14396.159.camel@mattotaupa>
	<1285021068.2453.80.camel@mattotaupa>
	<20100921051747.GA3989@thinky>
	<AANLkTim6_S3DW_U5V3P0HkFTcAsSWqbu3T5q2UWPajKE@mail.gmail.com>
	<20100921073508.GA5506@thinky>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 21 Sep 2010 08:46:26 -0700
Message-ID: <AANLkTi=0fURjDKfXb62JuiBNF8wh8sLMi6REfeMROnjB@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: minimal-uclibc: freesmartphone/libfsobasics_git.bb: do_compile() failed: utilities.c:35:22: fatal error: execinfo.h: No such file or directory
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
X-List-Received-Date: Tue, 21 Sep 2010 15:46:57 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Sep 21, 2010 at 12:35 AM, Frederik Sdun
<frederik.sdun@googlemail.com> wrote:
> * Khem Raj <raj.khem@gmail.com> [21.09.2010 07:43]:
>> On Mon, Sep 20, 2010 at 10:17 PM, Frederik Sdun
>> <frederik.sdun@googlemail.com> wrote:
>> > * Paul Menzel <paulepanter@users.sourceforge.net> [21.09.2010 00:18]:
>> > Hi,
>> >
>> > fso is quit untested with none GNU libcs and we partly depend on it. I
>> > wrote a short patch which add a --enable-no-gnuism switch for configure,
>> > but want to talk to Michael, before commiting it. Could you test it and
>> > report more gnuism in our code? And is possible to get a backtrace with
>> > uClibc which is not gnuism, but available in all none-GNU
>> > implementations?
>>
>> instead you could use the defines like __UCLIBC__ which are there when
>> using uclibc.
>>
> This is only available when compiling the C code. In the stage of
> compiling vala code it's not available.

I see, adding builtin defines to vala compiler can also help.

> --
> IRC: playya @ Freenode, Gimpnet
> xmpp: playya@draugr.de
> identi.ca: playya
>
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.10 (GNU/Linux)
>
> iEYEARECAAYFAkyYYCwACgkQvbwBzXsbjyqPvACfaz9IB5VoEOryse0Ny1azfqC3
> ahEAn1UvFeSUj+s9KXdG7opBUqeiNyGv
> =fQ+e
> -----END PGP SIGNATURE-----
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>



-- 
-Khem


