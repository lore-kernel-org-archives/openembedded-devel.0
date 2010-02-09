Received: from mail-bw0-f226.google.com ([209.85.218.226])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rep.dot.nop@gmail.com>) id 1NeloH-0007dM-GO
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Feb 2010 09:51:08 +0100
Received: by bwz26 with SMTP id 26so425642bwz.27
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Feb 2010 00:48:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=cI2xLCKxl6iLruZbKfj39WYq0zLSEOgIO+gomZ4fo7Q=;
	b=rNCUGQdIr1H7b0KmJBPDpOiDvTcKgujon8pbQV1Jdh3CBmP+6Bbpk6H5CEatXJSWip
	Tq5Jc/72hXanKGOs2LX/2bUTU040g8l4uX/t7jvLV/SblAabYFlsd8N4JGXQhXiJ2PGL
	hczVXYy5yJfYZ2TxuHC8aVVc6WdDxl2QhYa8M=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=oURw8fv0FEekQouCeuupQFrAh1bC6Sn8lIAkDgFcphLfn9YuR7/hnVtGLQ6vVwn8EU
	J72UGWOGWp/hBg/yldnqBgr0CPyaMxdJDVrYrwAGwT6iJJt6Hw2g/TUACnBLMiukuZzl
	u6yz9AiRo6SKov0mffp8If13T74M+AiN+ipdc=
Received: by 10.204.32.206 with SMTP id e14mr353877bkd.45.1265705312837;
	Tue, 09 Feb 2010 00:48:32 -0800 (PST)
Received: from s42.loc ([84.119.103.202])
	by mx.google.com with ESMTPS id 14sm2287420bwz.1.2010.02.09.00.48.31
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 09 Feb 2010 00:48:31 -0800 (PST)
Received: from cow by s42.loc with local (Exim 4.71)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1NelnX-00006V-Pd; Tue, 09 Feb 2010 09:50:19 +0100
Date: Tue, 9 Feb 2010 09:50:19 +0100
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100209085019.GA1663@mx.loc>
References: <1265663673-16312-1-git-send-email-rep.dot.nop@gmail.com>
	<1265663673-16312-2-git-send-email-rep.dot.nop@gmail.com>
	<1265663673-16312-3-git-send-email-rep.dot.nop@gmail.com>
	<1265663673-16312-4-git-send-email-rep.dot.nop@gmail.com>
	<1265663673-16312-5-git-send-email-rep.dot.nop@gmail.com>
	<1265663673-16312-6-git-send-email-rep.dot.nop@gmail.com>
	<1265666186.6761.3.camel@lenovo.internal.reciva.com>
MIME-Version: 1.0
In-Reply-To: <1265666186.6761.3.camel@lenovo.internal.reciva.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.218.226
X-SA-Exim-Mail-From: rep.dot.nop@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH 05/12] no need to set LD nowadays
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
X-List-Received-Date: Tue, 09 Feb 2010 08:51:08 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Feb 08, 2010 at 09:56:26PM +0000, Phil Blundell wrote:
>On Mon, 2010-02-08 at 22:14 +0100, Bernhard Reutner-Fischer wrote:
>>  # Use gcc for linking so LDFLAGS actually makes sense
>> -LD = "${CC} -nostdlib"
>> +#LD = "${CC} -nostdlib"
>>  
>
>Thanks for the patch.  When you say "nowadays", do you know which actual
>versions of busybox this is true for?  Is this definitely correct for

busybox >= 1.4.0 switched to kbuild, i.e.
make CROSS_COMPILE=alpha-linux- EXTRA_CFLAGS=-fwhatever \
EXTRA_LDFLAGS=-Wl,--warn-multiple-gp

For the usual case you'd either set CONFIG_CROSS_COMPILER_PREFIX in the
.config or pass CC down to make.

If you happen to have an odd host compiler then you want those too:
HOSTCC=ccc HOSTCFLAGS="-ieee" make ....

>all the versions that we have in the .dev tree?

It seems that the .dev tree has 1.2.1, 1.2.2, 1.3.1 still in there but
i, personally would strongly advise against using those (same for the
standalone tinylogin, but that's a different thing and not relevant
right now).
>
>Also, if that line is genuinely no longer required, you might as well
>just delete it.  There is no point in leaving commented-out cruft in
>these recipes indefinitely.

The ancient cruft versions made me leave in that comment.


