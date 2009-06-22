Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1MIoE0-0000VI-3U
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Jun 2009 20:26:36 +0200
Received: from 79-71-239-25.dynamic.dsl.as9105.com ([79.71.239.25]
	helo=[192.168.2.175])
	by crown.reciva.com with esmtpsa (TLS-1.0:RSA_ARCFOUR_MD5:16)
	(Exim 4.63) (envelope-from <philb@gnu.org>) id 1MIo3L-00028C-58
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Jun 2009 19:15:36 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1245692685-21173-1-git-send-email-denis@denix.org>
References: <1245692685-21173-1-git-send-email-denis@denix.org>
Date: Mon, 22 Jun 2009 19:09:05 +0100
Message-Id: <1245694145.3521.9.camel@kc.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.10.1 
Subject: Re: RFC: [PATCH] /etc/profile: stricter root PATH - require	absolute pathname for bins in cwd
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
X-List-Received-Date: Mon, 22 Jun 2009 18:26:38 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, 2009-06-22 at 13:44 -0400, Denys Dmytriyenko wrote:
> Having current directory (either '.' or empty string) in PATH is considered
> dangerous for root.

Agreed, having an empty element in there is a bad idea.  I don't think
any mainstream distribution does that.

FWIW, the equivalent from Debian's /etc/profile is:

 if [ "`id -u`" -eq 0 ]; then
   PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
 else
  PATH="/usr/local/bin:/usr/bin:/bin:/usr/games"
 fi

p.




