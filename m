Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ranjithkannikara@gmail.com>) id 1OdKR8-0007Dg-82
	for openembedded-devel@lists.openembedded.org;
	Mon, 26 Jul 2010 11:57:37 +0200
Received: by iwn34 with SMTP id 34so2741073iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Jul 2010 02:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:from:date
	:message-id:subject:to:content-type;
	bh=gwz3VXzYfEwBfXIb616GdL8IWC32/DGDCMNNRTwynJ4=;
	b=oLe44rEx2BQaNysIBUe/p/nDzMR8Y8ldUqudnY4M8m6v5MknteP/Iuj9SqFMoYagK7
	TtGM+pQ7URJsuRbPspyhByKhwXcrm6HfnwdOQW0vTtd9Z4w9DWD7hzHIy2oMhGKbHEAN
	kNJ14Nkw0NL4sLGMklBe5zR2BUPkfjlmd7mIc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:from:date:message-id:subject:to:content-type;
	b=s5pywNLbJy1Y+XCBtz4+s++L75RxLPMl3hdrgBfBoZIuCdz/0Aq0Zv2ZTnB7MV8XzF
	iUo9q1KWaj2hLTfBSdj7oQiCa1OjtkcJl7OyOV3dWDaTGz+jsdtg1YlXkVIgLOsA9xl2
	ylrMAY7PpYUAIxDUW+fXNK/kCP0ned2Rb+lJQ=
Received: by 10.231.149.80 with SMTP id s16mr8331152ibv.81.1280138187149; Mon, 
	26 Jul 2010 02:56:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.181.166 with HTTP; Mon, 26 Jul 2010 02:56:07 -0700 (PDT)
From: ranjith kannikara <ranjithkannikara@gmail.com>
Date: Mon, 26 Jul 2010 15:26:07 +0530
Message-ID: <AANLkTi=9efmk7Ehrfb69H-CFKUg+8X8fUZ90Pje4Fvh7@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: ranjithkannikara@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: bitbake fso-illume-image returns error on gtk+
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
X-List-Received-Date: Mon, 26 Jul 2010 09:57:37 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,
I am a newbie in openembedded. I tried bitbake helloworld and it worked. But
when i was running "bitbake fso-illume-image" . It returned an error that
do_compile for gtk+ failed.

The respective error log entry was

../../../../arm-angstrom-linux-gnueabi/bin/ld:.libs/libgdk_pixbuf-2.0.ver:2:
ignoring invalid character `\001' in script
and
../../../../arm-angstrom-linux-gnueabi/bin/ld:.libs/libgdk_pixbuf-2.0.ver:2:
syntax error in VERSION script

I tried googling and even asked in the irc channel #oe but dint get any
useful information.

Can any one tell me how to get this error cleared.

I ran bitbake -crebuild gtk+ also , which ran succesfully at first and when
again i run bitbate fso-illume-image it gave the same error
And now when i run bitbake -crebuild gtk+ that too shows the same error.

Regards,
Ranjith
*

*--
Ranjith Babu Kannikara
0091 9809215273
Student, Computer science and engg, GEC Thrissur...
Student developer google ( 2008 GSOC ).
http://sourceforge.net/users/kannikara
http://www.ranjithkannikara.blogspot.com/

