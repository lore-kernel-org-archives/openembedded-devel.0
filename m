Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rep.dot.nop@gmail.com>) id 1OggMM-0000AO-Ay
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Aug 2010 17:58:37 +0200
Received: by bwz10 with SMTP id 10so2908365bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Aug 2010 08:58:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	bh=XNfbgGCvfwyG7TW6gWKoRPAMxA5ars1wQcAyMGqff34=;
	b=eLIFxq/ZzCKcEvoTtXn3tJgfXC+e/8YU0q+YU/90yhK3UiyJpRsuB/iLOu932m/1KS
	opOoldOn0rjdXFBI5vFFyrgQaRGH0zcWMGS04OZovMYHtOeDEiKjPT2/tTHQq7hZnD2Z
	I3S5tbhFbxheVU9ZgXhFurODKSqVqxUTQfAfY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	b=dDEuD0SqYMMw+b7UjMBOKJ6Lh259YQxVbpx52MJdy0B4bBEc7Rc1oeImZ/vL9SUyei
	OFeB0V7H5SbtpvVy+KOmUxRZCdn2mwB7IOZVa029nWTmQqgWFyGy875kayL9C6Rl8fnS
	OgZtkW7BBCTz70lslrUqeFYjlEboncTq/CWGI=
Received: by 10.204.14.71 with SMTP id f7mr6323516bka.200.1280937503886;
	Wed, 04 Aug 2010 08:58:23 -0700 (PDT)
Received: from s42.loc (85-127-241-5.dynamic.xdsl-line.inode.at [85.127.241.5])
	by mx.google.com with ESMTPS id s34sm6048935bkk.13.2010.08.04.08.58.22
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 04 Aug 2010 08:58:23 -0700 (PDT)
Received: from cow by s42.loc with local (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1OggMC-0006sU-Ah; Wed, 04 Aug 2010 17:58:16 +0200
Date: Wed, 4 Aug 2010 17:58:16 +0200
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100804155816.GF28187@mx.loc>
References: <1280929918-23818-1-git-send-email-rep.dot.nop@gmail.com>
	<1280929918-23818-2-git-send-email-rep.dot.nop@gmail.com>
	<201008041807.06239.khimov@altell.ru>
	<20100804142147.GE28187@mx.loc>
	<AANLkTikfcpiAy2RfYEv80GYf67PbNysRw1qN3qiz0KRN@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTikfcpiAy2RfYEv80GYf67PbNysRw1qN3qiz0KRN@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: rep.dot.nop@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 2/3] perl: use only one method all_perl_packages
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
X-List-Received-Date: Wed, 04 Aug 2010 15:59:27 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Wed, Aug 04, 2010 at 07:36:01AM -0700, Chris Larson wrote:
>On Wed, Aug 4, 2010 at 7:21 AM, Bernhard Reutner-Fischer <
>rep.dot.nop@gmail.com> wrote:
>
>> On Wed, Aug 04, 2010 at 06:07:06PM +0400, Roman I Khimov wrote:
>> >В сообщении от Среда 04 августа 2010 17:51:57 автор Bernhard
>> Reutner-Fischer
>> >написал:
>> >> .. to avoid
>> >> ERROR: Error Method already seen: all_perl_packages in' perl_5.8.8.bb'
>> >> now in 'perl_5.10.1.bb'
>> >>
>> >> TODO: error() already prints "ERROR:" so the "Error" in above msg is
>> >> redundant
>> >>
>> >> Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
>> >
>> >What kind of configuration gives you such an error? Never seen that.
>>
>> It was applied by Chris as a5dee57033f7d9987858d2c0514f4e687ece2874
>> >
>> >Although the change itself looks good, I'd only probably rename
>> >perl_helper.inc to plain perl.inc, we can merge more common things between
>> >different perl versions later.
>>
>> fine with me, sure.
>
>
>Thanks for the fix, appreciate it -- I was really surprised to see no
>perl.inc existed yet.

It would be way cool if somebody with write-access could move the
function into some perl.inc and push that change....
Let me know if i'm supposed to send a patch with the correct .inc name
instead.

thanks,


