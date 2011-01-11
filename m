Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>) id 1Pck6C-00062X-Kt
	for openembedded-devel@lists.openembedded.org;
	Tue, 11 Jan 2011 20:41:44 +0100
Received: by fxm17 with SMTP id 17so19489217fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jan 2011 11:41:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	bh=9WPdsYEx3DzL7xhDr5+F59FcRQGcul/QOqYtKqrenuM=;
	b=H7onEUXQTejd9WsHFjklANFwNZehU1dhe4OSrchmWuQsw80hYtgRCYPpNId7llw6kL
	z3bWVHd6wjEmVR+dHGbJouaQYQ/n1GsYJwieBM/Jpnf063M9Y/G2rTXqMQrawS3775I3
	HdwPafnnNooSbyX4RzJZISfOFV0n8CrKOtSHk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	b=tVKWRU7X71LHoVS5qHnyXbqLp5IsHWn2eXacDmh0AptBprMht2oBuj+m8fT8JN5Opo
	OpH6owWwy6OWjvqt1bwM3G3CNSEgLW0bGPGRZ9+85qhOUUYK0cfK2anjYMEgvezooZXx
	1N8Xxj7A2gPOfyAa2jUQOGaquSv6gCqoRavQc=
Received: by 10.223.72.14 with SMTP id k14mr33933faj.45.1294774873384;
	Tue, 11 Jan 2011 11:41:13 -0800 (PST)
Received: from s42.loc (85-127-155-31.dynamic.xdsl-line.inode.at
	[85.127.155.31])
	by mx.google.com with ESMTPS id a2sm7547824faw.46.2011.01.11.11.41.11
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 11 Jan 2011 11:41:11 -0800 (PST)
Received: from cow by s42.loc with local (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1Pck5e-0001r0-6f; Tue, 11 Jan 2011 20:41:10 +0100
Date: Tue, 11 Jan 2011 20:41:10 +0100
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110111194110.GC6584@mx.loc>
References: <1294084926-3115-1-git-send-email-rep.dot.nop@gmail.com>
	<1294084926-3115-9-git-send-email-rep.dot.nop@gmail.com>
	<201101032354.25037.roman@khimov.ru> <4D230B5A.3030202@gmx.de>
	<AANLkTikAsHGf9H2YUVt6c7eqauOHyWuNUGC9Oy92TOBV@mail.gmail.com>
	<4D23186C.8080803@gmx.de>
MIME-Version: 1.0
In-Reply-To: <4D23186C.8080803@gmx.de>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH 09/12] busybox: provide postrm for package mdev
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
X-List-Received-Date: Tue, 11 Jan 2011 19:41:44 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Tue, Jan 04, 2011 at 01:54:04PM +0100, Wolfgang Hauser wrote:
>I agree for the test statement, but that may be solved by using ´the
>brackets in the long statement.
>
>Otavio Salvador schrieb:
>> On Tue, Jan 4, 2011 at 09:58, Wolfgang Hauser <wohauser@gmx.de> wrote:
>>> Keep it simple and stupid!
>>> So I vote for the long, readable and less error prone version.
>> 
>> I usually prefer the KISS however on this specific case I disagree.
>> 
>> The new code avoid using test and a fork. This allows for "test"
>> applet removal if desired.
>> 
>> I prefer the ugly but more "embedded like" code.

remember that this stuff potentially ends up on the target, so KISS
(byte-wise) is always the preferred way. And yes, update-rc.d and the
required inode itself is bloat, but heck, if you want online
pkg-management you have to take that penalty, FWIW.

So.. Can i please have an explicit ACK for that space-saver?


