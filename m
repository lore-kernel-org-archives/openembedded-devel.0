Received: from [64.233.184.236] (helo=wr-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <philipp.zabel@gmail.com>) id 1HCDj7-0003u1-Pv
	for openembedded-devel@lists.openembedded.org;
	Wed, 31 Jan 2007 12:34:09 +0100
Received: by wr-out-0506.google.com with SMTP id i30so175312wra
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Jan 2007 03:34:08 -0800 (PST)
Received: by 10.90.84.17 with SMTP id h17mr895889agb.1170243248141;
	Wed, 31 Jan 2007 03:34:08 -0800 (PST)
Received: by 10.90.92.2 with HTTP; Wed, 31 Jan 2007 03:34:08 -0800 (PST)
Message-ID: <74d0deb30701310334q3478a077m4147b2afc7e7dabe@mail.gmail.com>
Date: Wed, 31 Jan 2007 12:34:08 +0100
From: "pHilipp Zabel" <philipp.zabel@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20070131112150.GD21515@stygia.hyboria>
MIME-Version: 1.0
References: <1170240380.5809.15.camel@localhost.localdomain>
	<20070131112150.GD21515@stygia.hyboria>
Subject: Re: RFC: Xorg Version Numbering
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
X-List-Received-Date: Wed, 31 Jan 2007 11:34:10 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 1/31/07, Graeme Gregory <dp@xora.org.uk> wrote:
> On Wed, Jan 31, 2007 at 10:46:19AM +0000, Richard Purdie wrote:
> > My question is therefore does it make sense to have X11R7.x in PV?
> >
> > If people want a build compatible with X11R.x, it would be easy to write
> > a preferred-version-X11R7.1.inc with the appropriate PREFERRED_VERSIONs
> > set. In fact you could have a script autogenerate that.
> >
> > I realise removing X11Rx from the PV will break upgrades but I think if
> > we don't do that, we could be storing up trouble in the long run which
> > we could change now.
> >
> My memory of why X11R7.X ended up in the PV is that at the time bitbake
> didnt support an epoch in the PV. This was a hack to make sure that xorg
> 6.X stuff upgraded to 7.X properly.
>
> I guess this opens the discussion on bitbake and epochs again.
>
> Graeme

Right, that was the reason.
I'd absolutely prefer to switch to the individual release versions and
set an epoch if somebody could add epoch support to bitbake.

regards
Philipp


