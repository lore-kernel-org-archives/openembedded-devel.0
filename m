Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PW36E-0007iK-B8
	for openembedded-devel@lists.openembedded.org;
	Fri, 24 Dec 2010 09:34:06 +0100
Received: by iyj18 with SMTP id 18so5940968iyj.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Dec 2010 00:33:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=+AjbnK4tT2vlmaT6aT0uym+HOQJOTwqs/9Xwlx9hmlQ=;
	b=s3sX9TyBc1+px/meB71fxv3eOK550W6PI+mrfR5mmrbxNIcGime84hLACW+3ZI6cU6
	UlRRJCHKrui50kNlgMQa+RhXduvzZaGxMgtmTk4bYIfTssclFF4DqCq2TJHT4974bs4u
	p+/CelxFURogVJDye7XgrsvVd1uoesqSSLrf8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=ZPKJcgr8L7B4FAzN/sTriLJ5GBHsLr34ixfZqTVY9dvGb8AWMI62+M50VU+HDQuIzM
	NijlQ0pIZ+TjGJdiz6agbseeD6UyCaU7ie6H1LY8t6Rh5F7gZ/A8dJqU5CV/rS7ongkl
	YxbM4yNY6k7o3Y33gs2WMFee94FSp74XgkoL8=
MIME-Version: 1.0
Received: by 10.231.31.1 with SMTP id w1mr9203629ibc.7.1293179629082; Fri, 24
	Dec 2010 00:33:49 -0800 (PST)
Received: by 10.231.200.140 with HTTP; Fri, 24 Dec 2010 00:33:49 -0800 (PST)
Date: Fri, 24 Dec 2010 09:33:49 +0100
Message-ID: <AANLkTi=YRSMBzSihPEddjSNR+B7UFGWcAr_P9AgGs3eQ@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: avoid addtask?
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
X-List-Received-Date: Fri, 24 Dec 2010 08:34:06 -0000
Content-Type: text/plain; charset=ISO-8859-1

I was wondering whether it is better to avoid addtask where easily possible.

E.g. from one recipe:

do_postpatch() {
        rm -rf patches && rm -rf .pc && mv -f debian/patches patches
&& quilt push -av
}
addtask postpatch after do_patch before do_configure


Wouldn't it be simpler and probably even a little bit faster just to say:

do_configure_prepend() {
        rm -rf patches && rm -rf .pc && mv -f debian/patches patches
&& quilt push -av
}

(or if there is already a do_configure_prepend add the line to it)

Currently we have 142 addtasks and some of these are definitely useful
and desirable but I feel a lot of these could easily be merged into
the previous or next task.

How do you feel about this?

Frans


