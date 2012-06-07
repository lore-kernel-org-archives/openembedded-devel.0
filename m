Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Schar-0002e8-Vc
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 Jun 2012 20:38:02 +0200
Received: by obhx4 with SMTP id x4so1290087obh.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Jun 2012 11:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=HeX6wRI7gdByHQoWpl6M7T3H1bA/66s2BGlX9YXDnYM=;
	b=MaWHmtV4U6sgTSdSBTjcI+3Y1IK3+MWKf0q+VAg1R2V5zoRZBBegMpscCoTxD2MKs+
	nh2XCUcqxhiOXithxBQCFhaGi/11GfYDp9+1KLT4YnMGj+vXBlRYCTufeIiAuNgmEnVA
	hvfJM89xeli52+T+XyXmJEc4b5qhERs6hk6vmshmzGKjQaePq0gM8XeZ72vgfL9RFCBa
	J1sEou69UzVzmiLXy0u+u+bbZu4SQ9a2xBjV21+d4LBlHZu+dfnkFsY21EdZaRXDSwrc
	O6W7NODcIIrvWmLMWJE9BuHqwogy1W07mDzOlO9LqgZxjEnnTtXvge8CEe21iv/ORU0v
	dh6Q==
MIME-Version: 1.0
Received: by 10.182.154.73 with SMTP id vm9mr3189291obb.72.1339093652500; Thu,
	07 Jun 2012 11:27:32 -0700 (PDT)
Received: by 10.76.1.68 with HTTP; Thu, 7 Jun 2012 11:27:32 -0700 (PDT)
In-Reply-To: <jp3k9b$p58$1@dough.gmane.org>
References: <CALbNGRRSxKD_QqhCbLH=aRj3S0PEyTmQs9j8Lgg-5EObqMypxQ@mail.gmail.com>
	<jp3k9b$p58$1@dough.gmane.org>
Date: Thu, 7 Jun 2012 20:27:32 +0200
Message-ID: <CALbNGRSDJGWyQd0ZwASa4ZrJ9FfD=y08ET_gg-xStbpLGtnQBw@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: meta-systemd
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
X-List-Received-Date: Thu, 07 Jun 2012 18:38:02 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, May 17, 2012 at 9:41 PM, Koen Kooi <koen@dominion.thruhere.net> wro=
te:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Op 17-05-12 15:07, Andreas M=FCller schreef:
>> Hi
>>
>> happy to see this happen I have few questions on what is planned.
>>
>> In README is written:
>>
>>> And we're working to break the dependency on this one:
>>>
>>> URI: git://git.openembedded.org/meta-openembedded
>>
>> Maybe it is a misunderstanding but I would expect for contents of this
>> layer
>>
>> * systemd.bbclass * all from meta-oe/recipes-core/systemd * bbappends fo=
r
>> all recipes with systemd support.
>>
>> Is this correct?
>
> Correct. The bbappends will likely cause dependencies on non-oecore layer=
s,
> but so be it. We might need to set the unbreak-me flag for missing bb fil=
es
> that match our bbappends.

I started with meta-systemd and want to do some testing. The mentioned
'unbreak-me' - is it available already or and idea to be implemented?

Andreas


