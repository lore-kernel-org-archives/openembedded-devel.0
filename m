Received: from [209.85.146.180] (helo=wa-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <bgamari.foss@gmail.com>) id 1LiCw4-0003gi-Tf
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Mar 2009 20:20:49 +0100
Received: by wa-out-1112.google.com with SMTP id n7so920963wag.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Mar 2009 12:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:mail-followup-to:references:mime-version:content-type
	:content-disposition:in-reply-to:user-agent;
	bh=NgvBlXhYs0rNwhig7f3tPdQZ+1wUMQFOn8In0mI5h3k=;
	b=HclTGcuLoEb6+0g88H1mYAJwn4q08YExZnEO8YVxtd8qDZ8CWJOG0Ds/yIRw2eVhs3
	0F3YwDcSgLwuL4h00lXqUVmefIzkekjb4gnsYWxgiQSMY1xqEfMxo8N4kXsX8VRyhG2f
	AuzDSreeTEZxR/1P/DTHxeInF+aS0GEdViBhg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:mail-followup-to:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	b=ACIdGWzN6h56ubB4HyRZ600hvfimzMXMJ1JTGQVhshc9VBLVIit/5hLEBmwNKTad7i
	bUE8QiVmU7ZwvlXGlzSUPd5mYRVK02wu+r6/vaAVYJ5Bkb/CxdeANWrhzWpPYwkMoNr/
	OQ2TVz/ArWLPg5xNHSr86VRv/jsgvtyt9ISDg=
Received: by 10.114.124.1 with SMTP id w1mr1060439wac.13.1236972027762;
	Fri, 13 Mar 2009 12:20:27 -0700 (PDT)
Received: from localhost (c-24-61-223-47.hsd1.nh.comcast.net [24.61.223.47])
	by mx.google.com with ESMTPS id y25sm9494311pod.10.2009.03.13.12.20.24
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 13 Mar 2009 12:20:26 -0700 (PDT)
Date: Fri, 13 Mar 2009 15:20:08 -0400
From: Ben Gamari <bgamari.foss@gmail.com>
To: Discussion of the angstrom distribution development
	<angstrom-distro-devel@linuxtogo.org>, 
	openembedded-devel@lists.openembedded.org, beagleboard@googlegroups.com
Message-ID: <20090313192008.GA20581@mercury.localdomain>
Mail-Followup-To: Discussion of the angstrom distribution development
	<angstrom-distro-devel@linuxtogo.org>, 
	openembedded-devel@lists.openembedded.org,
	beagleboard@googlegroups.com
References: <49B5E3B9.70409@gmail.com>
	<1236709292.28500.27.camel@hammer.suse.cz>
	<49B73DC1.5000902@gmail.com>
	<74d0deb30903110117m2de9bd4cvd7bc88501e9c719b@mail.gmail.com>
	<1236760668.4955.5.camel@utx.utx.cz>
MIME-Version: 1.0
In-Reply-To: <1236760668.4955.5.camel@utx.utx.cz>
User-Agent: Mutt/1.5.19 (2009-01-05)
Subject: Re: [Angstrom-devel] Avahi recipe
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
X-List-Received-Date: Fri, 13 Mar 2009 19:20:50 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Mar 11, 2009 at 09:37:48AM +0100, Stanislav Brabec wrote:
> Ben, what will happen, it you remove avahi_0.6.21.bb from the tree?
> Maybe it poisons the dependency checker?

Indeed, after removing all of the avahi recipes other than _0.6.24.bb
things work roughly as expected (i.e. no gtk+). Still 2000 packages with
a few Xorg packages (libsm required by gstreamer, etc), but I probably
just have high expectations. Would it be possible to remove avahi
versions prior to 0.6.24 from the repository?

- Ben



