Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rep.dot.nop@gmail.com>) id 1OMom2-0006Ek-UB
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Jun 2010 22:54:55 +0200
Received: by bwz14 with SMTP id 14so99808bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Jun 2010 13:50:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:date:from:to:cc
	:subject:message-id:references:mime-version:content-type
	:content-disposition:in-reply-to:user-agent;
	bh=fbYgu1Zg22+RxYD0bQ6MRqbM+4QBYMS2fs6Y5yD1/hk=;
	b=FyUocVItpeM5pA9gcRDUkSL+Z2BUxkNHCvctFUCxQfHF69a6gjihYQIztoQYY/o3DW
	uJfrXkdcBafVqQfN2ndPqkGP/UBEBUDW5nZVnQASAsYa/XAK36a27hCaN4Xq7h50oAQV
	4F/C6SnivQFcRHCrXnaekkrvNcY3xK7ejTsUg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=ED+yCX70dbbt/JSDwWpElA6Ot6W0SjBdg7b7MOust9QLpCr9F6qqQQPatpSj2wzDZl
	KA16RApkYPUahyqpoeuhIqZvhZfM4RlZzxrsCtR8dwWXofcvu4Fc9Kqpj4U/mdFbuyHA
	mxnxQPXWJbL9sNK8l6x2bBzYwE2/WF5v40Fzg=
Received: by 10.204.83.211 with SMTP id g19mr567278bkl.44.1276203029700;
	Thu, 10 Jun 2010 13:50:29 -0700 (PDT)
Received: from s42.loc (85-127-249-17.dynamic.xdsl-line.inode.at
	[85.127.249.17])
	by mx.google.com with ESMTPS id z17sm1576282bkx.18.2010.06.10.13.50.28
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 10 Jun 2010 13:50:28 -0700 (PDT)
Received: from cow by s42.loc with local (Exim 4.71)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1OMoi1-0000LR-0M; Thu, 10 Jun 2010 22:50:41 +0200
Date: Thu, 10 Jun 2010 22:50:40 +0200
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100610205040.GW14941@mx.loc>
References: <1276114963.4424.42.camel@lenovo.internal.reciva.com>
	<1276199208-31929-2-git-send-email-rep.dot.nop@gmail.com>
	<AANLkTin367SqiCodgs_CxGiwAihL-SI0nlCJKUWqUZjq@mail.gmail.com>
	<1276201371.13179.20.camel@lenovo.internal.reciva.com>
	<AANLkTinAFdiBJ6jN3WwY75KsNwTPmkyoOL0iTgJ8UPFC@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTinAFdiBJ6jN3WwY75KsNwTPmkyoOL0iTgJ8UPFC@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: rep.dot.nop@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 2/2] busybox: configure according to {MACHINE, DISTRO}_FEATURES
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
X-List-Received-Date: Thu, 10 Jun 2010 20:54:56 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 10, 2010 at 01:27:36PM -0700, Chris Larson wrote:
>On Thu, Jun 10, 2010 at 1:22 PM, Phil Blundell <philb@gnu.org> wrote:

>> If you start factoring MACHINE_FEATURES into that kind of decision then,
>> logically, the package needs to have PACKAGE_ARCH=${MACHINE}.  I don't
>> think it would be a very good thing to start forcing packages down that
>> path unnecessarily.

This is unavoidable for certain special setups, isn't it.
>
>
>Fair enough, that seems reasonable for this particular case.  Now that you
>bring it up, we adjust package arch to machine when we use a machine
>specific file:// file, but maybe we need to teach it to check for references
>to MACHINE_FEATURES or COMBINED_FEATURES, somehow.

Both mmu and floatingpoint will need to look at COMBINED_FEATURES.
At least for mmu vs. !mmu PACKAGE_ARCH=${MACHINE} is unavoidable, no?


