Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 16EC97319F
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Jun 2016 13:49:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u57DnhZm017535; Tue, 7 Jun 2016 14:49:43 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Oh3O_T4gPvXO; Tue,  7 Jun 2016 14:49:43 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u57Dngk0017531
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 7 Jun 2016 14:49:43 +0100
Message-ID: <1465307382.13979.78.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mike Looijmans <mike.looijmans@topic.nl>,
	openembedded-devel@lists.openembedded.org
Date: Tue, 07 Jun 2016 14:49:42 +0100
In-Reply-To: <57568DB8.6010209@topic.nl>
References: <1464860046-15121-1-git-send-email-richard.purdie@linuxfoundation.org>
	<57568DB8.6010209@topic.nl>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH 1/3] gitkpkgv: Ensure files are closed
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 07 Jun 2016 13:49:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2016-06-07 at 11:02 +0200, Mike Looijmans wrote:
> ﻿Looks like regression in Python itself?
> 
> In both Python 2 and 3, the file is closed properly if the file
> object is not 
> being stored:
> 
>  >>> import os
>  >>> os.listdir('/proc/self/fd')
> ['0', '1', '2', '3']
>  >>> l=open('/proc/self/stat').readline()
>  >>> os.listdir('/proc/self/fd')
> ['0', '1', '2', '3']
>  >>> f=open('/proc/self/stat')
>  >>> os.listdir('/proc/self/fd')
> ['0', '1', '2', '3', '4']
>  >>>
> 
> 
> (file descriptor "3" is the one being used to read the /proc/self/fd 
> directory, "4" is the one used for reading the stat file)
> 
> The "with" construction should not be needed here. Something else is
> causing 
> this (e.g. nested function definition or exception handler?).

$ python2 -Wdefault -c "open('/bin/bash')"
$ python3 -Wdefault -c "open('/bin/bash')"
-c:1: ResourceWarning: unclosed file <_io.TextIOWrapper name='/bin/bash' mode='r' encoding='UTF-8'>

Admittedly its not an out the box warning but it is one that seems to
be enabled under bitbake. Details in:

https://bugs.python.org/issue10093

but the gist of the issue is that relying on the garbage collector to
close files is a cpython'ism and other implementations of python may
not do this.

So whilst "with" might not be strictly required, it is recommended.

Cheers,

Richard





