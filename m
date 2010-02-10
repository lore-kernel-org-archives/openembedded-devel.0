Received: from mail-fx0-f225.google.com ([209.85.220.225])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rep.dot.nop@gmail.com>) id 1NfLTx-0005Va-AY
	for openembedded-devel@lists.openembedded.org;
	Wed, 10 Feb 2010 23:56:32 +0100
Received: by fxm25 with SMTP id 25so556588fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Feb 2010 14:53:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=DU508oo1g0Hxaa+MkiZH1wipdwcEIezA4o17REyNacQ=;
	b=lJWYcp/FRSsKwaXnE9e7Ypbykr3A36iJ3NkY2ayUGK1tWNeJH7kBm0JQ4NQwSoizOB
	w5gXAxzIbpcFcNehQVJiajIFCFZ+us86qPwrzmpzBiaZHRQ5I3sPGK9K5vy/PrECGoE7
	YzQ3Z69jkm6OuHAg88B8X6qhl/ID90Q1ZvQV0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=WePdkn4N3fE/VdvGRlf/NGs8X3f7XaJ4FZEVNN4u0TH6+65RZUK53XpHqMUfkXDfHc
	0bMozN8Rg6fs6YAOk63Bds2iFBufWae3RteXcFYHt7lwq7boFI7j783VEsYnAUr5WGpG
	Zq588w/9IPIVm44TIpg/GLXDNmiY4BjzGNm+4=
Received: by 10.223.60.138 with SMTP id p10mr1156441fah.32.1265842435435;
	Wed, 10 Feb 2010 14:53:55 -0800 (PST)
Received: from s42.loc ([84.119.103.202])
	by mx.google.com with ESMTPS id 26sm2820471fks.37.2010.02.10.14.53.54
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 10 Feb 2010 14:53:54 -0800 (PST)
Received: from cow by s42.loc with local (Exim 4.71)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1NfLTa-0006sW-4o; Wed, 10 Feb 2010 23:56:06 +0100
Date: Wed, 10 Feb 2010 23:56:06 +0100
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100210225606.GG10632@mx.loc>
References: <1265838350-24498-1-git-send-email-rep.dot.nop@gmail.com>
	<hkvbfq$jo3$1@ger.gmane.org>
MIME-Version: 1.0
In-Reply-To: <hkvbfq$jo3$1@ger.gmane.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.220.225
X-SA-Exim-Mail-From: rep.dot.nop@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] recipes/*: use ${GNU_MIRROR}
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
X-List-Received-Date: Wed, 10 Feb 2010 22:56:32 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 10, 2010 at 11:20:44PM +0100, Koen Kooi wrote:
>-----BEGIN PGP SIGNED MESSAGE-----
>Hash: SHA1
>
>On 10-02-10 22:45, Bernhard Reutner-Fischer wrote:
>> sed -i -e 's|[hf]*[t]*p://ftp.gnu.org/gnu|${GNU_MIRROR}|g' $(git grep -l "ftp.gnu.org/gnu" recipes/)
>
>I must note that this change will break checksums if ftp.gnu.org isn't
>used as GNU_MIRROR for recipes with old-style checksums.
>
>>  recipes/binutils/binutils_2.17.bb            |    2 +-

ugh yes, so disregard this.

I'm tempted to ask for just wiping checksums.ini and let interrested
parties transfer to new-style to recover, but i better don't.


