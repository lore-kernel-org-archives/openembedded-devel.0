Received: from [216.239.58.188] (helo=gv-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1N137E-0002rF-P9
	for openembedded-devel@lists.openembedded.org;
	Thu, 22 Oct 2009 21:14:31 +0200
Received: by gv-out-0910.google.com with SMTP id e6so1893415gvc.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Oct 2009 12:13:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type;
	bh=nYZImxWDP9jpv85SZaCOU4gT3uNplzUpYIBA2D3XOFQ=;
	b=iky1y5nKbIVQMuI1eyF+QkfFHPUPmxHu5LTAB6GWPuRmig6KE+7R5/ipIWueXDJbkO
	np+XiTe6O/dxJwTsdcCoC7lSe//BkLeGoI4XkowASrxekD7ewVLup4xo2mlSieRPe/6D
	SScIpShBt950g0ljpQA9p0/JvdxHOKlCr35EQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=vLbdYUJ3xVio5GjIrh28Z6npHeS0URGom7UicNC5x6Ua8x1bEoAmwioX1DhCBCc3Pv
	wCD2GaL9jIlfHIg0BBUxfG+Rf6lYfdaNRhPDk6neQC8t6BPzU9NPoPsi6uw2c6IJUyY4
	O1BbnoPDnxgR3HW5rhl9EWfAKz5uTSH9/kaPk=
MIME-Version: 1.0
Received: by 10.239.145.5 with SMTP id q5mr832639hba.89.1256238808359; Thu, 22 
	Oct 2009 12:13:28 -0700 (PDT)
Date: Thu, 22 Oct 2009 21:13:28 +0200
Message-ID: <c384c5ea0910221213l732ced5fn3d3fb38594fa4240@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-SA-Exim-Connect-IP: 216.239.58.188
X-SA-Exim-Mail-From: leon.woestenberg@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [RFC] Make work subdirs match task name for install and package to avoid confusion
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
X-List-Received-Date: Thu, 22 Oct 2009 19:14:32 -0000
Content-Type: text/plain; charset=ISO-8859-1

Although I am aware of the correctness, I notice new OE devs being
confused by this fact:

the install task creates the image/ directory.
the package task creates the install/ directory.

I wonder if we need to change to install/ and package/ instead?

Regards,
-- 
Leon


