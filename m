Received: from mail-qy0-f182.google.com ([209.85.216.182])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jay@jay-tech.ru>) id 1PGfAP-0002o9-U1
	for openembedded-devel@lists.openembedded.org;
	Thu, 11 Nov 2010 22:58:50 +0100
Received: by qyk5 with SMTP id 5so1280730qyk.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Nov 2010 13:57:49 -0800 (PST)
MIME-Version: 1.0
Received: by 10.224.202.3 with SMTP id fc3mr1510439qab.64.1289512669494; Thu,
	11 Nov 2010 13:57:49 -0800 (PST)
Sender: jay@jay-tech.ru
Received: by 10.220.95.74 with HTTP; Thu, 11 Nov 2010 13:57:49 -0800 (PST)
X-Originating-IP: [93.81.68.250]
In-Reply-To: <AANLkTimzOfyN6wHgP5pZ7rbfWawN4ri7UHFSUH4cEoZ7@mail.gmail.com>
References: <AANLkTimzOfyN6wHgP5pZ7rbfWawN4ri7UHFSUH4cEoZ7@mail.gmail.com>
Date: Fri, 12 Nov 2010 00:57:49 +0300
X-Google-Sender-Auth: 3LGPnbur7acYUgpnZ9im6LG5Y0M
Message-ID: <AANLkTimgg7ryFQsid-uVmT=wA2UvJWTn2HkCkfFv-grU@mail.gmail.com>
From: Yury Bushmelev <jay4mail@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.216.182
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
X-List-Received-Date: Thu, 11 Nov 2010 21:58:50 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/11/11 Yury Bushmelev <jay4mail@gmail.com>:
> I've collected some data about disk usage while doing last testing build.
> Here you can see it: http://bit.ly/dnzIrq
> Or long direct url:
> https://spreadsheets.google.com/ccc?key=0AhY8lmfkCabTdGZRSGZ0eXg5cWhkV2k1c0Jvd0lvVnc&authkey=CLeK150N#gid=0

I've added 'Chart 2' sheet to this document.
Direct link is
https://spreadsheets.google.com/ccc?key=0AhY8lmfkCabTdGZRSGZ0eXg5cWhkV2k1c0Jvd0lvVnc&authkey=CLeK150N#gid=1

> Data was collected from following build:
> BB version: master

BB was changed to 1.10 to compare.

> OE version: testing_2010-10-29
> rm_work: enabled
> Parallelism: 3 BB threads + 3 make threads

1 BB thread + 6 make threads

> Distro: angstrom-2008.1
> Machines: efikamx (first peak), ben-nanonote (second peak)

Machines: collie, tosa+akita, efikamx, ben-nanonote

> Images: console-image x11-image opie-image
> Build type: clean, but with different TMPDIR's for every machine w/o
> removing of TMPDIR after build.


-- 
Yury Bushmelev


