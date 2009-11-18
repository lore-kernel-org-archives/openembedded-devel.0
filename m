Received: from mail-pz0-f192.google.com ([209.85.222.192])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1NAtRv-0001UV-Hf
	for openembedded-devel@lists.openembedded.org;
	Wed, 18 Nov 2009 23:56:34 +0100
Received: by pzk30 with SMTP id 30so1090516pzk.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Nov 2009 14:55:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=OZ88ZIoVNMr+baCyfVUFRRDUNAQbglHQZeqP/x+OocQ=;
	b=g6r3I6U5icxYkykNxShgvVA7u4xmOU8A0rWAjMXXnrsNy7skxy12ydv5qQ0RosJe1a
	PaXQPyVILaan2rr8SqanCeUPOuiK4fwr9dH/D4Xuwz6Rq+x+uiXUVekt7OUOZz++Sm34
	seKCwXJ2x/GeEA30sRNd9fJetWR5MAzmnQaPg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=iCkYuk5DPuRPnznq2pYrPxwOHNCE9qA2AOXYJHn/0aHGlSxU2CPShOfkZcWDdbS6FN
	+K23la+js1a9T7J4UUtCgALFD6cuAae8q87cd9fBT0Fu4mCe723iSIIeSrJdUn8Blgl3
	rmgYp8t+EogQSkIug3CTapB1xRb7MxdezOXKA=
MIME-Version: 1.0
Received: by 10.142.249.2 with SMTP id w2mr1336126wfh.198.1258584906531; Wed, 
	18 Nov 2009 14:55:06 -0800 (PST)
In-Reply-To: <1258582348.25369.689.camel@lenovo.internal.reciva.com>
References: <4B03CBF0.5010000@SSpaeth.de> <4B03CDD9.1010202@SSpaeth.de>
	<6ec4247d0911181320o1aae5e21o2f6a8038daff6173@mail.gmail.com>
	<1258582348.25369.689.camel@lenovo.internal.reciva.com>
Date: Thu, 19 Nov 2009 09:25:06 +1030
Message-ID: <6ec4247d0911181455g6399eeeci38db4e9b727886d@mail.gmail.com>
From: Graham Gower <graham.gower@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.222.192
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: BAD_RECOMMENDATIONS is broken (opkg issue)
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
X-List-Received-Date: Wed, 18 Nov 2009 22:56:34 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2009/11/19 Phil Blundell <philb@gnu.org>:
>
> It's meant to be handled by this chunk of code, and I'm fairly sure that
> this used to work reliably. =A0Has that part of opkg changed recently?

Nope, no changes there. And no particularly invasive changes up to r240.

I have some minor worries that
http://code.google.com/p/opkg/source/detail?r=3D328 will have some non
obvious fallout. (Obviously not the issue here though)

-Graham


