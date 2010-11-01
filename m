Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <zach.frey@gmail.com>) id 1PCxnx-00005s-Vh
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Nov 2010 18:04:23 +0100
Received: by wwb39 with SMTP id 39so63146wwb.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Nov 2010 10:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:sender:received:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=vQpnbmAxiIa3ZdFERdNPLlEWUhrymdSPgFXF2cWq2B4=;
	b=BSpjW4fvdZuriRWyZO/N99FPkiqVeVJAcra2lUykl1/uyW67yydYfJ87SqlRn6TVoi
	0Mu6AmtybwX88tueVoro8DmMYaVJqtaDvksClWfLyI9dxBefIwBWzgmA3DzYLBWW+rtb
	F4a+3wCcE0cu2HLXXKLv3waN7O3JMVHOKyZBI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:date:x-google-sender-auth:message-id:subject
	:from:to:content-type;
	b=vQF9ZORVpzuuSPE53RuO1HpL34tzSI+v7OO4SP/WUigTn8Z/GPDkzGV4LQ68p8HJKx
	UxQBu1Yz1/RSiFaIcUm5QUtYZFDPyexF5OjMaXeF2E2lZinGj99sSCwBbJVW1I1+zzy5
	td4q9lJ8BFRZ75IbJ44ehQnuu6p+nGKI8dSLs=
MIME-Version: 1.0
Received: by 10.216.56.18 with SMTP id l18mr3020834wec.36.1288631012599; Mon,
	01 Nov 2010 10:03:32 -0700 (PDT)
Sender: zach.frey@gmail.com
Received: by 10.216.37.5 with HTTP; Mon, 1 Nov 2010 10:03:32 -0700 (PDT)
Date: Mon, 1 Nov 2010 13:03:32 -0400
X-Google-Sender-Auth: LFHZtn-sGT4zjzdLhQif0r17dEQ
Message-ID: <AANLkTi=gi8pk_McpA58rvcOHdq-0Xpz+NyF2doWPO00B@mail.gmail.com>
From: Zach Frey <zach@znfrey.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.41
X-SA-Exim-Mail-From: zach.frey@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	SPF_PASS,WEIRD_PORT autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Trouble compiling system-tools-backends
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
X-List-Received-Date: Mon, 01 Nov 2010 17:04:23 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi everyone,

I'm trying to build angstrom-gnome-image with latest for omapzoom2 (on
Ubuntu 8.04) and I'm getting the following error:

| Making all in services
| make[2]: Entering directory
`/home/PHOENIX/frey/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/system-tools-backends-2.10.1-r0/system-tools-backends-2.10.1/services'
| cd .. && \
|       /bin/sh
/home/PHOENIX/frey/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/system-tools-backends-2.10.1-r0/system-tools-backends-2.10.1/missing
--run automake-1.7 --gnu  services/Makefile
| configure.in:8: version mismatch.  This is Automake 1.7.9,
| configure.in:8: but the definition used by this AM_INIT_AUTOMAKE
| configure.in:8: comes from Automake 1.11.1.  You should recreate
| configure.in:8: aclocal.m4 with aclocal and run automake again.
| make[2]: *** [Makefile.in] Error 1
| make[2]: Leaving directory
`/home/PHOENIX/frey/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/system-tools-backends-2.10.1-r0/system-tools-backends-2.10.1/services'
| make[1]: *** [all-recursive] Error 1
| make[1]: Leaving directory
`/home/PHOENIX/frey/OE/build/tmp/work/armv7a-angstrom-linux-gnueabi/system-tools-backends-2.10.1-r0/system-tools-backends-2.10.1'
| make: *** [all] Error 2
| FATAL: oe_runmake failed
| ERROR: Function do_compile failed
NOTE: package system-tools-backends-2.10.1-r0: task do_compile: Failed
ERROR: TaskFailed event exception, aborting
ERROR: Build of /home/PHOENIX/frey/OE/openembedded/recipes/gnome/
system-tools-backends_2.10.1.bb do_compile failed
ERROR: Task 2237 (/home/PHOENIX/frey/OE/openembedded/recipes/gnome/
system-tools-backends_2.10.1.bb, do_compile) failed with 256
ERROR: '/home/PHOENIX/frey/OE/openembedded/recipes/gnome/
system-tools-backends_2.10.1.bb' failed
ERROR: '/home/PHOENIX/frey/OE/openembedded/recipes/gnome/
system-tools-backends_2.10.1.bb' failed


Ideas?

Thanks,
Zach Frey

