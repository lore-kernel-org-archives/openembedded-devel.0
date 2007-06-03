Received: from [81.228.8.164] (helo=pne-smtpout2-sn2.hy.skanova.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <ulf@atmel.com>) id 1Huykd-0004cx-N9
	for openembedded-devel@openembedded.org; Mon, 04 Jun 2007 00:40:45 +0200
Received: from [192.168.2.3] (81.233.24.250) by
	pne-smtpout2-sn2.hy.skanova.net (7.2.075) (authenticated as
	0706224457) id 46245DE100C1DC63; Mon, 4 Jun 2007 00:38:36 +0200
Message-ID: <46634298.6050406@atmel.com>
Date: Mon, 04 Jun 2007 00:37:12 +0200
From: Ulf Samuelsson <ulf@atmel.com>
Organization: Atmel Nordic AB
User-Agent: Thunderbird 1.5.0.10 (X11/20060911)
MIME-Version: 1.0
To: Ulf Samuelsson <ulf@atmel.com>
References: <4662FAD5.9070803@atmel.com>
In-Reply-To: <4662FAD5.9070803@atmel.com>
X-Enigmail-Version: 0.94.2.0
Cc: openembedded-devel@openembedded.org
Subject: Re: Failure building angstrom-X11-image
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 03 Jun 2007 22:40:50 -0000
X-Groupsio-MsgNum: 2170
Content-Type: multipart/mixed; boundary="------------050706070904090306070202"

--------------050706070904090306070202
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Ulf Samuelsson skrev:
> When building libsoup, the configure routine hangs whcn checking for "xmlrpc-epi-php"
> I am running OpenSuse 10.2
> Installed php5-devel and php5-xmlrpc and no locj
> Downloaded xmlrpc-epi from sourceforge, and installed this.
> Dowbkiaded xmlrpc-epi-php from sourcefourge and configured this.
> There was a failure during build.
> 
> static unsigned char second_args_force_ref[] = { 3, BYREF_NONE, BYREF_FORCE,
> BYREF_NONE }
> 
> was incompatible with the declatation of second_args_force_ref in
> /usr/include/php5/Zend/zend_modules.h
> 
> extern unsigned char second_args_force_ref[3];   (IIRC)
> 
> I guess removing static could help, but BYREF_FORCE and BYREF_NONE seems to be unkonwn.
> Cant find those in include files.
> 
> Any clues?
> 
I now realize, I have to recompile php after configuring --with-xmlrpc

-- 
Best Regards,
Ulf Samuelsson

--------------050706070904090306070202
Content-Type: text/x-vcard; charset=utf-8;
 name="ulf.vcf"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="ulf.vcf"

begin:vcard
fn:Ulf Samuelsson
n:Samuelsson;Ulf
org:Atmel Nordic AB
adr;quoted-printable:;;Kavalleriv=C3=A4gen 24;Sundbyberg;S;117 58;Sweden
email;internet:ulf@atmel.com
title:Field Application Engineer
tel;work:+46 8 441 54 22
tel;cell:+46 706 22 44 57
url:http://www.atmel.com
version:2.1
end:vcard


--------------050706070904090306070202--
