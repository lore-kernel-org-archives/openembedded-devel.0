Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Gsfb3-0003pH-IV
	for openembedded-devel@openembedded.org; Fri, 08 Dec 2006 14:17:01 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1GsfZm-0002aQ-Q4
	for openembedded-devel@openembedded.org; Fri, 08 Dec 2006 14:15:42 +0100
Received: from r76b7.r.ppp-pool.de ([89.54.118.183])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Fri, 08 Dec 2006 14:15:42 +0100
Received: from no2spam by r76b7.r.ppp-pool.de with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Fri, 08 Dec 2006 14:15:42 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Rolf Leggewie <no2spam@nospam.arcornews.de>
Date: Fri, 08 Dec 2006 14:15:27 +0100
Message-ID: <elbohi$a8k$1@sea.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@sea.gmane.org
X-Gmane-NNTP-Posting-Host: r76b7.r.ppp-pool.de
User-Agent: Thunderbird 1.5.0.8 (X11/20061117)
Sender: news <news@sea.gmane.org>
Subject: RFC: encourage switch away from heanet.sf.net
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
X-List-Received-Date: Fri, 08 Dec 2006 13:17:01 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

it occurred to me today that Sourceforge is not using that intermediate 
page anymore where it lists all the mirrors for a file to be downloaded. 
    It used to be necessary that you click on one of the mirrors there 
to actually start the download from the browser. Instead they 
automatically 302 you now.

Mirrors are there for a reason.  Unfortunately, sf.net forced us in the 
past to use heanet.sourceforge.net for download since it was the only 
complete mirror.  This is not the case any more, we can use 
downloads.sf.net but still be sure to get the files we need (assuming 
that sf.net will only redirect us to mirrors that *do* have the file).

I therefore suggest to change bitbake.conf in the following way and 
request your comments on the matter (especially from hrw since RP 
suggested you are the most knowledgeable about sf.net and the 
associated, past problems).  This would set the IMHO sane default from 
which users can still deviate via local.conf and site.conf

- SOURCEFORGE_MIRROR = "http://heanet.dl.sourceforge.net/sourceforge"
+ SOURCEFORGE_MIRROR = "http://downloads.sf.net"

For what it is worth, I for one have switched (via site.conf so far).

Regards

Rolf



