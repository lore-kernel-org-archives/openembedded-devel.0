Received: from [209.85.218.219] (helo=mail-bw0-f219.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1Lu26P-0006F2-1k
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 Apr 2009 12:12:23 +0200
Received: by bwz19 with SMTP id 19so2792768bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Apr 2009 03:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=Tj7UVP4uG+g711hF0IckIXl3K4e4yNucgB50BdjUTVU=;
	b=Zb6Zb+tmhnkofYVZcSyQ9Ok8OV1nddtfQYtaXESb4mabW1SyW6f+IZDmQnYZJg8Hnq
	vhE2Vq8EaaP0mUTdv/Y3x6h93nVkFVNikF54IFJB0Wri2v5pAE64xUz6h6KDXRDOACil
	r7aoZEDenPWUigNzSmgBZXLI7/R4swQxzUSGI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=A8gvmqC0nFf55+aW5R+zXS/BCjiNaDXJ2UMoxVkIEpYR924ndoDhirX33rKISTnkdL
	kF6k9m69o2FAbTbd/0FnczU/FOqohB9kL9fgp25UnMewOirnzJLl2eek9sSUv+Zcuzky
	sQrxUiSQs3tw9es77a/1py46uXtV3Q0MWUI4U=
MIME-Version: 1.0
Received: by 10.223.126.203 with SMTP id d11mr16312fas.22.1239790112728; Wed, 
	15 Apr 2009 03:08:32 -0700 (PDT)
In-Reply-To: <200904151347.16942.khimov@altell.ru>
References: <1239784615-19928-1-git-send-email-khimov@altell.ru>
	<gs47uf$uv2$1@ger.gmane.org> <200904151347.16942.khimov@altell.ru>
Date: Wed, 15 Apr 2009 12:08:32 +0200
Message-ID: <d1b08f940904150308o4681f4f7n124af48c6b6a5082@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.218.219
X-SA-Exim-Mail-From: andrea.adami@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=AWL,BAYES_50,RDNS_NONE,
	SPF_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] libpcap: weaken bluez-libs dependency
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
X-List-Received-Date: Wed, 15 Apr 2009 10:12:23 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

>Is this a policy?
The point is the produced binary should not have different configure
options and/or different runtime behaviours...hence the need for a
finer granularity.

However, this has the side-effect of bloating the number of requested
packages for almost every task.

Regards

Andrea


