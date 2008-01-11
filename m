Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1JDN8o-0008CA-UD
	for openembedded-devel@openembedded.org; Fri, 11 Jan 2008 17:54:02 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1JDN8b-0001p7-8F
	for openembedded-devel@openembedded.org; Fri, 11 Jan 2008 16:53:45 +0000
Received: from ip-62-143-227-114.1411n-cud12k-01.ish.de ([62.143.227.114])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Fri, 11 Jan 2008 16:53:45 +0000
Received: from no2spam by ip-62-143-227-114.1411n-cud12k-01.ish.de with local
	(Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Fri, 11 Jan 2008 16:53:45 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Rolf Leggewie <no2spam@nospam.arcornews.de>
Date: Fri, 11 Jan 2008 17:53:36 +0100
Message-ID: <fm86uh$qa8$1@ger.gmane.org>
References: <47871C71.5020800@student.utwente.nl> <fm79ef$hak$1@ger.gmane.org>
	<47872B1A.9010400@student.utwente.nl>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip-62-143-227-114.1411n-cud12k-01.ish.de
User-Agent: Thunderbird 2.0.0.6 (X11/20071022)
In-Reply-To: <47872B1A.9010400@student.utwente.nl>
Sender: news <news@ger.gmane.org>
Subject: Re: mtn disapprove
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
X-List-Received-Date: Fri, 11 Jan 2008 16:54:12 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Koen Kooi schrieb:
> It's the thing I had in mind, but never worked up the motivation of
> doing :)

OK, here it is: http://oz.leggewie.org/wip/machine-config.diff

* drop unused poodle-2.6.inc
* work contents of collie-2.6.inc into collie.conf
* require zaurus-2.6.inc for collie.conf
* deleted entries from collie.conf that seem superfluous
* made some changes to zaurus-2.6.inc to make sure it applies
  to all Zaurus models
* define SERIAL_CONSOLE in zaurus-2.6.inc as ?=

RP and hrw have given their OK.  I have locally committed it as
49cb87ce3fb4d9857d853d9e54f38fa88e9ccc85.  If there are no objections, I
will eventually push it.



