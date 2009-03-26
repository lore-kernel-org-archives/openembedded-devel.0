Received: from [209.85.218.171] (helo=mail-bw0-f171.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1LmdRK-0003Hw-Ii
	for openembedded-devel@lists.openembedded.org;
	Thu, 26 Mar 2009 01:27:22 +0100
Received: by bwz19 with SMTP id 19so303132bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Mar 2009 17:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=a6IHusO78Fv7JTX9UoPHX7iRptl8i+RiACdzvDA6zR4=;
	b=x22RZrnQgmeewWnXz4PlEP/06labaPMo8IrRV7Upl/kf4Q3ZnZSYdaGNFFavNlN90I
	VkTVg8qsX7XBspPrBRmnI5TDEZKvBXaGeDdDJTkJAnMGXCOR2rbdRqWk9lcIhfXlZ9Jd
	SJA0WGSBAjIiDI9HfUKpKJuPTbYhyDkdBKyO0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=Nt9XtVsS/T8v+SIoGzYLOrcqsgpfCQCp8GADoOhivq9JxBkXCGssyjTN1mvG5DEncU
	+iQANZOx3lOOhfjhxlSP1yeeH/GW7KH2UMqc93gnFAAUQ/LmWU03yZNdVHLPUp1sJGL/
	VIR+BqxoUCPxfIOgcnoy9UjfHFLaJGG01r/iA=
MIME-Version: 1.0
Received: by 10.223.126.145 with SMTP id c17mr138907fas.102.1238027142995; 
	Wed, 25 Mar 2009 17:25:42 -0700 (PDT)
In-Reply-To: <eaff36cccf868e5b367b402fb61451bf8f681bd8.1238025789.git.andrea.adami@gmail.com>
References: <cover.1238025789.git.andrea.adami@gmail.com>
	<eaff36cccf868e5b367b402fb61451bf8f681bd8.1238025789.git.andrea.adami@gmail.com>
Date: Thu, 26 Mar 2009 01:25:42 +0100
Message-ID: <d1b08f940903251725s28bb4919tfe04a43d9471eea1@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 1/1] angstrom-2008.1.conf: add PREFERRED_PROVIDER_virtual/psplash -silence warning during parsing
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
X-List-Received-Date: Thu, 26 Mar 2009 00:27:22 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

was:
NOTE: Preparing runqueue
ERROR: Multiple .bb files are due to be built which each provide
virtual/psplash
(/oe/org.openembedded.dev/recipes/psplash/psplash-angstrom_svn.bb
/oe/org.openembedded.dev/recipes/psplash/psplash_svn.bb).
 This usually means one provides something the other doesn't and should.


IMHO the introduction of the new virtual/psplash implies each distro
sets a preferred provider.
Attached patch for Angstrom.

Regards

Andrea


