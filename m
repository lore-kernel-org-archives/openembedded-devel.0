Received: from [66.249.92.173] (helo=ug-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <pmiscml@gmail.com>) id 1JI8EO-00088W-4k
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 Jan 2008 20:59:24 +0100
Received: by ug-out-1314.google.com with SMTP id i24so368127ugd.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Jan 2008 11:59:28 -0800 (PST)
Received: by 10.66.221.6 with SMTP id t6mr2677770ugg.0.1201204767891;
	Thu, 24 Jan 2008 11:59:27 -0800 (PST)
Received: from ?192.168.10.89? ( [88.248.7.116])
	by mx.google.com with ESMTPS id j1sm5701387ugf.74.2008.01.24.11.59.25
	(version=SSLv3 cipher=OTHER); Thu, 24 Jan 2008 11:59:26 -0800 (PST)
Date: Thu, 24 Jan 2008 22:10:25 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Mailer: The Bat! (v3.64.01 Christmas Edition) Professional
X-Priority: 3 (Normal)
Message-ID: <644458191.20080124221025@gmail.com>
To: Florian Boor <florian.boor@kernelconcepts.de>
In-Reply-To: <47948C77.9070300@kernelconcepts.de>
References: <15810137585.20080121005051@gmail.com>
	<47948C77.9070300@kernelconcepts.de>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [Gpe-list] [RFC] Making libmimedir-0.4.2 default in OE
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 24 Jan 2008 19:59:24 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Florian,

Monday, January 21, 2008, 2:13:43 PM, you wrote:

> Hi,

> Paul Sokolovsky schrieb:
>>   Currently, libmimedir-0.3.1 is marked DEFAULT_PREFERENCE = "1". That
>> version of the lib has at least 2 serious bugs:

> how did that happen? I can't imagine that this would be a good idea.

  I usually do mtn ann/mtn log, but there I stopped once seen that that
line was changed in 2006, and that change what syntactic cleanup, so
actual DEFAULT_PREFERENCE value likely was there for quite log time.

>>   So, I'd like to propose to remove mentioned DEFAULT_PREFERENCE and
>> make other steps as needed to make 0.4.2 the default version.

> I agree, that can't be wrong :-)

  Ok, committed.

>> 2. There appears to be (at least) two libmimedir's, another one is
>> http://sourceforge.net/projects/libmimedir/ (at 0.5, versions up to
>> 0.4 were part of synce project). Debian names package for the lib in
>> question "libmimedir-gnome", we may want to disambiguate too.
>> http://packages.qa.debian.org/libm/libmimedir-gnome.html

> Yes we should follow Debian here. I don't know if the synce one is relevant in
> any way but it might be better to change the name of the package to be safe.

  I will prepare patch for that later. synce's version is used at
least by synce itself, and so dependent things (like sync plugins for
example), which may be added to OE someday.

> Greetings

> Florian





-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



