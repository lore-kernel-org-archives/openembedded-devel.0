Received: from [202.37.96.11] (helo=gatekeeper.tait.co.nz)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <douglas.royds@tait.co.nz>) id 1MJLcY-0008MP-MM
	for openembedded-devel@lists.openembedded.org;
	Wed, 24 Jun 2009 08:06:11 +0200
Received: from gatekeeper.tait.co.nz (localhost.localdomain [127.0.0.1])
	by localhost.tait.co.nz (Postfix) with ESMTP id 2E75846752
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Jun 2009 17:55:01 +1200 (NZST)
Received: from sunstrike.tait.co.nz (sunstrike [172.25.40.92])by 
	gatekeeper.tait.co.nz (Postfix) with ESMTP id 1DB0846749for 
	<openembedded-devel@lists.openembedded.org>; Wed, 24 Jun 2009 17:54:58 
	+1200 (NZST)
Received: from conversion-daemon.sunstrike.tait.co.nz by 
	sunstrike.tait.co.nz(Sun Java System Messaging Server 6.1 (built Apr 28
	2004))id <0KLQ00E019KEJY00@sunstrike.tait.co.nz>(original mail from 
	douglas.royds@tait.co.nz)for openembedded-devel@lists.openembedded.org; 
	Wed,24 Jun 2009 17:54:58 +1200 (NZST)
Received: from [172.25.114.21] by sunstrike.tait.co.nz(Sun Java System 
	Messaging Server 6.1 (built Apr 28 2004))with ESMTP id 
	<0KLQ00EU6B3M1G10@sunstrike.tait.co.nz> 
	foropenembedded-devel@lists.openembedded.org; Wed,24 Jun 2009 17:54:58 
	+1200 (NZST)
Date: Wed, 24 Jun 2009 17:56:27 +1200
From: Douglas Royds <douglas.royds@tait.co.nz>
In-reply-to: <1245692685-21173-1-git-send-email-denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <4A41C00B.3030409@tait.co.nz>
MIME-version: 1.0
References: <1245692685-21173-1-git-send-email-denis@denix.org>
User-Agent: Thunderbird 2.0.0.21 (X11/20090409)
X-imss-version: 2.054
X-imss-result: Passed
X-imss-approveListMatch: *@tait.co.nz
Subject: Re: RFC: [PATCH] /etc/profile: stricter root PATH -requireabsolute pathname for bins in cwd
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
X-List-Received-Date: Wed, 24 Jun 2009 06:06:11 -0000
Content-type: text/plain;
	format=flowed;
	charset=ISO-8859-1
Content-transfer-encoding: 7BIT

Should this find its way back into Stable?


Denys Dmytriyenko wrote:
> Having current directory (either '.' or empty string) in PATH is considered
> dangerous for root.
>
> Signed-off-by: Denys Dmytriyenko <denis@denix.org>
> ---
>  recipes/base-files/base-files/profile |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/recipes/base-files/base-files/profile b/recipes/base-files/base-files/profile
> index 5797535..b5ce69d 100644
> --- a/recipes/base-files/base-files/profile
> +++ b/recipes/base-files/base-files/profile
> @@ -12,7 +12,7 @@ if [ ! -e /etc/localtime ]; then
>  fi
>  
>  if [ "`id -u`" -eq 0 ]; then
> -   PATH=$PATH:/usr/local/sbin:/usr/sbin:/sbin:
> +   PATH=$PATH:/usr/local/sbin:/usr/sbin:/sbin
>  fi
>  if [ "$PS1" ]; then
>  # works for bash and ash (no other shells known to be in use here)
>   


=======================================================================
This email, including any attachments, is only for the intended
addressee.  It is subject to copyright, is confidential and may be
the subject of legal or other privilege, none of which is waived or
lost by reason of this transmission.
If the receiver is not the intended addressee, please accept our
apologies, notify us by return, delete all copies and perform no
other act on the email.
Unfortunately, we cannot warrant that the email has not been
 altered or corrupted during transmission.
=======================================================================



