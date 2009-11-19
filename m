Received: from mail-bw0-f217.google.com ([209.85.218.217])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rep.dot.nop@gmail.com>) id 1NB96z-0005so-9m
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Nov 2009 16:40:00 +0100
Received: by bwz9 with SMTP id 9so2409605bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Nov 2009 07:38:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=O2OxdvEKdrdOUidlK6fOd36TP/9K51ZgYP42TbmegG4=;
	b=k9/S0JsCG2OeNxZSf09XjUASRDSGhukIvlJKwjQ3xubSVdEAgZqB64etts5ujd4wfE
	IMM7xmDtnKXJSeDLu/ViXU3HfbwN8r04oKrG/NCRrk6mm3nwFEirLBQgVnxw+V4Nf0gd
	0tNO3bC+DGEE1u8/59fGB/i9F2uSyzZAoFk5w=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=YtDyFRwWXsXT3/fDQA2oL2J6w3svDrRdHRyWLjlcRoTCdZqomnSJtl5xRakgSOJOyP
	TjZJJezh08MqfLOdgsRnoZrP1Ht8F17QWULYNupFoe9cJMyw90VQEBrhaezf4nmmfYcb
	RDax7OEGAc/UBGXPV2QT/lzp6B3cvKZDKQADc=
Received: by 10.204.11.6 with SMTP id r6mr166005bkr.29.1258645112381;
	Thu, 19 Nov 2009 07:38:32 -0800 (PST)
Received: from s42.loc (85-127-251-67.dynamic.xdsl-line.inode.at
	[85.127.251.67])
	by mx.google.com with ESMTPS id 31sm804006fkt.31.2009.11.19.07.38.31
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 19 Nov 2009 07:38:31 -0800 (PST)
Received: from cow by s42.loc with local (Exim 4.69)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1NB97U-0001Nk-97; Thu, 19 Nov 2009 16:40:28 +0100
Date: Thu, 19 Nov 2009 16:40:28 +0100
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20091119154028.GS919@mx.loc>
References: <he0ijk$kqa$2@ger.gmane.org> <20091118114113.GC2919@mx.loc>
	<c384c5ea0911180344u7aa5a29ao71528ff23547643e@mail.gmail.com>
	<20091118123012.GD2919@mx.loc>
MIME-Version: 1.0
In-Reply-To: <20091118123012.GD2919@mx.loc>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.218.217
X-SA-Exim-Mail-From: rep.dot.nop@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Revert of 406cd0fee12ad99ba6d6f7d55f743cc4c6697955
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
X-List-Received-Date: Thu, 19 Nov 2009 15:40:00 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Nov 18, 2009 at 01:30:12PM +0100, Bernhard Reutner-Fischer wrote:
>On Wed, Nov 18, 2009 at 12:44:39PM +0100, Leon Woestenberg wrote:
>>Hello Bernhard,
>>
>>On Wed, Nov 18, 2009 at 12:41 PM, Bernhard Reutner-Fischer
>><rep.dot.nop@gmail.com> wrote:
>>> On Wed, Nov 18, 2009 at 11:34:28AM +0100, Koen Kooi wrote:
>>>>Hi,
>>>>
>>>>Since 406cd0fee12ad99ba6d6f7d55f743cc4c6697955 broke all
>>>>glibc-internal-iconv builds and I'm too lazy/stupid to fix it
>>>>properly for uclibc I reverted this commit.
>>>
>>> for unpatched uClibc you could just
>>> TARGET_CPPFLAGS += -D_Exit=_exit
>>>
>>Thanks, and what's the patched uClibc alternative (and where's the
>>patch)? It defines _Exit()?
>
>I suggest to just #define it to _exit, yes.
>(glibc has it as weak alias but i'd prefer to get away with a define),
>like:
>
>_Exit(): define to _exit()

OTOH someone may want to override it locally, so to play safe let's
follow suite:
http://git.uclibc.org/uClibc/commit/?h=0_9_30&id=e4adfdc4128c5909adeefecdaf870e30172922a9


