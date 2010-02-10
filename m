Received: from mail-bw0-f226.google.com ([209.85.218.226])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rep.dot.nop@gmail.com>) id 1NfFnO-0002MB-5O
	for openembedded-devel@lists.openembedded.org;
	Wed, 10 Feb 2010 17:52:13 +0100
Received: by bwz26 with SMTP id 26so209457bwz.27
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Feb 2010 08:49:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=/thHkpEamLCFgfkSFhOtsuiAeUbJKiVPR6/ZB26H2e4=;
	b=JRF7LkMirNQjl0pxjvzX+ayfjtI3XltadQvQRX5SIznWo/lC7p/m1oMCnW0nQjIEja
	UF8qrxJ95Pr0HlKOfhwcet8WwQG7iYtSr6i1/Z7DqMLePAapOMOPdDyR6tGFrqpcmi0B
	fS4pNJWUivBnCAtPfkBDKcDb/t49o9tIoq5Y0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=LEaTJGE9oVKQbbw+8zL/rRvOeipuOvzThT7QdhZ4tafejO6zXgFQlQ/i0LPnOp6NNT
	1XjYgXjIh1TWFdoIUdbN4ivv0pcKrknklfyYiQ8mb8Km5d9r/g0otE1FSUSlnmojQZ9F
	bz1K9r4ICqufsjo+256fVceYMiIA+FCgVCnP0=
Received: by 10.204.6.203 with SMTP id a11mr346414bka.33.1265820576462;
	Wed, 10 Feb 2010 08:49:36 -0800 (PST)
Received: from s42.loc ([84.119.103.202])
	by mx.google.com with ESMTPS id 16sm645275bwz.7.2010.02.10.08.49.33
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 10 Feb 2010 08:49:34 -0800 (PST)
Received: from cow by s42.loc with local (Exim 4.71)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1NfFmu-0003f2-UA; Wed, 10 Feb 2010 17:51:40 +0100
Date: Wed, 10 Feb 2010 17:51:40 +0100
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100210165140.GC13636@mx.loc>
References: <1265663673-16312-1-git-send-email-rep.dot.nop@gmail.com>
	<1265663673-16312-2-git-send-email-rep.dot.nop@gmail.com>
	<1265663673-16312-3-git-send-email-rep.dot.nop@gmail.com>
	<1265663673-16312-4-git-send-email-rep.dot.nop@gmail.com>
	<1265663673-16312-5-git-send-email-rep.dot.nop@gmail.com>
	<1265716695.3777.633.camel@mill.internal.reciva.com>
MIME-Version: 1.0
In-Reply-To: <1265716695.3777.633.camel@mill.internal.reciva.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.218.226
X-SA-Exim-Mail-From: rep.dot.nop@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH 04/12] matchbox-panel-2: fix DEPENDS
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
X-List-Received-Date: Wed, 10 Feb 2010 16:52:13 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Feb 09, 2010 at 11:58:15AM +0000, Phil Blundell wrote:
>On Mon, 2010-02-08 at 22:14 +0100, Bernhard Reutner-Fischer wrote:
>> libacpi has no recipe as opposed to acpid
>> 
>> Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
>> ---
>>  recipes/matchbox2/matchbox-panel-2_svn.bb |    2 +-
>>  1 files changed, 1 insertions(+), 1 deletions(-)
>
>Um, really?  I do seem to have a recipe for libacpi in my tree.

Oh, there was none in september. I withdraw this patch (and sorry for
not re-checking. Will do from now on..)

Thanks,


