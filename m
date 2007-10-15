Received: from [209.85.134.184] (helo=mu-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <philipp.zabel@gmail.com>) id 1IhR94-0005Hv-Q9
	for openembedded-devel@lists.openembedded.org;
	Mon, 15 Oct 2007 16:42:17 +0200
Received: by mu-out-0910.google.com with SMTP id w9so1554380mue
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Oct 2007 07:35:51 -0700 (PDT)
Received: by 10.82.112.3 with SMTP id k3mr11295398buc.1192458951178;
	Mon, 15 Oct 2007 07:35:51 -0700 (PDT)
Received: by 10.82.119.15 with HTTP; Mon, 15 Oct 2007 07:35:51 -0700 (PDT)
Message-ID: <74d0deb30710150735i2ff97bedwbbde3901a78cd6f5@mail.gmail.com>
Date: Mon, 15 Oct 2007 16:35:51 +0200
From: "pHilipp Zabel" <philipp.zabel@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <200710151419.07302.openembedded@haerwu.biz>
MIME-Version: 1.0
References: <200710151419.07302.openembedded@haerwu.biz>
Subject: Re: [RFC] Handling of virtual/* namespace in packages
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
X-List-Received-Date: Mon, 15 Oct 2007 14:42:18 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 10/15/07, Marcin Juszkiewicz <openembedded@haerwu.biz> wrote:
>
> In OpenedHand we got hit by virtual/update-alternatives and packaging.
> Poky contains two providers for virtual/u-a:
>
> 1. update-alternatives-cworth
> 2. update-alternatives-dpkg
>
> First one comes from IPKG source and is written in pure shell. Second one
> is in Perl so it fetch too much to be usable.
>
> The problem comes when you build both of them (it happens on our
> autobuilder due to 'world' build) - package manager (ipkg) selects random
> one - in our case it is always 'update-alternatives-dpkg' so generated
> rootfs is too big to be usable.
>
> Solution which came to my mind is quite simple. Our distro (Poky) already
> prefers 'u-a-cworth' as provider for 'virtual/update-alternatives'. So if
> package depends on 'virtual/update-alternatives' then let package.bbclass
> mangle its dependencies in such way that 'u-a-cworth' (preferred by
> distro) would be writen in package.
>
> What do you think about it?

You propose to add mangle
"Depends: virtual/u-a" into "Depends: u-a-cworth"
in the package control file in package.bbclass if there is
PREFERRED_PROVIDER_virtual/u-a = "u-a-cworth" set?

I don't think that's such a good idea, generally, as suddenly a package that
should work with any virtual/u-a can only be installed with u-a-cworth.

Maybe this mangling could be done for distro specific task packages only?

regards
Philipp


