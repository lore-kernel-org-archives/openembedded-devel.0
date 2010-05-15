Received: from fg-out-1718.google.com ([72.14.220.153])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <michael.lippautz@gmail.com>) id 1ODCti-0007nl-Rf
	for openembedded-devel@lists.openembedded.org;
	Sat, 15 May 2010 10:39:03 +0200
Received: by fg-out-1718.google.com with SMTP id 19so1604317fgg.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 May 2010 01:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:subject:from:to:in-reply-to
	:references:content-type:date:message-id:mime-version:x-mailer
	:content-transfer-encoding;
	bh=enLhbIXmGAcCCjW7SMT3jox5SdWJ1qXDi7myZu1SxVU=;
	b=Dt1nH51Au2k6sLnQhs1wACWOH6OUxVR6V+hoQfGIwC/2vxuP9ygPf+u014p7uh5a13
	H5CJUCul7K6uW5kqbnBJcVXOprzaLCsWyaIAAPu5o00ajE4mViWORtjHtMC+Ggk9RPUO
	h0Fy7VkxUqVuuHgPXLmuDRyFSjWnWXljkzSX8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=subject:from:to:in-reply-to:references:content-type:date:message-id
	:mime-version:x-mailer:content-transfer-encoding;
	b=SAWn0dJe2c3Po1hOdgTucQOsGpLRX1E1zrF3F2mcJ2+wl8KO6etxVnTrUeRBlMavuY
	yc42rMYytNrUBKKK9Y6wEY3KrGViwbvLWCHvLdxWHr5Yl7E/1JrhVF1jD4welaVweJ3o
	D4L1Su5vAkK13cOmhXwLf6FXakCDeQ6a8xlVk=
Received: by 10.87.49.36 with SMTP id b36mr4268011fgk.57.1273912507956;
	Sat, 15 May 2010 01:35:07 -0700 (PDT)
Received: from [192.168.178.115] (85-127-149-110.dynamic.xdsl-line.inode.at
	[85.127.149.110])
	by mx.google.com with ESMTPS id e11sm2699836fga.28.2010.05.15.01.35.06
	(version=SSLv3 cipher=RC4-MD5); Sat, 15 May 2010 01:35:07 -0700 (PDT)
From: Michael Lippautz <michael.lippautz@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1273859746.22943.454.camel@trini-m4400>
References: <AANLkTil89_7H3CIZOSZd9QjKE-Cf6mv5B7xpFCqaM8oM@mail.gmail.com>
	<1273859746.22943.454.camel@trini-m4400>
Date: Sat, 15 May 2010 10:35:48 +0200
Message-ID: <1273912548.4196.2.camel@becca>
Mime-Version: 1.0
X-Mailer: Evolution 2.30.1.2 
X-SA-Exim-Connect-IP: 72.14.220.153
X-SA-Exim-Mail-From: michael.lippautz@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Issues with parallel build? (Was: gtk+native missing dep ?)
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
X-List-Received-Date: Sat, 15 May 2010 08:39:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

> On Fri, 2010-05-14 at 19:47 +0200, Andrea Adami wrote:
> > On Sat, May 8, 2010 at 1:12 PM, Andrea Adami <andrea.adami@gmail.com> wrote:
> > I repeated the build of console-image and gtk+-native always fails
> > using 4 threads.
> > Anyone can confirm?

Have seen such issues using 4 threads in other recipes too (can't
remember the names though)

Seems to be some race condition. (Using Angstrom, dunno if relevant)

Regards,
Michael



