Received: from [74.125.92.144] (helo=qw-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1Me9jh-0004Y3-BJ
	for openembedded-devel@lists.openembedded.org;
	Thu, 20 Aug 2009 17:39:33 +0200
Received: by qw-out-1920.google.com with SMTP id 4so1630028qwk.36
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Aug 2009 08:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:from:date:x-google-sender-auth:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=CrM6yb6t/OOhLaMQ3M3Yr10u2NXo/fZGG5sn2LU0dNM=;
	b=rRFJ9b+AHTcx4Z6V8nft63XDX6H9hMDdImo6jxmQIQJIFEgha2fSEbbUJFcLEV+uWw
	OSct+vslWGFmUtSYyiBO0taKmiT+2bwKc7PeOcEwyYQlrxW4/Msva3RkYdxzVEzwI07G
	0tM3IX/xtiYte6Z6qXdHZke7V/hzgogkynr+s=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type
	:content-transfer-encoding;
	b=uZQeaZ8BWYtdHkWIb5ylMlmSYsT3/6JJWK5PeUAXm9B5dwpiJ3Ym/9cMSyqT9n7oME
	YN8JWESlyY10wQb/9g8UHUjuKRu/VWVDGzxmoin8gedfKghOIcIZgmthYkvUzHijgfz8
	UOOjiM592U37XrXLtV5FC1LcuQttapTQfK7sQ=
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.118.6 with SMTP id t6mr3271051qcq.39.1250781735031; Thu, 
	20 Aug 2009 08:22:15 -0700 (PDT)
In-Reply-To: <Pine.LNX.4.64.0908200802190.3621@juice.ott.cti.com>
References: <1250738680-20274-1-git-send-email-clarson@mvista.com> 
	<Pine.LNX.4.64.0908200802190.3621@juice.ott.cti.com>
From: Chris Larson <clarson@kergoth.com>
Date: Thu, 20 Aug 2009 08:21:54 -0700
X-Google-Sender-Auth: 55bb7d5a1c9ae32b
Message-ID: <b6ebd0a50908200821r1cff2f42q4be6e8064abd76db@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] cross.bbclass: keep TARGET_SYS & TARGET_PREFIX independent.
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
X-List-Received-Date: Thu, 20 Aug 2009 15:39:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

> Can you explain for a crosscompile noob -- when would TARGET_PREFIX !=
> ${TARGET_SYS}-? I understand they're separate variables so they COULD be
> different; just wondering why someone would set them that way.

The only case that comes to mind is when using external toolchains.
They aren't all so kind as to be arch-vendor-os-<foo>.
-- 
Chris Larson
clarson at kergoth dot com
clarson at mvista dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Software Engineer
MontaVista Software, Inc.


