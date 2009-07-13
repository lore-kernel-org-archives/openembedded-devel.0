Received: from [207.164.182.72] (helo=smtp.cbnco.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <msmith@cbnco.com>) id 1MQBQo-000867-1X
	for openembedded-devel@lists.openembedded.org;
	Mon, 13 Jul 2009 04:38:18 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id 7278B507C6E
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Jul 2009 22:25:09 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 25514-08 for <openembedded-devel@lists.openembedded.org>; 
	Sun, 12 Jul 2009 22:25:09 -0400 (EDT)
Received: from juice.ott.cti.com (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTPSA id 4AB47507C46
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Jul 2009 22:25:09 -0400 (EDT)
Date: Sun, 12 Jul 2009 22:25:09 -0400 (EDT)
From: Michael Smith <msmith@cbnco.com>
X-X-Sender: michael@juice.ott.cti.com
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1247300986.16040.157.camel@lenovo.internal.reciva.com>
Message-ID: <Pine.LNX.4.64.0907122220040.3621@juice.ott.cti.com>
References: <1247290267-16928-1-git-send-email-msmith@cbnco.com>
	<1247300986.16040.157.camel@lenovo.internal.reciva.com>
MIME-Version: 1.0
X-Virus-Scanned: amavisd-new at cbnco.com
Subject: Re: [PATCH 1/2] package classes: count dotfiles as non-empty
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
X-List-Received-Date: Mon, 13 Jul 2009 02:38:18 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII

On Sat, 11 Jul 2009, Phil Blundell wrote:

> Thanks, I checked this in.

Thanks. Please ignore the second patch -- it causes lots of empty .debug 
directories to appear in non-debug packages. It'd be nice if 
populate_packages() could preserve the permissions of the directories 
above the files it copies, but for now it's easy enough to work around in 
a populate_packages_append for the rare cases where it matters.

Mike


