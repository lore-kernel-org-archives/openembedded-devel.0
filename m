Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1KNS1d-0003G0-RO
	for openembedded-devel@openembedded.org; Mon, 28 Jul 2008 14:40:29 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1KNS02-0000dN-Ux
	for openembedded-devel@openembedded.org; Mon, 28 Jul 2008 12:38:51 +0000
Received: from ip-62-143-12-162.hsi.ish.de ([62.143.12.162])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Mon, 28 Jul 2008 12:38:50 +0000
Received: from no2spam by ip-62-143-12-162.hsi.ish.de with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Mon, 28 Jul 2008 12:38:50 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Rolf Leggewie <no2spam@nospam.arcornews.de>
Date: Mon, 28 Jul 2008 14:38:52 +0200
Message-ID: <g6kekk$rc8$1@ger.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip-62-143-12-162.hsi.ish.de
User-Agent: Thunderbird 2.0.0.16 (X11/20080724)
Sender: news <news@ger.gmane.org>
Subject: shorter git URLs
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
X-List-Received-Date: Mon, 28 Jul 2008 12:40:30 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi,

it looks like the switch to git is coming nearer.  gitweb is nice and
fast.  But it produces rather long URLs.  I assume we'll want to point
to recipes and stuff often and gitweb is a convenient way to do that
publicly.  I suggest we implement a couple of apache rewrite rules.

a) file access against .dev
http://gitweb.openembedded.net/file/dev/$1
http://gitweb.openembedded.net/?p=org.openembedded.dev.git;a=blob_plain;f=$1;hb=HEAD

b) file access against .stable
http://gitweb.openembedded.net/file/stable/$1
http://gitweb.openembedded.net/?p=org.openembedded.stable.git;a=blob_plain;f=$1;hb=HEAD

c) directory access against .dev
http://gitweb.openembedded.net/dir/dev/$1
http://gitweb.openembedded.net/?p=org.openembedded.dev.git;a=tree;f=$1;hb=HEAD

d) directory access against .stable
http://gitweb.openembedded.net/dir/stable/$1
http://gitweb.openembedded.net/?p=org.openembedded.stable.git;a=tree;f=$1;hb=HEAD


I have not tested this out and I am not sure if this will be error-free.
What I am sure about is that this would be a nice thing to have.

Regards

Rolf



