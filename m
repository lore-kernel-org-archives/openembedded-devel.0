Received: from [209.85.218.221] (helo=mail-bw0-f221.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stuart68@gmail.com>) id 1MWPHZ-0006Ty-KQ
	for openembedded-devel@lists.openembedded.org;
	Thu, 30 Jul 2009 08:38:29 +0200
Received: by bwz21 with SMTP id 21so383168bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 29 Jul 2009 23:23:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type;
	bh=eJ6Jsmvb2K1sH7i/79iU9eqb+1w8xnt/AZKQn6Bfttk=;
	b=XtUVShJ7B+ahmszGr3mTf9N0xs4rhalM1NDdA7d7mhyMzrFJcL7+lV0ItLq2AzQ7Fy
	AaF6pdMLgeLQv+g3bSM3ENkK7F4rJyy/B9Sv6js4CXkv7w6idORsU7R15A+LmAwOZ68y
	UjdNKQOPFfxdsQkPCRXNPgeNfuPNCPKasInWw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=TEgJM4m8UyjJbHc98rN8gozHoLJlxshyioKHSQFSDkf/3w9j3pqI+hml3ZJlrMCVWX
	h4KLEKJOXYymW7daQ5bMGN6aQ+hWonyiVpdG7REtkG/MZpKBGpekinOwBrNZsWBSuDzP
	+qAvi0wAGjz280TRaQEMHP64D5cO3AzbrX6m8=
MIME-Version: 1.0
Received: by 10.204.66.69 with SMTP id m5mr627019bki.174.1248935009213; Wed, 
	29 Jul 2009 23:23:29 -0700 (PDT)
Date: Thu, 30 Jul 2009 07:23:29 +0100
Message-ID: <91283b620907292323k97f58c8tab25fd987265d64e@mail.gmail.com>
From: Stuart Gray <stuart68@gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Advice needed on using Bitbake to make qt project (.pro) Click to flag this post
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
X-List-Received-Date: Thu, 30 Jul 2009 06:38:29 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi,

I am new to using Bitbake and would like to ask if anyone has links to
examples on how to get Bitbake to build Qt projects.

I have successfully used Bitbake to add firmware files to my image, but I am
about to look at building Qt projects into the image. I have already added
the Qt Embedded package to the image.

Any advice would be great as I have very tight project timescales and I am
trying to reduce risk as far as possible. I have been through the Bitbake
example and searched online for examples. From what I understand I should
just be able to add the .cpp, .h and .pro files to the SRC_URI list. Now I
know from reading up on Bitbake that if the SRC_URI contains a makefile that
Bitbake will recognise this and use it to compile the code, but is the same
true if it contains a .pro file. Will it call qmake and then make?

Regards,
Stuart

