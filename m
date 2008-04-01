Received: from [209.85.146.176] (helo=wa-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1JglPK-0005Ne-Dd
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Apr 2008 20:40:31 +0200
Received: by wa-out-1112.google.com with SMTP id l24so4674525waf.22
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Apr 2008 11:40:29 -0700 (PDT)
Received: by 10.114.191.1 with SMTP id o1mr13045392waf.66.1207075228846;
	Tue, 01 Apr 2008 11:40:28 -0700 (PDT)
Received: by 10.114.234.12 with HTTP; Tue, 1 Apr 2008 11:40:28 -0700 (PDT)
Message-ID: <19c1b8a90804011140w3c74fafay3434207d65ed249f@mail.gmail.com>
Date: Tue, 1 Apr 2008 11:40:28 -0700
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <c384c5ea0803310832w74e60013p3940a72947cfd417@mail.gmail.com>
MIME-Version: 1.0
References: <c384c5ea0803301459l3d808b51v64bad3155b7b3b86@mail.gmail.com>
	<fsqenu$gr7$1@ger.gmane.org>
	<c384c5ea0803310832w74e60013p3940a72947cfd417@mail.gmail.com>
Subject: Re: Behaviour when bitbaking a specific version with DEFAULT_PREFERENCE = "-1"
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
X-List-Received-Date: Tue, 01 Apr 2008 18:40:33 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

you can generate the dependencies (bitbake -vvvv option) and see who
is pulling the second one.

-Khem

On Mon, Mar 31, 2008 at 8:32 AM, Leon Woestenberg
<leon.woestenberg@gmail.com> wrote:
> On Mon, Mar 31, 2008 at 12:34 PM, Rolf Leggewie
>  <no2spam@nospam.arcornews.de> wrote:
>  > Leon Woestenberg wrote:
>  >  > when I perform a bitbake package-version.bb, whilst that package has
>  >  > DEFAULT_PREFERENCE -1, weird things happen.
>  >
>  >  example?
>  >
>  Sure. (Revision numbers might be off, I do not have access to the
>  build machine right now.)
>
>  I had built console-image for MACHINE=efika, with madwifi-ng as an
>  extra package.
>  madwifi-ng-r2072 gets built, because newers have DEFAULT_PREFERENCE -1
>  (at least for MACHINE "efika").
>
>  Good so far.
>
>  I then cleaned madwifi-ng. If I then build a specific newer version
>  (which has DEFAULT_PREFERENCE = -1", bitbake madwifi-ng-r3367, bitbake
>  starts to build both revisions, and concurrently in my case.
>
>  I.e both the one I specified, and the one which has DEFAULT_PREFERENCE set to 1.
>
>  Not a common case, but it took me a while to see what caused it.
>
>  Regards,
>  --
>  Leon
>
>
>
>  _______________________________________________
>  Openembedded-devel mailing list
>  Openembedded-devel@lists.openembedded.org
>  http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


