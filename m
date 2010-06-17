Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rep.dot.nop@gmail.com>) id 1OPKzS-0004sI-90
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 Jun 2010 21:43:07 +0200
Received: by fxm18 with SMTP id 18so228639fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Jun 2010 12:38:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=ROrVxoJwpX2xVIHfex+RIBofQOAWtDdKxkYgQ6ofZy4=;
	b=PTZUgbbhBabGcYZ63uxb2nW2XumSVhP+SzepaxXL+46QA3tH6ox2sDWyWk5COy/86F
	tHDXQwTXfQjcb6l0m3GxTer9gVO66HqcY6rJq2XEKPe3AYk7ECoDdL2+dXMnOg9Dcmwb
	vvwm+L/mfPKL4TI046k6vTJCkPIIr3Q+ERI8k=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=SABlpwZzKOrBGzBCSdBl9gpQfseNs6zXI45hDXx/SniwKMo10fA1JKf4JnGehofMnO
	NA3qWeKCwQjRsgS8OXywDm7a5glqldz5OphKUQTbLxt9tuKYxTLFG9r9DpQfnpGegEXl
	v5jWs5gXx3mOeFjxbkiy12zPBbubImXUl2bPY=
Received: by 10.204.48.195 with SMTP id s3mr8175601bkf.195.1276803515742;
	Thu, 17 Jun 2010 12:38:35 -0700 (PDT)
Received: from s42.loc ([84.119.101.18])
	by mx.google.com with ESMTPS id jx10sm1148814bkb.9.2010.06.17.12.38.34
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 17 Jun 2010 12:38:34 -0700 (PDT)
Received: from cow by s42.loc with local (Exim 4.71)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1OPKvG-0000rx-68; Thu, 17 Jun 2010 21:38:46 +0200
Date: Thu, 17 Jun 2010 21:38:46 +0200
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100617193846.GC14941@mx.loc>
References: <AANLkTilQUwinqS2HGJJzP3t_UTmXtH9daLEiN_fek-6i@mail.gmail.com>
	<AANLkTikBqtzPB0rBp1DQ4Ekzo40HeAJcX1q7i1mLFaWy@mail.gmail.com>
	<AANLkTim1FUHwT6lBvu2yoUUM8rvYRSaw-9e4VE_olNoa@mail.gmail.com>
	<AANLkTilzhsHsHj4f-bd4FcB7Ka7fRspYX0iUsMxxzVuz@mail.gmail.com>
	<AANLkTikK720KNmNjRKr6x12-kSben4t42KlmgHsSGEpS@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTikK720KNmNjRKr6x12-kSben4t42KlmgHsSGEpS@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: rep.dot.nop@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: OSError: [Errno 2] No such file or directory
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
X-List-Received-Date: Thu, 17 Jun 2010 19:43:07 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 17, 2010 at 12:11:52PM -0700, Khem Raj wrote:
>On Thu, Jun 17, 2010 at 5:39 AM, nikunj badjatya
><nikunjbadjatya@gmail.com> wrote:
>> /home/nikunj/ope/openembedded/recipes/coreutils/coreutils-native_8.5.bb,
>> do_populate_sysroot)
>> NOTE: Testing
>> /home/nikunj/ope/build/tmp/work/i686-linux/coreutils-native-8.5-r0/sysroot-destdir///home/nikunj/ope/build/tmp/sysroots/i686-linux/usr/bin/sleep
>> for relocatability

>Does  /home/nikunj/ope/build/tmp/work/i686-linux/coreutils-native-8.5-r0/sysroot-destdir///home/nikunj/ope/build/tmp/sysroots/i686-linux/usr/bin/sleep
>exist ?

huh? How would that supposed to be ok?
Looks like home is leaking into some prefix, no?
We should have a sanity for that one i suppose..

Feb 14 22:25:04 <me> does anybody else see /home in their staging dir or did i goof up somehow?
Feb 14 22:26:24 <me> would be nice if sanity would yell at /root and /home in the staging dir..

where /home == something in BBPATH, without looking into details.


