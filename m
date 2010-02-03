Received: from mail-bw0-f226.google.com ([209.85.218.226])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <michael.lippautz@gmail.com>) id 1Nck9N-0004xm-9z
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Feb 2010 19:40:32 +0100
Received: by bwz26 with SMTP id 26so1342567bwz.27
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Feb 2010 10:38:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=K27ElytmLVCAJh6ZrVM2wcg6X0huzObsmcfjHbl/k4A=;
	b=I5Mc46kxFx1d905xaJJFOt5h9b8Wk9UBr6lC51LelyAGD1JsWatq8pmIaB9D95JyZk
	ECwzid1K5aPYvmfXu0HNM4Aa9x/g1apxZdmhO81yboHg/25LMfHuaUSRxaZ3WWOnzEnk
	xas+ylW0x7qXFHjGSrnfTS+7MN1k4/XWLjp1M=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=kyIstv/HvmatDDyUwgUhLHNbZUwQvxCMgYakYKW2Nj8Ue34VGMKjnhZ5I+/KbruRG0
	WQ7W4zmZLLH4vWA/Up2L9pZ55hAx4d6Fxv+UYRKRfVCTI4G0ZQfacKulBE1SceoMKhFS
	sXPPZpuNTEGkSvtPOrAQdghpJ9oza4YrGKFEE=
MIME-Version: 1.0
Received: by 10.204.126.5 with SMTP id a5mr1880790bks.109.1265222281411; Wed, 
	03 Feb 2010 10:38:01 -0800 (PST)
In-Reply-To: <1265221914.4267.273.camel@cheeto.emacinc.com>
References: <1265221914.4267.273.camel@cheeto.emacinc.com>
Date: Wed, 3 Feb 2010 19:38:01 +0100
Message-ID: <fca63bcf1002031038q7d1d0bb6r1340de8100e80f5f@mail.gmail.com>
From: Michael Lippautz <michael.lippautz@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.218.226
X-SA-Exim-Mail-From: michael.lippautz@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: re-run install task without cleaning
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
X-List-Received-Date: Wed, 03 Feb 2010 18:40:32 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/2/3 Travis Stratman <tstratman@emacinc.com>:
> Any suggestions?

bitbake -c install -f <recipe>

-f forces the task

Regards,
Michael


