Received: from [209.85.198.187] (helo=rv-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1JgwQs-0000H2-E4
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 Apr 2008 08:26:50 +0200
Received: by rv-out-0910.google.com with SMTP id c24so1698408rvf.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Apr 2008 23:26:49 -0700 (PDT)
Received: by 10.141.34.12 with SMTP id m12mr4844274rvj.26.1207117608994;
	Tue, 01 Apr 2008 23:26:48 -0700 (PDT)
Received: by 10.140.125.10 with HTTP; Tue, 1 Apr 2008 23:26:48 -0700 (PDT)
Message-ID: <19c1b8a90804012326na52fee5hedef00c3a12390c4@mail.gmail.com>
Date: Tue, 1 Apr 2008 23:26:48 -0700
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <fsihmm$dr3$1@ger.gmane.org>
MIME-Version: 1.0
References: <20080328011211.7c66e00b@zaurus>
	<1206696274.5029.14.camel@dax.rpnet.com>
	<1206699605.18251.39.camel@hammer.suse.cz>
	<fsihmm$dr3$1@ger.gmane.org>
Cc: openembedded-devel@openembedded.org
Subject: Re: binconfig.bbclass breaks packages QA
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
X-List-Received-Date: Wed, 02 Apr 2008 06:26:50 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Fri, Mar 28, 2008 at 3:36 AM, Koen Kooi
<koen@dominion.kabel.utwente.nl> wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
>  Hash: SHA1
>
>  Stanislav Brabec schreef:
>
> | Richard Purdie wrote:
>  |> On Fri, 2008-03-28 at 01:12 +0100, Stanislav Brabec wrote:
>  |
>  |>> After the fix, maybe binconfig files could be moved to the
>  |>> standard staging directory (it must be in build path then).
>  |>>
>  |>> Could anybody with deeper insight confirm it or do this change?
>  |> We still need that mangling unfortunately.
>  |
>  | Grr.
>  |
>  | | CROSS COMPILE Badness: /usr/include in INCLUDEPATH:
>  /usr/include/freetype2
>  | | cc1: internal compiler error: in add_path, at c-incpath.c:371
>  |
>  | We may want -isysroot instead of -isystem (and report bug above to gcc
>  | developers, as the report advices), but only for cross builds.
>
>  We patch gcc to ICE on including /usr/include, /opt/include, etc, so we
>  shouldn't report them to the gcc people, but spank the application
>  authors where appropriate.

Actually there is a patch which will issue warning on such poisoning
when using cross gcc. but sometimes it becomes annoyance for build
systems like scratchbox which pretend to be native.

google for poison-system-directories. I can post a patch if thats desired.


>
>  regards,
>
>  Koen
>  -----BEGIN PGP SIGNATURE-----
>  Version: GnuPG v1.4.5 (Darwin)
>
>  iD8DBQFH7MoVMkyGM64RGpERAonaAJ9f8dqydelLPQc93nD0n1Qh+856cwCfeNNu
>  0BoSRuHZyQA4zwMnDGf6R44=
>  =UJik
>  -----END PGP SIGNATURE-----
>
>
>
>
>  _______________________________________________
>  Openembedded-devel mailing list
>  Openembedded-devel@lists.openembedded.org
>  http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


