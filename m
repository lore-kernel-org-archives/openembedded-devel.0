Received: from [93.97.175.187] (helo=dan.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1MHHPv-00045S-Lj
	for openembedded-devel@openembedded.org; Thu, 18 Jun 2009 15:12:35 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	n5ID1dCd005076 for <openembedded-devel@openembedded.org>;
	Thu, 18 Jun 2009 14:01:39 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id QFOnbjH4ooa9 for <openembedded-devel@openembedded.org>;
	Thu, 18 Jun 2009 14:01:39 +0100 (BST)
Received: from [192.168.1.3] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	n5ID1bIF005062
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-devel@openembedded.org>;
	Thu, 18 Jun 2009 14:01:38 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <1245267720-13612-2-git-send-email-khimov@altell.ru>
References: <1245267720-13612-1-git-send-email-khimov@altell.ru>
	<1245267720-13612-2-git-send-email-khimov@altell.ru>
Date: Thu, 18 Jun 2009 14:00:36 +0100
Message-Id: <1245330036.11257.21.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
Subject: Re: [PATCH 2/3] package_ipk: optimize	do_package_update_index_ipk
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
X-List-Received-Date: Thu, 18 Jun 2009 13:12:35 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, 2009-06-17 at 23:41 +0400, Roman I Khimov wrote:
> If there are no package updates since last index update, don't re-create
> indexes. Really helps when building something like 10 images.

ipkg-make-index should have caching internally such that it only
rebuilds the segments of packages that have changed. If this patch makes
a significant difference, we should fix ipkg-make-index.

Also, just because the number of .ipk files matches the number of files
in the index it doesn't mean nothing changed (think about a package
being rebuilt and having just its dependencies changes).

Finally, using date stamps also doesn't work with packaged staging.

So a definite NAK I'm afraid, please fix ipkg-make-index.

Richard




