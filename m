Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <daniel.xntian@gmail.com>) id 1OFIdF-0003Yi-PI
	for openembedded-devel@lists.openembedded.org;
	Fri, 21 May 2010 05:10:43 +0200
Received: by vws20 with SMTP id 20so494000vws.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 May 2010 20:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=JvITO8OFcpnnpm8f/SAXZXZ9TcSrgG9EYcSRP1CPl3I=;
	b=OjsP37RpGSSvsP0+s8HaskaEaCbUz33x+xQkYL/5hG0HO0MrMnhH6W5VsPoWeSHo7O
	Z0qVuYo3RXCP+MLJbeMYdsJkR+jvn7iofBbuhOjtAxP5Zr1lUZsyhYa4BB2Cb+H6drxK
	fjOWyXZZAZw6JNrBye3HFwCU+vHbQ9B+T5/lQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	b=T9aKS0cGLoMfupWU//kaMOI6nnDGWzyRJw9OduOhMMOhXPobonsT24RE95gu0MwDlS
	GT5i1xmZLdKPGeG9D020MjlwN7gjfEJBXiXgmj94qgjbFvqSMXlU0USJAEJXjAdZevnz
	UjsOYvqMI8iIGzryhsc9dKU3hn0VzEmAMwlK4=
MIME-Version: 1.0
Received: by 10.220.60.199 with SMTP id q7mr638086vch.204.1274411198608; Thu, 
	20 May 2010 20:06:38 -0700 (PDT)
Received: by 10.220.100.140 with HTTP; Thu, 20 May 2010 20:06:38 -0700 (PDT)
In-Reply-To: <20100519094209.GH3302@jama>
References: <AANLkTimeUg2WhglfZE-N2rdYNZ4yehKmR6YSvBL5NIPX@mail.gmail.com>
	<20100519094209.GH3302@jama>
Date: Fri, 21 May 2010 11:06:38 +0800
Message-ID: <AANLkTikMWsFhMyvjKX1D8Zhmu5Iuva1Q9ELU1siIF8Vf@mail.gmail.com>
From: daniel tian <daniel.xntian@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.212.47
X-SA-Exim-Mail-From: daniel.xntian@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: martin.jansa@gmail.com
Subject: Re: Does anybody try the e-image-core
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
X-List-Received-Date: Fri, 21 May 2010 03:10:43 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/5/19 Martin Jansa <martin.jansa@gmail.com>:
> On Wed, May 19, 2010 at 05:31:21PM +0800, daniel tian wrote:
>> Hi, guys:
>> =A0 =A0 Now I am working on a project: porting the enlighenment on mips =
machine.
>> =A0 =A0 The local.conf is configure as db1200 machine which is a mips32
>> little endian arch.
>> =A0 =A0 I have already built a rootfs and kernel from previous
>> openembedded source code.
>> =A0 =A0 But the startx command is not found, so I don't know how to
>> startup the enlightenment desktop, and maybe there have any others
>> packages missing in this rootfs.
>
> you can try xserver-nodm-init recipe which provides
> /etc/init.d/xserver-nodm (no idea if it's part of e-image-core).
>
I already built the xserver-nodm-init recipe, and the "opkg install
xserver-nodm-init_1.0-r11.5_all.ipk" runned on my board.
but errors happen, here is the message:

Installing xserver-nodm-init (1.0-r11.5) to root...
Configuring xserver-nodm-init.
 Adding system startup for /etc/init.d/xserver-nodm.
Starting Xserver
/etc/rc5.d/S05xserver-nodm: line 35: /etc/X11/Xserver: not found

it seems I still miss something else.

Any ideas?
Sorry, I am  a novice in this OE.

Thank u very much.
                                                            daniel


