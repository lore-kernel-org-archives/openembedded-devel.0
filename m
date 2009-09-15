Received: from [82.71.203.194] (helo=crown.reciva.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philb@gnu.org>) id 1MnT94-000484-Ra
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 Sep 2009 10:12:17 +0200
Received: from [81.170.68.179] (helo=[192.168.2.154])
	by crown.reciva.com with esmtpsa (TLS-1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <philb@gnu.org>)
	id 1MnT8Y-00013Q-Ga; Tue, 15 Sep 2009 09:11:43 +0100
From: Phil Blundell <philb@gnu.org>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1252881838-19764-1-git-send-email-Martin.Jansa@gmail.com>
References: <1252881838-19764-1-git-send-email-Martin.Jansa@gmail.com>
Date: Tue, 15 Sep 2009 09:11:40 +0100
Message-Id: <1253002300.4490.1103.camel@lenovo.internal.reciva.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.3 
X-Broken-Reverse-DNS: no host name found for IP address 81.170.68.179
X-SA-Exim-Connect-IP: 82.71.203.194
X-SA-Exim-Mail-From: philb@gnu.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: bitbake-dev@lists.berlios.de
Subject: Re: [PATCH] Allow % as wildcard in the end of PREFERRED_VERSION_pkg
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
X-List-Received-Date: Tue, 15 Sep 2009 08:12:18 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, 2009-09-14 at 00:43 +0200, Martin Jansa wrote:
> +def isPreferredVersion(pe, pv, pr, preferred_e, preferred_v, preferred_r):
> +    """
> +    Check if the version pe,pv,pr is the preferred one.
> +    If there is preferred version defined and ends with '%', then pv has to start with that version after removing the '%' in the end,
> +    """
>  
> +    if (pv == preferred_v or (preferred_v != None and preferred_v.endswith('%') and pv.startswith(preferred_v[:len(preferred_v)-1]))):
> +        if (pr == preferred_r or preferred_r == None):
> +            if (pe == preferred_e or preferred_e == None):
> +                return true
> +    return false
> +    

I'm not totally comfortable that this patch is semantically well-formed.
If you start allowing wildcards then the idea of "the preferred version"
becomes somewhat ill-defined since, obviously, the wildcard might match
any number of files.  I'm not quite sure what the problem is that you
are trying to solve, but my initial reaction is that (whatever the
problem is) it would probably be better solved another way.

p.



