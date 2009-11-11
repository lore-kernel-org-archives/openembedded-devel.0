Received: from [74.125.78.147] (helo=ey-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dp@xora.org.uk>) id 1N8I1b-0001wZ-Jf
	for openembedded-devel@lists.openembedded.org;
	Wed, 11 Nov 2009 19:34:38 +0100
Received: by ey-out-1920.google.com with SMTP id 3so927526eyh.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Nov 2009 10:33:19 -0800 (PST)
Received: by 10.213.23.87 with SMTP id q23mr1016994ebb.75.1257953869219;
	Wed, 11 Nov 2009 07:37:49 -0800 (PST)
Received: from xora-eee (www.xora.org.uk [80.68.91.202])
	by mx.google.com with ESMTPS id 10sm566678eyd.47.2009.11.11.07.37.47
	(version=SSLv3 cipher=RC4-MD5); Wed, 11 Nov 2009 07:37:48 -0800 (PST)
Date: Wed, 11 Nov 2009 15:37:45 +0000
From: Graeme Gregory <dp@xora.org.uk>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20091111153745.GA2533@xora-eee>
References: <1257953228-2353-1-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1257953228-2353-1-git-send-email-Martin.Jansa@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 74.125.78.147
X-SA-Exim-Mail-From: dp@xora.org.uk
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] bitbake.conf: SRCPV always upgradeable paths for git recipes
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
X-List-Received-Date: Wed, 11 Nov 2009 18:34:38 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Signed-off-by: Graeme Gregory <dp@xora.org.uk>

For inclusion in .dev

Graeme

On Wed, Nov 11, 2009 at 04:27:08PM +0100, Martin Jansa wrote:
> * Holger Hans Peter Freyther <zecke@openmoko.org> did for the OM git
>   tree that was never merged back into OE.
> * Taken from xora/angstrom-srcpv branch where it rot for long enough
> ---
>  conf/bitbake.conf |    3 ++-
>  1 files changed, 2 insertions(+), 1 deletions(-)
> 
> diff --git a/conf/bitbake.conf b/conf/bitbake.conf
> index 39a1f27..7c0defe 100644
> --- a/conf/bitbake.conf
> +++ b/conf/bitbake.conf
> @@ -570,7 +570,8 @@ UPDATECOMMAND_cvs = "/usr/bin/env 'PATH=${PATH}' cvs -d${CVSROOT} update -d -P $
>  UPDATECOMMAND_svn = "/usr/bin/env svn update ${SVNCOOPTS}"
>  SRCDATE = "${DATE}"
>  SRCREV = "1"
> -AUTOREV = "${@bb.fetch.get_srcrev(d)}"
> +SRCPV = "${@bb.fetch.get_srcrev(d)}"
> +AUTOREV = "${SRCPV}"
>  
>  SRC_URI = "file://${FILE}"
>  
> -- 
> 1.6.5.2
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


