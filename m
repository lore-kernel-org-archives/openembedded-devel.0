Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rep.dot.nop@gmail.com>) id 1OgenA-0003kg-UX
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Aug 2010 16:18:10 +0200
Received: by fxm12 with SMTP id 12so2486775fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Aug 2010 07:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	bh=nKbGwLrDdAUYTcA0DBWRd5g7ZJClF+IdTyLGccBKc5Q=;
	b=eh4Jnys33Lpvg4/GkeLvdQkgxK9T2IzTze2CTbFkMvjuKLHUBiEodpcHYYjkcgMBPK
	McNdicP84tKNr8ebGwFHnM14HfCT4hRSH1frGwA2iepkTGJwvuKgCABrohg5Rcat0enD
	XT6EalMvOnGNPqEFXcWbfgXZ6EjG00O4WcvZs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	b=B9tVYz2CECIEDO3g2Z0h4rlD8oxnkd6uAgwQPa8KdFHSAa5qwvGPaFsZImwhkNgwlS
	3ITOStN/VtgkC4IeD17TVXmTDo4Pp5nYvXrlxBtZiCEfp+gniE6++Zkf+zc7HoBTNQwS
	ze6NVtXtV9EQ6uN9abpklINhzWyS/Sjoudcxw=
Received: by 10.223.118.211 with SMTP id w19mr2360591faq.19.1280931474726;
	Wed, 04 Aug 2010 07:17:54 -0700 (PDT)
Received: from s42.loc (85-127-241-5.dynamic.xdsl-line.inode.at [85.127.241.5])
	by mx.google.com with ESMTPS id r5sm2982328faq.32.2010.08.04.07.17.53
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 04 Aug 2010 07:17:54 -0700 (PDT)
Received: from cow by s42.loc with local (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1Ogemy-0006MT-3y; Wed, 04 Aug 2010 16:17:48 +0200
Date: Wed, 4 Aug 2010 16:17:48 +0200
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100804141748.GC28187@mx.loc>
References: <1280929918-23818-1-git-send-email-rep.dot.nop@gmail.com>
	<201008041802.01481.khimov@altell.ru>
MIME-Version: 1.0
In-Reply-To: <201008041802.01481.khimov@altell.ru>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: rep.dot.nop@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 1/3] perl: honour DISTRO_FEATURE largefile
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
X-List-Received-Date: Wed, 04 Aug 2010 14:18:13 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Wed, Aug 04, 2010 at 06:02:01PM +0400, Roman I Khimov wrote:
>В сообщении от Среда 04 августа 2010 17:51:56 автор Bernhard Reutner-Fischer 
>написал:
>> Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
>> ---
>>  recipes/perl/perl-native_5.8.8.bb |    4 ++--
>>  recipes/perl/perl_5.8.8.bb        |    6 ++++--
>>  2 files changed, 6 insertions(+), 4 deletions(-)
>
>Is it really appropriate for -native? And how about Perl 5.10.1?

it's perfectly fine to build on a uclibc-based host with LFS off.
Dunno about 5.10.1, it has a default preference of -1


