Received: from [74.125.44.158] (helo=yx-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martunge@googlemail.com>) id 1KXubd-0005bA-0E
	for openembedded-devel@lists.openembedded.org;
	Tue, 26 Aug 2008 11:12:53 +0200
Received: by yx-out-1718.google.com with SMTP id 4so1071722yxp.42
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Aug 2008 02:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:sender
	:to:subject:in-reply-to:mime-version:content-type:references
	:x-google-sender-auth;
	bh=pxvSrFi7bmnTkXJvqD7mCFF7o8R3/boyrSH4nhUgg5I=;
	b=j2uuMr6NFKYesdvVKjUYm28hr0GFNk+JUQ0qqeUItdJYY40+lvyklIrNRr9LtaOdvx
	t5pn+RmLYwKievLgyYTV6DbqHgDNEgilD065RzC2iirQPVI2lTNbPa4Yts7Q70bWOvpe
	3XVuAYl0C/fPBFzJgZGHEgHOrJIEevqLiWLiY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=googlemail.com; s=gamma;
	h=message-id:date:from:sender:to:subject:in-reply-to:mime-version
	:content-type:references:x-google-sender-auth;
	b=GTjPvhWuJfcDkJfkVAurXyKUOSjBqFpjAhHerFGlkt3gbWnhrzizuCfGJvDyOIRbfI
	pi6uxuWm7leE60a3A+I+cNhQ7/PooRLTI5OY8/+oQuDszhnjOxJq+8lih85CApM3mhJ2
	+Qzmp/igMasNg9zK10mh4EDem+jZmNUnnF9MY=
Received: by 10.150.54.1 with SMTP id c1mr8878382yba.62.1219741881770;
	Tue, 26 Aug 2008 02:11:21 -0700 (PDT)
Received: by 10.150.230.14 with HTTP; Tue, 26 Aug 2008 02:11:21 -0700 (PDT)
Message-ID: <96ed81960808260211w42b34224r73ba6cf8a4ea772@mail.gmail.com>
Date: Tue, 26 Aug 2008 11:11:21 +0200
From: "Martin Runge" <martin.runge@web.de>
Sender: martunge@googlemail.com
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <48B370CC.18EC6B.26072@m5-81.163.com>
MIME-Version: 1.0
References: <48B370CC.18EC6B.26072@m5-81.163.com>
X-Google-Sender-Auth: 58b1717fa6e6f098
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Git server did not support http protocol.
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
X-List-Received-Date: Tue, 26 Aug 2008 09:12:53 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi all,

I used openembedded in several companies I worked for a consultant. In all
of them, I was caught behind a firewall ( proxy with login required), too.
By now, we can only use the daily snapshots of the monotone database and
checkout locally.

So supporting git over http(s) additionally would be a great improvement for
us.

I agree that tunneling everything over http is not a good style, but I am
not in the position to change it.

best regards
Martin


2008/8/26 Readon Shaw <xydarcher@163.com>

> Many git servers support http access.
>
> when i git-clone oe's git repository with command:
> git clone http://git.openembedded.net/org.openembedded.dev open
>
> it reports that:
> Cannot get remote repository information.
> Perhaps git-update-server-info needs to be run there?
>
> would it applicapable to support http access of git server?
> i have to access the repository through proxy.
>
>
> Readon Shaw
> xydarcher@163.com
>                 2008-08-26
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

