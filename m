Received: from mail.reciva.com ([82.71.203.194] helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1NXEEO-0005Tw-8h
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 Jan 2010 14:34:55 +0100
Received: from castle.reciva.com ([82.71.203.193]
	helo=lurch.internal.reciva.com)
	by crown.reciva.com with esmtps (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1NXECE-00079v-51
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 Jan 2010 13:32:38 +0000
Received: from mill.internal.reciva.com ([192.168.106.87] ident=pb)
	by lurch.internal.reciva.com with esmtp (Exim 4.63)
	(envelope-from <philb@gnu.org>) id 1NXECD-0006SG-U2
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 Jan 2010 13:32:38 +0000
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4B55B26C.5040706@gmail.com>
References: <4B54F654.4000500@atmel.com>  <4B55B26C.5040706@gmail.com>
Date: Tue, 19 Jan 2010 13:32:34 +0000
Message-ID: <1263907954.9743.4.camel@mill.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.2 
X-SA-Exim-Connect-IP: 82.71.203.194
X-SA-Exim-Mail-From: philb@gnu.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Angstrom: x11-gpe-image : Calibration of Screen ?
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
X-List-Received-Date: Tue, 19 Jan 2010 13:34:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2010-01-19 at 14:23 +0100, Marco Cavallini wrote:
> Temporary conclusion is that xtscal is no longer usable because the
> xcalibrate extension is only implemented for kdrive.
> Possible options are to use kdrive (hopefully not) or find another way
> to calibrate our touchscreen.
> I am working on a new way to calibrate the screen in the xorg (not
> kdrive) way.

Can you not simply repair XCALIBRATE in the xorg server?  I don't think
there's anything wrong with the wire protocol, and it seems a bit
excessive to invent a completely new way of doing calibration just
because that code isn't currently working.

p.




