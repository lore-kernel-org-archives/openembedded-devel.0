Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1MGzIR-0007n4-D5
	for openembedded-devel@openembedded.org; Wed, 17 Jun 2009 19:51:39 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1MGz8J-0007Dk-PH
	for openembedded-devel@openembedded.org; Wed, 17 Jun 2009 17:41:11 +0000
Received: from p17194-ipngn801marunouchi.tokyo.ocn.ne.jp ([114.162.172.194])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Wed, 17 Jun 2009 17:41:11 +0000
Received: from no2spam by p17194-ipngn801marunouchi.tokyo.ocn.ne.jp with local
	(Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Wed, 17 Jun 2009 17:41:11 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Rolf Leggewie <no2spam@nospam.arcornews.de>
Date: Thu, 18 Jun 2009 02:40:58 +0900
Message-ID: <h1b9rb$39u$1@ger.gmane.org>
References: <1245258640-1623-1-git-send-email-clarson@mvista.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: p17194-ipngn801marunouchi.tokyo.ocn.ne.jp
User-Agent: Thunderbird 2.0.0.21 (X11/20090409)
In-Reply-To: <1245258640-1623-1-git-send-email-clarson@mvista.com>
Sender: news <news@ger.gmane.org>
Subject: Re: [PATCH] image.bbclass: remove tmp/rootfs after image creation unless you set a variable
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
X-List-Received-Date: Wed, 17 Jun 2009 17:51:39 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Chris Larson wrote:
> Set IMAGE_KEEPROOTFS to something other than the empty string to keep
> tmp/rootfs around after image creation, otherwise it will be removed

We had something like this proposed a while ago by I think Lynn Lin. 
This is already a bit more evolved since it is conditional on a 
variable.  The proposal then was rejected on the grounds of breaking 
concurrent builds and I think this will likely be the case here, too.

comments?



