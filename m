Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1PIidf-0000oW-Du
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Nov 2010 15:05:32 +0100
Received: by bwz10 with SMTP id 10so1623607bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Nov 2010 06:04:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=Hev81IWAYNKY2Q0u9ASdF9WeVLtUA3GP/YIDcbf0lVM=;
	b=qpDwki0C6C/pZQy7FVbleYZIRorqXs8Geh1ihnfDPhNnD9DlO4PxEVQsgUbOtkDIWG
	audMFv1/27NSzsQTsGS4oUAs5+vfAthweQxfqLr0t2lSDaM/cy+dTMlotZm2Nhf5dWyo
	+on4Acuo+eDvJe5VLjsnawqqaeYOUnBDRcwaY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=VvTeGxOT0be2HuKvLZGhFfr69UJgrK5pHsZG8vJEVAAE+4yCEoqR0QswaJxUwebLEb
	IalxiHg8dDMTKJucyLO42q9gGtd9X0p735C4BvWm2eraIb/WTtbL2vow9AQdCQaPSyh0
	QLmDVvfKv9jU+TDVSKWD/2xzueZKrUiPMVUQU=
Received: by 10.204.62.17 with SMTP id v17mr9200688bkh.67.1290002665151;
	Wed, 17 Nov 2010 06:04:25 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 4sm1341160bki.13.2010.11.17.06.04.22
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 17 Nov 2010 06:04:23 -0800 (PST)
Date: Wed, 17 Nov 2010 15:04:21 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101117140421.GB3604@jama>
References: <1290002290-9233-1-git-send-email-fransmeulenbroeks@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1290002290-9233-1-git-send-email-fransmeulenbroeks@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH v2] libX11: patch configure.ac so a nios2 system is not seen as an os2 system.
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
X-List-Received-Date: Wed, 17 Nov 2010 14:05:32 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Nov 17, 2010 at 02:58:10PM +0100, Frans Meulenbroeks wrote:
> The OS/2 platform requires some utility functions as well as having a non-32 bit wchar_t. Fix the configure check so that it doesn't also affect the nios2 cpu, which wouldn't influence these operating system issues.

Looks good

Acked-by: Martin Jansa <Martin.Jansa@gmail.com>

Thanks


