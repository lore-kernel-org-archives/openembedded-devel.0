Received: from mail-pz0-f192.google.com ([209.85.222.192])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1NBc0i-0002yy-Th
	for openembedded-devel@lists.openembedded.org;
	Fri, 20 Nov 2009 23:31:28 +0100
Received: by pzk30 with SMTP id 30so2534455pzk.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Nov 2009 14:29:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=mPvEdDADflM2VEI9wFHG+6PsDM50OXrO77lh5VJUQAg=;
	b=hu1aZEcnVb6uYYz7+DGDjKpx3wadMk9SbnfdzDqv3FQPV/lokZOROO4ZHK6JUKe05h
	bSsS42JNE6RGGjhLTRjnhbv8tILjVCRcVEW7N1VcxWBYV87Nl6yA0yZfiFyIeTvsEADH
	n9b3FAsp8XQ61j3tvGCTEPEoXm3+QSRTvqGvo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=k+PtOyRXHK6oR3wT+gz6UrPQKaokZzpY6OizT881BJDj429kulugqxt+qdd7eZTLPt
	+pRyUSX4Y+t71EZ/fNnXFltE41tMB3J0o8V2pKt4g2oXR4sJcRaDLvMnxe8MIUNGV21I
	n1CcJL+ssdIu3T9iSK7EPAlanGPU/tQ6pacr0=
MIME-Version: 1.0
Received: by 10.140.202.20 with SMTP id z20mr118429rvf.28.1258756198364; Fri, 
	20 Nov 2009 14:29:58 -0800 (PST)
In-Reply-To: <200911202055.21122.david.lanzendoerfer@o2s.ch>
References: <20091120172438.3e6f603e@Gorodetsky>
	<200911202055.21122.david.lanzendoerfer@o2s.ch>
Date: Fri, 20 Nov 2009 23:29:58 +0100
Message-ID: <d1b08f940911201429g31d37920n704868df08015f3f@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.222.192
X-SA-Exim-Mail-From: andrea.adami@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Error building opie-image
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
X-List-Received-Date: Fri, 20 Nov 2009 22:31:28 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello,

the issue with opie-networksettings appears with the new kernel headers.
Quick fix you could try:

wextensions.h

6c6
-#include <net/if.h>
+//#include <net/if.h>

Code is now in <linux/wireless.h>

Regards

Andrea


