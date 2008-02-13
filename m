Received: from [209.85.128.184] (helo=fk-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <philipp.zabel@gmail.com>) id 1JPJqm-0003z9-6V
	for openembedded-devel@openembedded.org; Wed, 13 Feb 2008 16:48:44 +0100
Received: by fk-out-0910.google.com with SMTP id 18so59799fks.12
	for <openembedded-devel@openembedded.org>;
	Wed, 13 Feb 2008 07:48:43 -0800 (PST)
Received: by 10.82.113.6 with SMTP id l6mr81890buc.22.1202917722927;
	Wed, 13 Feb 2008 07:48:42 -0800 (PST)
Received: by 10.82.118.18 with HTTP; Wed, 13 Feb 2008 07:48:42 -0800 (PST)
Message-ID: <74d0deb30802130748v75c065fdjec0692dc5ed4b3f7@mail.gmail.com>
Date: Wed, 13 Feb 2008 16:48:42 +0100
From: "pHilipp Zabel" <philipp.zabel@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <47B3075F.4000703@student.utwente.nl>
MIME-Version: 1.0
References: <200802131340.02616.mickey@vanille-media.de>
	<47B2E83E.9090209@student.utwente.nl>
	<200802131432.42455.mickey@vanille-media.de>
	<47B3075F.4000703@student.utwente.nl>
Cc: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@openembedded.org>
Subject: Re: tinylogin vs. busybox
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 13 Feb 2008 15:48:44 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Feb 13, 2008 4:06 PM, Koen Kooi <k.kooi@student.utwente.nl> wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Michael 'Mickey' Lauer schreef:
> | On Wednesday 13 February 2008 13:53:18 Koen Kooi wrote:
> |> Michael 'Mickey' Lauer schreef:
> |> | I just realized that we are still using tinylogin which has bugs and
> |>
> |> is dead.
> |>
> |> | Newer busybox releases contain all the functionality. Anyone know a
> |> | compelling reason to keep using tinylogin as the default in
> task-base? If
> |> | not, I'd like to switch to busybox (after changing its defconfig) soon.
> |>
> |> Using busybox as login requires it being setuid root, with all the nasty
> |> security implications stemming from that.
> |
> | http://www.busybox.net/lists/busybox/2004-May/011551.html give me the
> opinion
> | that this is not a problem.
>
> If that email is true, we could dump tinylogin, but frankly, I trust
> busybox as far as I can throw a piano (and toybox as far as I can throw
> a 21" crt) and SUID root binaries make my skin crawl, so we must be very
> carefull and do thorough tests before making this change.
> The last thing we want is $bigcompany to blame OE for the exploitabilty
> of their devices.
>
> |> I don't think OE should force
> |> people to only have one user ('root') on their systems, since that is
> |> exactly what your proposed change would mean.
> |
> | I agree, but I don't see why using busybox login would limit us to
> root-only.
> | Care to give more details?
>
> The way busybox worked before is that *any* busybox applet is SUID root,
> which means 'vi' and 'passwd' are as well, which in practice means there
> is only one user: root.

busybox does drop root priviledges for applets that don't need them,
after reading its configuration file.
The only input from non-root users that I can see until then are the
command line parameters (applets/applets.c)

main() --> run_applet_and_exit() --> run_current_applet_and_exit() -->
check_suid()

regards
Philipp

> | Besides, I think using something old and dead as tinylogin with known
> bugs is
> | more of a security problem than setuid root busybox...
>
> That depends on what those bugs are, I can't do more than handwaving
> about one being less secure as the other without that knowledge.
>
> regards,
>
> Koen
>
> - --
> koen@dominion.kabel.utwente.nl will go go away in december 2007, please
> use k.kooi@student.utwente.nl instead.
>
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>
> iD8DBQFHswdfMkyGM64RGpERAhIXAJ9+ve//TgUn/U7ZFYUmNaqitAY+bwCfY4pF
> JPmlPuPhBdvndxlqzveWVaE=
> =nTlr
> -----END PGP SIGNATURE-----
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


