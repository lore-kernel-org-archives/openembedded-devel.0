Received: from [68.142.199.193] (helo=web33604.mail.mud.yahoo.com)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <cottons_box@yahoo.co.uk>) id 1MdAub-0007RO-4N
	for openembedded-devel@openembedded.org; Tue, 18 Aug 2009 00:42:46 +0200
Received: (qmail 80267 invoked by uid 60001); 17 Aug 2009 22:25:42 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.co.uk; s=s1024;
	t=1250547942; bh=iJPrC1gJWeDxxwDmLbVlORhrAvOjK9YVgMElqNr2eAc=;
	h=Message-ID:X-YMail-OSG:Received:X-Mailer:Date:From:Subject:To:MIME-Version:Content-Type:Content-Transfer-Encoding;
	b=2vQZX3CKzFVRy+cuA4GX7fflc1Z1Qg1F8Twv5ql+kGxARRtSrB6g7WsBUAkqdifkCKGnr0PNnxS73ZRnTQ00yw9k4nyTeqZCE2OmBp6De8mOqAFvMynTHlKTb0yGI58aeELTwXS7d0i04OdChC+YR4Vx9QNs0i720WBqN0v0Vj8=
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=s1024; d=yahoo.co.uk;
	h=Message-ID:X-YMail-OSG:Received:X-Mailer:Date:From:Subject:To:MIME-Version:Content-Type:Content-Transfer-Encoding;
	b=NS9vRNtugd/HFhTBXeiCpugco4V6PyeFRLPRq9XcgJexAtAOP8o+Ua7KOUeC/L6Rpyik8nMURgyYLEUCVoYi7jfR/F+uDzezpxsuDVt+21qKm/6eLDJFEazbgLvYhcrh/926XTZ3RPa67+iiZdYDR//I5Cdi4Dk9asNZ3Y3TmPo=;
Message-ID: <802577.80063.qm@web33604.mail.mud.yahoo.com>
X-YMail-OSG: nNQXXrUVM1ktGczuIlwOuoqMLRGpW3TaYbi0V2JqmWjIPxBp_F90SlOyxM_HlcVG3Y4qZ61EVooBJCy0XklD909YVmH3SISzHAV0riUBOp6cm9cVuTVew1de3l5TpwI7CTfZiRKCoiThbs1Ld8k.PyabCygz8CLEnIVSh.R8Sz3cK9IP3pwsmf67GCxJpiupw3GTnTBlSY3tAODWGpkHUG_b_sOE24XVRwWJZCzbulMtdxA03uLPCBGDChIYDsLz0rF0wjbnuccR3nYjMrrfEyJ_fnQQEknGPvV9qnRXSsYMtgc35ULMjW2c1KlsRjIQ3vNxew--
Received: from [86.161.141.163] by web33604.mail.mud.yahoo.com via HTTP;
	Mon, 17 Aug 2009 15:25:42 PDT
X-Mailer: YahooMailClassic/6.1.2 YahooMailWebService/0.7.338.2
Date: Mon, 17 Aug 2009 15:25:42 -0700 (PDT)
From: Chris Cotton <cottons_box@yahoo.co.uk>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
Subject: Debugging using Eclipse CDT and OpenEmbedded - how to set it up?
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
X-List-Received-Date: Mon, 17 Aug 2009 22:42:47 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi all, =0A=0AI am new to OpenEmbedded, having come from a background of wr=
iting C code for 8 bit microprocessors.  I am now starting out using OpenEm=
bedded with the Gumstix Overo range of devices. (ARM Cortex-A8 based) A pos=
t similar to the following was put on the Nabble Gumstix forums earlier tod=
ay, and it has been suggested that it may be of interest to people here as =
well.  If this is not the right place for it, I apologise.=0A=0AI have writ=
ten a simple 'Hello World' program in C, and have compiled and tested it na=
tively on my PC (which is running Debian 5) in Eclipse.  I have also compil=
ed it from within the OpenEmbedded environment, and then run it on my targe=
t hardware.  My goal is to debug an application on the Gumstix Overo using =
Eclipse, the GDB debugger and an NFS server, utilising the Ethernet connect=
ion present on the Gumstix.=0A=0AThe problem is that I can't work out how t=
o set up Eclipse to use the ARM cross - compile toolchain built into OpenEm=
bedded.  I've found the C/C++ Build and General setup sections in Eclipse, =
but can't work out where all the right bits of the cross compiler are withi=
n my OpenEmbedded installation, and where they go in the Eclipse setup.=0A=
=0AIn summary, I would be extremely grateful to anyone who is willing to sh=
ow me, in simple steps, how to tie OpenEmbedded to Eclipse to enable user-f=
riendly debugging.=0A=0AThank you in advance,=0AChris Cotton.=0A=0A=0A     =
 


