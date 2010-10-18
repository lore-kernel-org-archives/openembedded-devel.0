Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P7kEi-00063r-4o
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 Oct 2010 09:34:39 +0200
Received: by iwn2 with SMTP id 2so879460iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Oct 2010 00:33:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=cUWKZg6+amIrqGiX3ezZmEFed9r2uyjoq2vwJNSEEAg=;
	b=AoKqIIme5ZMLAj+mT+IP2rZpoJ6A9p6RyBsof4k8c0vtvncxhdEKC8a3TgbP0IRQ4D
	v0lv2keFzREl1fWbFXI4NDfFJJNFuOLzWConSC3bqZLErPC+NaxgAKLNWQvIqjR31EHc
	tYx9SSHU5/M9zSOwSN4FyR/8kp7nzLNB6NWSA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=FwvL7IUJmNHFXCX79f1c2rIGa+2rsjN1CWWDUBOC1WQ9gpCDAvpfC0o899sGvHIYoW
	2WU8qWu3HUjZWTF8qCTmARsUmA4AF3nBo4gvb2adIsDKZCWmqEfO/YaSIF37Rli91eVp
	QtK/czyBF9LPVte74ikmhNl0FiX94I3x/7bYk=
MIME-Version: 1.0
Received: by 10.231.10.141 with SMTP id p13mr2877983ibp.183.1287387208582;
	Mon, 18 Oct 2010 00:33:28 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Mon, 18 Oct 2010 00:33:28 -0700 (PDT)
In-Reply-To: <20101017211540.GB3324@jama>
References: <20101017211540.GB3324@jama>
Date: Mon, 18 Oct 2010 09:33:28 +0200
Message-ID: <AANLkTinn3BXBjocx=9D5Z_TxrPZnvtQTEwyRK+e3hPkP@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] do we really need all OVERRIDES in FILESPATH?
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
X-List-Received-Date: Mon, 18 Oct 2010 07:34:40 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/10/17 Martin Jansa <martin.jansa@gmail.com>:
> Currently
> bitbake -e -b xserver-xorg-conf_0.1.bb | grep ^FILESPATH= | sed "s/:/\n/g" | wc -l
> shows 65 directories where file:// from SRC_URI can be found.

Actually I got 84. This is git head from last friday or so. Seems a
good plan to reduce this somewhat.
BTW this was for:
DISTRO = "angstrom-2008.1"
MACHINE = "ixp4xxbe"

Frans

frans@frans-desktop:~/workspace/openembedded.git/recipes/xserver-common$
bitbake -e -b xserver-xorg-conf_0.1.bb | grep ^FILESPATH= | sed
"s/:/\n/g" | wc -l
84
frans@frans-desktop:~/workspace/openembedded.git/recipes/xserver-common$
bitbake -e -b xserver-xorg-conf_0.1.bb | grep ^FILESPATH= | sed
"s/:/\n/g"
FILESPATH="/home/frans/workspace/openembedded.git/recipes/xorg-xserver/xserver-xorg-conf-0.1-r34/local
/home/frans/workspace/openembedded.git/recipes/xorg-xserver/xserver-xorg-conf-0.1-r34/ixp4xxbe
/home/frans/workspace/openembedded.git/recipes/xorg-xserver/xserver-xorg-conf-0.1-r34/angstrom
/home/frans/workspace/openembedded.git/recipes/xorg-xserver/xserver-xorg-conf-0.1-r34/linux-gnueabi
/home/frans/workspace/openembedded.git/recipes/xorg-xserver/xserver-xorg-conf-0.1-r34/armeb
/home/frans/workspace/openembedded.git/recipes/xorg-xserver/xserver-xorg-conf-0.1-r34/build-linux
/home/frans/workspace/openembedded.git/recipes/xorg-xserver/xserver-xorg-conf-0.1-r34/fail-fast
/home/frans/workspace/openembedded.git/recipes/xorg-xserver/xserver-xorg-conf-0.1-r34/pn-xserver-xorg-conf
/home/frans/workspace/openembedded.git/recipes/xorg-xserver/xserver-xorg-conf-0.1-r34/armv5teb
/home/frans/workspace/openembedded.git/recipes/xorg-xserver/xserver-xorg-conf-0.1-r34/Unknown
/home/frans/workspace/openembedded.git/recipes/xorg-xserver/xserver-xorg-conf-0.1-r34/libc-glibc
/home/frans/workspace/openembedded.git/recipes/xorg-xserver/xserver-xorg-conf-0.1-r34
/home/frans/workspace/openembedded.git/recipes/xorg-xserver/xserver-xorg-conf-0.1/local
/home/frans/workspace/openembedded.git/recipes/xorg-xserver/xserver-xorg-conf-0.1/ixp4xxbe
/home/frans/workspace/openembedded.git/recipes/xorg-xserver/xserver-xorg-conf-0.1/angstrom
/home/frans/workspace/openembedded.git/recipes/xorg-xserver/xserver-xorg-conf-0.1/linux-gnueabi
/home/frans/workspace/openembedded.git/recipes/xorg-xserver/xserver-xorg-conf-0.1/armeb
/home/frans/workspace/openembedded.git/recipes/xorg-xserver/xserver-xorg-conf-0.1/build-linux
/home/frans/workspace/openembedded.git/recipes/xorg-xserver/xserver-xorg-conf-0.1/fail-fast
/home/frans/workspace/openembedded.git/recipes/xorg-xserver/xserver-xorg-conf-0.1/pn-xserver-xorg-conf
/home/frans/workspace/openembedded.git/recipes/xorg-xserver/xserver-xorg-conf-0.1/armv5teb
/home/frans/workspace/openembedded.git/recipes/xorg-xserver/xserver-xorg-conf-0.1/Unknown
/home/frans/workspace/openembedded.git/recipes/xorg-xserver/xserver-xorg-conf-0.1/libc-glibc
/home/frans/workspace/openembedded.git/recipes/xorg-xserver/xserver-xorg-conf-0.1
/home/frans/workspace/openembedded.git/recipes/xorg-xserver/xserver-xorg-conf/local
/home/frans/workspace/openembedded.git/recipes/xorg-xserver/xserver-xorg-conf/ixp4xxbe
/home/frans/workspace/openembedded.git/recipes/xorg-xserver/xserver-xorg-conf/angstrom
/home/frans/workspace/openembedded.git/recipes/xorg-xserver/xserver-xorg-conf/linux-gnueabi
/home/frans/workspace/openembedded.git/recipes/xorg-xserver/xserver-xorg-conf/armeb
/home/frans/workspace/openembedded.git/recipes/xorg-xserver/xserver-xorg-conf/build-linux
/home/frans/workspace/openembedded.git/recipes/xorg-xserver/xserver-xorg-conf/fail-fast
/home/frans/workspace/openembedded.git/recipes/xorg-xserver/xserver-xorg-conf/pn-xserver-xorg-conf
/home/frans/workspace/openembedded.git/recipes/xorg-xserver/xserver-xorg-conf/armv5teb
/home/frans/workspace/openembedded.git/recipes/xorg-xserver/xserver-xorg-conf/Unknown
/home/frans/workspace/openembedded.git/recipes/xorg-xserver/xserver-xorg-conf/libc-glibc
/home/frans/workspace/openembedded.git/recipes/xorg-xserver/xserver-xorg-conf
/home/frans/workspace/openembedded.git/recipes/xorg-xserver/xserver-xorg-conf-0.1/local
/home/frans/workspace/openembedded.git/recipes/xorg-xserver/xserver-xorg-conf-0.1/ixp4xxbe
/home/frans/workspace/openembedded.git/recipes/xorg-xserver/xserver-xorg-conf-0.1/angstrom
/home/frans/workspace/openembedded.git/recipes/xorg-xserver/xserver-xorg-conf-0.1/linux-gnueabi
/home/frans/workspace/openembedded.git/recipes/xorg-xserver/xserver-xorg-conf-0.1/armeb
/home/frans/workspace/openembedded.git/recipes/xorg-xserver/xserver-xorg-conf-0.1/build-linux
/home/frans/workspace/openembedded.git/recipes/xorg-xserver/xserver-xorg-conf-0.1/fail-fast
/home/frans/workspace/openembedded.git/recipes/xorg-xserver/xserver-xorg-conf-0.1/pn-xserver-xorg-conf
/home/frans/workspace/openembedded.git/recipes/xorg-xserver/xserver-xorg-conf-0.1/armv5teb
/home/frans/workspace/openembedded.git/recipes/xorg-xserver/xserver-xorg-conf-0.1/Unknown
/home/frans/workspace/openembedded.git/recipes/xorg-xserver/xserver-xorg-conf-0.1/libc-glibc
/home/frans/workspace/openembedded.git/recipes/xorg-xserver/xserver-xorg-conf-0.1
/home/frans/workspace/openembedded.git/recipes/xorg-xserver/xserver-xorg-conf/local
/home/frans/workspace/openembedded.git/recipes/xorg-xserver/xserver-xorg-conf/ixp4xxbe
/home/frans/workspace/openembedded.git/recipes/xorg-xserver/xserver-xorg-conf/angstrom
/home/frans/workspace/openembedded.git/recipes/xorg-xserver/xserver-xorg-conf/linux-gnueabi
/home/frans/workspace/openembedded.git/recipes/xorg-xserver/xserver-xorg-conf/armeb
/home/frans/workspace/openembedded.git/recipes/xorg-xserver/xserver-xorg-conf/build-linux
/home/frans/workspace/openembedded.git/recipes/xorg-xserver/xserver-xorg-conf/fail-fast
/home/frans/workspace/openembedded.git/recipes/xorg-xserver/xserver-xorg-conf/pn-xserver-xorg-conf
/home/frans/workspace/openembedded.git/recipes/xorg-xserver/xserver-xorg-conf/armv5teb
/home/frans/workspace/openembedded.git/recipes/xorg-xserver/xserver-xorg-conf/Unknown
/home/frans/workspace/openembedded.git/recipes/xorg-xserver/xserver-xorg-conf/libc-glibc
/home/frans/workspace/openembedded.git/recipes/xorg-xserver/xserver-xorg-conf
/home/frans/workspace/openembedded.git/recipes/xorg-xserver/files/local
/home/frans/workspace/openembedded.git/recipes/xorg-xserver/files/ixp4xxbe
/home/frans/workspace/openembedded.git/recipes/xorg-xserver/files/angstrom
/home/frans/workspace/openembedded.git/recipes/xorg-xserver/files/linux-gnueabi
/home/frans/workspace/openembedded.git/recipes/xorg-xserver/files/armeb
/home/frans/workspace/openembedded.git/recipes/xorg-xserver/files/build-linux
/home/frans/workspace/openembedded.git/recipes/xorg-xserver/files/fail-fast
/home/frans/workspace/openembedded.git/recipes/xorg-xserver/files/pn-xserver-xorg-conf
/home/frans/workspace/openembedded.git/recipes/xorg-xserver/files/armv5teb
/home/frans/workspace/openembedded.git/recipes/xorg-xserver/files/Unknown
/home/frans/workspace/openembedded.git/recipes/xorg-xserver/files/libc-glibc
/home/frans/workspace/openembedded.git/recipes/xorg-xserver/files
/home/frans/workspace/openembedded.git/recipes/xorg-xserver/local
/home/frans/workspace/openembedded.git/recipes/xorg-xserver/ixp4xxbe
/home/frans/workspace/openembedded.git/recipes/xorg-xserver/angstrom
/home/frans/workspace/openembedded.git/recipes/xorg-xserver/linux-gnueabi
/home/frans/workspace/openembedded.git/recipes/xorg-xserver/armeb
/home/frans/workspace/openembedded.git/recipes/xorg-xserver/build-linux
/home/frans/workspace/openembedded.git/recipes/xorg-xserver/fail-fast
/home/frans/workspace/openembedded.git/recipes/xorg-xserver/pn-xserver-xorg-conf
/home/frans/workspace/openembedded.git/recipes/xorg-xserver/armv5teb
/home/frans/workspace/openembedded.git/recipes/xorg-xserver/Unknown
/home/frans/workspace/openembedded.git/recipes/xorg-xserver/libc-glibc
/home/frans/workspace/openembedded.git/recipes/xorg-xserver"


