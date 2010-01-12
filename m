Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NUl99-0007NL-8s for openembedded-devel@lists.openembedded.org;
	Tue, 12 Jan 2010 19:07:20 +0100
Received: from list by lo.gmane.org with local (Exim 4.50) id 1NUl74-0001su-0t
	for openembedded-devel@lists.openembedded.org;
	Tue, 12 Jan 2010 19:05:06 +0100
Received: from 69.199.146.210 ([69.199.146.210])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Jan 2010 19:05:05 +0100
Received: from q-newsgroup by 69.199.146.210 with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Jan 2010 19:05:05 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: David Winn <q-newsgroup@qypea.com>
Date: Tue, 12 Jan 2010 18:01:12 +0000 (UTC)
Message-ID: <loom.20100112T185527-540@post.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: sea.gmane.org
User-Agent: Loom/3.14 (http://gmane.org/)
X-Loom-IP: 69.199.146.210 (Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.6) Gecko/20100107 Fedora/3.5.6-1.fc12 Firefox/3.5.6)
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Apache staging for building modules
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
X-List-Received-Date: Tue, 12 Jan 2010 18:07:20 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

I'm trying to create a recipe mod_fastcgi for use with apache2 in OE, and hit a
bit of a problem. In order to build mod_fastcgi requires access to the apache
source directory, which is removed by rm_work. Apache2-native is staging headers
and apxs which might work for building native modules, but won't cross compile.

Is there something I am overlooking here? Are any other apache modules compiled
by OE?

Thanks,
David



