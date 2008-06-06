Received: from [85.214.48.103] (helo=mail.familie-heinold.de ident=postfix)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <heinold@inf.fu-berlin.de>) id 1K4kRL-0007ll-Rx
	for openembedded-devel@lists.openembedded.org;
	Sat, 07 Jun 2008 00:29:43 +0200
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id E36138400BE
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  7 Jun 2008 00:24:51 +0200 (CEST)
Received: from mail.familie-heinold.de (h873313.serverkompetenz.net
	[127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 7CEA38400B2
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  7 Jun 2008 00:24:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.2.4 (2008-01-01) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=AWL,BAYES_40 autolearn=ham
	version=3.2.4
Received: from rhein.familie-heinold.de (e178090106.adsl.alicedsl.de
	[85.178.90.106]) by mail.familie-heinold.de (Postfix) with ESMTP
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  7 Jun 2008 00:24:51 +0200 (CEST)
Received: by rhein.familie-heinold.de (Postfix, from userid 1000)
	id F053E3C1A7; Sat,  7 Jun 2008 00:24:50 +0200 (CEST)
Date: Sat, 7 Jun 2008 00:24:50 +0200
From: Henning Heinold <heinold@inf.fu-berlin.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20080606222450.GA6145@rhein.zuhause.netz>
References: <200806061706.11880.geoffrey@pager.net>
MIME-Version: 1.0
In-Reply-To: <200806061706.11880.geoffrey@pager.net>
User-Agent: Mutt/1.5.18 (2008-05-17)
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: Re: DEPENDS="gettext" vs. DEPENDS="virtual/libintl"
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Fri, 06 Jun 2008 22:29:44 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 06, 2008 at 05:06:11PM -0500, Geoffrey Wossum wrote:
> Hi all,
> 
> I'm working on exorcizing gettext as a requirement for building OE.  Since 
> glib-2.0 absolutely has to have libintl, I've found an alternate way of 
> providing.  uClibc's libintl stub has a pretty bad case of bitrot, but I 
> found proxy-libintl, which was written to get GNOME onto Windows.  By setting 
> proxy-libintl up as the PREFERRED_PROVIDER for virtual/libintl, I can get 
> past glib-2.0 now.
> 
> The problem now is that some packages explicitly list "gettext" in their 
> DEPENDS.  Is this just legacy from before virtual/libintl was created?  Is 
> there any reason why these can't all be changed to "virtual/libintl"?
> 
> TIA,
> ---
> Geoffrey
> 
Hi,

I suggest looking into this packages to see why they need gettext, maybee
they need special tools, which only gettext provides.

Bye,

Henning


