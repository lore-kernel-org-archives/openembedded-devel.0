Received: from mail-fx0-f216.google.com ([209.85.220.216])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1NNRfM-0005Zx-I9
	for openembedded-devel@lists.openembedded.org;
	Wed, 23 Dec 2009 14:54:19 +0100
Received: by fxm8 with SMTP id 8so6737336fxm.27
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Dec 2009 05:52:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=jKYnAko3VSZ7n49Z47tUfYt67zz6GdSBBw21wtZoU+4=;
	b=k5mLIg5yup0yeTkwOWnLqlDkk1LtJk7Wqv7j5xB/1yG6qYsHg5TxwCZHCVTOz3GNP8
	yn+/TaTRcc/pBjVKBqyjUShWchWk0nrDOJwclIuhsfb9pUraqwACnBGHzu3QyFYpntDJ
	VDZ1IGI5i/FGgsKMf9STXxhiazYswd0X+2/Og=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=RN3IAbDhWf4bAGhKDI/EJTiS9N3oeB3pNR/cMWCOhMxeEJqzSKqIO/uKzUln3LxdX9
	vg9CDeIzbv39ANdiOuQV4ZRX+CdOS+hcQDCBcb+Db5o5dBj933Nm6W1xIHSDMldm3nCs
	jtWUxe/g/q5Ps2nDUlMepvOE9mqi5zFKOzZNw=
MIME-Version: 1.0
Received: by 10.239.139.39 with SMTP id r39mr1153035hbr.116.1261576343847; 
	Wed, 23 Dec 2009 05:52:23 -0800 (PST)
In-Reply-To: <1261448680-12334-1-git-send-email-camelguo@gmail.com>
References: <1261448680-12334-1-git-send-email-camelguo@gmail.com>
Date: Wed, 23 Dec 2009 14:52:23 +0100
Message-ID: <c384c5ea0912230552o1d62883bte754fcc5da4b8d69@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.220.216
X-SA-Exim-Mail-From: leon.woestenberg@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] Modify distro/minimal.conf to use glibc and add an eglibc-based minimal distribution
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
X-List-Received-Date: Wed, 23 Dec 2009 13:54:19 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello,

On Tue, Dec 22, 2009 at 3:24 AM, Guo Hongruan <camelguo@gmail.com> wrote:
> 1. conf/distro/minimal-eglibc.conf: add minimal distribution based on eglibc.
> 2. conf/distro/minimal.conf: use glibc instead of eglibc

NAK.

OE is not supposed to have a different distribution file name for each
for the variants.

Regards,
-- 
Leon


