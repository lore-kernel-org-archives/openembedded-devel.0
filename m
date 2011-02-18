Received: from gandharva.secretlabs.de ([78.46.147.237])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <holger+oe@freyther.de>) id 1PqYY0-0004Su-3w
	for openembedded-devel@lists.openembedded.org;
	Fri, 18 Feb 2011 23:11:32 +0100
Received: from [192.168.0.101] (91-64-83-241-dynip.superkabel.de
	[91.64.83.241])
	by gandharva.secretlabs.de (Postfix) with ESMTPA id 0F3D41B10C0C
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Feb 2011 22:21:17 +0000 (UTC)
Message-ID: <4D5EEE4A.5030002@freyther.de>
Date: Fri, 18 Feb 2011 23:10:18 +0100
From: Holger Freyther <holger+oe@freyther.de>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101209 Fedora/3.1.7-0.35.b3pre.fc14
	Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: Build issues on natty
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
X-List-Received-Date: Fri, 18 Feb 2011 22:11:32 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi all,

I am still hitting two build issues on natty and could need a hand on fixing
this in OpenEmbedded.

1.) openssl-native. We apply a patch to make openssl link with local objects
so that an upgrade from openssl 0.9.x to 1.0.0 is going to work. With
something in gcc 4.5, latest binutils... something changed


2.) curl-native. This is actually somehow weird. We disable GNUTLS on build
but something links to gnutls indireclty and it takes the system gnutls but
the local gcrypt and stuff goes wrong. Building without ldap support seems to
fix that.

cheers
	holger


