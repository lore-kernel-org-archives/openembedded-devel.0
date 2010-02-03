Received: from mail-gx0-f215.google.com ([209.85.217.215])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1NckET-0005Ge-7E
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Feb 2010 19:45:48 +0100
Received: by gxk7 with SMTP id 7so1746349gxk.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Feb 2010 10:43:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=SNAGCJ/SEaVr7jWa9WmQbUwoz+HZFWZ7kMOqeurWZtg=;
	b=QAQOpH2HIJ70fWDxHCpBQDVnThZiREqGTW97w7B6kEk+wWW18/J+pOK/5od+t1/R7J
	IIt6UBPDPqH/in0XAbjeYAWWHzqWUComMbUk17abMGUZfC6JSlQvdLFOkLa7NxEXyUKZ
	GEAwHbo8iX9xY0gMEecpUBUZAi8xLcso/K/lo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=NSUV1vPTkaeILv3OdMv4dQvsTuGmf9Q8/DGwWVpQVJ856Ic7qAjJC03+58jQ1o3xbF
	GSotWAF0QaUvdsOrP31Usnq+jpeDlwWBbp/emvXYDFfacIvrrclvL8hC1dogBqGO1QRZ
	KDEf39Gr/pGwYQR1FHZawoK2eCHYHdwwe6aSM=
MIME-Version: 1.0
Received: by 10.100.40.8 with SMTP id n8mr10692780ann.121.1265222593958; Wed, 
	03 Feb 2010 10:43:13 -0800 (PST)
In-Reply-To: <ac9c93b11002012357k2f7a920dqd800db05beab0664@mail.gmail.com>
References: <ac9c93b11001300418t644f9b92h926dbae7a232b339@mail.gmail.com>
	<1265065663.3159.8.camel@rex>
	<ac9c93b11002012357k2f7a920dqd800db05beab0664@mail.gmail.com>
Date: Wed, 3 Feb 2010 19:43:12 +0100
Message-ID: <ac9c93b11002031043t12281789q1d48891e35f12a74@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.217.215
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: packaged staging issue; additional packages
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
X-List-Received-Date: Wed, 03 Feb 2010 18:45:48 -0000
Content-Type: text/plain; charset=ISO-8859-1

Found it; fixed it; tested it; pushed it;

Root case was that packaged-staging.bbclass was not updated when
DISTRO_PR was introduced.
This caused the generation of pathnames which were missing the
DISTRO_PR part. Fixed it by adding + "${DISTRO_PR}" to the places
involved.

Kudos to RP for pointing me to the proper direction.

FM


