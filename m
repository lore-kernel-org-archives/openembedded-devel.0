Received: from [65.55.111.177] (helo=blu0-omc4-s38.blu0.hotmail.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <tiankongever@hotmail.com>) id 1MEHlJ-0008Tz-77
	for openembedded-devel@lists.openembedded.org;
	Wed, 10 Jun 2009 08:58:18 +0200
Received: from BLU137-W29 ([65.55.111.136]) by blu0-omc4-s38.blu0.hotmail.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Tue, 9 Jun 2009 23:48:36 -0700
Message-ID: <BLU137-W29570FDEF1300363D893E4D4450@phx.gbl>
X-Originating-IP: [219.142.122.100]
From: =?gb2312?B?wfW3vLuq?= <tiankongever@hotmail.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 10 Jun 2009 14:48:35 +0800
Importance: Normal
In-Reply-To: <1244206438.6643.46.camel@port4>
References: <BLU137-W15C50162BE2D466B2B3182D44C0@phx.gbl>
	<1244144325.6678.0.camel@port4>
	<BLU137-W9D00E1434DB12273A400AD4480@phx.gbl>
	<1244206438.6643.46.camel@port4>
MIME-Version: 1.0
X-OriginalArrivalTime: 10 Jun 2009 06:48:36.0091 (UTC)
	FILETIME=[7A79DCB0:01C9E997]
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: OE Build :error configure failed to discover size of unix socket path
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
X-List-Received-Date: Wed, 10 Jun 2009 06:58:18 -0000
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: 8bit



Hi!

   I met a error while I build:

/mono/io-layer/wapi-private.h:22:2: error: #error configure failed to discover size of unix socket path
| make[3]: *** [collection.lo] Error 1
| make[3]: Leaving directory `/home/build/stuff/workspace/work/i586-ThunderST-linux/mono-2.4-r0/mono-2.4/mono/io-layer'
| make[2]: *** [all-recursive] Error 1
| make[2]: Leaving directory `/home/build/stuff/workspace/work/i586-ThunderST-linux/mono-2.4-r0/mono-2.4/mono'
| make[1]: *** [all-recursive] Error 1
| make[1]: Leaving directory `/home/build/stuff/workspace/work/i586-ThunderST-linux/mono-2.4-r0/mono-2.4'
| make: *** [all] Error 2
| FATAL: oe_runmake failed
NOTE: Task failed: /home/build/stuff/workspace/work/i586-ThunderST-linux/mono-2.4-r0/temp/log.do_compile.10880
NOTE: package mono-2.4-r0: task do_compile: failed
ERROR: TaskFailed event exception, aborting
NOTE: package mono-2.4: failed
ERROR: Build of /home/build/stuff/openembedded/packages/mono/mono_2.4.bb do_compile failed
ERROR: Task 9 (/home/build/stuff/openembedded/packages/mono/mono_2.4.bb, do_compile) failed
NOTE: Tasks Summary: Attempted 7 tasks of which 0 didn't need to be rerun and 1 failed.
ERROR: '/home/build/stuff/openembedded/packages/mono/mono_2.4.bb' failed
NOTE: build 200906101437: completed

Any advice will be appreciated!


_________________________________________________________________
Messenger10年嘉年华，礼品大奖等你拿！
http://10.msn.com.cn
From esbenhaabendal@gmail.com Wed Jun 10 09:03:20 2009
Received: from [74.125.92.146] (helo=qw-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <esbenhaabendal@gmail.com>) id 1MEHq9-00009K-42
	for openembedded-devel@lists.openembedded.org;
	Wed, 10 Jun 2009 09:03:18 +0200
Received: by qw-out-1920.google.com with SMTP id 14so359686qwa.36
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Jun 2009 23:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=aFGK1ifdLqUdTxrlAisQXzgHU/p29kiCpVPFUu3PFmg=;
	b=qT66Rt5fawbhkrzwRshCgCx+bGZ+qua04kSSJIq35pQNv7IH0DIETFB7Q9A7+G52gb
	NMCSb0SKpBCH5KEHMZdxH8nLC2FqUQIzemlRXac+CHP1BT6EhgC1w7TSg7/fR7un0wdj
	dNMC2GwEW6CwHDjl26ultzsfCZVRCTGhADzfY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=cC/ORus5B9t45/YHWRi7r2tXnjZeiqQ2oy69jSPznJLrgKTbDalqMkKI7r6ryXGULo
	xQDXM371O3ZrcdULxopmfNyvt53E/4GhD2F9vKLCqrKMzyiuJkt94iZgqCCXDPsYIei7
	lJin2Yljlol8V7nwDlK0mdYH5+O8p/2xiyZuM=
MIME-Version: 1.0
Received: by 10.224.67.1 with SMTP id p1mr1368984qai.263.1244616817166; Tue, 
	09 Jun 2009 23:53:37 -0700 (PDT)
In-Reply-To: <200906091121.59329.mickey@vanille-media.de>
References: <f96d234e0904300544g4f933c15x1abaa430373868fa@mail.gmail.com>
	<f96d234e0906051443y3d0cfcf0m595469c780c9fed@mail.gmail.com>
	<200906060846.30822.mickey@vanille-media.de>
	<200906091121.59329.mickey@vanille-media.de>
Date: Wed, 10 Jun 2009 08:53:37 +0200
Message-ID: <d2b9ea600906092353o4fe9ea02vbc7df3b103b401c4@mail.gmail.com>
From: Esben Haabendal <esbenhaabendal@gmail.com>
To: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Subject: Re: [oe] progress on OE organization issues
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
X-List-Received-Date: Wed, 10 Jun 2009 07:03:20 -0000

On Tue, Jun 9, 2009 at 11:21 AM, Michael 'Mickey'
Lauer<mickey@vanille-media.de> wrote:
> Alas, right now we have
>
> =A0* 20 subscribers to the member-list, of
> =A0* 70 folks with commit access, of
> =A0* several hundred subscribers to the devel-list,
> =A0let alone all the stakeholders "in the dark" ;)
>
> So, please join the e.V. and request membership to the e.V. via the membe=
rs
> list, in case you did not have already.

As for the last bullet point, what is the status of membership for
those of us without commit access? I seem to have seen mixed signals
wether we are invited to be member of the e.V.  Some messages
indicates that only people with commit access are going to be
accepted, while others (like mickey) request all interested in OE to
join the e.V.

Could someone put a small statement on Wiki on this?

/Esben

--=20
Esben Haabendal, Senior Software Consultant
Dor=E9Development ApS, Ved Stranden 1, 9560 Hadsund, DK-Denmark
Phone: +45 51 92 53 93, E-mail: eha@doredevelopment.dk
WWW: http://www.doredevelopment.dk


