Received: from [66.249.92.168] (helo=ug-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <pmiscml@gmail.com>) id 1IuurG-0006HG-8L
	for openembedded-devel@lists.openembedded.org;
	Wed, 21 Nov 2007 20:03:38 +0100
Received: by ug-out-1314.google.com with SMTP id m3so189124ugc
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Nov 2007 11:01:17 -0800 (PST)
Received: by 10.66.221.5 with SMTP id t5mr452603ugg.1195667843061;
	Wed, 21 Nov 2007 09:57:23 -0800 (PST)
Received: from ?192.168.2.2? ( [88.231.78.200])
	by mx.google.com with ESMTPS id w28sm1383919uge.2007.11.21.09.57.17
	(version=SSLv3 cipher=OTHER); Wed, 21 Nov 2007 09:57:22 -0800 (PST)
Date: Wed, 21 Nov 2007 19:57:13 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Mailer: The Bat! (v3.64.01 Christmas Edition) Professional
X-Priority: 3 (Normal)
Message-ID: <1496857094.20071121195713@gmail.com>
To: Esben Haabendal <eha@doredevelopment.dk>
In-Reply-To: <1195626057.11679.7.camel@localhost>
References: <20071119120819.GA17788@lenovo>
	<47419EA0.4030308@student.utwente.nl>
	<4742217C.9060506@whitby.id.au>
	<74d0deb30711200112x17ad31fej4b25840a74e05abb@mail.gmail.com>
	<1195626057.11679.7.camel@localhost>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Getting Started -Makefile
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
X-List-Received-Date: Wed, 21 Nov 2007 19:03:50 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Esben,

Wednesday, November 21, 2007, 8:20:57 AM, you wrote:

[]

>> The question is how to fix this problem correctly.
>> One possibility would be that bitbake, if BBPATH is unset, issues a
>> warning and scans the file system (starting from the $PWD) for a
>> certain file (local.conf) in which BBPATH would be specified.

> Something like that would be nice. When bitbake finds BBPATH unset, it
> traverses from $PWD to / to find a .bbenv (or some other filename, but
> local.conf is probably not a good one), which can setup BBPATH,
> PYTHONPATH, OEDIR or whatever env virables is used in the
> conf/local.conf file.

  LOL. So, editing .bashrc is hard, while creating and editing some
obscure file is easy?

> To guard against bad bitbake versions (as BBPATH
> is unset, bitbake can be expected to be picked up from a generic PATH)
> it might be smart to introduce a variable in local.conf stating specific
> or minimum version requirements for bitbake.

  ... Ah, and it comes at the expense yet?

> Would there by any problems in extending bitbake calling convention in
> this way?

  Yes. Occam's blade. There's nothing to extend for. "man bash" will
make everyone who does it an expert not only in bitbake, but in Unix
way of doing stuff at all. After that, it will be much easier to
decide if something worth fixing, if yes, then why, and finally, how.

> /Esben




-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



