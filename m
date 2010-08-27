Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1Op07m-00040A-1w
	for openembedded-devel@lists.openembedded.org;
	Fri, 27 Aug 2010 16:41:59 +0200
Received: by wwb31 with SMTP id 31so3175423wwb.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Aug 2010 07:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=EFFOA8hYdJwE9e/A7yfo4eU3JTXnSIPmea0bSeZVf+0=;
	b=wvlBcrGgoT2rzNQyuQbJcsAFZggABvHm1EwIKF1l6js6B1jYBfn7Z+Wm2T8cDm0+N6
	Wi2bXjPs7j1F13NqAgZoh+A60v22VrjbDZSx61ltEARmso1inu2P8z5klG7ofWonSy2J
	0nHLLG/m5/qjHtBP8LOwA9vL9UjT41l9Spm3k=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	b=wTFEN0OXipo+DWKksFnfLmElpkeWArLDfStOsrAed6z3wSzRijv4gCK3XxlWWC9FBB
	DEFeOM1z0zroeABV1mL3fLZgqG05LQpiMxahtoljdM+mNYrVvYqm0jFuiGxwKH5+jtpp
	HWbp/3N6geSylNpzoOnlEpOg3fnnvz7mi182g=
MIME-Version: 1.0
Received: by 10.227.134.199 with SMTP id k7mr804972wbt.51.1282920077214; Fri,
	27 Aug 2010 07:41:17 -0700 (PDT)
Received: by 10.216.21.209 with HTTP; Fri, 27 Aug 2010 07:41:17 -0700 (PDT)
In-Reply-To: <4C77CA9C.6080205@mlbassoc.com>
References: <4C771A94.1020802@mlbassoc.com>
	<AANLkTimhME5XnoVz+a6vrnDyvZBeoK9Yy9st0MVAQ2H3@mail.gmail.com>
	<4C77CA9C.6080205@mlbassoc.com>
Date: Fri, 27 Aug 2010 10:41:17 -0400
Message-ID: <AANLkTin2wYkFr49RQVTxfgJ-pzLw9twTW=c6WoONNjJO@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: Gary Thomas <gary@mlbassoc.com>
X-SA-Exim-Connect-IP: 74.125.82.43
X-SA-Exim-Mail-From: cliff.brake@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Testing build failure
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
X-List-Received-Date: Fri, 27 Aug 2010 14:42:01 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 27, 2010 at 10:24 AM, Gary Thomas <gary@mlbassoc.com> wrote:
> Presumably it then installed into $HOME (that's what the recipe is
> expecting).
> On my system though, I _have_ write permission in /opt and the tools end =
up
> in the wrong place and everything falls apart from there onwards.
>
> I just checked and if I remove write permission to /opt, this package
> runs properly. =A0I've worked out a patch using --prefix=3D to the TI bin=
ary
> installer that makes it install correctly even if /opt is writeable.

Excellent, this is a good example of the benefits of our testing
effort -- we find obscure problems like this that make OE nearly
impossible for some users to get going.  This reinforces the point
that OE is a different beast than most software and effective testing
cannot be done by a single resource.

Thanks,
Cliff

--=20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
http://bec-systems.com


