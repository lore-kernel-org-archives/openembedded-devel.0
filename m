Received: from mail-yx0-f203.google.com ([209.85.210.203])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1NmDBu-0002FZ-Rm
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Mar 2010 22:30:15 +0100
Received: by yxe41 with SMTP id 41so1223413yxe.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Mar 2010 13:27:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type;
	bh=1zRPaG8v+gNwxEL5cEa6f4LEYqfHsbUQQxUkwrzZTLo=;
	b=qVDHJldXeKdV6dVmHcRaAJ4oXm0pC3eMXk7zzBhm8idk+PZ07sFbi7LB1nfdZY5Jxj
	VQA32Ip0LOrmH4Ng68Xb3GezwDrOzEMymn0xMHYcB/0jS9cPHwos6fij6Erz8tdoyzog
	PHNLARKuOgXVMpLu+28V2kNiHvHgvLy4X8nWI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=C938AB0QA2VCrYcjEO43YaCwVhkM0wIaFA/fOcbyGfQ4cgf8EtgEoTWfdo+HteJUSN
	gFZcnpbsDG7s7L7gG7Yw4zQiY85qwZ0Fa/VklcmCTbHDx5Dp0D5Rxlx/+ktuFhugVllG
	Dm6mWk5GI4WueP/JVidqngoJgGiErjZai9MAI=
MIME-Version: 1.0
Received: by 10.101.39.2 with SMTP id r2mr3231277anj.67.1267478844121; Mon, 01 
	Mar 2010 13:27:24 -0800 (PST)
Date: Mon, 1 Mar 2010 22:27:24 +0100
Message-ID: <ac9c93b11003011327v1ee75303p334cf298ff8516b7@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.210.203
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_PASS autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [RFC] remove unused svn-updates.dpatch files
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
X-List-Received-Date: Mon, 01 Mar 2010 21:30:15 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/3/1 Denys Dmytriyenko <denis@denix.org>:
> On Mon, Mar 01, 2010 at 08:10:31AM +1030, Graham Gower wrote:

>> What should offend you more is stuff like this:
>>
>> [grg@rak gcc]$ pwd
>> /home/grg/oe/openembedded/recipes/gcc
>> [grg@rak gcc]$ find . -name svn-updates.dpatch -exec ls -l {} \;
>> -rw-r--r-- 1 grg users 17668056 2009-11-15 12:59
>> ./gcc-4.4.2/debian/svn-updates.dpatch
>> -rw-r--r-- 1 grg users 17668056 2009-11-15 12:59
>> ./gcc-4.4.1/debian/svn-updates.dpatch
>> -rw-r--r-- 1 grg users 17668056 2009-11-15 12:59
>> ./gcc-4.3.1/debian/svn-updates.dpatch
>> -rw-r--r-- 1 grg users 17668056 2009-11-15 12:59
>> ./gcc-4.3.3/debian/svn-updates.dpatch
>> -rw-r--r-- 1 grg users 17668056 2009-11-15 12:59
>> ./gcc-4.3.4/debian/svn-updates.dpatch
>> -rw-r--r-- 1 grg users 17668056 2009-11-15 12:59
>> ./gcc-svn/debian/svn-updates.dpatch
>> -rw-r--r-- 1 grg users 17668056 2009-11-15 12:59
>> ./gcc-4.3.2/debian/svn-updates.dpatch
>> [grg@rak gcc]$ grep svn-updates *
>> [grg@rak gcc]$
>
> So, there is 125 MB wasted right there... Thanks for the heads up! :)

Checked it and the 4.4.[12] and gcc-svn versions are gone.
the gcc-4.3.[1-4] versions are still there but seem unused:

frans@linux-suse:~/oe/openembedded/recipes/gcc> grep -r svn-updates.dpatch .
frans@linux-suse:~/oe/openembedded/recipes/gcc>

Howvever as gcc is quite core, I'd rather verify first that it is ok
to remove them
(or can someone with more gcc knowledge remove)

Frans.


