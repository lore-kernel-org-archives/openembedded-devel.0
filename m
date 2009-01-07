Received: from [209.85.218.15] (helo=mail-bw0-f15.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <norguhtar@gmail.com>) id 1LKd2O-0005kh-JE
	for openembedded-devel@lists.openembedded.org;
	Wed, 07 Jan 2009 19:21:59 +0100
Received: by bwz8 with SMTP id 8so20029710bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Jan 2009 10:15:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:in-reply-to:mime-version:content-type:references;
	bh=r8pDe11UQyYPunqfudCYFn/ifvrSCB+iDzTfjbte5Xk=;
	b=WRGQ2WeQmYpaMUwxsCsDNYGwZtkFaTQAH5qjPZ8kDGyiOQBgWEUcHods5Ee/DxdqE7
	KGAJJ1JVy081UBLJ3kjOtWRG0PQhWOzrjpUZ8m+3bPkGaBy8RtwSNrAljaO3yRlh9C1o
	gbeG4o4kWThZEeOrjarWFFHnfXt6dcG2C/XpI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:in-reply-to:mime-version
	:content-type:references;
	b=XFgCKERINZbOebrsPp/AfqyQbggEC+JDUNNRkrKW7rqAIR0/6qeSDPbJqB4d2nMpjR
	dAFhww1JcNcXcvE5cEziUQlQS4s8W+5rQ0W3jXzzDb82bd2RDPyf9rBr4VLgstHqlMSt
	ifWQKESST6cKLNKZCFwZ9YGp7SykjdECG4iNw=
Received: by 10.103.182.3 with SMTP id j3mr8392596mup.107.1231352134335;
	Wed, 07 Jan 2009 10:15:34 -0800 (PST)
Received: by 10.103.24.16 with HTTP; Wed, 7 Jan 2009 10:15:34 -0800 (PST)
Message-ID: <1fea892d0901071015o27499ed3ydf97bea8986aaee5@mail.gmail.com>
Date: Wed, 7 Jan 2009 23:15:34 +0500
From: "Anatoly Shipitsin" <norguhtar@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1231350193.5331.37.camel@dax.rpnet.com>
MIME-Version: 1.0
References: <1fea892d0901070846h7e3dc5cn4263adbac0252596@mail.gmail.com>
	<1231350193.5331.37.camel@dax.rpnet.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Double defines FILESPATH
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
X-List-Received-Date: Wed, 07 Jan 2009 18:22:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wed, Jan 7, 2009 at 22:43, Richard Purdie <rpurdie@rpsys.net> wrote:

>
> This is actually on my list of things to clean up in OE, I already did
> in Poky. The one to remove is the one in bitbake.conf as the
> base.bbclass one always replaces it.
>
> Why not from base.bbclass? Extendible in local.conf FILESPATH usable.
For example i can define my own patch for kernel defconfig.

