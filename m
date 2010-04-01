Received: from mail-fx0-f218.google.com ([209.85.220.218])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rep.dot.nop@gmail.com>) id 1NxOrk-0007L8-J0
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Apr 2010 20:11:40 +0200
Received: by fxm10 with SMTP id 10so640242fxm.27
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Apr 2010 11:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:date:from:to:cc
	:subject:message-id:references:mime-version:content-type
	:content-disposition:in-reply-to:user-agent;
	bh=ZOKgQq8ytVBLfU1MKIcE6J+o6Aovts0/aN3iU80YEnI=;
	b=fLXLgTTigqf/tAhFmUKzbSxmAnDKsdq2FBXK7+bFr4/qmX15AZDDA7cU7+0jM1Jgr7
	HEODdVynEwtC+UZfhDoYzazDQqlwintCXHh7FvwzszoutlF2JUwBBhKVn0yLuqLD1vaa
	yaHY0HkZkzxqsNdj0gtwtpx9vmE1ZxaQXN7Hw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=G6Rz4HycX09m+qJ3xmwe776OeQgACG06tR5LLu/C3RqhzrkAqfGTAnINnVKJCMe0n8
	CP//wQKxSr96j0goI5Cjn0LHACMJBRgConQcHHXNnH0BKXIJq105+sEb+kJ8HgbVmudd
	NHBpSsD8GY+PtVH6rEZS/IonH34+Q13zT0dsU=
Received: by 10.223.17.194 with SMTP id t2mr953722faa.101.1270145304089;
	Thu, 01 Apr 2010 11:08:24 -0700 (PDT)
Received: from s42.loc ([84.119.100.188])
	by mx.google.com with ESMTPS id 14sm5801778fxm.13.2010.04.01.11.08.23
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 01 Apr 2010 11:08:23 -0700 (PDT)
Received: from cow by s42.loc with local (Exim 4.71)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1NxP12-0007Gq-6S; Thu, 01 Apr 2010 20:21:16 +0200
Date: Thu, 1 Apr 2010 20:21:16 +0200
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100401182116.GA27613@mx.loc>
References: <t2n46a47f951003312246y97e7b196m59c6d8136580adb0@mail.gmail.com>
	<p2k46a47f951004010909sfb05675bx2ad6274204621bd6@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <p2k46a47f951004010909sfb05675bx2ad6274204621bd6@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.220.218
X-SA-Exim-Mail-From: rep.dot.nop@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=unavailable version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-users@linuxtogo.org
Subject: Re: error building meta-toolchain for powerpc 405
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
X-List-Received-Date: Thu, 01 Apr 2010 18:11:41 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 01, 2010 at 11:09:56AM -0500, Ryan Phillips wrote:

>Patch attached... It looks like gcc-package-sdk needs to have the
>strips be optional.

Apart from the question below, why not just invoke strip once for all of
them?
${TARGET_PREFIX}strip ${D}${prefix}/${TARGET_SYS}/lib/*.so.* || :

just curious..

>                    Is this the correct fix or should libstdc++
>already exist?
>
>Related Commit: 8c4198fc


