Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ryan@trolocsis.com>) id 1NxU8D-0003ON-7w
	for openembedded-devel@lists.openembedded.org;
	Fri, 02 Apr 2010 01:49:02 +0200
Received: by gyb11 with SMTP id 11so689676gyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Apr 2010 16:45:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.90.70.4 with HTTP; Thu, 1 Apr 2010 16:45:43 -0700 (PDT)
In-Reply-To: <20100401182116.GA27613@mx.loc>
References: <t2n46a47f951003312246y97e7b196m59c6d8136580adb0@mail.gmail.com>
	<p2k46a47f951004010909sfb05675bx2ad6274204621bd6@mail.gmail.com>
	<20100401182116.GA27613@mx.loc>
Date: Thu, 1 Apr 2010 17:45:43 -0600
Received: by 10.91.161.23 with SMTP id n23mr2435087ago.66.1270165543672; Thu, 
	01 Apr 2010 16:45:43 -0700 (PDT)
Message-ID: <t2m46a47f951004011645p62453346i8af848faea4350b4@mail.gmail.com>
From: Ryan Phillips <ryan@trolocsis.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: ryan@trolocsis.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
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
X-List-Received-Date: Thu, 01 Apr 2010 23:49:02 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Apr 1, 2010 at 12:21 PM, Bernhard Reutner-Fischer
<rep.dot.nop@gmail.com> wrote:
> On Thu, Apr 01, 2010 at 11:09:56AM -0500, Ryan Phillips wrote:
>
>>Patch attached... It looks like gcc-package-sdk needs to have the
>>strips be optional.
>
> Apart from the question below, why not just invoke strip once for all of
> them?
> ${TARGET_PREFIX}strip ${D}${prefix}/${TARGET_SYS}/lib/*.so.* || :
>
> just curious..
>

Great point, your fix does appear to be better. I'm just starting OE
development and still learning the system.

Regards,
Ryan


