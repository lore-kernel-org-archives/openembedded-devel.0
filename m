Received: from mail-pz0-f184.google.com ([209.85.222.184])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1NmDJc-0005qQ-2B
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Mar 2010 22:38:16 +0100
Received: by pzk14 with SMTP id 14so3814397pzk.28
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Mar 2010 13:35:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=9yGi7m9yTHGRdLyklsi7EH/GnTbVha9Gz10L3R5DDdo=;
	b=RnvNUVzoyoalc1NiaAp7gC0eI1AopXZRiUnSAbN6PeAdeQg3aHGN7nU+V+cV/PD++J
	LYeP3Kv2wsd6uHqDHZfAAhiTa2xQVvY+JRVhyyrEhKwvWhV/ac4/gs8nZxx27tbjO8DH
	Z3Dqo8pr/PuWOJlLSCyIM85MwhY8lvYRK06uM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=XXej5Nrt3wKax9FKDIZ0tB7Az+p432V5mECFx27AWJdmfpne80N3Z+8ROoQL2hAU1n
	n/zBcPKEC9BH6EQ5TP0w0stOrxy8+Z3lJxUCdZJUWz5F8WPFMh10/bt8fSYAtaTOzYbs
	1oi15qi3bvwXSbG7szhnBdxSOGu1c1vinqx6c=
MIME-Version: 1.0
Received: by 10.143.25.1 with SMTP id c1mr2809588wfj.17.1267479320978; Mon, 01 
	Mar 2010 13:35:20 -0800 (PST)
In-Reply-To: <ac9c93b11003011327v1ee75303p334cf298ff8516b7@mail.gmail.com>
References: <ac9c93b11003011327v1ee75303p334cf298ff8516b7@mail.gmail.com>
Date: Tue, 2 Mar 2010 08:05:20 +1030
Message-ID: <6ec4247d1003011335w5fb01238o4fa7551b96c57406@mail.gmail.com>
From: Graham Gower <graham.gower@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.222.184
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_PASS autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] remove unused svn-updates.dpatch files
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
X-List-Received-Date: Mon, 01 Mar 2010 21:38:16 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 2 March 2010 07:57, Frans Meulenbroeks <fransmeulenbroeks@gmail.com> wrote:
> 2010/3/1 Denys Dmytriyenko <denis@denix.org>:
>> On Mon, Mar 01, 2010 at 08:10:31AM +1030, Graham Gower wrote:
>
>>> What should offend you more is stuff like this:
>>>
>>> [grg@rak gcc]$ pwd
>>> /home/grg/oe/openembedded/recipes/gcc
>>> [grg@rak gcc]$ find . -name svn-updates.dpatch -exec ls -l {} \;
>>> -rw-r--r-- 1 grg users 17668056 2009-11-15 12:59
>>> ./gcc-4.4.2/debian/svn-updates.dpatch
>>> -rw-r--r-- 1 grg users 17668056 2009-11-15 12:59
>>> ./gcc-4.4.1/debian/svn-updates.dpatch
>>> -rw-r--r-- 1 grg users 17668056 2009-11-15 12:59
>>> ./gcc-4.3.1/debian/svn-updates.dpatch
>>> -rw-r--r-- 1 grg users 17668056 2009-11-15 12:59
>>> ./gcc-4.3.3/debian/svn-updates.dpatch
>>> -rw-r--r-- 1 grg users 17668056 2009-11-15 12:59
>>> ./gcc-4.3.4/debian/svn-updates.dpatch
>>> -rw-r--r-- 1 grg users 17668056 2009-11-15 12:59
>>> ./gcc-svn/debian/svn-updates.dpatch
>>> -rw-r--r-- 1 grg users 17668056 2009-11-15 12:59
>>> ./gcc-4.3.2/debian/svn-updates.dpatch
>>> [grg@rak gcc]$ grep svn-updates *
>>> [grg@rak gcc]$
>>
>> So, there is 125 MB wasted right there... Thanks for the heads up! :)
>
> Checked it and the 4.4.[12] and gcc-svn versions are gone.
> the gcc-4.3.[1-4] versions are still there but seem unused:
>
> frans@linux-suse:~/oe/openembedded/recipes/gcc> grep -r svn-updates.dpatch .
> frans@linux-suse:~/oe/openembedded/recipes/gcc>
>
> Howvever as gcc is quite core, I'd rather verify first that it is ok
> to remove them
> (or can someone with more gcc knowledge remove)
>
> Frans.
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

Perhaps there are other patches in the debian directories that are also unused?

-Graham


