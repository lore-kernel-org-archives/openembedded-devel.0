Received: from [64.233.182.191] (helo=nf-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <pmiscml@gmail.com>) id 1Gdwba-0005cA-09
	for openembedded-devel@lists.openembedded.org;
	Sun, 29 Oct 2006 00:24:42 +0200
Received: by nf-out-0910.google.com with SMTP id l23so1746336nfc
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Oct 2006 15:24:15 -0700 (PDT)
Received: by 10.49.75.2 with SMTP id c2mr2268209nfl;
	Sat, 28 Oct 2006 15:24:14 -0700 (PDT)
Received: from CUBE ( [82.193.96.236])
	by mx.google.com with ESMTP id v20sm2886523nfc.2006.10.28.15.24.13;
	Sat, 28 Oct 2006 15:24:14 -0700 (PDT)
Date: Sun, 29 Oct 2006 01:24:13 +0300
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Priority: 3 (Normal)
Message-ID: <1025557584.20061029012413@gmail.com>
To: Bernhard Fischer <rep.nop@aon.at>
In-Reply-To: <20061025153503.GB5673@aon.at>
References: <OFC1EB4E10.63CD3677-ON8525720D.00622299-8525720D.00627058@us.ibm.com>
	<200610240136.41311.paul@codesourcery.com>
	<1893885600.20061024043855@gmail.com>
	<200610241928.47477.rob@landley.net>
	<557987790.20061025031831@gmail.com> <20061025153503.GB5673@aon.at>
MIME-Version: 1.0
Cc: busybox@busybox.net, openembedded-devel@lists.openembedded.org
Subject: busybox "ps ax" woes, was: Re[2]: [Qemu-devel] Config file support
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
X-List-Received-Date: Sat, 28 Oct 2006 22:24:42 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

Hello Bernhard,

Wednesday, October 25, 2006, 6:35:04 PM, you wrote:

> On Wed, Oct 25, 2006 at 03:18:31AM +0300, Paul Sokolovsky wrote:

>>  Oh, and while we still talking (and to add even more confusion),
>>how'd you guys managed to kill "ps ax" to work in busybox 1.2.1? I
>>really miss it here, when loading my embedded images into QEMU...

> Just unset PS_FEATURE_WIDE.

> In principle, i agree that we should enhance it to allow for
> disregarding any non-options.

  Thanks for your response! I actually had a suspicion that some
busybox config option was mis-set. We're using it here with
OpenEmbedded automated build system, and well, when doing system
integration, the distance from configs of individual packages
to the developers increases ;-).

  But we actually had issues with that besides mere command-line
nuisance: some of our init.d scripts has "ps -e" or something, and as
a workaround we had to switch to procps ;-(.

  Again, thanks for your hint, from the context where it was written,
I couldn't expect to get an answer ;-)

> Something like
> Index: libbb/getopt32.c
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- libbb/getopt32.c    (revision 16432)
> +++ libbb/getopt32.c    (working copy)
> @@ -72,6 +72,9 @@
>          env -i ls -d /
>          Here we want env to process just the '-i', not the '-d'.
> =20
> + "_"    If the first character in the applet_opts string is an underscor=
e,
> +               ignore all non-option arguments.
> +
>  const struct option *applet_long_options
> =20
>          This struct allows you to define long options.  The syntax for



> Alternatively you can rewrite ps to match the procps' big ps better.
> I need to be able to see the full commandline if i do `ps ww=B4, not only
> the first 25 chars of them.

> HTH,



--=20
Best regards,
 Paul                            mailto:pmiscml@gmail.com



