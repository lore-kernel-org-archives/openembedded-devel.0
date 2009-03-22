Received: from [209.85.218.171] (helo=mail-bw0-f171.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1LlX8d-0008E6-H0
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 Mar 2009 00:31:31 +0100
Received: by bwz19 with SMTP id 19so1462900bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 22 Mar 2009 16:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=k1IcYHZ5ySMEHo0yehKWDBqK9NAggavb8xfk+kz7124=;
	b=Rv1TDMXk0HhRlDokYumqHg6T3X+zfEfpv+A2uV39qHy9F0ZNSykVe8DBtxmlwKm1Ys
	A3gUBfsTbrt59W3yAg11EaEgNNqnRAk2XzWvTJO8KRHb27YGBlgfhZwMx0tHYcqMvsGW
	gxrr5moNUiNW5HpjZrNKXyWSBxFDuOZK3nFv0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=ruAZAdqkIZC0h+TT7Q9mKCEB7uIso4Jpx20PKP5VHBJM4BA4vDW8btZlkKHdbRh+1c
	iAONJUJTZ9DWUh0omDXUlfEfCFOzpNpyLGIfXfILLx3tK+H70aM3pRatYY/oL+WJ1MPP
	pkU1GD2ugbU32uzTMNl5toISLaZSDblTByfw4=
MIME-Version: 1.0
Received: by 10.223.126.145 with SMTP id c17mr5469521fas.102.1237764610779; 
	Sun, 22 Mar 2009 16:30:10 -0700 (PDT)
In-Reply-To: <d1b08f940903221104u5f0f1328i8918a50ec49541f7@mail.gmail.com>
References: <1237737623-10538-1-git-send-email-matthieu.poullet@gmail.com>
	<d1b08f940903220927v2f820afia681d67bdbd50b54@mail.gmail.com>
	<20090322172416.GA16899@denix.org>
	<d1b08f940903221104u5f0f1328i8918a50ec49541f7@mail.gmail.com>
Date: Mon, 23 Mar 2009 00:30:10 +0100
Message-ID: <d1b08f940903221630p3e0bc9a5i443e8ada0a40fa03@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] Angstrom: weak-assign DEPLOY_DIR
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
X-List-Received-Date: Sun, 22 Mar 2009 23:31:31 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Wait a moment:

if we weak-assign DEPLOY_DIR in angstrom.inc
DEPLOY_DIR ?= "${TMPDIR}/deploy/${ANGSTROMLIBC}"

then it takes the value from bitbake.conf?
DEPLOY_DIR ?= "${TMPDIR}/deploy"


Now doubtful...

Andrea


