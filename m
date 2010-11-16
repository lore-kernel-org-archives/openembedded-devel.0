Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jay@jay-tech.ru>) id 1PIQcY-0006F1-M9
	for openembedded-devel@lists.openembedded.org;
	Tue, 16 Nov 2010 19:51:12 +0100
Received: by pwi8 with SMTP id 8so316815pwi.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Nov 2010 10:50:00 -0800 (PST)
MIME-Version: 1.0
Received: by 10.229.70.130 with SMTP id d2mr6617771qcj.53.1289933398385; Tue,
	16 Nov 2010 10:49:58 -0800 (PST)
Sender: jay@jay-tech.ru
Received: by 10.220.95.74 with HTTP; Tue, 16 Nov 2010 10:49:58 -0800 (PST)
X-Originating-IP: [93.81.137.132]
In-Reply-To: <201011151345.58456.jay4mail@gmail.com>
References: <201011151345.58456.jay4mail@gmail.com>
Date: Tue, 16 Nov 2010 21:49:58 +0300
X-Google-Sender-Auth: OqmoCME5_kGT1-VAV109e1Ges1E
Message-ID: <AANLkTimJvHgdber=0vgBp_LQdydy0YoSkCXrDQmaM+qp@mail.gmail.com>
From: Yury Bushmelev <jay4mail@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.47
X-SA-Exim-Mail-From: jay@jay-tech.ru
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=AWL,BAYES_00,SPF_SOFTFAIL
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [testing-next] race condition on incremental build of tosa opie-image
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
X-List-Received-Date: Tue, 16 Nov 2010 18:51:12 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/11/15 Yuri Bushmelev <jay4mail@gmail.com>:
> Hello!
>
> There are results from tonight's testbuilder run on current testing-next.
>
> I have following fail when doing _incremental_ test build of
> angstrom-2008.1/tosa/opie-image. Clean build was fine.
> Bitbake version: git master, OE version: testing-next.
> bb threads: 5, make threads: 2
>
> Bad thing is that error log on tinderbox is totally unuseful.
> Build stats:
> http://tinderbox.openembedded.net/builds/103097/
> Log:
> http://tinderbox.openembedded.net/public/logs/task/10153584.txt
>
> Note tasks order in following log. It looks like race condition.
>
> NOTE: package libqtaux2-1.2.4-r2.0: task do_setscene: Succeeded
> [...]
> | OSError: [Errno 2] No such file or directory: '/storage/oe/testbuilder/build/angstrom_2008/armv5/deploy/glibc/ipk/armv5te/libqtaux2-1_1.2.4-
> r0.6_armv5te.ipk'
> [...]
> NOTE: Running task 6770 of 6932 (ID: 3421, /storage/oe/testbuilder/openembedded/recipes/libqtaux/libqtaux2_1.2.4.bb, do_fetch)
>
> I have untouched build directory as well as lvm snapshot of this
> volume before build, so I can even try to reproduce error.

If no one is interested I'll rebuild tosa image and remove snapshot tonight.

-- 
Yury Bushmelev


