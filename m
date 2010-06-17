Received: from mail.gmx.net ([213.165.64.20])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <jeesmann@gmx.de>) id 1OPM3l-0005em-Lf
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 Jun 2010 22:51:48 +0200
Received: (qmail invoked by alias); 17 Jun 2010 20:39:47 -0000
Received: from p5DE7A143.dip.t-dialin.net (EHLO [192.168.2.101])
	[93.231.161.67]
	by mail.gmx.net (mp005) with SMTP; 17 Jun 2010 22:39:47 +0200
X-Authenticated: #55411201
X-Provags-ID: V01U2FsdGVkX1/7fjpnTlH74k/VEqbqH5gNo2iE4qNLl8nKeKV0Lw
	1SZqom9Bk+XY4X
From: Joerg Eesmann <jeesmann@gmx.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <89BAD49D-B779-4C20-BBC0-F220F8C440AA@keylevel.com>
References: <89BAD49D-B779-4C20-BBC0-F220F8C440AA@keylevel.com>
Date: Thu, 17 Jun 2010 22:39:46 +0200
Message-Id: <1276807186.8606.1.camel@fred.uchi.de>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
X-Y-GMX-Trusted: 0
X-SA-Exim-Connect-IP: 213.165.64.20
X-SA-Exim-Mail-From: jeesmann@gmx.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: New user would like some help
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
X-List-Received-Date: Thu, 17 Jun 2010 20:52:15 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi,
try libsdl, nothing with the suffix -native.
The native-recipes are not cross-compiled, they will go to the staging
directory, I think.
BR
Joerg
On Thu, 2010-06-17 at 20:24 +0100, Chris Tapp wrote:
> Hi,
> 
> I've recently come across Openembedded and really like what I see :-)
> 
> I'm trying to use it to produce a minimal Linux image and have built  
> one for 'minimal-image' using the 'minimal'  distro for the 'alix'  
> machine. This builds and boots in Qemu, so looks good.
> 
> I now want to add some other libraries to the image so that they will  
> be available by default. I've tried to do this by adding IMAGE_INSTALL  
> lines in to minimal-image.bb (I'll do this properly by making a copy  
> soon!). e.g.
> 
> IMAGE_INSTALL = "task-boot \
> 		libsdl-native \
> <rest of file>
> 
> This appears to do something at build time, but libsdl is not in the  
> image that's produced.
> 
> Is this the right way to go about this? I assume not, as, but I've had  
> a look at the user manual and didn't spot anything obvious in there to  
> show me what I'm doing wrong.
> 
> Any help would be greatly appreciated.
> 
> Chris
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



