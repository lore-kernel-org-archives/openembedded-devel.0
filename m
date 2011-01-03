Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>) id 1PZrf5-0007WK-Ob
	for openembedded-devel@lists.openembedded.org;
	Mon, 03 Jan 2011 22:09:51 +0100
Received: by fxm17 with SMTP id 17so12785887fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 03 Jan 2011 13:09:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	bh=94jHcAZaHDVYm7uIwfs+agM0fM87uQ4unjGmI1/KMxA=;
	b=bBazuvmeuyJRD1A42CaiaiMk2bqldNjuWPC1Zj2dcuf4tqSbrHT18BeJuy4+AhWEAU
	uj8C8/OKcuL98T5ce4tfH7Na4IFIl7rwp80ifbaowusou+wWVRKEnwzwUXKlaByh1tgC
	zDs0p6PFy+9c8JbwhoG5nXTmtJshuIckZ93l8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	b=aen10F0C6g5YGPSEBj6QpcybJVgQ2sGUXQGFGUCWLLHQ3PBVE3x2XlCwK8qyBEa4TH
	n1s/kCdAEr0U7mvaaJJXn6qm9jJsza7WQqAe8lvzjs1YrD9KpnBtojc5WY1ReKiREqVA
	ravrSHoMw0SDMobfIJycwNNtN8A9J6CTZ7scg=
Received: by 10.223.53.68 with SMTP id l4mr4173403fag.44.1294088969892;
	Mon, 03 Jan 2011 13:09:29 -0800 (PST)
Received: from s42.loc (85-127-155-31.dynamic.xdsl-line.inode.at
	[85.127.155.31])
	by mx.google.com with ESMTPS id l14sm4904456fan.9.2011.01.03.13.09.28
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 03 Jan 2011 13:09:28 -0800 (PST)
Received: from cow by s42.loc with local (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1PZreg-00019w-PW; Mon, 03 Jan 2011 22:09:26 +0100
Date: Mon, 3 Jan 2011 22:09:26 +0100
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110103210926.GE25803@mx.loc>
References: <1294084926-3115-1-git-send-email-rep.dot.nop@gmail.com>
	<1294084926-3115-10-git-send-email-rep.dot.nop@gmail.com>
	<201101032330.21527.roman@khimov.ru>
MIME-Version: 1.0
In-Reply-To: <201101032330.21527.roman@khimov.ru>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH 10/12] busybox: simplify update-rc.d OPT handling
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
X-List-Received-Date: Mon, 03 Jan 2011 21:09:51 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Mon, Jan 03, 2011 at 11:30:21PM +0300, Roman I Khimov wrote:
>В сообщении от Понедельник 03 января 2011 23:02:04 автор Bernhard Reutner-
>Fischer написал:
>> -	if test "x$D" != "x"; then
>> -		OPT="-r $D"
>> -	else
>> -		OPT="-s"
>> -	fi
>> +	[ -n "$D" ] && OPT="-r $D" || OPT="-s"
>
>I have a strong feeling that this is wrong. Yeah, the first one takes up five 
>times more lines but to me it's about five times easier to parse glancing over 
>the recipe.
>
>Also, from what I heard '"x$D" != "x"' tests are the most portable ones.

It is more portable, yes. But given that test(1) is required to support
both -n and -z even in SUSv3 -- and still is in SUSv4 and i doubt this
fact will change anytime soon -- it's sane to assume it works.

ok?


