Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rep.dot.nop@gmail.com>) id 1OHv8S-00020v-OV
	for openembedded-devel@lists.openembedded.org;
	Fri, 28 May 2010 10:41:45 +0200
Received: by fxm9 with SMTP id 9so700068fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 May 2010 01:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=Dulxt7SOUudQNFhQKWyK2ia4rjgn7AILcX345TEzDM4=;
	b=LR4lFG4a/XGryvtot44pbSSWYz+4oJzttNjzUeOcS2EcnxUhBjhOc/7TZBDANx6HrV
	TaWjrqHpNXcNRDzRrEV0V3sGDiW3HhzmfqdiRF2bUl9/xUErnAe+nUEC/aQLvw1EBpjx
	S+npwpAcVg75wlbArLLLiovpxBCwHm+LkpATw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=oSm4F8wjSl6MQH92UtuU4LOKTl/9cEPBjdpVwsy717IKODvXGkdwt31nVI6hyS34c6
	Hra7lAl3w/djFcAFKcIHyzgBNR/n5qbqBuOBSZeh4Djtd2uzxoCpGJUYD01Mz29betx1
	fn6BcA/xHy59XyrsVfJC8aCDj5ex2XA1Um9hA=
Received: by 10.204.5.140 with SMTP id 12mr5302044bkv.34.1275035855214;
	Fri, 28 May 2010 01:37:35 -0700 (PDT)
Received: from s42.loc (85-127-94-237.dynamic.xdsl-line.inode.at
	[85.127.94.237])
	by mx.google.com with ESMTPS id d5sm9444108bkd.13.2010.05.28.01.37.32
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 28 May 2010 01:37:33 -0700 (PDT)
Received: from cow by s42.loc with local (Exim 4.71)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1OHv4Q-0005dE-4e; Fri, 28 May 2010 10:37:34 +0200
Date: Fri, 28 May 2010 10:37:34 +0200
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100528083734.GA20685@mx.loc>
References: <1265832780-19939-7-git-send-email-rep.dot.nop@gmail.com>
	<1265832780-19939-8-git-send-email-rep.dot.nop@gmail.com>
	<1265832780-19939-9-git-send-email-rep.dot.nop@gmail.com>
	<1265892781.3777.1050.camel@mill.internal.reciva.com>
	<20100213125146.GJ10632@mx.loc> <20100213161449.GD30265@mx.loc>
	<1267058975.18176.527.camel@trini-m4400>
	<1267094388.4243.1.camel@rex>
	<1267118467.18176.533.camel@trini-m4400>
	<1267128981.4243.88.camel@rex>
MIME-Version: 1.0
In-Reply-To: <1267128981.4243.88.camel@rex>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: rep.dot.nop@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: BBCLASSEXTEND canadian?
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
X-List-Received-Date: Fri, 28 May 2010 08:41:45 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Feb 25, 2010 at 08:16:21PM +0000, Richard Purdie wrote:
>On Thu, 2010-02-25 at 10:21 -0700, Tom Rini wrote:
>> > BBCLASSEXTEND covers -native and -nativesdk
>> 
>> Is the -nativesdk part implicit in the anonfuncs in nativesdk.bbclass or
>> just not merged yet?
>
>It should be implicit in the anonfuncs. If that class differs to Poky,
>the Poky changes should be merged though.
>
>> > The -cross, -crosssdk, -canadian-cross and other combinations usually
>> > have too many differences to be worth the effort although it would be
>> > possible to make them work.
>> 
>> I'm not so sure about that, but we'll see.  I should have some form of
>> canadian stuff working again shortly.
>
>You're unsure it would be possible to make them work of that its not
>worth the effort?

Tom?

Yesterday evening i was building a pristine master reference again and
saw that mpfr et al are (still) pretty outdated.
AFAIR i cannot mix BBCLASSEXTEND vs. old-fashioned recipes for one
package (didn't try if that's still true) so i'm, again, running into
the issue of what to do with older toolchains needing that canadian
stuff. I'm not too jazzed about the idea to touch the old toolchains
just because i want to have current gmp/mpc/mpfr/gcc (using CLASSEXTEND
nativesdk). So, how to proceed?

cheers,


