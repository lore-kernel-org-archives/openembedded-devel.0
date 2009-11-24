Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NCrV3-00025o-PY for openembedded-devel@lists.openembedded.org;
	Tue, 24 Nov 2009 10:15:56 +0100
Received: from list by lo.gmane.org with local (Exim 4.50) id 1NCrTe-0007Ou-MM
	for openembedded-devel@lists.openembedded.org;
	Tue, 24 Nov 2009 10:14:26 +0100
Received: from 203.117.234.153 ([203.117.234.153])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Nov 2009 10:14:26 +0100
Received: from robk by 203.117.234.153 with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Nov 2009 10:14:26 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Rob Kramer <robk@starhub.net.sg>
Followup-To: gmane.comp.handhelds.openembedded
Date: Tue, 24 Nov 2009 17:12:28 +0800
Message-ID: <heg84r$lhh$1@ger.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: 203.117.234.153
User-Agent: KNode/4.3.2
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Custom handling of ipk upgrade conflicts..
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
X-List-Received-Date: Tue, 24 Nov 2009 09:15:56 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7Bit

Hi all,

I'm wondering how I could deal with conditionally installing some files in a 
ipk package, such as configuration files. For example, to not install some 
file if it already exists, or to merge it in some customized way. The 
CONFFILES directive is too interactive for my use, and doesn't allow custom 
handling of conflicts.

Does someone know of an example of a recipe that does a similar thing, 
perhaps using ipkg preinstall scripts etc?

Cheers!

    Rob



