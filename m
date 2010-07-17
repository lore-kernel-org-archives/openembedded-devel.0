Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Oa2GM-0000eq-N2
	for openembedded-devel@lists.openembedded.org;
	Sat, 17 Jul 2010 09:56:49 +0200
Received: by pwi10 with SMTP id 10so1265868pwi.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Jul 2010 00:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=HLBsKf93DCEWiozUEn0A1uYSmP5U0cdChdBjxcR6yoU=;
	b=SL2U1MET2c32K5+R1hBPJ5WBo9+VGA/gDXX9RxfxzVC+UKm1DFEurt9XAUXtb8twfi
	x0Vs3ZkV2PpYLWPqndT+Floe/vaMJh4w92tT3mW6sAXVm58RAnDY0jvAjVUaUvxRbrsP
	JLlzygvFS5i+ivHB96JzCbqa2lVVv+HoMFBK0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=nJIuvD630pH7rj16h4HVNbkiVa2jKWA7zFBNveZ08dVByM6aaNiWG8yGI9jluXFed5
	YVgX2O64iju+bOkpmU7kjzcZy/ucL1aQSfDo5Y6a6xa4j0gd/I2kKMgYbuJxcsb29f4/
	/fmx8QZaK43Og6RRYnVylMBN8Ui18Vl9Oyvzw=
Received: by 10.114.13.12 with SMTP id 12mr3026021wam.124.1279353395836;
	Sat, 17 Jul 2010 00:56:35 -0700 (PDT)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id d35sm36017536waa.21.2010.07.17.00.56.34
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 17 Jul 2010 00:56:34 -0700 (PDT)
Date: Sat, 17 Jul 2010 00:56:39 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100717075639.GA1156@gmail.com>
References: <1279226782-6124-1-git-send-email-fransmeulenbroeks@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1279226782-6124-1-git-send-email-fransmeulenbroeks@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.160.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 1/3] glibc 2.9: cleaned up; patches only in local dir
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
X-List-Received-Date: Sat, 17 Jul 2010 07:56:50 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (15/07/10 22:46), Frans Meulenbroeks wrote:
> moved all patches to glibc-2.9
> removed references to other dirs.


Well you forgot to copy glibc-2.4/etc dir into glibc-2.9
this will render glibc 2.9 unbuildable.

Thx
-Khem


