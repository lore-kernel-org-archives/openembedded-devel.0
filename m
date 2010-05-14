Received: from mail-gx0-f228.google.com ([209.85.217.228])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OCigj-00030W-QY
	for openembedded-devel@lists.openembedded.org;
	Fri, 14 May 2010 02:23:38 +0200
Received: by gxk28 with SMTP id 28so1165151gxk.7
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 May 2010 17:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=WUbvkqR+joIGSYbS4RoJuRf1w56lxgibJV9Z3EUnjCM=;
	b=R092fHIwEelSW2g5Wa+/QzQy8++6dPX1PisvO2v29Ylx3P3R4oJnNvGXD3FmZDxsOw
	A0D+3bQwU7HcKnd5qvg1//lk7453yTSQCy+AdnTw/aElTRMqmB2cYeK0uIsf+ZC9kw85
	n3ua1/Uy46mQHTO9b7VXt12N5FKvlCW67QIHI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=l6QZ4XQcF63Bek6Tq94rDl8gELpOb7jsW6UAcjsZPa947n7aB8LCPwo21Rq3PRrWVb
	Pw6qhNaqGnPTB47sQA9TlQpLTAcABFh+NImEwisM2pljcnqGhta8INHrbF2Hkhm8NwR0
	IXh8Hokec+oh2KFIwgern/FUDlQxg6c198wAM=
MIME-Version: 1.0
Received: by 10.101.134.6 with SMTP id l6mr325515ann.50.1273796376391; Thu, 13 
	May 2010 17:19:36 -0700 (PDT)
Received: by 10.231.39.73 with HTTP; Thu, 13 May 2010 17:19:36 -0700 (PDT)
In-Reply-To: <alpine.DEB.2.00.1005131412550.6436@lynx>
References: <alpine.DEB.2.00.1005131412550.6436@lynx>
Date: Thu, 13 May 2010 17:19:36 -0700
Message-ID: <AANLkTinqyTnfMhBuyQFIntIcPSdyD8loK0iwJreBkBIr@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.217.228
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: bitbake fetch vs fetchall?
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
X-List-Received-Date: Fri, 14 May 2010 00:23:38 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, May 13, 2010 at 11:18 AM, Robert P. J. Day
<rpjday@crashcourse.ca> wrote:
>
> =A0 based on a quick google, i realize i'm not the only person who's
> once been burned by not knowing about the bitbake "fetchall" command
> versus the "fetch" command. =A0and i'm aware that, if one wants to fetch
> absolutely *all* software required for a given target, one must use
> "fetchall".
>
> =A0so, first, what's the difference between these two commands? =A0and,
> second, there's precious little explanation in the current OE user
> manual about "fetchall". =A0in fact, in the user manual, there is the
> explanation:
>
> fetch
>
> =A0 =A0Try to download all of the required source files, but don't do
> anything else with them.
>
> which would seem to be slightly misleading and is bound to trip
> someone up. =A0should not the user manual be extended to describe
> "fetchall"?
>

yes it could be improved and probably also point distinction between
fetch and fetchall. Care to make a patch :)



> rday
>
> --
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> Robert P. J. Day =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 Waterloo, Ontario, CANADA
>
> =A0 =A0 =A0 =A0 =A0 =A0Linux Consulting, Training and Kernel Pedantry.
>
> Web page: =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0http://crashcourse.ca
> Twitter: =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 http://twitter.com/rpjday
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


