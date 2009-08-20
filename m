Received: from [78.46.147.237] (helo=gandharva.secretlabs.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1Me0nf-00042f-N2
	for openembedded-devel@lists.openembedded.org;
	Thu, 20 Aug 2009 08:07:08 +0200
Received: from tamarin.localnet (123-192-185-227.dynamic.kbronet.com.tw
	[123.192.185.227])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id 34ACB1B10C0B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Aug 2009 05:53:42 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 20 Aug 2009 07:49:07 +0200
User-Agent: KMail/1.12.0 (Linux/2.6.31-rc4; KDE/4.3.0; i686; ; )
References: <1250738680-20274-1-git-send-email-clarson@mvista.com>
	<1250738680-20274-5-git-send-email-clarson@mvista.com>
	<1250738680-20274-6-git-send-email-clarson@mvista.com>
In-Reply-To: <1250738680-20274-6-git-send-email-clarson@mvista.com>
MIME-Version: 1.0
Message-Id: <200908200749.07494.holger+oe@freyther.de>
Subject: Re: [PATCH] bitbake.conf: Kill CCACHE. Implicit, automatic use of things which can fail is bad.
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
X-List-Received-Date: Thu, 20 Aug 2009 06:07:14 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Thursday 20 August 2009 05:24:37 Chris Larson wrote:
> To re-enable, set CCACHE = "ccache ".
>
> Signed-off-by: Chris Larson <clarson@mvista.com>

Could you elaborate on the need of that? Which platforms do you deal with that 
break due the usage of ccache?

And technically I think you should make it CCACHE = "", out of legacy I think 
we can not really remove keys from bitbake.conf


