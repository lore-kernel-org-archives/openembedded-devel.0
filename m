Received: from mail-wi0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chris.sarra@gmail.com>) id 1Rd0bl-0004zc-99
	for openembedded-devel@lists.openembedded.org;
	Tue, 20 Dec 2011 15:23:57 +0100
Received: by wibhq7 with SMTP id hq7so1466106wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Dec 2011 06:16:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:from:date:message-id:subject:to:content-type;
	bh=SQjCjLxKrdIpLFs9DwKXFJi+hHsknpu3NxM3nb+bhd0=;
	b=X4ktcB1aqXA4lvvKJCjnutt24Rjd911jVY7+C91cu/YGFcKupNMUC/KQChx/GNlsCz
	44mjCT19k+LA69oSgJbszng1aMTL8wtVyKu4dknLBwJN/zfpQ3nT1R8iHXfF+UhE6M+/
	tLwVliqCUa8oQFhPkqTCLLJlpNwMT/t2R5xS8=
Received: by 10.180.19.138 with SMTP id f10mr6434970wie.3.1324390613322; Tue,
	20 Dec 2011 06:16:53 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.121.133 with HTTP; Tue, 20 Dec 2011 06:16:22 -0800 (PST)
From: Christopher Sarra <chris.sarra@gmail.com>
Date: Tue, 20 Dec 2011 09:16:22 -0500
Message-ID: <CAAJ_Y3kksFvP84YPNV0=oQE7x8XxH0-CoDq02eO-MsODi_2B0g@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: fakeroot 1.15.1 issues
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
X-List-Received-Date: Tue, 20 Dec 2011 14:23:57 -0000
Content-Type: text/plain; charset=UTF-8

Hi All,

I'm writing to ask about a recent thread I saw about problems with OE
fetching fakeroot 1.15.1. I'm new to OE and BitBake, and I'm having a
problem similar to what I saw in that previous post:

<<
NOTE: package fakeroot-native-1.15.1-r0.0: task do_fetch: Started
ERROR: The checksums for
"/localhome/cwsarra/oe/sources/downloads/fakeroot_1.15.1.orig.tar.bz2" did
not match.
  MD5: expected "248c408b1e06e776c5739871b49bd968", got
"c33f8b2be5bfafc0258efb8139cc5972"
  SHA256: expected
"45fbb9ad611f33224cc09954963dde563cc80fe58c76feb25b6e98550b81729a", got
"92ed10b39922bb2890ef7cc7512fdfe57bd2d1f54a894364518b292f79455138"

NOTE: package fakeroot-native-1.15.1-r0.0: task Fetch failed:
ftp://ftp.debian.org/debian/pool/main/f/fakeroot/fakeroot_1.15.1.orig.tar.bz2checksum
mismatch.: Failed
ERROR: Function 'Fetch failed:
ftp://ftp.debian.org/debian/pool/main/f/fakeroot/fakeroot_1.15.1.orig.tar.bz2checksum
mismatch.' failed
>>

I read through the proposed patches, but I'm still not clear on which files
I need to edit to work around this issue. There was a fix proposed for the
fakeroot_1.15.1 recipe file, but that didn't seem to work for me. Can
someone tell me which [additional] files I need to update?


Thanks for your time,
Chris

