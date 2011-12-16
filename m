Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Rbfsm-0000V4-16
	for openembedded-devel@lists.openembedded.org;
	Fri, 16 Dec 2011 23:04:00 +0100
Received: by iakh37 with SMTP id h37so1527365iak.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Dec 2011 13:57:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:mail-followup-to:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=0V54jyA65ZHIzzj2IyvZxsknVbCwtpVYbuq1m2KK7AE=;
	b=jmAUkVZ5hLmJ0Ch9YgHXo/chyBbTyEc2A63S8PALPTQZlNHpIiE9zA7Yed56M80l4+
	ho6q+B+IaEHp1IFDkEECCIHcvHEszVVwjheH7O9+OfwVXxlYQGw8Ag++pqJhncZyHXLi
	WdCxwzoDMNc5CW2ZdTwKv2lg94l+zzfzlZlpY=
Received: by 10.50.214.2 with SMTP id nw2mr10962699igc.54.1324072619264;
	Fri, 16 Dec 2011 13:56:59 -0800 (PST)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net. [99.57.141.118])
	by mx.google.com with ESMTPS id rc7sm4549028igb.0.2011.12.16.13.56.57
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 16 Dec 2011 13:56:58 -0800 (PST)
Date: Fri, 16 Dec 2011 13:57:14 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20111216215714.GD28832@sakrah.homelinux.org>
Mail-Followup-To: openembedded-devel@lists.openembedded.org
References: <1324003173-13994-1-git-send-email-b19537@freescale.com>
	<1324003173-13994-6-git-send-email-b19537@freescale.com>
MIME-Version: 1.0
In-Reply-To: <1324003173-13994-6-git-send-email-b19537@freescale.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH meta-oe 6/9] ptpd: add
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
X-List-Received-Date: Fri, 16 Dec 2011 22:04:00 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (16/12/11 10:39), b19537@freescale.com wrote:
> From: Zhenhua Luo <b19537@freescale.com>
> 
>     Precision Time Protocol (PTP) as defined by the IEEE 1588 standard.
> 
> Signed-off-by: Zhenhua Luo <b19537@freescale.com>
> ---
>  .../ptpd/ptpd-1.0.0/add-limit-h.patch              |   26 ++++++++++++++++++++
>  meta-oe/recipes-connectivity/ptpd/ptpd_1.0.0.bb    |   21 ++++++++++++++++
>  2 files changed, 47 insertions(+), 0 deletions(-)
>  create mode 100644 meta-oe/recipes-connectivity/ptpd/ptpd-1.0.0/add-limit-h.patch
>  create mode 100644 meta-oe/recipes-connectivity/ptpd/ptpd_1.0.0.bb
> 
> diff --git a/meta-oe/recipes-connectivity/ptpd/ptpd-1.0.0/add-limit-h.patch b/meta-oe/recipes-connectivity/ptpd/ptpd-1.0.0/add-limit-h.patch
> new file mode 100644
> index 0000000..8ed3f2f
> --- /dev/null
> +++ b/meta-oe/recipes-connectivity/ptpd/ptpd-1.0.0/add-limit-h.patch
> @@ -0,0 +1,26 @@
> +ptpd: fix ftbfs by including limits.h so MAX_INT defined
                                            ^^^^^^^
should be INT_MAX



