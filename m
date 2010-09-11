Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OuMFv-0003f5-Mz
	for openembedded-devel@lists.openembedded.org;
	Sat, 11 Sep 2010 11:20:25 +0200
Received: by iwn2 with SMTP id 2so3089961iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Sep 2010 02:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=HdTogZ4mXVSMqOOl2d3ljA2Oa6+Ps1jVnQpRX78nyGU=;
	b=SIdw9/T/pvgrOjATXlb76wNSRm2luaduGPlnwrR1mWP+3DK9u0lffAUrGDDnDk1+M0
	9WqZg96vkm4uGhhMvMYDuzGTryBVsk0l7zHJcVpCazGEiGUPNM+eZrKkfdfvjwRiPaDO
	cf9MrASr+X6M5p1RzZvg4WczOiod7ZPTy1DYg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=XbkBA5mcKnzRYEq145xz2VRsA416nYlmObJLopxxzzuXZCBL102l9DKQMNZ0+O6kX+
	qnTQ4x89u7xwGlqHp7vnX2kkAJlT2YS0fRY9q9GE3QF20ofovfR/RkonAF2KwfoJm4+Z
	I1EXWUI44ioMvMY3IUkMxk1/wIiso3NiueuFU=
MIME-Version: 1.0
Received: by 10.231.190.75 with SMTP id dh11mr2400691ibb.189.1284196772636;
	Sat, 11 Sep 2010 02:19:32 -0700 (PDT)
Received: by 10.231.208.17 with HTTP; Sat, 11 Sep 2010 02:19:32 -0700 (PDT)
In-Reply-To: <20100910204307.GP28148@denix.org>
References: <20100903111210.GA17702@game.jcrosoft.org>
	<1283570085-11968-1-git-send-email-plagnioj@jcrosoft.com>
	<AANLkTim57opnM=fn47pQ-GeNsNbSyydHd3TKSWhdD5z5@mail.gmail.com>
	<AANLkTikyFRQskds_P9AH+=_km46KEf1cPm-Vq1+MhdhC@mail.gmail.com>
	<131E5DFBE7373E4C8D813795A6AA7F080310BFA4A2@dlee06.ent.ti.com>
	<AANLkTik599XZfY1Abq+gdDqGSOOLnqHUiqL1VVK9Rh87@mail.gmail.com>
	<20100910185711.GG28148@denix.org> <4C8A95E7.7070403@mentor.com>
	<20100910204307.GP28148@denix.org>
Date: Sat, 11 Sep 2010 11:19:32 +0200
Message-ID: <AANLkTikXECs3BmKwUBPLM80zcLFV1W6Ppi1drDU_PhB8@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] rename SOC_FAMILY to TARGET_SOC_FAMILY and make it global
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
X-List-Received-Date: Sat, 11 Sep 2010 09:20:27 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/9/10 Denys Dmytriyenko <denis@denix.org>:
> On Fri, Sep 10, 2010 at 01:32:39PM -0700, Tom Rini wrote:
>> Denys Dmytriyenko wrote:
>>> On Wed, Sep 08, 2010 at 07:58:39AM +0200, Frans Meulenbroeks wrote:
>>>> 2010/9/7 Maupin, Chase <chase.maupin@ti.com>:

>
> Yes, pushing Chase's patch for documentation update is on my TODO list for
> later today - I'm giving people last chance to comment...

Thanks alot!

>
> I agree, updating documentation is very desirable, no objections here. I was
> merely commenting on Frans' note here, giving some background:
>
>>>> Hi Chase,
>>>> I see you indeed as the submitter. The commit carries your name and
>>>> there is no reference in the commit message of another author.

Actually I was not really aware of SOC_FAMILY existing already.
I was triggered by this message which hinted Chase was the owner:
http://thread.gmane.org/gmane.comp.handhelds.openembedded/35141/focus=35236
(and there was no ref to the patch you mentioned).

Anyway, it is documented and that is good!

Frans


