Received: from mail-px0-f179.google.com ([209.85.216.179])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <camelguo@gmail.com>) id 1NbR3W-0008H6-Gp
	for openembedded-devel@lists.openembedded.org;
	Sun, 31 Jan 2010 05:05:05 +0100
Received: by pxi9 with SMTP id 9so2908130pxi.24
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 30 Jan 2010 20:02:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:content-type:to:subject
	:references:date:mime-version:content-transfer-encoding:from
	:organization:message-id:in-reply-to:user-agent;
	bh=Tp+Sei2cv/1aTbY2MZ+S87AfZUmFPeia0lM/V8R27cM=;
	b=okd8y34Ri50Qdln+xoHDLIETk9dfOf+5iiEfBO66cJghl8btTfjkmVtC7h/9+SMft2
	e/dto46kX1G/6BNZRNORo/ehuw+TUyKlu1bFWy0OyghNJB0waMCQz8/30KPb078fEISI
	nHysIFzP6gqFtBL0fWPe8qJVRHGZ4XIsld/lU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=content-type:to:subject:references:date:mime-version
	:content-transfer-encoding:from:organization:message-id:in-reply-to
	:user-agent;
	b=fqcvFd36b2pBabFaf1f2/VwW9dBHPZI7p+Qxf13ctK9qyT32ONtqwNB3hx2K2XV81J
	x8+r/3pgL/uUWWuiQeo/2QcD6OONnfyrI2sIkTBiCzNPdA2WFlw9kOn7W9ejO3SKykum
	6gjrJ1uRBjpRSaEc7covvTCDTDHa7WJ3vks1w=
Received: by 10.141.15.21 with SMTP id s21mr1940554rvi.218.1264910556883;
	Sat, 30 Jan 2010 20:02:36 -0800 (PST)
Received: from camelguo ([123.54.107.86])
	by mx.google.com with ESMTPS id 21sm3159298pzk.7.2010.01.30.20.02.33
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 30 Jan 2010 20:02:36 -0800 (PST)
To: "Guo Hongruan" <camelguo@gmail.com>,
	openembedded-devel@lists.openembedded.org
References: <op.u7dnj4v0mn1qzu@camelguo>
	<201001310435.35312.holger+oe@freyther.de> <op.u7do2cw1mn1qzu@camelguo>
Date: Sun, 31 Jan 2010 12:02:28 +0800
MIME-Version: 1.0
From: "Guo Hongruan" <camelguo@gmail.com>
Organization: Gulessoft, Inc
Message-ID: <op.u7dpieeymn1qzu@camelguo>
In-Reply-To: <op.u7do2cw1mn1qzu@camelguo>
User-Agent: Opera Mail/10.10 (Linux)
X-SA-Exim-Connect-IP: 209.85.216.179
X-SA-Exim-Mail-From: camelguo@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: building u-boot - git failed
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
X-List-Received-Date: Sun, 31 Jan 2010 04:05:05 -0000
Content-Type: text/plain; charset=utf-8; format=flowed; delsp=yes
Content-Transfer-Encoding: Quoted-Printable

I think I got the answer, see  =

http://git.denx.de/?p=3Du-boot.git;a=3Dcommitdiff;h=3Df865fcbbb35851e75f=
ee9c3a3fa8e0f71d9e6463

adding the following patch to u-boot recipe can solve this problem.

diff --git a/lib_arm/board.c b/lib_arm/board.c
index 5e3d7f6..e148739 100644 (file)
--- a/lib_arm/board.c
+++ b/lib_arm/board.c
@@ -93,23 +93,23 @@ extern void rtl8019_get_enetaddr (uchar * addr);
   * May be supplied by boards if desired
   */
  void inline __coloured_LED_init (void) {}
-void inline coloured_LED_init (void) __attribute__((weak,  =

alias("__coloured_LED_init")));
+void coloured_LED_init (void) __attribute__((weak,  =

alias("__coloured_LED_init")));
  void inline __red_LED_on (void) {}
-void inline red_LED_on (void) __attribute__((weak,  =

alias("__red_LED_on")));
+void red_LED_on (void) __attribute__((weak, alias("__red_LED_on")));
  void inline __red_LED_off(void) {}
-void inline red_LED_off(void)       __attribute__((weak,  =

alias("__red_LED_off")));
+void red_LED_off(void) __attribute__((weak, alias("__red_LED_off")));
  void inline __green_LED_on(void) {}
-void inline green_LED_on(void) __attribute__((weak,  =

alias("__green_LED_on")));
+void green_LED_on(void) __attribute__((weak, alias("__green_LED_on")));=

  void inline __green_LED_off(void) {}
-void inline green_LED_off(void)__attribute__((weak,  =

alias("__green_LED_off")));
+void green_LED_off(void) __attribute__((weak, alias("__green_LED_off"))=
);
  void inline __yellow_LED_on(void) {}
-void inline yellow_LED_on(void)__attribute__((weak,  =

alias("__yellow_LED_on")));
+void yellow_LED_on(void) __attribute__((weak, alias("__yellow_LED_on"))=
);
  void inline __yellow_LED_off(void) {}
-void inline yellow_LED_off(void)__attribute__((weak,  =

alias("__yellow_LED_off")));
+void yellow_LED_off(void) __attribute__((weak,  =

alias("__yellow_LED_off")));
  void inline __blue_LED_on(void) {}
-void inline blue_LED_on(void)__attribute__((weak,  =

alias("__blue_LED_on")));
+void blue_LED_on(void) __attribute__((weak, alias("__blue_LED_on")));
  void inline __blue_LED_off(void) {}
-void inline blue_LED_off(void)__attribute__((weak,  =

alias("__blue_LED_off")));
+void blue_LED_off(void) __attribute__((weak, alias("__blue_LED_off")));=


  /*********************************************************************=
***
   * Init Utilities                                                     =
 *

=E5=9C=A8 Sun, 31 Jan 2010 11:52:50 +0800=EF=BC=8CGuo Hongruan <camelguo=
@gmail.com> =E5=86=99=E9=81=93:

> =E5=9C=A8 Sun, 31 Jan 2010 11:35:35 +0800=EF=BC=8CHolger Hans Peter Fr=
eyther  =

> <holger+oe@freyther.de> =E5=86=99=E9=81=93:
>
>> Now to the hint:
>> 1.) The issue seems to be caused by using newer GCC?
>
> I searched the error through google. It said that the error occurred  =

> using gcc-4.4.2, while using gcc-4.2, it works OK.
>
>> 2.) Take it up with upstream uboot to see how they want it to be  =

>> changed.
>> 2.1.) E.g. removing the "inline" could work and it should not increas=
e  =

>> the
>>        size of the text section
>> 2.2) E.g. instead of using the alias it could call the inline  =

>> function...
>
> Someone said it can be solved by removing 'inline' keywords.
>
>


-- =

Guo Hongruan, Embedded Linux Consultant
Skype: camelguo
Twitter: camelguo
http://www.gulessoft.com


