Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kristoffer.ericson@gmail.com>) id 1PndgU-00023h-0k
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Feb 2011 22:04:14 +0100
Received: by fxm17 with SMTP id 17so1850672fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Feb 2011 13:03:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:cc:subject:message-id:reply-to
	:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=i2Qq1JWArlzx3tKYmEfXurpxZOfLEQiOyyLaBjcILiI=;
	b=A6V/wPF8uqRcmB/RPQGTR5D0bTtlKJv4Md3nP1o8YYw2gPVKFFXXKMuBRG8SLS63AP
	0QVMjznYZHpXquPmocEpz+cNABwMpNf6cUe6oSegCc/+hLR07h0bnNyHPyInNDvLvSnf
	tdfIbvqN9MMqxmj9DDCFqt4/G2h8zu2tz42Zw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=gTpYPgDZD59cCrzMy7ODiPvUBNBIJGcb7mMQi1uxcPA6NNOSyvsMCQV7Li8oaZ7Ss9
	xDA9+a0hTQhiEezSbiwtobCiYzW+7YoDFixcqEU2TCdVhlL0gwjWQLlSL/DVHD0w09Hh
	OPaU+E+2kBTqUvpSYv6Q12Y5hXw57u/5UDYnw=
Received: by 10.223.110.77 with SMTP id m13mr7090540fap.86.1297371789276;
	Thu, 10 Feb 2011 13:03:09 -0800 (PST)
Received: from localhost (c-5fdbe555.010-30-6c6b7012.cust.bredbandsbolaget.se
	[85.229.219.95])
	by mx.google.com with ESMTPS id j12sm30755fax.9.2011.02.10.13.03.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 10 Feb 2011 13:03:07 -0800 (PST)
Date: Thu, 10 Feb 2011 23:05:06 +0100
From: Kristoffer Ericson <kristoffer.ericson@gmail.com>
To: Filip Zyzniewski <filip.zyzniewski@gmail.com>
Message-ID: <20110210220506.GA11237@BoggieMan>
References: <1297282989-7580-1-git-send-email-filip.zyzniewski@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1297282989-7580-1-git-send-email-filip.zyzniewski@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] base-files: update fstab for jornada7xx
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
X-List-Received-Date: Thu, 10 Feb 2011 21:04:14 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Wed, Feb 09, 2011 at 09:23:09PM +0100, Filip Zyzniewski wrote:
> We use the scsi subsystem for PCMCIA ATA access, so device files are
> /dev/sda*, not /dev/hda*.
> See recipes/linux/linux-jlime-jornada7xx-2.6.34+git/defconf_jlime:702.

Applied, Thx

> 
> Signed-off-by: Filip Zyzniewski <filip.zyzniewski@gmail.com>
> ---
>  recipes/base-files/base-files/jornada7xx/fstab |    6 +++---
>  1 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/recipes/base-files/base-files/jornada7xx/fstab b/recipes/base-files/base-files/jornada7xx/fstab
> index f0c23d9..a06a1b6 100644
> --- a/recipes/base-files/base-files/jornada7xx/fstab
> +++ b/recipes/base-files/base-files/jornada7xx/fstab
> @@ -1,7 +1,7 @@
>  proc		/proc	proc	defaults	        0  0
> -/dev/hda2       /       ext2    defaults                0  0
> -/dev/hda1	/mnt/cf	auto	defaults,sync,noauto	0  0
> -/dev/hda3       none    swap    sw                      0  0
> +/dev/sda2       /       ext2    defaults                0  0
> +/dev/sda1	/mnt/cf	auto	defaults,sync,noauto	0  0
> +/dev/sda3       none    swap    sw                      0  0
>  tmpfs		/var/volatiles	tmpfs	defaults	        0  0
>  tmpfs		/mnt/ram	tmpfs	defaults	0  0
>  tmpfs                /dev/shm             tmpfs      mode=0777             0  0
> -- 
> 1.7.1


