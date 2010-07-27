Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ranjithkannikara@gmail.com>) id 1OdbZH-0006cG-3Z
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Jul 2010 06:15:04 +0200
Received: by iwn34 with SMTP id 34so3457936iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Jul 2010 21:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:from:date
	:message-id:subject:to:content-type;
	bh=lmD0Qguyd40STNt/2atolfh30U+w13jSW09Enl7T7OQ=;
	b=MGNAcJT03uCwztz0U0xv7h4Zvb/KPrPaUxkQnyjivHDznYE2ks3og5v5s5Ztuhdt7n
	8ezV3ja2OvA07A2SVRxVZvh9NE0l+hUYzRgYy2lDQtYXCmrTDXgFc16x60qRFuyIudio
	DXhPZ6KjzEYh6TAlLpSTjxdoMOLR10crIZbHI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:from:date:message-id:subject:to:content-type;
	b=yAVKeXPsesCarby6NB6icyFi6Pyxv2HE5DuCA5HzyPUKsVg1HZzeSFhRrG35zItEG9
	VPOx4tYcnT0Go7Y+CQEXSZwbGmV6v7KF972XsMQBxonWy22i2WsWH0JSOFvkG9TLMIGh
	rjupqlAnwpST2VQzVR3xJEvygW1kvX0iGDsq8=
Received: by 10.231.146.129 with SMTP id h1mr9635428ibv.181.1280204087310; 
	Mon, 26 Jul 2010 21:14:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.181.166 with HTTP; Mon, 26 Jul 2010 21:14:27 -0700 (PDT)
From: ranjith kannikara <ranjithkannikara@gmail.com>
Date: Tue, 27 Jul 2010 09:44:27 +0530
Message-ID: <AANLkTik+1EuG8Se996jFqVfQBXc3fFqoYPGzHh4hRsV2@mail.gmail.com>
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
Subject: bitbake error on ncurses_5.4.bb C compiler cannot create executables
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
X-List-Received-Date: Tue, 27 Jul 2010 04:15:04 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,
I was trying to run " bitbake fso-illume-image" and it rerturned an error
that do_config on ncurses5.4.bb failed
the respective log is

Configuring NCURSES 5.4 ABI 5 (Tue Jul 27 09:32:35 IST 2010)
checking build system type... i686-pc-linux-gnu
checking host system type... arm-oe-linux-gnueabi
checking target system type... arm-oe-linux-gnueabi
Configuring for linux-gnueabi
checking for prefix... /usr
checking for arm-oe-linux-gnueabi-gcc... arm-oe-linux-gnueabi-gcc
-march=armv4t -mtune=arm920t -mthumb-interwork -mthumb
checking whether the C compiler works... no
configure: error: in
`/home/ranjith/test/build/tmp/work/armv4t-oe-linux-gnueabi/ncurses-5.4-r20.0/ncurses-5.4':
configure: error: C compiler cannot create executables
See `config.log' for more details.

and the config.log entry is

.## ----------- ##
## confdefs.h. ##
## ----------- ##

/* confdefs.h */
#define PACKAGE_NAME ""
#define PACKAGE_TARNAME ""
#define PACKAGE_VERSION ""
#define PACKAGE_STRING ""
#define PACKAGE_BUGREPORT ""
#define PACKAGE_URL ""
#define SYSTEM_NAME "linux-gnueabi"

configure: exit 77

I tried googling and tried installing gcc newer version, buildessentials,
epenembedded-essentials, but nothign worked for me.
So can any one help me in this regard to solve this issue ,,

Regards,
Ranjith

-- 
Ranjith Babu Kannikara
0091 9809215273
Student, Computer science and engg, GEC Thrissur...
Student developer google ( 2008 GSOC ).
http://sourceforge.net/users/kannikara
http://www.ranjithkannikara.blogspot.com/

