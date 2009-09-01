Received: from [212.227.126.177] (helo=moutng.kundenserver.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dirk@do13.de>) id 1MiOup-0004Xq-F8
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Sep 2009 10:40:35 +0200
Received: from mail.opfer.lan (do13.in-dsl.de [217.197.85.204])
	by mrelayeu.kundenserver.de (node=mreu1) with ESMTP (Nemesis)
	id 0MKv1o-1MiOcl3Wuc-000GSy; Tue, 01 Sep 2009 10:21:58 +0200
Received: from localhost ([127.0.0.1] helo=home.opfer.tk)
	by mail.opfer.lan with esmtpa (Exim 4.69)
	(envelope-from <dirk@do13.de>) id 1MiOcY-0007MH-Ro
	for openembedded-devel@lists.openembedded.org;
	Tue, 01 Sep 2009 10:21:54 +0200
Received: from p578b18b1.dip0.t-ipconnect.de ([87.139.24.177])
	(SquirrelMail authenticated user dirk) by home.opfer.tk with HTTP;
	Tue, 1 Sep 2009 10:21:42 +0200 (CEST)
Message-ID: <57768.87.139.24.177.1251793302.squirrel@home.opfer.tk>
In-Reply-To: <20090901055731.GA22534@gmail.com>
References: <1251504044-2315-1-git-send-email-raj.khem@gmail.com>
	<1251620948.4215.673.camel@lenovo.internal.reciva.com>
	<20090830094809.GB26823@gmail.com>
	<200908311333.20189.marcin@juszkiewicz.com.pl>
	<20090901055731.GA22534@gmail.com>
Date: Tue, 1 Sep 2009 10:21:42 +0200 (CEST)
From: "Dirk Opfer" <dirk@do13.de>
To: openembedded-devel@lists.openembedded.org
User-Agent: SquirrelMail/1.4.10a
MIME-Version: 1.0
X-Priority: 3 (Normal)
Importance: Normal
X-Scan-Signature: a308e19b64648530e53d4ab040f58cc2
X-Spam-Score: -4.4 (----)
X-Provags-ID: V01U2FsdGVkX1+c+EqNE28TyV9Fsh66bkloQEWX+ZKsMW233MS
	JDcgc09QSphAGesGE5JssjQi8UE4NoRPgF42UuIkQUm0jKK45c
	8/pyXD/mVf11J/wRJ7qpiWfaPih1SAG
Subject: Re: [PATCH] sane-toolchain-eglibc.inc: Set TARGET_OS?= linux-gnuspe for e500
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
X-List-Received-Date: Tue, 01 Sep 2009 08:40:35 -0000
Content-Type: text/plain;charset=iso-8859-1
Content-Transfer-Encoding: 8bit

>
> Attached implementation is based on this suggestion. I have not done
> wholesale change to distro confs only for micro and minimal.
>
> I tested this patch with
>
>
> for targ in `ls openembedded/conf/machine/*.conf|cut -d '/' -f 4|cut -d
> '.' -f 1`; do echo -n "$targ "; MACHINE=$targ DISTRO=minimal bitbake -e
> |grep TARGET_OS=\"; done
>
> and all machine confs were giving correct values for TARGET_OS
> also I repeated same test with DISTRO=minimal-uclibc
>
> Comments ?

e300 doesn't implement the signal processing engine (SPE).
Only e500v1 and e500v2 supports these instructions.

Dirk


> Thanks
>
> -Khem
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>




