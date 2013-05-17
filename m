Received: from mail-pd0-f175.google.com ([209.85.192.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elvis.dowson@gmail.com>) id 1UdOnW-00015k-EK
	for openembedded-devel@lists.openembedded.org;
	Fri, 17 May 2013 19:50:36 +0200
Received: by mail-pd0-f175.google.com with SMTP id y14so3508620pdi.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 May 2013 10:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=kXoHuoqs/MUE253oJxS/M2E0vONzrjOZBMYCHklxwXM=;
	b=XvxthYMCw7Y/loOTuay3GxnzEKJURRWpru1adpW4EoBP38d16NESwuX9i/K/5emlKo
	S7rogHr1MRX/n5U3BjYFdAIytIHu/jvnmbLYK8fQoLST4sZtOOA+CWMOyCKlN4FGrZ9b
	QX55ujci6MaZMOikBtVp+ZK1nckFXzXq6Dh30O9XmQsvTQxjJ4nTH0f2zQGyCEFYNZU7
	M3CxNr6QjODl5sCFAAOpY0PPcyVRaZ5hEf1Llc+t7gupg741S5si8mHiAtOgyeKuVzux
	TS/K64C5YZSxyEAmE2R+Ui7ChYZnf5OCXyTe79RVvqSsw/cmlE0zB0mDMVKvFOLcvSlU
	puRQ==
X-Received: by 10.66.164.3 with SMTP id ym3mr50032667pab.106.1368811933818;
	Fri, 17 May 2013 10:32:13 -0700 (PDT)
Received: from [192.168.1.100] ([94.205.106.101])
	by mx.google.com with ESMTPSA id
	cq1sm12000973pbc.13.2013.05.17.10.32.10 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 17 May 2013 10:32:12 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.1 \(1498\))
From: Elvis Dowson <elvis.dowson@gmail.com>
In-Reply-To: <FF983BDD-B955-4657-A711-56457453F64D@gmail.com>
Date: Fri, 17 May 2013 21:32:05 +0400
Message-Id: <EA34DF4F-ACD6-4D49-96B6-212658E8DBEB@gmail.com>
References: <1364545389-20291-1-git-send-email-elvis.dowson@gmail.com>
	<B42120AF-E508-4363-8249-E94E10A2957D@gmail.com>
	<F81A0AC1-9DA1-4A74-949D-94FA709BFD43@gmail.com>
	<FF983BDD-B955-4657-A711-56457453F64D@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Mailer: Apple Mail (2.1498)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [v2] gcc-4.8: Refactor gcc-4.8.0 patch files.
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
X-List-Received-Date: Fri, 17 May 2013 17:50:37 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hi Khem,
                  I've noticed that the gcc-4.8.0 patches have made it's =
way to the master branch, but notice that you don't use the prefix patch =
numbers for any newly generated patches.

=
http://git.yoctoproject.org/cgit/cgit.cgi/poky/tree/meta/recipes-devtools/=
gcc/gcc-4.8

e.g. 0036-gcc-4.8-PR56797.patch, as opposed to gcc-4.8-PR56797.patch

It makes it quicker to know the linear sequence from looking at the =
patches in the gcc-4.8 folder, as well as the gcc-4.8.inc file, as time =
goes by.

This is what I had hoped to fix, when I submitted the refactored =
patches, since it will help easily add/remove/port patches for current =
and future versions of the gcc recipes. It is also useful, while =
attempting to compare patches across multiple gcc recipes.

Best regards,

Elvis Dowson=


