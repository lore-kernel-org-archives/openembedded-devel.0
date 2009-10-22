Received: from [74.125.92.147] (helo=qw-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1N0ptR-0000kH-8y
	for Openembedded-devel@lists.openembedded.org;
	Thu, 22 Oct 2009 07:07:24 +0200
Received: by qw-out-1920.google.com with SMTP id 4so955482qwk.36
	for <Openembedded-devel@lists.openembedded.org>;
	Wed, 21 Oct 2009 22:06:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type;
	bh=+qwzJRgKiocgoCPCFHUvb9+cMZNs+9uDQqnrJI2LS7Y=;
	b=WT7QliYYreY5nmmkDCbrSMZi5u0gLjyYnE1SIFhmqDM7MzXQ5PXAFnxlh16mFgqXdH
	mxhD2qNKdDIHvdAPStIHsdBmKixyVn3hzUTPDfAxBAmOtiQtwxjRdcbibcZxku2Cm/Dt
	QhZSkHlTNILT77FXmQLZ/LyG16KWlqOn8HZzU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=d/1Z/LItaO86SRNzPTCvT4/X3h1LDXfRAHt017lt6AYri2X746UGdVKQMtLoMgsnuG
	b9KMnQawHx25H/EYy/TwDklmiAq2J7cf9K/e03k1w0j+vjtUkgzl7qcY+FWgwybQICPz
	pN6YNnblMqXmMt374B7JWqaoL0qS4z0al1S7k=
MIME-Version: 1.0
Received: by 10.229.44.21 with SMTP id y21mr1234786qce.42.1256187981336; Wed, 
	21 Oct 2009 22:06:21 -0700 (PDT)
Date: Wed, 21 Oct 2009 22:06:20 -0700
Message-ID: <19c1b8a90910212206s1e64c71jd8a168149e39421@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.92.147
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Moving gcc 4.4.1 to 4.4.2
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
X-List-Received-Date: Thu, 22 Oct 2009 05:07:24 -0000
Content-Type: text/plain; charset=UTF-8

Hi

I have tested a patch which essentially moves gcc 4.4.1 recipes to gcc
4.4.2. There are no changes other than PR
The patch is too big and some lines are larger than 998 chars which
violates the RFC2822 and hence git send-email
will not send it.

There are 25 bug fixes from 4.4.1 to 4.4.2 (per gcc bugzilla) and
essentially its a bug fix release we could have backported
these to 4.4.1 too but then I thought using the release conveys better
message about the release we are using.

 You can have a look at the patch here

http://sakrah.homelinux.org/Public/0001-gcc-4.2.2-Move-4.4.1-recipes-to-4.4.2.patch

Is this ok or does someone has concerns.

Thanks

-Khem


