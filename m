Received: from [209.85.198.242] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1KyVob-0006rn-CK
	for openembedded-devel@lists.openembedded.org;
	Fri, 07 Nov 2008 19:12:13 +0100
Received: by rv-out-0708.google.com with SMTP id f25so1515363rvb.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 07 Nov 2008 10:10:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:mime-version:content-type:content-transfer-encoding
	:content-disposition;
	bh=HttfvXOfC+uXzKKdMhC3yBekMM6ro+fNwFiFaEdb8Yw=;
	b=LY/mNu/O0illK38+RkBqm9XYkcGxLjdAB6WHOdYW+7lcSebtaAPRe6AFPYZ0Q70xgV
	IMJaa9HMJXTbMOzetrSRnrzTYlwZ4q4JaZUY8Eh1NEAL3rh1Jd9QzHCP3im6nNDaF6yF
	RGzKqoKnjoyo2uy1EdnRczmK4PPQbhOQleWR4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:mime-version:content-type
	:content-transfer-encoding:content-disposition;
	b=DczEu259naTKN+1sAuu3FIF/Phwf9F2GTjdWGkX039CjHf/dCT+m8YGfagMQvP7Cah
	ijf65tDZhogAvm65OpJeywiMsjbRRNKMMYmpmQ039jeUUCXz1140Ne5RKLiHPqBlM0p9
	Joj2gU5Alu8pMSYNI8ZqUsg5Zm0uxe5EqoPFM=
Received: by 10.140.193.15 with SMTP id q15mr1893179rvf.274.1226077378130;
	Fri, 07 Nov 2008 09:02:58 -0800 (PST)
Received: by 10.141.193.4 with HTTP; Fri, 7 Nov 2008 09:02:58 -0800 (PST)
Message-ID: <f96d234e0811070902y7bc14e8bu13b87ba81f01d330@mail.gmail.com>
Date: Fri, 7 Nov 2008 12:02:58 -0500
From: "Cliff Brake" <cliff.brake@gmail.com>
To: bitbake-dev@lists.berlios.de, openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
Subject: merging bitbake changes from poky
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
X-List-Received-Date: Fri, 07 Nov 2008 18:12:13 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

I am experimenting with merging some bitbake changes from poky and
they are available:

  URL: git://dev.bec-systems.com/bitbake.git
  Tracked remote branches
    bitbake-1.8 bitbake-1.8-poky-fixes master

Can we consider moving bitbake to git?  It would make activities like
this a little easier.  It would also be easier for users to manage
their own bitbake repositories which has been necessary for me several
times in the past to include fixes.  Note, I am not suggested we merge
bitbake with the OE source, but I don't see any problem with putting
it in a separate repo on git.openembedded.net.

Thanks,
Cliff

-- 
=======================
Cliff Brake
http://bec-systems.com


