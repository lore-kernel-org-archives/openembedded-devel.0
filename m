Received: from [209.85.218.165] (helo=mail-bw0-f165.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1LhVyO-0007Xe-Le
	for openembedded-devel@lists.openembedded.org;
	Wed, 11 Mar 2009 22:28:22 +0100
Received: by bwz9 with SMTP id 9so168520bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Mar 2009 14:28:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=NyO+bDZx9PF7+iXljyuI3uP3EZlEjkFBu183ySpugLU=;
	b=xwJpQCtlPtx/W6Ro6U0zWZC2dZSU39alVIM4pCB4p5bDH5vMOjY1ilLZLon6RjiOOh
	lQc6zHmI/jzrjXlILPzz94OfDnbOc+6cMwwElbEalzxoSrBMsRG1e6nzgkM6Mc9niAo2
	UVBrfmtnpApyoRvRAzP2rln5rV3TYwYveORdU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=FKFy0Mf283tNet2ZAcEMJ7JUnbEKmLw8HSWqcKxlSwXt50P5E4Smfhrv1w+9i76aNU
	vjgQxwb/phiEZhc7QkptFDIgFMbuI3ypE3GgJltgoHWlMzjIlOPqc0FFVSslemjLPhrq
	b/nRnMXvjO6Xi/hCBHbX5e9pMXBzZp6N+VlJI=
MIME-Version: 1.0
Received: by 10.223.116.205 with SMTP id n13mr6759569faq.103.1236806889857; 
	Wed, 11 Mar 2009 14:28:09 -0700 (PDT)
In-Reply-To: <20090311030509.GA10085@denix.org>
References: <1236463653.25861.321.camel@cheeto.emacinc.com>
	<200903071735.37618.raj.khem@gmail.com>
	<1236637089.29394.59.camel@cheeto.emacinc.com>
	<19c1b8a90903091535u4dd8982blc884a508cc35e8dc@mail.gmail.com>
	<1236699601.29394.99.camel@cheeto.emacinc.com>
	<19c1b8a90903101035t52ba7a0ble2f49e324bc20ba@mail.gmail.com>
	<20090311030509.GA10085@denix.org>
Date: Wed, 11 Mar 2009 22:28:09 +0100
Message-ID: <c384c5ea0903111428y4ffee26dud7662f1f614074ac@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: failure on gcc-cross-initial-4.2.4-r5 for i686
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
X-List-Received-Date: Wed, 11 Mar 2009 21:28:25 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Denys,

On Wed, Mar 11, 2009 at 4:05 AM, Denys Dmytriyenko <denis@denix.org> wrote:
>
> i686-linux holds my native packages
> i686-angstrom-linux holds my target/cross packages, including gcc-cross
> i686-generic-angstrom-linux holds machine-specific target packages
>
Are that your overlay directory names?


Then they have nothing to do with the actual problem AFAIK.

It's probably the target triplet name that makes the difference, like
Khem suggests.


Regards,
-- 
Leon


