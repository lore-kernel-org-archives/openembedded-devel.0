Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1H6DRj-0002Pn-8a
	for openembedded-devel@openembedded.org; Sun, 14 Jan 2007 23:03:23 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1H6DPR-0001Tu-Gx
	for openembedded-devel@openembedded.org; Sun, 14 Jan 2007 23:01:01 +0100
Received: from r76d9.r.ppp-pool.de ([89.54.118.217])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Sun, 14 Jan 2007 23:01:01 +0100
Received: from no2spam by r76d9.r.ppp-pool.de with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Sun, 14 Jan 2007 23:01:01 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Rolf Leggewie <no2spam@nospam.arcornews.de>
Date: Sun, 14 Jan 2007 23:00:44 +0100
Message-ID: <eoe96g$1aj$1@sea.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@sea.gmane.org
X-Gmane-NNTP-Posting-Host: r76d9.r.ppp-pool.de
User-Agent: Thunderbird 1.5.0.9 (X11/20070103)
Sender: news <news@sea.gmane.org>
Subject: RFC: move m4 up to version 1.4.4
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
X-List-Received-Date: Sun, 14 Jan 2007 22:03:23 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

I would like to propose moving m4 up to version 1.4.4.

It seems 1.4.2 that we are using now is causing problems at times -> bug 
837.  The latest version is even 1.4.8 but anything past 1.4.4 depends 
on autoconf >= 2.60.

I have seen that there is a bb file in OE for 2.61 but with preference 
of -1 so I suspect something is not working.  Therefore I propose to go 
up to the latest version which works with the autoconf we have.  I 
prepared the bb files (same as 1.4.2 but SRC_URI without the patch file) 
and verified that m4 and m4-native do compile.

Objections?  Comments?

Regards

Rolf



