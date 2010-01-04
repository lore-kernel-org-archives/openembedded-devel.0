Received: from mail-ew0-f212.google.com ([209.85.219.212])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1NRsSJ-0004q4-NZ
	for openembedded-devel@lists.openembedded.org;
	Mon, 04 Jan 2010 20:19:10 +0100
Received: by ewy4 with SMTP id 4so16557813ewy.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Jan 2010 11:17:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=KsHCefaH09Ca714d72rqiExBijSvVqdao3DxcFhzNmM=;
	b=uRr0AdDNrSDVavmrX3S193JUYkz1VXHOTIPCgRNn+UfddXG4ziF0AhPDoUJQXbaQoA
	qeg4sUKo+n3KPfAqQ6KpqqzPzxtQ/OQJgQslxxgg0Obh5PQGCva5wK+xoE4QC9DLkbly
	8+h6+8PM5a/QgasqmFsMKesq4VIHt4UANSCSI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=NP79IaWX3Fh1luEenS9QuYcHCJ7kkjae/czuE2E1VvBvaCKtiYR3unAO6nXpsvRBmF
	ovoHGmx1+ZT/LCXXctvm6Aow3105Pc3t4bOBWuzyfVTT5nsWTg9NqswfRNMiG+5AFu8y
	uGGfZiZvw1MALu925kS8c83rC2fUer/+hDM6E=
Received: by 10.213.107.8 with SMTP id z8mr314569ebo.32.1262632624928;
	Mon, 04 Jan 2010 11:17:04 -0800 (PST)
Received: from gmail.com ([72.14.240.163])
	by mx.google.com with ESMTPS id 23sm37524856eya.19.2010.01.04.11.17.02
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 04 Jan 2010 11:17:04 -0800 (PST)
Date: Mon, 4 Jan 2010 11:17:28 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100104191728.GE4326@gmail.com>
References: <op.u5yhl8usmn1qzu@guohr-laptop-ubuntu>
MIME-Version: 1.0
In-Reply-To: <op.u5yhl8usmn1qzu@guohr-laptop-ubuntu>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.219.212
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: compiling glibc-2.6.1 failed due to undefined reference to `_begin
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
X-List-Received-Date: Mon, 04 Jan 2010 19:19:10 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (03/01/10 20:14), Guo Hongruan wrote:
> Hi guys:
>    There is a building failure of org.openembedded.dev. I think it
> may be a bug of openembedded. Have anyone met the same bug? Or have
> some idea about it?

I guess you are using latest binutils. There has been changes in ld
which surfaced this issue. So either you could switch back to using 
older binutils like 2.18 or something. Or you could also port the patch
recipes/glibc/glibc-2.9/glibc-2.9-use-_begin.patch

-Khem


