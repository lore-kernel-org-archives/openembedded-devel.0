Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jay@jay-tech.ru>) id 1PH3gR-0004Vm-Nj
	for openembedded-devel@lists.openembedded.org;
	Sat, 13 Nov 2010 01:09:56 +0100
Received: by vws12 with SMTP id 12so1217699vws.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Nov 2010 16:08:30 -0800 (PST)
MIME-Version: 1.0
Received: by 10.220.75.20 with SMTP id w20mr588930vcj.34.1289606909970; Fri,
	12 Nov 2010 16:08:29 -0800 (PST)
Sender: jay@jay-tech.ru
Received: by 10.220.95.74 with HTTP; Fri, 12 Nov 2010 16:08:29 -0800 (PST)
X-Originating-IP: [93.81.68.211]
In-Reply-To: <AANLkTimgg7ryFQsid-uVmT=wA2UvJWTn2HkCkfFv-grU@mail.gmail.com>
References: <AANLkTimzOfyN6wHgP5pZ7rbfWawN4ri7UHFSUH4cEoZ7@mail.gmail.com>
	<AANLkTimgg7ryFQsid-uVmT=wA2UvJWTn2HkCkfFv-grU@mail.gmail.com>
Date: Sat, 13 Nov 2010 03:08:29 +0300
X-Google-Sender-Auth: Ayq_Z3OvbvupK1PLU_BHY26g3co
Message-ID: <AANLkTintUOaC5DKMDroQXL5FEMgbjjks0Og1bHZShw3k@mail.gmail.com>
From: Yury Bushmelev <jay4mail@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.212.47
X-SA-Exim-Mail-From: jay@jay-tech.ru
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=AWL,BAYES_00,SPF_SOFTFAIL
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: JFYI: OE build time disk usage chart
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
X-List-Received-Date: Sat, 13 Nov 2010 00:10:04 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/11/12 Yury Bushmelev <jay4mail@gmail.com>:

>> I've collected some data about disk usage while doing last testing build.
>> Here you can see it: http://bit.ly/dnzIrq
>> Or long direct url:
>> https://spreadsheets.google.com/ccc?key=0AhY8lmfkCabTdGZRSGZ0eXg5cWhkV2k1c0Jvd0lvVnc&authkey=CLeK150N#gid=0
>
> I've added 'Chart 2' sheet to this document.
> Direct link is
> https://spreadsheets.google.com/ccc?key=0AhY8lmfkCabTdGZRSGZ0eXg5cWhkV2k1c0Jvd0lvVnc&authkey=CLeK150N#gid=1

New data again:
https://spreadsheets.google.com/a/jay-tech.ru/ccc?key=0AhY8lmfkCabTdGZRSGZ0eXg5cWhkV2k1c0Jvd0lvVnc&authkey=CLeK150N#gid=2
https://spreadsheets.google.com/a/jay-tech.ru/ccc?key=0AhY8lmfkCabTdGZRSGZ0eXg5cWhkV2k1c0Jvd0lvVnc&authkey=CLeK150N#gid=3

First (Chart 3) is build with BB_SCHEDULER="completion" (default when
using rm_work).
Second (Chart 4) is build with BB_SCHEDULER="speed" (default when
rm_work is not used).
As you can see, "speed" scheduler slightly improved build time (about
40 min for me) but about 40Gb of disk peak space was used.
"Completion" is a bit slower but uses about 34Gb in peak.

-- 
Yury Bushmelev


