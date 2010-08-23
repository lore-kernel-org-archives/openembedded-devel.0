Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jkridner@beagleboard.org>) id 1OnfEl-00030f-MC
	for openembedded-devel@lists.openembedded.org;
	Tue, 24 Aug 2010 00:12:11 +0200
Received: by fxm6 with SMTP id 6so3621824fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Aug 2010 15:10:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.216.30.21 with SMTP id j21mr3115540wea.37.1282601457555; Mon,
	23 Aug 2010 15:10:57 -0700 (PDT)
Received: by 10.216.15.79 with HTTP; Mon, 23 Aug 2010 15:10:57 -0700 (PDT)
In-Reply-To: <i4tckj$qie$4@dough.gmane.org>
References: <1282505285-5897-1-git-send-email-jkridner@beagleboard.org>
	<i4tckj$qie$4@dough.gmane.org>
Date: Mon, 23 Aug 2010 18:10:57 -0400
Message-ID: <AANLkTim-_SjZXv7UYHnRsRH0ffdKqCZqEwx9kDUYusf7@mail.gmail.com>
From: Jason Kridner <jkridner@beagleboard.org>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Rcpt-To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Mail-From: jkridner@beagleboard.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] beagleboard-demo-image: update for xM demo shipped with board
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
X-List-Received-Date: Mon, 23 Aug 2010 22:12:11 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Aug 23, 2010 at 4:48 AM, Koen Kooi <k.kooi@student.utwente.nl> wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 22-08-10 21:28, Jason Kridner wrote:
>
>> * removed e-wm
>
> please don't do that.

What is the right way to build an image that can switch window managers?

>
>
>> * qt4-tools-sdk and task-sdk-host don't produce target installs
>
> Duh, those have 'sdk' in their name so they are for the sdk

If you want to write a manual on how OE is organized and respond RTFM,
then I'd accept the "duh".  'sdk' to me did not necessarily imply
cross-tools.  Excuse me for putting in notes about things that I
learned.

>
>> * removed gpe, because it conflicted with gtk
>
> That makes no sense, gpe is based on gtk

I'll put it back to pull up the error, but there was a gpe-X package
and a gtk-X package that conflicted.

>
>> * remove qmake2 and qt4-tools since they aren't building
>
> Builds fine over here.

I'll put them back and fight through the build issues.

>
> So: NAK
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>
> iD8DBQFMcjXSMkyGM64RGpERAmOIAKCLtz0ff7UpLJggQ3ooFThaZmpwbwCfQYSy
> A4xbapvXK3Q2j0hs+0y8lmk=
> =cNh4
> -----END PGP SIGNATURE-----
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


