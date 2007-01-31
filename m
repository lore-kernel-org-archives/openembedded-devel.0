Received: from [80.68.91.202] (helo=xora.org.uk)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <dp@xora.org.uk>) id 1HCDRu-0002Da-9q
	for openembedded-devel@lists.openembedded.org;
	Wed, 31 Jan 2007 12:16:26 +0100
Received: from xora.org.uk ([::ffff:81.178.202.178])
	(AUTH: LOGIN dp, TLS: TLSv1/SSLv3,128bits,AES128-SHA)
	by xora.org.uk with esmtp; Wed, 31 Jan 2007 11:16:00 +0000
	id 00078162.45C07A75.000046AC
Date: Wed, 31 Jan 2007 11:21:50 +0000
From: Graeme Gregory <dp@xora.org.uk>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20070131112150.GD21515@stygia.hyboria>
References: <1170240380.5809.15.camel@localhost.localdomain>
Mime-Version: 1.0
In-Reply-To: <1170240380.5809.15.camel@localhost.localdomain>
User-Agent: Mutt/1.5.12-2006-07-14
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
X-List-Received-Date: Wed, 31 Jan 2007 11:16:30 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wed, Jan 31, 2007 at 10:46:19AM +0000, Richard Purdie wrote:
> My question is therefore does it make sense to have X11R7.x in PV?
> 
> If people want a build compatible with X11R.x, it would be easy to write
> a preferred-version-X11R7.1.inc with the appropriate PREFERRED_VERSIONs
> set. In fact you could have a script autogenerate that.
> 
> I realise removing X11Rx from the PV will break upgrades but I think if
> we don't do that, we could be storing up trouble in the long run which
> we could change now.
> 
My memory of why X11R7.X ended up in the PV is that at the time bitbake
didnt support an epoch in the PV. This was a hack to make sure that xorg
6.X stuff upgraded to 7.X properly.

I guess this opens the discussion on bitbake and epochs again.

Graeme



