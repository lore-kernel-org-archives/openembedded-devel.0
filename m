Received: from [93.97.175.187] (helo=dan.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1MHHUo-0004Gy-PP
	for openembedded-devel@openembedded.org; Thu, 18 Jun 2009 15:17:39 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	n5ID6gLT005767 for <openembedded-devel@openembedded.org>;
	Thu, 18 Jun 2009 14:06:42 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id H26ptVElFsNI for <openembedded-devel@openembedded.org>;
	Thu, 18 Jun 2009 14:06:42 +0100 (BST)
Received: from [192.168.1.3] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	n5ID6Z8r005718
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-devel@openembedded.org>;
	Thu, 18 Jun 2009 14:06:37 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <1245267720-13612-1-git-send-email-khimov@altell.ru>
References: <1245267720-13612-1-git-send-email-khimov@altell.ru>
Date: Thu, 18 Jun 2009 14:05:35 +0100
Message-Id: <1245330335.11257.26.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Subject: Re: [PATCH 1/3] Make package_update_index_ipk proper task	with locking
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
X-List-Received-Date: Thu, 18 Jun 2009 13:17:39 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, 2009-06-17 at 23:41 +0400, Roman I Khimov wrote:
> Parallel image builds race in package_update_index_ipk, so locking is
> needed and for a proper lock package_update_index_ipk needs to be a
> proper task.

Can I suggest we actually add the ability to lock from shell scripts? A
couple of python scripts (bitbake-lock/bitbake-unlock) which just call
the python locking functions should be trivial to write and then mean we
can add sane locking to specialist functions much more easily. It should
allow us to solve the opkg.conf file issue you were seeing easily too.

Adding those shell scripts is slightly trickt - I'm happy to have them
in bitbake but we'll need another release before OE.dev can depend on
use them. We're overdue a bitbake release so perhaps we can get this
done quite quickly though...

Cheers,

Richard



