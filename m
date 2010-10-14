Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ashcharles@gmail.com>) id 1P6UDJ-0002HC-Sy
	for openembedded-devel@lists.openembedded.org;
	Thu, 14 Oct 2010 22:15:47 +0200
Received: by ewy1 with SMTP id 1so2721762ewy.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Oct 2010 13:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:from:date
	:message-id:subject:to:content-type;
	bh=xhLj9cOX3/UHAoymRLTamjScN73EL5Hg0uTMSJK/1Zc=;
	b=b18HC3hytPhAU5bxr95Xerh4JNc9L5SnaT81a37SblVVopXbG5ss7GmQgqnYjPfEQg
	hwI9k1kxLFrPy+o9t6jYFVy5pW5wFa68QFXivY58aYdbG2gJc6SwEwYx1HPiFMKTxpax
	4HEeoBoZFhkx2IlIVLKWrKJeRHOFbMo29ZxmI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:from:date:message-id:subject:to:content-type;
	b=CrnAdCoaMO0jT6aYF8s3UbbDsXm9W1iIt3PDtv1IYKQQSGvSZnfjzbFP8pov+kuPRF
	d8M2b/WW8woqSddbJjh4CjL1BXATpgrLocZXJ6uyURroSYNAdpWd++sJFVj5hyDs1GvQ
	EVZwS0eIIK6yRegBWA5ZY1QuvWcD2fD+613+4=
Received: by 10.213.16.207 with SMTP id p15mr599314eba.61.1287087316449; Thu,
	14 Oct 2010 13:15:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.29.12 with HTTP; Thu, 14 Oct 2010 13:14:55 -0700 (PDT)
From: Ash Charles <ashcharles@gmail.com>
Date: Thu, 14 Oct 2010 13:14:55 -0700
Message-ID: <AANLkTimdcdr2mSBOzaKJ2FTuR=KBbropdvobucfQx5Wx@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.215.47
X-SA-Exim-Mail-From: ashcharles@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Bitbaking while modifying recipes
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
X-List-Received-Date: Thu, 14 Oct 2010 20:15:47 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

At what point in bitbaking a recipe is it safe to start modifying the
recipe without risk of messing up the current bitbake build?  I often
find myself kicking off a bitbake and then wanting to do some git
operations in my openembedded recipes tree.  Previously I've resisted
the urge to mess around until whatever is being bitbaked is done but I
suspect that I'd be fine to make changes as soon as the parse step is
completed.  Is this correct?

Thanks,

Ash


