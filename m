Received: from na3sys009aog113.obsmtp.com ([74.125.149.209])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <mdpoole@troilus.org>) id 1PT5as-0007qZ-E1
	for openembedded-devel@lists.openembedded.org;
	Thu, 16 Dec 2010 05:37:31 +0100
Received: from source ([209.85.213.54]) (using TLSv1) by
	na3sys009aob113.postini.com ([74.125.148.12]) with SMTP
	ID DSNKTQmXKWefsjla0Xe7iTPZUYu6j49rFAEZ@postini.com;
	Wed, 15 Dec 2010 20:35:54 PST
Received: by ywp6 with SMTP id 6so1592662ywp.27
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Dec 2010 20:35:52 -0800 (PST)
MIME-Version: 1.0
Received: by 10.236.95.36 with SMTP id o24mr15997679yhf.97.1292474152204; Wed,
	15 Dec 2010 20:35:52 -0800 (PST)
Received: by 10.236.108.44 with HTTP; Wed, 15 Dec 2010 20:35:52 -0800 (PST)
In-Reply-To: <loom.20101124T090626-312@post.gmane.org>
References: <loom.20101124T090626-312@post.gmane.org>
Date: Wed, 15 Dec 2010 23:35:52 -0500
Message-ID: <AANLkTi=gaij=zue+LuXxr-bv7LHfYE_Nqo7xu1+QBzWS@mail.gmail.com>
From: Michael Poole <mdpoole@troilus.org>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.149.209
X-SA-Exim-Mail-From: mdpoole@troilus.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_MED autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Source distribution broken?
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
X-List-Received-Date: Thu, 16 Dec 2010 04:37:31 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/11/24 Anders T=F6rnqvist <a.tqvist@gmail.com>:
> Hi,
>
> Is the source distribution functionality broken?
>
> This is set in local.conf:
> SRC_DIST_LOCAL =3D "copy"
> INHERIT +=3D "src_distribute_local"
>
> New checkout of OE from git.
> Have tried different builds for MACHINE=3Dbeagleboard and images minimal-=
image and
> base-image.
>
> The only thing that is stored in the TMPDIR/deploy/glibc/sources is a MIT
> directory with the minimal-image/minimal-image.bb file.
>
>
> In src_distribute.bbclass there is a line
> addtask distribute_sources before do_build after do_fetch
> Does do_build actually get run for every task?
>
> If set to something else instead of "do_build" like "do_compile" will tri=
gger a
> lot of src_distribute calls and copying of files for a lot of licenses to
> TMPDIR/deploy/glibc/sources.
>
> Any ideas?

I see substantially similar behavior, and am glad to know it's not
just me.  (Thanks, by the way, for mentioning the change from
"do_build" to "do_compile".)

I see a few more files on my system.  Curiously, and perhaps
significantly, they correspond to the targets that I pass to bitbake.
That is, I run "bitbake x-load u-boot-omap3 linux-omap3 company-image"
(where company-image extends micro-image), and inside
TMPDIR/deploy/uclibc/sources/ I have GPLv2+/x-load,
GPLv2/u-boot-omap3, GPLv2/linux-omap3 and MIT/company-image.

Unfortunately, I am not familiar enough with OpenEmbedded or bitbake
to help much beyond this.  Hopefully someone else on the list can
help.

Michael


