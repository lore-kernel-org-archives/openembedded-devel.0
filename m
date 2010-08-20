Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1OmRzP-0005zr-Ee
	for openembedded-devel@lists.openembedded.org;
	Fri, 20 Aug 2010 15:50:36 +0200
Received: by wwe15 with SMTP id 15so674306wwe.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Aug 2010 06:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=KuDnOb7KYXrGkRn/YcKBYN1DIGUqyG4xuzMX2Gnio6E=;
	b=oBV4qluhnwqFomhZ9TXeXmyTjnUwy4l6w8wqLY+pwRqUSS7zpybDTYHDKoa9AU3cmF
	GlxCRb3TQS/d3OpEkkAhb/909GXwUL4N0LbkL/YdX6qcwWps/k9s9od9Gb4Miwg+XaP2
	Cn4pfNMkmM94pu0M3/KXXg3UNjmEqavSzi6/M=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=W5sJ7vuSupSQJ/QVgKGiA/ZwHQO+npUW7X3JHz5afYehlhjLYgkgevOeREcQkNT5CN
	oXGObitiFj9O9TLG7vMT9wYl0V2EL29lcSeAvM/A3m0kwxAbZ4RdVW7CTs2Y4yblGaKg
	QXdx6xHnD8OgKXjDRvHsOWXsRzPV0xJ7XGE1M=
MIME-Version: 1.0
Received: by 10.227.156.83 with SMTP id v19mr1289378wbw.67.1282312210930; Fri,
	20 Aug 2010 06:50:10 -0700 (PDT)
Received: by 10.227.69.82 with HTTP; Fri, 20 Aug 2010 06:50:10 -0700 (PDT)
In-Reply-To: <A06367EE83B2214587BB5C9037AD244F1E35AB0561@34093-MBX-C14.mex07a.mlsrvr.com>
References: <A06367EE83B2214587BB5C9037AD244F1E35AB0561@34093-MBX-C14.mex07a.mlsrvr.com>
Date: Fri, 20 Aug 2010 15:50:10 +0200
Message-ID: <AANLkTimO3XjDg1B4Jxqgb_NBfFvg2iKkCwr54-ygu1H7@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.43
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: configure error for xproto
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
X-List-Received-Date: Fri, 20 Aug 2010 13:50:36 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 19, 2010 at 3:50 PM, David Peters <davidp@matrixpd.com> wrote:
> I recently ran "sh oebb.sh update" and tried building packages for the am=
3517-evm board. =A0I'm now getting the following error. =A0Any ideas what i=
s causing this?
> .
> 614 configure:3097: checking whether the C compiler works
> 615 configure:3119: arm-angstrom-linux-gnueabi-gcc -march=3Darmv7-a -mtun=
e=3Dcortex-a8 -mfpu=3Dneon -mfloat-abi=3Dsoftfp -mthumb-interwork -mno-thum=
b -isystem/home/dapeters/angstrom-setup-scripts/build/tmp-angstrom_2008_1/s=
ysroots/armv7a-angstrom-linux-gnueabi/usr/include -fexpensive-optimizations=
 -frename-registers -fomit-frame-pointer -O2 -ggdb3 -isystem/home/dapeters/=
angstrom-setup-scripts/build/tmp-angstrom_2008_1/sysroots/armv7a-angstrom-l=
inux-gnueabi/usr/include -L/home/dapeters/angstrom-setup-scripts/build/tmp-=
angstrom_2008_1/sysroots/armv7a-angstrom-linux-gnueabi/usr/lib -Wl,-rpath-l=
ink,/home/dapeters/angstrom-setup-scripts/build/tmp-angstrom_2008_1/sysroot=
s/armv7a-angstrom-linux-gnueabi/usr/lib -Wl,-O1 -Wl,--hash-style=3Dgnu conf=
test.c =A0>&5
> 616 Assembler messages:
> 617 Fatal error: Invalid -march=3D option: `armv7-a'

similar issue was reported today on IRC #oe

did you rebuild from scratch ( TMPDIR removed ) after
http://git.openembedded.org/cgit.cgi/openembedded/commit/?id=3Dff701435705b=
6d0bb28a051e5e3c524b2badc834

sanity check should force you to remove it..
but fahad_usman also had still old tmp/cross in PATH..

Regards,


