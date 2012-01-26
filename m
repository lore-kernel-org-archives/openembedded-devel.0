Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RqEvn-0007fI-SS
	for openembedded-devel@lists.openembedded.org;
	Thu, 26 Jan 2012 03:19:19 +0100
Received: by lags15 with SMTP id s15so50156lag.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jan 2012 18:11:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=+2cPcMvMewqs/5O8DF5EB3YcXddyjhnLUu5HN9v/CWs=;
	b=g+G0FdpFhefrKMT4gRkKoX6gU94/FZs/veGUEO7MqI8LcbfDHZ9LQxatVH2Ww98Xrn
	tgsJOpgbxHNoLpXi1Ve4KRfF6HsQcuBEYJ+iKIiYA2wojgo05PwZ7+gBLDWmFvZbR+X5
	+iSWfdswnhQdVic+0chfp/roHgIHuEBt+ukzk=
Received: by 10.152.114.169 with SMTP id jh9mr67178lab.20.1327543892249; Wed,
	25 Jan 2012 18:11:32 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.5.201 with HTTP; Wed, 25 Jan 2012 18:11:02 -0800 (PST)
In-Reply-To: <1327519488.54350.YahooMailNeo@web36906.mail.mud.yahoo.com>
References: <1327519488.54350.YahooMailNeo@web36906.mail.mud.yahoo.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 25 Jan 2012 18:11:02 -0800
Message-ID: <CAMKF1sqtVB6hsAeC3PQcp6qwDEHdi=f=pFJ0gQwL93Gqf+DiFA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: how to specify alternative library locations from recipes using cmake
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
X-List-Received-Date: Thu, 26 Jan 2012 02:19:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 25, 2012 at 11:24 AM, Greg Kogut <gkogut@yahoo.com> wrote:
> I hope this isn't too much of a n00b question.
>
> I've developed a dozen new recipes (which I'll submit once they're stable=
), most of which use cmake.
>
> Some of them install libraries to alternative library locations, e.g. '/o=
pt/myprog/lib'. =C2=A0 This works correctly, and I've verified the librarie=
s are installed to the correct locations in the filesystem image.
>
> However, while building binaries dependent on these new libraries, also u=
sing cmake, cmake tries to point the linker to these directories on the hos=
t machine, not the cross-compiler filesystem. =C2=A0With predictable result=
s.
>
> What is the correct practice for correctly guiding cmake to the right loc=
ation? =C2=A0I've searched the existing recipes which use cmake without fin=
ding anything.
>

Does adding something like
set( CMAKE_LIBRARY_PATH ${libdir} /opt/myprog/lib)
to classes/cmake.bbclass help

> Regards,
> Greg
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


