Received: from mail-bw0-f217.google.com ([209.85.218.217])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1NAiz5-0004ZR-9P
	for openembedded-devel@lists.openembedded.org;
	Wed, 18 Nov 2009 12:46:06 +0100
Received: by bwz9 with SMTP id 9so1015305bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Nov 2009 03:44:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=pUlhzwidnekyYi/FQdGZY2C5ye0i5tjZNxyFhre2Onk=;
	b=hj7TteimrjF+QkibJLAr/xMydTXfiUXXP59f/cB3pwBM2Ko4CukvFYTqbL4+1JmTgO
	Qa5XpQLipYjl6abMaIwG6SugH0kILa79m7S+0vDM2slinJl4razaBf7t2DA1kW71lT8H
	Ov0gw0hFyKXgPFhCT/3NpkZmbuROvkIGrd3wM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=iKI79gCLXDF4i+3PA/zkc93+MOUN0pXogTKpRagLgQA9UcN4ZRw0MFkqMs/o1VUCoa
	Zd3/mPfB/fqz1rbTQq76veZnDvFwgD4gqT25SheDk34VGML90KYT3l8OC6K0sZqL0Xew
	Ovoy/VikMKSP+5TN+5QrkCQW/BF0Lee2s9q8c=
MIME-Version: 1.0
Received: by 10.239.144.90 with SMTP id n26mr1065354hba.133.1258544679422; 
	Wed, 18 Nov 2009 03:44:39 -0800 (PST)
In-Reply-To: <20091118114113.GC2919@mx.loc>
References: <he0ijk$kqa$2@ger.gmane.org> <20091118114113.GC2919@mx.loc>
Date: Wed, 18 Nov 2009 12:44:39 +0100
Message-ID: <c384c5ea0911180344u7aa5a29ao71528ff23547643e@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.218.217
X-SA-Exim-Mail-From: leon.woestenberg@gmail.com
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
X-List-Received-Date: Wed, 18 Nov 2009 11:46:06 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello Bernhard,

On Wed, Nov 18, 2009 at 12:41 PM, Bernhard Reutner-Fischer
<rep.dot.nop@gmail.com> wrote:
> On Wed, Nov 18, 2009 at 11:34:28AM +0100, Koen Kooi wrote:
>>Hi,
>>
>>Since 406cd0fee12ad99ba6d6f7d55f743cc4c6697955 broke all
>>glibc-internal-iconv builds and I'm too lazy/stupid to fix it
>>properly for uclibc I reverted this commit.
>
> for unpatched uClibc you could just
> TARGET_CPPFLAGS += -D_Exit=_exit
>
Thanks, and what's the patched uClibc alternative (and where's the
patch)? It defines _Exit()?

Maybe that's better for OE.

Regards,
-- 
Leon


