Received: from [202.173.155.195] (helo=birgitte.twibble.org)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <lenehan@twibble.org>) id 1HyhVk-0008G2-Qc
	for openembedded-devel@lists.openembedded.org;
	Thu, 14 Jun 2007 07:04:53 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
	by birgitte.twibble.org (Postfix) with ESMTP id CC3A810D6B5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Jun 2007 15:01:30 +1000 (EST)
Received: from birgitte.twibble.org ([127.0.0.1])
	by localhost (birgitte [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 00639-05
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Jun 2007 15:01:29 +1000 (EST)
Received: from nynaeve.twibble.org (nynaeve.twibble.org [202.173.155.194])
	by birgitte.twibble.org (Postfix) with ESMTP id 9820ABF226
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Jun 2007 15:01:29 +1000 (EST)
Received: by nynaeve.twibble.org (Postfix, from userid 500)
	id 82CF1B70149; Thu, 14 Jun 2007 15:01:29 +1000 (EST)
Date: Thu, 14 Jun 2007 15:01:29 +1000
From: Jamie Lenehan <lenehan@twibble.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20070614050129.GA27377@twibble.org>
MIME-Version: 1.0
User-Agent: Mutt/1.5.12-2006-07-14
X-Virus-Scanned: by amavisd at twibble.org
Subject: [RFC] Move /bin/ip to /sbin/ip and use update-alternatives
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
X-List-Received-Date: Thu, 14 Jun 2007 05:05:40 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

I usually need the full ip command from iproute2 rather than the
busybox version, but currently they put the ip command in different
locations:

 busybox  -> /bin/ip
 iproute2 -> /sbin/ip

I want to change busybox to install it's ip symlink in /sbin (the standard
location for this) and use update-alternatives to select the iproute2 one
when it's installed.

Anyone have any issues with doing this?

-- 
 Jamie Lenehan <lenehan@twibble.org>


