Received: from [209.85.211.187] (helo=mail-yw0-f187.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ihar.hrachyshka@gmail.com>) id 1MlePZ-0007Z5-It
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Sep 2009 09:49:48 +0200
Received: by ywh17 with SMTP id 17so978911ywh.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Sep 2009 00:49:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=bKsKV8msjVhuEgbAJBrmXqM260vstrNtPqgSkZENuVQ=;
	b=T4ta+JxtmqJY1/g/HI5H7OsM1Un79KN7nF4akNkoALPMk3omFCvSpQUz3xjq3w4sc+
	4KrABqQS7e8q7SZdXOa4ebjPZkAU8ePP5PEfhrwiPS90QiPNUKV6qcFXOfff1KJImsZ6
	cch77ALQRXrZO1k9aEJDlUKJYSJs/8+GJBaVI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=qtlU8761pXtF002+iSWichFdw8ZbhVxw/tCTWIn0LzXQAaANPWuqhv1oivu28R0ObX
	sc0aPuLIQ0sBD8oTKU7gQLSCnS6T6H3MFSM89Sii77CqMFXVbQNi8hp/8Fysl1BtmGmx
	NEngIr++vSPgFTYNxljRhrXFNXL7VeWjogUUo=
Received: by 10.150.183.11 with SMTP id g11mr2197614ybf.50.1252568957640;
	Thu, 10 Sep 2009 00:49:17 -0700 (PDT)
Received: from localhost.minsk.epam.com (cpmsq.epam.com [217.21.56.2])
	by mx.google.com with ESMTPS id 23sm401043ywh.7.2009.09.10.00.49.15
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 10 Sep 2009 00:49:16 -0700 (PDT)
Date: Thu, 10 Sep 2009 10:48:45 +0300
From: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090910074845.GB25839@localhost.minsk.epam.com>
References: <1252329016-10848-1-git-send-email-ihar.hrachyshka@gmail.com>
	<1252329016-10848-2-git-send-email-ihar.hrachyshka@gmail.com>
	<1252329016-10848-3-git-send-email-ihar.hrachyshka@gmail.com>
	<1252329016-10848-4-git-send-email-ihar.hrachyshka@gmail.com>
	<1252501527.27780.755.camel@mill.internal.reciva.com>
MIME-Version: 1.0
In-Reply-To: <1252501527.27780.755.camel@mill.internal.reciva.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.211.187
X-SA-Exim-Mail-From: ihar.hrachyshka@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] Use NEED_UNZIP_FOR_UNPACK variable for some recipes.
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
X-List-Received-Date: Thu, 10 Sep 2009 07:49:48 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Sep 09, 2009 at 02:05:27PM +0100, Phil Blundell wrote:
> On Mon, 2009-09-07 at 16:10 +0300, Ihar Hrachyshka wrote:
> > +NEED_UNZIP_FOR_UNPACK=1
> 
> Why is this better than just declaring an explicit dependency of
> do_unpack on unzip-native?  It's not obvious to me that the extra level
> of abstraction buys much in this situation.
> 
> p.
> 

We can drob the variable then. What about .zip extension auto detection?


