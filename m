Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ob0-f169.google.com (mail-ob0-f169.google.com
	[209.85.214.169])
	by mail.openembedded.org (Postfix) with ESMTP id 9143E6D073
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Oct 2013 14:17:33 +0000 (UTC)
Received: by mail-ob0-f169.google.com with SMTP id wp4so5888656obc.28
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Oct 2013 07:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type:content-transfer-encoding;
	bh=46SyL7wcFOX6Fucm5FFYy257cOoPG8Aj6lJusq9ahB8=;
	b=qOm5rKHDQ9WN1ar9HalMOiVnqNY2nFrXCwu2Ll/v+VzlCAjkie289K13e1Mpw8OBNW
	2uBdbbPvAuIVWhvnsNv8U7u3xhBHGTHVE7LelqpkcC/2n1VFBZPVVJmVGlwghvKOWDOW
	RuPgFHQ7AmBU0bSewOA/K/Gim5gI1pYDwibQN0oBNK77oDWJ9MrtykBPmDZuGsop3m2r
	zcKYE9c0hvyE+UTo9cVkEz79uo6MVK9yN28qYY3lcHNAxsuHSH2zwLFLO1BGlHTeQ6cK
	mwDcCorsawpmeTAzW1P2b93aDY91jGEf7JhAKrLoa1PqpTOc5pxPd6qtzjz+OhDYO3KJ
	Mx7Q==
MIME-Version: 1.0
X-Received: by 10.60.73.137 with SMTP id l9mr7344193oev.32.1382365048166; Mon,
	21 Oct 2013 07:17:28 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Mon, 21 Oct 2013 07:17:28 -0700 (PDT)
In-Reply-To: <1734982.Eo3HTheTAh@helios>
References: <2478778.XBk41EpSZr@koontz>
	<544da34b-acbf-44ca-8f84-fd993db893f4@email.android.com>
	<1734982.Eo3HTheTAh@helios>
Date: Mon, 21 Oct 2013 12:17:28 -0200
X-Google-Sender-Auth: aPS1wIWw0qm-cuPmofFCBoxicuo
Message-ID: <CAP9ODKr0=4MPP-dXCVM7xzRRzQkGN3oTk2JQRGx=iUxwTkFFGw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Cc: Anders Darander <anders@chargestorm.se>
Subject: Re: Regarding layers and their versioning.
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 21 Oct 2013 14:17:34 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 21, 2013 at 7:01 AM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> On Monday 21 October 2013 09:29:27 Anders Darander wrote:
>> "S=F8ren Holm" <sgh@sgh.dk> wrote:
>> >What is the best way to manage a private repo with recipes as well as
>> >meta-oe,
>> >meta-core and meta-angstrom.
>> >
>> >Currently I have a private repo that has the layers attached as
>> >submodules. Is that a crazy setup or what?
>>
>> We're doing the same internally at ChargeStorm. One benefit is that we'r=
e
>> having our "master" repo keeping track of all the layers that we're usin=
g
>> and which revision of those layers.
>>
>> Other people / projects just use a shell script checking out the desired
>> layers. Some people combines layers into one huge repo (though I'd
>> personally not recommend that approach). (That'd be similar to how Poky =
is
>> being managed).
>>
>> Yet other people / projects use repo.
>>
>> It's up to what you're comfortable with in the end.
>
> Just to clarify, we use the combo-layer script (scripts/combo-layer) to m=
anage
> the Poky repository. It can combine multiple repositories or even parts o=
f
> repositories into one and keep it up-to-date. It works well for our purpo=
ses,
> i.e. providing a single repository that people can download containing al=
l of
> the needed basic components. However, it's just one of a number of differ=
ent
> solutions in this area and you'd have to evaluate which tool works best f=
or
> your situation.

At O.S. Systems we used some variants here.

We started with forking and moved to combo-layer script. The
combo-layer works for most case but it fails badly with empty merge
commits and like. So it works quite fine for Yocto use case but not as
fine for company workflow.

In the end we choose 'repo' and we provide some 'platform' for
customers where we link all need projects in a single .xml file; this
scales fine and is quite easy to use.

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

