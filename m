Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <top.grzechu@gmail.com>) id 1OEHbc-00025W-MR
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 May 2010 09:52:49 +0200
Received: by fxm8 with SMTP id 8so488012fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 May 2010 00:48:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=T77pa/PFEfXurHlaPoEJNt6npkkN9MP3sPOzuj0Qhpc=;
	b=SEuYOBxPLtEQhubnzNgMHkf+GrCYBAu/2Lrk8J81xC52ImD0BUb4JU0UiTsWsXXgwg
	YDQ3mZFsuqw38miieqXyHeehNmABDfRbeXIYN9bP10irvKQnd3qjeI/FKr+Pf9xfrx43
	47kyf8PNvk9HIFXy8BtVwp5aQOAJrZK5Cvxg4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=a9jjAGHb7oLRd2P26/KiH9VJj3l8lQy3F2OmCnA0Ta0CBrINT53cI+P+dTxRUMqJ9+
	u/3sEZRU92Ha4Rai6C5EKxba7tj9ZQQvZKlP/R+JDITrqKG708XDnD9168XvKzTgva+l
	etDwwvFmUKsnXX3p8ZeLfxsEL+NrEEHKfFWNc=
MIME-Version: 1.0
Received: by 10.204.48.212 with SMTP id s20mr99491bkf.205.1274168928774; Tue, 
	18 May 2010 00:48:48 -0700 (PDT)
Received: by 10.204.76.131 with HTTP; Tue, 18 May 2010 00:48:48 -0700 (PDT)
In-Reply-To: <hstfkm$fv2$1@dough.gmane.org>
References: <AANLkTinL4kGrM6P5Di1N4KI-95sFuEwDn-RM_SZ32cjS@mail.gmail.com>
	<hstfkm$fv2$1@dough.gmane.org>
Date: Tue, 18 May 2010 09:48:48 +0200
Message-ID: <AANLkTilat0DSBMKTzt4iYbHwUwJsn1XFWBmlNKbcgXqE@mail.gmail.com>
From: Grzegorz Toporek <top.grzechu@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: top.grzechu@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Problem at the very beginning
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
X-List-Received-Date: Tue, 18 May 2010 07:52:49 -0000
Content-Type: text/plain; charset=ISO-8859-1

>
> > What should be mentioned, there was no a problem to build this for
> > angstrom-2008.1 distribution (machine om-gta01). Now I have changed it to
> > colibri, which is my boar, and the problem occurred.
>
> Do you *really* need your own distro?
>
> regards,
>

Hi, thank you for your answer.

I don't know if I need this. My project is a continuation of a former one,
and the guys before have been using disto configuration files.

So, do you suggest that I don't need those files to build system on Colibri
PXA270 (ARM)?

Maybe there is a good way to update an old system? I have backup images
(img.gz) of it...

Best Regards,
Grzegorz




2010/5/18 Koen Kooi <k.kooi@student.utwente.nl>

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 18-05-10 09:03, Grzegorz Toporek wrote:
> > Hi all,
> >
> > I'm new to the mailing list so I would like to say hello to everyone. I'm
> > new to OE/bitbake as well so please be patient...
> >
> > I was trying to build busybox package but unfortunately I got this error.
> Is
> > it a type conversion problem?  I got this with "Simple Helloworld"
> either...
> >
> > What should be mentioned, there was no a problem to build this for
> > angstrom-2008.1 distribution (machine om-gta01). Now I have changed it to
> > colibri, which is my boar, and the problem occurred.
>
> Do you *really* need your own distro?
>
> regards,
>
> Koen
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>
> iD8DBQFL8kHWMkyGM64RGpERAmsqAJ99Uyl/UCFy0Op0WoOMi1dpa9vTkQCfVc9R
> aj0rnrBbJRFwMlXF7e15BaA=
> =h/5L
> -----END PGP SIGNATURE-----
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

