Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TC21K-0004Qp-93
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 Sep 2012 07:31:22 +0200
Received: by eekb57 with SMTP id b57so1523615eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Sep 2012 22:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=mT5xiVsIirsbtboLnJ+fLRrUuzL6ferzH/yX2W3NHxA=;
	b=U150a/oY0koUVMrp6OEUnzeMJLVK1h/NPIHujlcUiCWqgmYSh/Q98Bz+XgFXgygU2v
	/8u95WuCZpNhddU+2ox7HaqqoNNTCZQrPRpARRkBp0RKD+OJz+d4R03r74659joSuzVG
	ZRUKdTTIMXRV2LH6Sg194SC9kSqCevoWvkFXHL40/YJ/RErYQSIw0x6WZnLohkUmeaix
	6pB7fCSwvZbn4LRbZDFQze3L2h1wGa65+BZjFrBqz4IprzxvlXMHgPfZVuiEaTDqW9t4
	iT2KFyNVUgIv/rc/TB++WpbycIJq7nFZngN9TDcTv8dPMla4fKhzc3Ir98F4T+hueSUn
	Uo7A==
Received: by 10.14.202.66 with SMTP id c42mr950193eeo.35.1347513529073; Wed,
	12 Sep 2012 22:18:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.2.5 with HTTP; Wed, 12 Sep 2012 22:18:18 -0700 (PDT)
In-Reply-To: <CAG4_upS_8o4j4EhL4mvaGY--kwnYh3SgwnyHPfc_yFjo-3k6Hg@mail.gmail.com>
References: <CAG4_upS_8o4j4EhL4mvaGY--kwnYh3SgwnyHPfc_yFjo-3k6Hg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 12 Sep 2012 22:18:18 -0700
Message-ID: <CAMKF1srdrMSTv03-AiubgPZd5Hv8-nwbdBUuQAS=aeZHojdQxg@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: at91bootstrap and gcc 4.6+
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
X-List-Received-Date: Thu, 13 Sep 2012 05:31:22 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Sep 10, 2012 at 7:37 PM, Chris Verges <kg4ysn@gmail.com> wrote:
> Hi all,
>
> For anyone doing development on the AT91-based platforms, there is a known
> issue with at91bootstrap and gcc 4.6 (and later) where the
> linker erroneously causes an overlap between sections.  There is a known
> fix here, just needs to be turned into a patch file for OE:
>
> http://www.at91.com/forum/viewtopic.php/f,12/t,20624/

I dont see the full linker script but may be using OVERLAY
would be nicer in that

>
> Chris
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


