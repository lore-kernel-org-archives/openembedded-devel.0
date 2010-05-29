Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OIJo6-0008UY-36
	for openembedded-devel@lists.openembedded.org;
	Sat, 29 May 2010 13:02:23 +0200
Received: by yxe42 with SMTP id 42so190271yxe.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 29 May 2010 03:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=NijtWsm5c9URyTVRrK9Q+PfgvdIgtC3PgMHg+XZSP4Y=;
	b=wJ7sBUDf66FqKwFLdlqHQeR55yHRilw+7l2cTXwk8AJyxemZ0KpIj3IxEdYeiSkJjp
	jUuxC4ymUMbIMH1xnGnS3oRqQKI/Vp0EgWE80AjXVbuf0Z7fbyFwabYSuiE+To6Sr/Q2
	TVQkAb07EvNwdR/HMEfVAxmmnzBw4w9QjBfL4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=Mleg84nSQWBmJjdegQoTJqL8zpRhJSysm8XtYGpARzm7CEcbvmEY+h9BIvNP/7EulE
	QF5eEZNZphrSzKNdY5/ctXIXnCWLXhv9goIUUbyY5gw7VNE+aGB1dRf5j96tzDsv4OLO
	uD9DCKsFKwKrmj1rFpz+Ku6RLVvdun8a8Fdj8=
MIME-Version: 1.0
Received: by 10.91.82.17 with SMTP id j17mr1370420agl.40.1275130690516; Sat, 
	29 May 2010 03:58:10 -0700 (PDT)
Received: by 10.90.71.4 with HTTP; Sat, 29 May 2010 03:58:10 -0700 (PDT)
In-Reply-To: <htqn9k$gvu$1@dough.gmane.org>
References: <htqn9k$gvu$1@dough.gmane.org>
Date: Sat, 29 May 2010 12:58:10 +0200
Message-ID: <AANLkTikM0Sp8VbdO8xZkdIQj9SWwyNooOGClEFH7Bg3C@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org, andrea.adami@gmail.com
X-SA-Exim-Connect-IP: 209.85.213.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Faking sign offs is bad
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
X-List-Received-Date: Sat, 29 May 2010 11:02:23 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/5/29 Koen Kooi <k.kooi@student.utwente.nl>:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Hi,
>
> It seems some people have taken to faking sign off in patches, which is
> a bad thing. I would like to propose to revert anything that has fake
> signed-off-by lines.
>
> Case in point:
> http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=28bc48904e31c3a63cf5a60bc005ed8fb359cc52
>
> Can that please get reverted? Andrea didn't ask me for a sign off and I
> didn't give one.

Andrea, do you want to comment on this? (or explain it)

Without knowing  the other side of the story I won't comment on this
specific example, but I would like to say something on it in general.
Personally I feel that faking sign-off's or acked-by's is very bad.
If this happens due to an accident or unawareness, I'm inclined to
give the person a second chance, but if it happens repeatedly or
intentionally, I suggest a revocation of commit rights.

And in order to avoid yes/no discussions I strongly suggest that
people express their acks in a way that it can be traced back should
any argument arise (e.g. by ack-ing by mail or on a logged irc
channel).

Frans.

>
> Apart from that, the commit is bogus, it just adds a
> 'udev/udev-151/udev-compat-static.patch' file in ${S} (of all places!)
> instead of actually patching the udev init file.
>
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>
> iD8DBQFMAOBzMkyGM64RGpERApnUAJ9ZTsHRLSeP2ZEFdqGuzReFNhDjfQCgrB38
> ddIujBP67BVQSsk6IBXZBJc=
> =ihUE
> -----END PGP SIGNATURE-----
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


