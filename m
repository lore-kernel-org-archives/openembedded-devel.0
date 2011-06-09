Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QUnzn-0006aN-4s
	for openembedded-devel@lists.openembedded.org;
	Fri, 10 Jun 2011 00:46:35 +0200
Received: by pwj9 with SMTP id 9so1022387pwj.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 Jun 2011 15:43:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=Iw7GIk/akYEvJ7QZo3GBKVk09Uypj0hwdrd1Gi741j8=;
	b=ZfSCbOb4CU6Q73N06q2Ps9h0DceGaqCI2o5VoaQSG++UUvOtjHw+Ya8b7tFoOT44SV
	GgBWfjaHigv8nNsSbpkg4neQYSncrVarypdXsW2w6lRSzrw4yxmx0dILeRk7yRbg9uuN
	yqmWbq/u7VjZoAbXCOVp4azejct/IXmJ4xc/8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	b=YHqczQVnGaWWGz6CL3/q3OAPrE9ZmRU2s/GXOY51rDFXsS++lzNGFiZK0UU2SKp1K5
	2g9AlwxwThTSXwgwN2B8uNmy/RiwnqUdGev1zJJbjC2BBJHbx/DTAjgcqK09pDz2qCVL
	AVEdwNZrBGGZRCuLLLE+8PaWsxRLzyU0xCFtg=
Received: by 10.143.68.18 with SMTP id v18mr225633wfk.340.1307659394461;
	Thu, 09 Jun 2011 15:43:14 -0700 (PDT)
Received: from [192.168.1.70] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id x8sm2164715wfx.19.2011.06.09.15.43.12
	(version=SSLv3 cipher=OTHER); Thu, 09 Jun 2011 15:43:13 -0700 (PDT)
Message-ID: <4DF14C7E.7000701@gmail.com>
Date: Thu, 09 Jun 2011 15:43:10 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110516 Thunderbird/3.1.10
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4DF0C472.4030608@dresearch-fe.de>
In-Reply-To: <4DF0C472.4030608@dresearch-fe.de>
Subject: Re: Distros supporting older kernels?
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
X-List-Received-Date: Thu, 09 Jun 2011 22:46:35 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06/09/2011 06:02 AM, Steffen Sledz wrote:
> Hi Distro Maintainers,
>
> as you could read in earlier messages of mine, we're forced to use an
> older kernel version (2.6.24) for our hardware. This brings a lot of
> problems as you can imagine (e.g. we're also bound to udev-141).
>
> Until now we've used angstrom-2008.1 with some own patches according to
> the linux-libc-headers and udev versions for our hardware which were
> reasonably not accepted by the Angstrom maintainers (see discussions [1]
> or [2]).
>
> In there current situation (angstrom-2008.1 is deprecated, the new layer
> concept will come up) we're looking for a new, better, less hacky solution.
>
> My first question therefor is if there are any distros explicitely
> supporting older kernels (pre 2.6.27) yet? Or are willing to work on it?
>

I guess a machine layer on top of oe-core could be something you can 
work out and add/override needed recipes in this layer.

> [1] <http://thread.gmane.org/gmane.comp.handhelds.openembedded/32375>
> [2] <http://thread.gmane.org/gmane.comp.handhelds.openembedded/42628>
>
> Thx,
> Steffen
>
> PS: Does anybody know a good overview which Linux Kernel API changes
> were made in which kernel version?
>



