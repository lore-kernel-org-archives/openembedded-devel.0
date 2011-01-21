Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jay@jay-tech.ru>) id 1PgFus-00087W-Mv
	for openembedded-devel@lists.openembedded.org;
	Fri, 21 Jan 2011 13:16:34 +0100
Received: by qwi2 with SMTP id 2so1706464qwi.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Jan 2011 04:15:50 -0800 (PST)
MIME-Version: 1.0
Received: by 10.229.81.138 with SMTP id x10mr512699qck.20.1295612150033; Fri,
	21 Jan 2011 04:15:50 -0800 (PST)
Sender: jay@jay-tech.ru
Received: by 10.220.29.2 with HTTP; Fri, 21 Jan 2011 04:15:49 -0800 (PST)
X-Originating-IP: [95.182.103.27]
In-Reply-To: <AANLkTim0+yJ+oKSteOQ-22_PCPFB_KQ0NRw73VDyq478@mail.gmail.com>
References: <AANLkTinhZBY4ODjB9h3y+Ep-hXBu6O85cB95h4_KFxmP@mail.gmail.com>
	<AANLkTim0+yJ+oKSteOQ-22_PCPFB_KQ0NRw73VDyq478@mail.gmail.com>
Date: Fri, 21 Jan 2011 15:15:49 +0300
X-Google-Sender-Auth: j0AYPJY0Q3uvAgwYv9ePQYF9DT8
Message-ID: <AANLkTin3tNJ5Lb48qnktGyqvF10-sEEa4M6K94WHZ580@mail.gmail.com>
From: Yury Bushmelev <jay4mail@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: testing branch 2011-01-20
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
X-List-Received-Date: Fri, 21 Jan 2011 12:16:35 -0000
Content-Type: text/plain; charset=ISO-8859-1

2011/1/21 Cliff Brake <cliff.brake@gmail.com>:
> 60+ combinations tested last week!!!
>
> http://cgit.openembedded.org/cgit.cgi/openembedded/tag/?id=tested_2011-01-13
>
> For more information on the testing effort, please see:
>
> http://www.openembedded.org/index.php/Testing
>
> Tom has enough combinations in testing now, it may be time to think
> about a little more automation for this.

I've thought about collecting testing results via oe-stats.
We should collect following data:
- machine
- distro
- target
- workstation (distro + arch)*
- bitbake version*
- tester (builder) name
- last successful build
- build type (clean/incremental)*
- current issues

Fields marked by * are not present in current oe-stats info.

With all info in oe-stats we can create report that will look like
table on Testing wiki page. Then Cliff can just copy data from there
to his weekly report :)

-- 
Yury Bushmelev


