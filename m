Received: from [209.85.218.20] (helo=mail-bw0-f20.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <norguhtar@gmail.com>) id 1LKbe4-0005za-BC
	for openembedded-devel@lists.openembedded.org;
	Wed, 07 Jan 2009 17:52:40 +0100
Received: by bwz13 with SMTP id 13so21142889bwz.21
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Jan 2009 08:46:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:mime-version:content-type;
	bh=x6utsYfET/GclyUMI6kRoI5j2F+4xzgLN5ResvucYEg=;
	b=OdAebIEVGVYmt2yZ1WA/G/Mtdr694cpSr+3KcmQahsvxZn2qZc7n2NwgIdhcIhoWyT
	poGPDCYhz1gHEzcYwuAqTIV7CnQlAm4R1ioU2HU+4r4fikWr+oW6rmgX9z/PaGHWnuFT
	JeC57VycSfNM59E9U9iayXAm6hlFd+vaXkJKQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:mime-version:content-type;
	b=qfUcd64A62DThmzhb5ydDpWwwCSYq0FbPm9Qf160NDZSV+QQ1hTTAYFdIKFAgjbck7
	8Xd1vCcB/j+RBiCtUD7tKJ6NaELTXDkrfxZm8LgqXyPsJQCnM8vYQqItfdrGxtcT5aaM
	uEcq/PvsyEaO/IXXBH8+KbSlBSpClM4swReXA=
Received: by 10.103.121.19 with SMTP id y19mr8357642mum.56.1231346793304;
	Wed, 07 Jan 2009 08:46:33 -0800 (PST)
Received: by 10.103.24.16 with HTTP; Wed, 7 Jan 2009 08:46:33 -0800 (PST)
Message-ID: <1fea892d0901070846h7e3dc5cn4263adbac0252596@mail.gmail.com>
Date: Wed, 7 Jan 2009 21:46:33 +0500
From: "Anatoly Shipitsin" <norguhtar@gmail.com>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Double defines FILESPATH
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
X-List-Received-Date: Wed, 07 Jan 2009 16:52:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello.

Why FILESPATH defines twice? I'm find define in classes/base.bbclass and
conf/bitbake.conf.

