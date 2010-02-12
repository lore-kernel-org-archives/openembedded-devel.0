Received: from mail-iw0-f182.google.com ([209.85.223.182])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Ng1y3-0004vc-MP
	for openembedded-devel@lists.openembedded.org;
	Fri, 12 Feb 2010 21:18:26 +0100
Received: by iwn12 with SMTP id 12so3013934iwn.26
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Feb 2010 12:15:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=eSpHQZ/F2ahVaw87xLSaYkRC0R/OKnu+KgxaiOH1wpA=;
	b=fWCeszF8L1tjv7gNSPIxgaFhqcFw+3A3l+9q1yO4wuEN5htuC8CG+phU2mWUuEA+5g
	RuvgT0VBeUvpR/o/0nfv6eQC86QaUxmiBRWCsER+DiKfNdWraEm55lqh5x2FLKCvI78Q
	/Fbu5BrsZMv8maZVGSRnwCIt0p8I6x7EdgKMU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=F1tppl3ZdttSf/AD0fyQ3El/hLCG5zFC6Qi47bsW+q/oguIZJTWvEXmiXHEgz4BsKh
	O3x+3LUqUKdPEIWK0ClbV7ucCPQUls2CBdri1HX0Tu2nCT3ar4Jmo/TB92fF3oqTnYHy
	MbAaKd29iA5MgOUFVcO3YfDl5QJm8ZBIogE8o=
MIME-Version: 1.0
Received: by 10.231.146.74 with SMTP id g10mr2998196ibv.98.1266005747493; Fri, 
	12 Feb 2010 12:15:47 -0800 (PST)
In-Reply-To: <1265986283-28972-1-git-send-email-marcin@juszkiewicz.com.pl>
References: <1265986283-28972-1-git-send-email-marcin@juszkiewicz.com.pl>
Date: Fri, 12 Feb 2010 12:15:47 -0800
Message-ID: <19c1b8a91002121215i747bfc79h7a209241dc928996@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.223.182
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Patches to solve libblkid/libuuid version problems
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
X-List-Received-Date: Fri, 12 Feb 2010 20:18:27 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Feb 12, 2010 at 6:51 AM, Marcin Juszkiewicz
<marcin@juszkiewicz.com.pl> wrote:
> There are two recipes which provides libblkid, libuuid and fsck:
> e2fsprogs (older 1.x) and util-linux-ng (newer 2.x).

May be the versions of e2fsprogs and util-linux-ng  should be paired.
like version x of util-linux-ng goes with version y of e2fsprogs

>
> More and more applications/libraries require 2.x versions but in OE it
> depends on build order if both are built.
>
> And as I got hit by problem I decided to clean it a bit. Resulting
> patches are result. They are not perfect but should help. I did not
> tested on any device yet - only did Angstrom build.
>
> Review, comment etc.
>
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


