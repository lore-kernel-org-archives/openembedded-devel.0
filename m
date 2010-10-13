Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vwyodapink@gmail.com>) id 1P5xaA-0003om-5l
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Oct 2010 11:25:11 +0200
Received: by vws3 with SMTP id 3so1815642vws.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Oct 2010 02:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=sS+UqVet7KvgUpdQhmvMPSgf6q3rIbKBz2C3YXaWyi8=;
	b=RwEVOKTfJb8a14OASf37vRWOW83C2pF8v8BJb1kdN1lx3KH9XrTIrYdDoJeeYoWsr0
	5oXp1WJTUriSn+eo3PAtndUbd5W/dUM1VkFhMW2qfphXU7biLkUxI7T473rF84c7Ekmw
	cZgweGcCE2DKWXE0383OBhNnJaaeqksITOPWI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=s/aXPO+B9kmqFCI9TKFKm8P0t3zcEx8X8cENEMx4qrjgtyTUwlDL4oWmmoMFmDSYvR
	h863QL98vHUj+4pMQ9Oq+UvwEHK1ADCj8mFVgyX+U4T26xi/PL7wEoBDvhcTgyGpc6ns
	PVjUYL6ol0Mi6O17PjZZ4kldLYCi1MQcRnXQw=
MIME-Version: 1.0
Received: by 10.220.185.132 with SMTP id co4mr2725811vcb.42.1286961880994;
	Wed, 13 Oct 2010 02:24:40 -0700 (PDT)
Received: by 10.220.201.141 with HTTP; Wed, 13 Oct 2010 02:24:40 -0700 (PDT)
In-Reply-To: <4CB57639.1080908@gmail.com>
References: <4CB57639.1080908@gmail.com>
Date: Wed, 13 Oct 2010 02:24:40 -0700
Message-ID: <AANLkTikqgzOHLyMLWpKwh32-khrnGWR0L4Kfwzv6BXmx@mail.gmail.com>
From: "J. L. " <vwyodapink@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.212.47
X-SA-Exim-Mail-From: vwyodapink@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: apr-util_1.3.4.bb fails, looking at host includes
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
X-List-Received-Date: Wed, 13 Oct 2010 09:25:11 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 10/13/10, Tasslehoff Kjappfot <tasskjapp@gmail.com> wrote:
> I'm trying to compile log4cxx, but it fails compiling apr-util, saying
> that it is looking at host includes.
>
> I suspect the following from log.do_configure is a problem:
>
> /checking for pg_config... /usr/bin/pg_config
>    adding "-I/usr/include/postgresql" to CPPFLAGS
>    adding "-L/usr/lib" to LDFLAGS/
>
> But I have no idea how to fix it...
>
> - Tasslehoff
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


This may not be related but I ran into apr-util looking at the host
machine as well when I was trying to build subversion. I can not
remember now the exact package I installed on the build machine that
fixed it. So maybe trying searching for some packages that deal with
apr-util that you dont have on your build machine. I could be way off
for yours but seems very similar to what I had to do. Hope this helps
some


