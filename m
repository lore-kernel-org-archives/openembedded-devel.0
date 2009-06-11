Received: from [63.81.120.158] (helo=gateway-1237.mvista.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <clarson@mvista.com>) id 1MEb9J-0004dd-9w
	for openembedded-devel@lists.openembedded.org;
	Thu, 11 Jun 2009 05:40:21 +0200
Received: from [0.0.0.0] (asshur.mvista.com [10.0.0.11])
	by hermes.mvista.com (Postfix) with ESMTP id 6717318182
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Jun 2009 20:30:31 -0700 (PDT)
Message-ID: <4A307A57.2040908@mvista.com>
Date: Wed, 10 Jun 2009 20:30:31 -0700
From: Christopher Larson <clarson@mvista.com>
User-Agent: Thunderbird 2.0.0.21 (Windows/20090302)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <87k53jiiqe.wl%peter@chubb.wattle.id.au>
In-Reply-To: <87k53jiiqe.wl%peter@chubb.wattle.id.au>
Subject: Re: How do I modifly kernel config?
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
X-List-Received-Date: Thu, 11 Jun 2009 03:40:21 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Peter Chubb wrote:
> Hi,
>    Is there an easy way to make a recipe that builds a kernel with a
> different .config ?  I know I can copy an entire recipe with my own
> file://defconfig --- but is that the best way to proceed?

FILESPATHBASE =. "${TOPDIR}/files"

Then mkdir -p files/<PN for the kernel recipe>; cp myconfig files/<PN 
for the kernel recipe>/defconfig.  or what have you.  file:// uris are 
processed via FILESPATH, which is constructed by FILESPATHBASE and 
FILESPATHPKG.  The default FILESPATHBASE is the location where the 
recipe resides, if that helps explain it.

-Chris


