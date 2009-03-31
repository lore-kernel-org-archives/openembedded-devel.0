Received: from [216.145.245.198] (helo=mx02.dls.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mwester@dls.net>) id 1LoTip-0007c8-0q
	for openembedded-devel@lists.openembedded.org;
	Tue, 31 Mar 2009 04:29:03 +0200
Received: from [209.242.7.134] (helo=[192.168.231.111])
	by mx02.dls.net with esmtpa (Exim 4.69)
	(envelope-from <mwester@dls.net>) id 1LoTge-0002Ar-Kk
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Mar 2009 21:26:49 -0500
Message-ID: <49D17F70.8020109@dls.net>
Date: Mon, 30 Mar 2009 21:26:56 -0500
From: "Mike (mwester)" <mwester@dls.net>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US;
	rv:1.8.1.21) Gecko/20090302 Thunderbird/2.0.0.21 Mnenhy/0.7.6.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: [RFC] make preferred openssl version match for -native recipe
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
X-List-Received-Date: Tue, 31 Mar 2009 02:29:03 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

I'd like to propose that we remove the "DEFAULT_PREFERENCE = "-1"" line
from openssl-native_0.9.8j.bb.

This is causing a problem in select cases (for example, python-native
fails "import md5"), because we build and stage openssl 0.9.8j, but the
corresponding -native that gets built and staged is openssl 0.9.7g.

The 0.9.8j version is currently selected as the PREFERRED_VERSION in the
preferred-om-2008-versions.inc file, as well as for SlugOS.  I've
successfully built it on both 32 and 64 bit hosts.

Unless there are objections, I'll commit a fix in a couple of days.

Regards,
Mike (mwester)


