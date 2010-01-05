Received: from mail-fx0-f212.google.com ([209.85.220.212])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1NSE2t-0004aI-Hf
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Jan 2010 19:22:22 +0100
Received: by fxm4 with SMTP id 4so13732623fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Jan 2010 10:20:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=ayR8hvFHP4iL5V51N6iDx58knxNQE2VN5b6XYQOFFJI=;
	b=bsOVBbsHcYhJZnQmX1gV85JkPmLkruApGQBf820FKvUySkDa2RV7HZt4fIQhPRNfOe
	QRUUEbat0MlC5oBes4m6FN4nQAe4gn7FKvzAcqAMNDKvrOFvzvsFoeTt/4YjbgJUm4Nh
	YoDS0yYm1xcsiibPk5Xr+n/AaVy6a8LU1HlvQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=iIcBLI1JRJ1jyGM1qlsrlYD+iCugGG+qr9bSFmiig8qCaWWL69tqU6AdUvNWXM/HD+
	c0Z8JoOyJhoe6nGyYSn+NE8kyhPYIwxWZ+EZkLhkBYa/at9radgZCMRkzV0QL1IzpCRA
	wxpKWzNy08iJQGkJDakq3EI9pUXW4T4Ng222M=
Received: by 10.102.204.5 with SMTP id b5mr5254446mug.113.1262715615956;
	Tue, 05 Jan 2010 10:20:15 -0800 (PST)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id i7sm13279247mue.16.2010.01.05.10.20.13
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 05 Jan 2010 10:20:15 -0800 (PST)
Date: Tue, 5 Jan 2010 10:20:44 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100105182044.GB21048@gmail.com>
References: <325d766d1001050900y3eef724eu5eb68fc04ec969d7@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <325d766d1001050900y3eef724eu5eb68fc04ec969d7@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.220.212
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Error building gcc-cross
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
X-List-Received-Date: Tue, 05 Jan 2010 18:22:22 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (05/01/10 18:00), martin mangard wrote:
> hello
> 
> I wanna run an application which depends on libstdc++.so.5.   I use
> the default x86-machine configuration (i486) of the
> "org.openembedded.dev" branch  to build the image. The default
> provider for the libstdc++ is in my case "gcc-cross_4.3.4.bb" which
> successfully builds "libstdc++.so.6"
> 
> I would like to create a  libstdc++ -compatibility package which
> provides an additional  binary of the older version of libstdc++.
> I started to play with the gcc-cross recipe.   "bitbake -b
> gcc-cross_3.4.4.bb"  leaded to the following error.


gcc 3.4 will not build libstdc++.so.5. You have to use gcc 3.3
try to build one of those. They may be rusted over a long time.
You can also take a prebuild ipk 

Thanks

-Khem



