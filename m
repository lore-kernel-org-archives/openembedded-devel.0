Received: from [64.233.182.187] (helo=nf-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <pmiscml@gmail.com>) id 1H3Zk5-0000kh-5e
	for openembedded-devel@lists.openembedded.org;
	Sun, 07 Jan 2007 16:15:25 +0100
Received: by nf-out-0910.google.com with SMTP id l24so8370757nfc
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 07 Jan 2007 07:13:51 -0800 (PST)
Received: by 10.49.20.15 with SMTP id x15mr18832956nfi.1168182831259;
	Sun, 07 Jan 2007 07:13:51 -0800 (PST)
Received: from CUBE ( [82.193.96.238])
	by mx.google.com with ESMTP id b1sm103458755nfe.2007.01.07.07.13.50;
	Sun, 07 Jan 2007 07:13:51 -0800 (PST)
Date: Sun, 7 Jan 2007 17:14:04 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Priority: 3 (Normal)
Message-ID: <1976028215.20070107171404@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <45A0FB1D.40907@dominion.kabel.utwente.nl>
References: <E1H3LkV-0005Np-21@linuxtogo.org>
	<45A0FB1D.40907@dominion.kabel.utwente.nl>
MIME-Version: 1.0
Subject: Re: [oe-commits] org.oe.dev matchbox-panel: Update from using specific machine overrides to using machine
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
X-List-Received-Date: Sun, 07 Jan 2007 15:15:25 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Koen,

Sunday, January 7, 2007, 3:52:29 PM, you wrote:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1

> pfalcon commit schreef:
>> matchbox-panel: Update from using specific machine overrides to using machine
>> features (GUI_MACHINE_CLASS).
>> 
>> Author: pfalcon@openembedded.org

> |
> /data/build/koen/OE/build/tmp/angstrom/work/collie-angstrom-linux/matchbox-panel-0.9.3-r1/temp/run.do_configure.27231:
> line 196:
[]
>  $@: bad substitution

   Sorry, I tested it on h4000 & hx4700 to check both standard boolean
cases, guess double indirection trick is just too hacky. I
reimplemented it using standard @base_conditional(), which should just
work I assume. Sorry, I cannot test it now, as collie build pulls up
new gcc, etc., please let me know if something's wrong still.

> NOTE: Task failed:
> /data/build/koen/OE/build/tmp/angstrom/work/collie-angstrom-linux/matchbox-panel-0.9.3-r1/temp/log.do_configure.27231
> NOTE: package matchbox-panel-0.9.3-r1: task do_configure: failed

> Could you fix that please?


-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



