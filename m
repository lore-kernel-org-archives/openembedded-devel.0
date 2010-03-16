Received: from mail-iw0-f174.google.com ([209.85.223.174])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1NrLyO-0000eQ-Nj
	for openembedded-devel@lists.openembedded.org;
	Tue, 16 Mar 2010 02:53:37 +0100
Received: by iwn4 with SMTP id 4so910751iwn.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Mar 2010 18:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=F9CKa1vsvCzqCx9iOnyqJGTdUsYPWUAHcx5cl4nGxqg=;
	b=QBVrcSdp9/k3+Kkt6B/9qA6KA8tZgyziW+Kk+yq9ha9YiySWFMbH8MnemQwr030WmL
	QuCbUsQpkXsnBvE3r5EVpVWwqcu0enlgGaKNvphONH2cBKAAkWnbJ3OLhIhXI6wECYVn
	rTr7kGz8uwtNDUNxZmxuMByGOGJYwi2XWszgU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=VSbSY/zqaYEV6NfxumaNd/Q1WzTyVy2otMCXqFtD24RHlPuh1E1DOB2fr4rnkhsMln
	UygsPwzYXLsK+MRvbBr9wUMFFhHt318+niTK3TjDrQz2VnRMNR9caRrw9xxh1Y61d170
	o9nN4TqW3m4G+c+sk6BvEYE/VHMq9RABlow/s=
MIME-Version: 1.0
Received: by 10.231.161.138 with SMTP id r10mr725640ibx.34.1268704229780; Mon, 
	15 Mar 2010 18:50:29 -0700 (PDT)
In-Reply-To: <201003160136.25555.holger+oe@freyther.de>
References: <hndr0p$old$1@dough.gmane.org>
	<1268672644-29043-1-git-send-email-valentin.longchamp@epfl.ch>
	<201003160136.25555.holger+oe@freyther.de>
Date: Mon, 15 Mar 2010 18:50:29 -0700
Message-ID: <19c1b8a91003151850hf81a370ha8d4fd1ac3c9464@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.223.174
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] Do not generate NEON code for qt-4.6.2 embedded on armv6
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
X-List-Received-Date: Tue, 16 Mar 2010 01:53:37 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Mar 15, 2010 at 5:36 PM, Holger Hans Peter Freyther
<holger+oe@freyther.de> wrote:
> On Monday 15 March 2010 18:04:04 Valentin Longchamp wrote:
>> http://bugreports.qt.nokia.com/browse/QTBUG-8749
>> Neon code is generated for armv6 processor, where it should be armv7 only.
>> This results in illegal instructions with some of the qt4 libraries.
>>
>> The current solution is not optimal, I just needed a quick fix for my arch
>> and I don't have the needed knowledge in OE to fix it cleanly, but I wanted
>> to point this issue out. But at least other arch (armv5 and armv4) should
>> have the same problem and receive the same fix.
>
> Well... then maybe this should be fixed differently then?

probably disable neon by default in qt build system and only enable it
for  architectures that support
neon  will make it work better with default option set for older arms.
One could also ask compiler
at build time but then it would be autoconf like :)

-Khem

>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


