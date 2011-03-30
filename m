Received: from mail-qy0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <v2g.udel@gmail.com>) id 1Q4yiD-0007E3-2I
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 Mar 2011 18:57:41 +0200
Received: by qyk35 with SMTP id 35so3416229qyk.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Mar 2011 09:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:content-type:mime-version:subject:from
	:in-reply-to:date:content-transfer-encoding:message-id:references:to
	:x-mailer; bh=L/W8i/eBbXi9cBnhbLa7Wfgg87AmEljaJhrINSFofX8=;
	b=qQXOAKy+bMw8MgSV6eqcLj8y/WxpdWvVEp6L2ASyV8HrWSTEZpoeI4kdvv7cIwc3k4
	BF9ORe51cMBzQQiLKF28x6RSU3mVECTFycMnImCqG+zmrSz534QT/pIDSleuibgIzqUB
	NnzJyrCFEOWSHmjpJQIdK/PnI85tzzRFeFhMo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer;
	b=nif6uyUQevJGqvd1I2O3oYBk71hFJih0JJpQgc8Zo4MA30lDb8rGlxuPFEui5HnjDu
	wNSrydj3AWzT2NAVxZUqFTVje45CvYYpAvOM1/LhO9WJYFu7Y9VJ/T7MLmJJiv7czcD0
	mUhPSlelEuB0JPCTJ7sr3QV4vo9Yl3YX65PUo=
Received: by 10.229.75.141 with SMTP id y13mr1317129qcj.15.1301504137953;
	Wed, 30 Mar 2011 09:55:37 -0700 (PDT)
Received: from wifi-roaming-128-4-204-62.nss.udel.edu
	(wifi-roaming-128-4-204-62.nss.udel.edu [128.4.204.62])
	by mx.google.com with ESMTPS id c27sm170917qck.46.2011.03.30.09.55.36
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 30 Mar 2011 09:55:37 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1082)
From: Sachin Kamboj <v2g.udel@gmail.com>
In-Reply-To: <1301496042.11614.15.camel@localhost>
Date: Wed, 30 Mar 2011 12:55:35 -0400
Message-Id: <BA1E2EAB-64FF-47E0-AB46-407D19D68B6D@gmail.com>
References: <1301494030-10554-1-git-send-email-v2g.udel@gmail.com>
	<1301494030-10554-4-git-send-email-v2g.udel@gmail.com>
	<1301496042.11614.15.camel@localhost>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.1082)
Subject: Re: [PATCH 4/6] Add recipes for building TS75xx userspace utilities
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
X-List-Received-Date: Wed, 30 Mar 2011 16:57:41 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Thanks for suggesting these changes. I'll submit a new version of the =
patch soon...

On Mar 30, 2011, at 10:40 AM, Marcin Juszkiewicz wrote:

> Dnia 2011-03-30, =C5=9Bro o godzinie 10:07 -0400, UDel V2G Team pisze:
> 3. I would prefer patching Makefile then own do_compile/do_install

The original makefiles (if they exist at all - only a few of these =
utilities have actual makefiles) are rather esoteric - for example they =
contain support for building these utilities simultaneously for =
different platforms and need links to separate cross-compilers for all =
these platforms. It is way simpler to include the compilation =
instructions here.=20

> 4. tarballs are not versioned - discuss it with upstream

We'll discuss this with the vendor - however, can we include these =
tarballs in the interim?

/Thanks,
Sachin.=


