Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1NXuON-0003dS-EH
	for openembedded-devel@openembedded.org; Thu, 21 Jan 2010 11:36:02 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	o0LATM40024083; Thu, 21 Jan 2010 10:29:22 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id q0rO2r5uic-W; Thu, 21 Jan 2010 10:29:22 +0000 (GMT)
Received: from [192.168.1.3] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	o0LATGLY024077
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
	Thu, 21 Jan 2010 10:29:18 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: Martin Jansa <martin.jansa@gmail.com>
In-Reply-To: <1252881838-19764-1-git-send-email-Martin.Jansa@gmail.com>
References: <1252881838-19764-1-git-send-email-Martin.Jansa@gmail.com>
Date: Thu, 21 Jan 2010 10:34:13 +0000
Message-Id: <1264070053.11679.12.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.3.1 
X-SA-Exim-Connect-IP: 93.97.175.187
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: openembedded-devel@openembedded.org, bitbake-dev@lists.berlios.de
Subject: Re: [Bitbake-dev] [PATCH] Allow % as wildcard in the end of	PREFERRED_VERSION_pkg
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
X-List-Received-Date: Thu, 21 Jan 2010 10:36:02 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, 2009-09-14 at 00:43 +0200, Martin Jansa wrote:
> ---
>  lib/bb/providers.py |   13 ++++++++++++-
>  1 files changed, 12 insertions(+), 1 deletions(-)
> 
> diff --git a/lib/bb/providers.py b/lib/bb/providers.py
> index 8970fb3..feaee52 100644
> --- a/lib/bb/providers.py
> +++ b/lib/bb/providers.py
> @@ -63,7 +63,18 @@ def sortPriorities(pn, dataCache, pkg_pn = None):
>  
>      return tmp_pn
>  
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
>  def findPreferredProvider(pn, cfgData, dataCache, pkg_pn = None, item = None):
>      """
>      Find the first provider in pkg_pn with a PREFERRED_VERSION set.
> @@ -96,7 +107,7 @@ def findPreferredProvider(pn, cfgData, dataCache, pkg_pn = None, item = None):
>          for file_set in pkg_pn:
>              for f in file_set:
>                  pe,pv,pr = dataCache.pkg_pepvpr[f]
> -                if preferred_v == pv and (preferred_r == pr or preferred_r == None) and (preferred_e == pe or preferred_e == None):
> +                if isPreferredVersion(pe,pv,pr,preferred_e,preferred_v,preferred_r):
>                      preferred_file = f
>                      preferred_ver = (pe, pv, pr)
>                      break

This has been applied to bitbake master, thanks!

Richard



