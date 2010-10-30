Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1PC6OT-0005Iz-R8
	for openembedded-devel@lists.openembedded.org;
	Sat, 30 Oct 2010 10:02:30 +0200
Received: by fxm3 with SMTP id 3so3845967fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 Oct 2010 01:01:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=GB3R6Q5vVDIdCwIUoqgoIOkT5BB0f1IiRtn7LfpEKpc=;
	b=OzU3/OHSjuo1BsV0iOBjCqVpO+5wam9BT/sStlmBUWWHvqwqhkpkZe28QJreRiBT7+
	Sxs6vr4VuQUtkO49hjzNiJkr+phNiC1NwRDwRpGJ+GpDZicArXfHt+8wScOnH8HcH4Mn
	IP64XUhHWPN84nbrf8euD8qH+dkNTyg7fZ1QI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=ddn0PNFZrtW2l1b4RFO0zsp3HGjFBE1dW7VuwjxVEFRkC6/VImMg31LnkdvkYhWLrY
	FjpollpWlsu0/o8lrNr6zy8ZcyrxkFn/TzJ+XSYXrOEOLYyW5aGzE+CAfR82VxqPStj/
	1q36d2BD5gQ+hsmfQIRheMOBIEW086GkiW3bA=
Received: by 10.223.101.206 with SMTP id d14mr4884707fao.128.1288425703657;
	Sat, 30 Oct 2010 01:01:43 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 16sm1452723fal.0.2010.10.30.01.01.42
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 30 Oct 2010 01:01:42 -0700 (PDT)
Date: Sat, 30 Oct 2010 10:01:38 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101030080138.GB3206@jama>
References: <20101029191718.GA27520@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20101029191718.GA27520@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] Toolchain recipes, versions, removal and consolidation
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
X-List-Received-Date: Sat, 30 Oct 2010 08:02:30 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 29, 2010 at 12:17:18PM -0700, Khem Raj wrote:
> Hi
> 
> There are so many versions of toolchain components gcc/binutils/glibc that
> we have in metadata. I would like to reduce the number and keep supporting
> the ones we really use. Right now we have recipes for
> 
> binutils = 2.14.90.0.6,2.14.90.0.7, 2.15.94.0.1, 2.16, 2.16.1, 2.16.91.0.6,
> 2.16.91.0.7, 2.17, 2.17.50.1, 2.17.50.0.5, 2.17.50.0.8, 2.17.50.0.12, 2.18,
> 2.18.50.0.7, 2.18.atmel.1.0.1, 2.19, 2.19.1, 2.19.51, 2.19.51.0.3, 2.20,
> 2.20.1, cvs
> 
> gcc = 3.3.3, 3.3.4, 3.4.3, 3.4.4, 3.4.6, 4.0.0, 4.0.2, 4.1.0, 4.1.1, 4.1.2,
> 4.2.1, 4.2.2, 4.2.3, 4.2.4, 4.3.1, 4.3.2, 4.3.3, 4.3.4, 4.4.1, 4.4.2,
> 4.4.4, 4.5, csl-arm-2007q3, csl-arm-2008q1, csl-arm-2008q3
> 
> glibc = 2.2.5, 2.3.2, 2.3.3, 2.3.5+cvs20050627, 2.5, 2.6.1, 2.9, 2.10.1,
> cvs
> 
> uclibc = 0.9.28, 0.9.29, 0.9.30, 0.9.30.1, 0.9.30.2, 0.9.30.3, 0.9.31, git
> 
> 
> eglibc = 2.9, 2.10, 2.11, 2.12, svn
> 
> They all use common files. So whenever there is a bugfix needed its a very
> hard job to first create a common fix that works across all versions
> secondly verify if it works and I am sure 80% of recipe versions mentioned
> here dont even build
> 
> So I am going to propose to remove most of them which dont build and
> request the distro and machine maintainers to please update the list of
> toolchain components to keep.
> 
> Please voice which versions should we really really keep. This should be a
> set which is buildable and functional.

For me sane-toolchain versions + newer are enough. More users of same
versions will provide better testing and in the end better toolchain for
all.

Regards,

-- 
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


