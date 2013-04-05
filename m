Received: from mail-lb0-f172.google.com ([209.85.217.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1UOF5f-0001f3-AI
	for openembedded-devel@lists.openembedded.org;
	Sat, 06 Apr 2013 00:26:36 +0200
Received: by mail-lb0-f172.google.com with SMTP id u10so4205168lbi.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Apr 2013 15:09:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=mYAAyJCkYIlc6/H7fYb4JXy0Iwz5iY/4Hm2HXOOQOFM=;
	b=tBj+vA73389/y9I+4eyE1syuelMnmokgV/jta5wJwQ0N0EBaSay+cKqXkuD4kInIq9
	z21xy1Am/MDY8h45gVKsbSkP3HeT1FIkUhc5rGhS3JUcSHpal3NtLYMv/jCIlgT2oYMV
	Sspu7rMT6Jq2laOQG3AEbJowCatNvcZJDxSgkTJSqCzEbOHNyQeuASurIjCE0B5jsa2+
	YKZ7d700aQcUB8EV0TzqovA05b6Q6T7fg7T5DKPo3l6jqKsYLvdPjpdhUE5Vndc/kOLj
	XxUsHo1cG66HL7XE5upHhM83lboN2Xu6hPMH/dTBKcz2r5tJIBJuI77S6CAmbu/9YhX9
	8QIg==
X-Received: by 10.112.132.2 with SMTP id oq2mr6989067lbb.5.1365199760604; Fri,
	05 Apr 2013 15:09:20 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.112.125.38 with HTTP; Fri, 5 Apr 2013 15:09:00 -0700 (PDT)
In-Reply-To: <20130405221305.6a7ae319@e6520eb>
References: <1363859339-12187-1-git-send-email-ross.burton@intel.com>
	<20130321140745.4a0683c8@e6520eb>
	<CABcZANkitD_S70HFXiM+xnC73avzC-2LDjRTcezwVMe1VcW+ow@mail.gmail.com>
	<20130405221305.6a7ae319@e6520eb>
From: Chris Larson <clarson@kergoth.com>
Date: Fri, 5 Apr 2013 15:09:00 -0700
X-Google-Sender-Auth: C4_sjmhEOjwN_CC1Tqlq5_Sr6Po
Message-ID: <CABcZANm57z5Ug+VJ8PWRCMU=z=JZFmM_jqxbObdAt62ixK6jgg@mail.gmail.com>
To: =?UTF-8?B?RXJpYyBCw6luYXJk?= <eric@eukrea.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Cc: Openembedded Discussion <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH][for-danny] guile: remove from meta-oe, there is newer version in oe-core
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
X-List-Received-Date: Fri, 05 Apr 2013 22:26:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 5, 2013 at 1:13 PM, Eric B=C3=A9nard <eric@eukrea.com> wrote:

> Le Fri, 5 Apr 2013 10:02:22 -0700,
> Chris Larson <clarson@kergoth.com> a =C3=A9crit :
> > I'm a bit confused about why this went in. danny is a stable branch, an=
d
> > this is clearly not a bugfix. Did the existence of this recipe actually
> > cause a problem? This just caused a temporary build break for us due to
> > bbappending to a removed recipe. What exactly is the policy for meta-oe=
's
> > danny branch, if it's not "bugfixes only"?
>
> I usually apply patches to danny-next and wait at least one week to get
> feedback before pushing to danny (and usually I try to do that on a
> friday).
> So if you want to prevent this kind of problem for the future, you may
> be able to configure one of your autobuilders to build your
> projects using danny-next's branch so that you get the error before the
> patches are pushed to danny.
>

Good point, I'll keep that in mind.
--=20
Christopher Larson

