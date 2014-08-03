Return-Path: <thomas.senyk@pelagicore.com>
Received: from mail-wg0-f52.google.com (mail-wg0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 0FEBE601A8
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  3 Aug 2014 07:23:12 +0000 (UTC)
Received: by mail-wg0-f52.google.com with SMTP id a1so6075073wgh.23
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 03 Aug 2014 00:23:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization
	:user-agent:in-reply-to:references:mime-version
	:content-transfer-encoding:content-type;
	bh=6DY2KPbKN+OERKpn8IOzU4+UZgptsjjeljCPxjyxm9k=;
	b=ig2xAffYnrpCVFACLDPLPgO4KuCZj//WVUbfHC/Yr7ZxGUOT4waR++u47AC2jrzCoA
	WP8YHOX0juLw2HkGW0HoCJ/zy/c45K8H1bi3ktU/BQPhxb5ExL7xJ8piwM+zzO01wfHa
	5/uaB2e7GlhGOc++vnivbZ7b6j4ieJtjepsWTstnkv17gAFRkyjFni81W4H0WW3BnJRa
	Vhn+4145DdTJm2Cbc1asfVQnBcTK8NHG+rzGTR7lxRA1RawBrJDl8WVxwt5b1ezLCVgC
	yf5MGqy5dxcFOkdzRvMRqntpW9Sa8waHdvJosPOPI+JQtgffEWh6atBCsi1hMSgJsYrj
	ORAQ==
X-Gm-Message-State: ALoCoQlu424SUhkH5fF5852bUeD5SEOoux4OilRNN5xg4bvfP08/NAbMe8HBsTPNH0Z8EmzJceY0
X-Received: by 10.180.182.161 with SMTP id ef1mr21024128wic.44.1407050593185; 
	Sun, 03 Aug 2014 00:23:13 -0700 (PDT)
Received: from comet.localnet
	(HSI-KBW-149-172-7-15.hsi13.kabel-badenwuerttemberg.de.
	[149.172.7.15])
	by mx.google.com with ESMTPSA id b9sm27018479wic.23.2014.08.03.00.23.11
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 03 Aug 2014 00:23:12 -0700 (PDT)
From: Thomas Senyk <thomas.senyk@pelagicore.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 03 Aug 2014 09:23:10 +0200
Message-ID: <5290215.bXYc1MYsDd@comet>
Organization: Pelagicore AG
User-Agent: KMail/4.13.3 (Linux/3.15.7-1-ARCH; KDE/4.13.3; x86_64; ; )
In-Reply-To: <CAHURY+2S57BPgcsbNZjnpLQs4f-x7k=hbNqVnrT6yS0dwQuy0A@mail.gmail.com>
References: <CAHURY+15jB-vQQakQSfjL7WsNjpQyQy6Nq-dcUVPKJ11SNWF7w@mail.gmail.com>
	<20140802202908.GB23556@haswell>
	<CAHURY+2S57BPgcsbNZjnpLQs4f-x7k=hbNqVnrT6yS0dwQuy0A@mail.gmail.com>
MIME-Version: 1.0
Cc: Sandeep Gound <sandeepg@mindastoneridge.com>
Subject: Re: bitbake meta-toolchain error
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 03 Aug 2014 07:23:13 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

On Sunday, August 03, 2014 09:53:24 AM Nilesh Kokane wrote:
> Hi Raj,
> 
> 
> Thanks for your valuable reply first of all.
> 
> 
> 
> 
> 
> It seems eglvivante.h might have issues are you compiling
> Qt with XCB support ?
> 
> Yes , i'm compiling the Qt with the XCB support

And that's the problem .. isn't it? From previose mails I understand you 
trying to get a EGLFS (egl on top of framebuffer) build .. right?
(the rest of this mail assume a 'yes' to this answer)

You're trying to compile Qt/XCB on top of a sysroot which has no X11 in it.

.. and/or you have X11 left overs from previous builds and Qt picks them up 
although you're building with -DEGL_API_FB=1

> 
> then check if egl defines are OK in that header.
> you might delete all defines except X11 in eglvivante.h
> may be that will help.

Tinkering your eglvivante.h sound like the wrong thing to do :)

This should be solved by qtbase_%.bbappend in meta-fsl-arm.
You'll see that there is code for:
	a. taking the right platform plugin
		(the line with "-eglfs" in it)*
	b. setup for eglvivante.h
		(the lines around -DEGL_API_FB=1

(*this line could be improved by adding -xcb and -no-xcb accordingly...)


Open qtbase.inc (from meta-qt5) and remove the "-silent"
Then clean your build director* (I usually just delete the complete build 
folder and start from scratch) 
Build again, and if it fails then write again to this mail list with links to 
all logs: 
	bitbake log, 
	qtbase: run.configure, log.do_configure, run.do_compile, log.do_compile


(*This is just to make sure the change for DISTRO_FEATURE has no side effects, 
if already did a clean build after the change then you should be good)

> 
> 
> My eglvivante.h looks something like  this http://pastebin.com/DTEDrRkx
> can you tell me exactly what i need to delete in the header file for
> circumventing the problem
> 
> 
> 
> Thanks
> Nilesh Kokane
> 
> On Sun, Aug 3, 2014 at 1:59 AM, Khem Raj <raj.khem@gmail.com> wrote:
> > On 14-08-02 08:59:13, Nilesh Kokane wrote:
> > > where are the logs
> > > 
> > > I'm logged with the errors as posted on pastebin
> > > http://pastebin.com/hsMhT9f8
> > > 
> > > Please if you can have alook.
> > 
> > It seems eglvivante.h might have issues are you compiling
> > Qt with XCB support ?
> > then check if egl defines are OK in that header.
> > you might delete all defines except X11 in eglvivante.h
> > may be that will help.


