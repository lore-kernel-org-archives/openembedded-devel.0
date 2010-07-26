Received: from hsp-52.hspserver.com ([85.197.80.179])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ml@vdm-design.de>) id 1OdKj7-0002ZK-Mf
	for openembedded-devel@lists.openembedded.org;
	Mon, 26 Jul 2010 12:16:06 +0200
Received: from localhost (localhost [127.0.0.1])
	by hsp-52.hspserver.com (Postfix) with ESMTP id E2A79A2C45E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Jul 2010 12:15:53 +0200 (CEST)
Received: from hsp-52.hspserver.com ([127.0.0.1])
	by localhost (hsp-52.hspserver.com [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id KnoHv0OIJ29O
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Jul 2010 12:15:53 +0200 (CEST)
Received: from tomboy.localnet (pD9E1646B.dip.t-dialin.net [217.225.100.107])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by hsp-52.hspserver.com (Postfix) with ESMTPSA id 3A97AA2C44C
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Jul 2010 12:15:53 +0200 (CEST)
From: Thomas Zimmermann <ml@vdm-design.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 26 Jul 2010 12:15:50 +0200
User-Agent: KMail/1.13.5 (Linux/2.6.34-0.slh.11-sidux-amd64; KDE/4.4.5; x86_64;
	; )
References: <AANLkTi=9efmk7Ehrfb69H-CFKUg+8X8fUZ90Pje4Fvh7@mail.gmail.com>
In-Reply-To: <AANLkTi=9efmk7Ehrfb69H-CFKUg+8X8fUZ90Pje4Fvh7@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <201007261215.50344.ml@vdm-design.de>
X-SA-Exim-Connect-IP: 85.197.80.179
X-SA-Exim-Mail-From: ml@vdm-design.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: bitbake fso-illume-image returns error on gtk+
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
X-List-Received-Date: Mon, 26 Jul 2010 10:16:06 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

Am Montag 26 Juli 2010, 11:56:07 schrieb ranjith kannikara:
> Hi,
> I am a newbie in openembedded. I tried bitbake helloworld and it worked.
> But when i was running "bitbake fso-illume-image" . It returned an error
> that do_compile for gtk+ failed.
> 
> The respective error log entry was
> 
> ../../../../arm-angstrom-linux-gnueabi/bin/ld:.libs/libgdk_pixbuf-2.0.ver:2
> : ignoring invalid character `\001' in script
> and
> ../../../../arm-angstrom-linux-gnueabi/bin/ld:.libs/libgdk_pixbuf-2.0.ver:2
> : syntax error in VERSION script
> 
> I tried googling and even asked in the irc channel #oe but dint get any
> useful information.
> 
> Can any one tell me how to get this error cleared.
> 
> I ran bitbake -crebuild gtk+ also , which ran succesfully at first and when
> again i run bitbate fso-illume-image it gave the same error
> And now when i run bitbake -crebuild gtk+ that too shows the same error.
> 
> Regards,
> Ranjith

There is sth strange in the VERSION file of gtk+.
You have 2 alternatives:
1) use bash
2) clean the VERSION file

Greets
Thomas


