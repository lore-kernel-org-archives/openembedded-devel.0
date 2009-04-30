Received: from [209.85.219.172] (helo=mail-ew0-f172.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dp@xora.org.uk>) id 1LzXEz-0007sH-2E
	for openembedded-devel@lists.openembedded.org;
	Thu, 30 Apr 2009 16:27:57 +0200
Received: by ewy20 with SMTP id 20so3855382ewy.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Apr 2009 07:22:32 -0700 (PDT)
Received: by 10.210.71.11 with SMTP id t11mr271656eba.49.1241101352558;
	Thu, 30 Apr 2009 07:22:32 -0700 (PDT)
Received: from ?192.168.1.10? (94-193-93-235.zone7.bethere.co.uk
	[94.193.93.235])
	by mx.google.com with ESMTPS id 7sm3983099eyg.47.2009.04.30.07.22.31
	(version=SSLv3 cipher=RC4-MD5); Thu, 30 Apr 2009 07:22:31 -0700 (PDT)
Message-ID: <49F9B426.5020602@xora.org.uk>
Date: Thu, 30 Apr 2009 15:22:30 +0100
From: Graeme Gregory <dp@xora.org.uk>
User-Agent: Thunderbird 2.0.0.21 (X11/20090318)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <20090430140436.GA7335@pcimg12.dei.unipd.it>
In-Reply-To: <20090430140436.GA7335@pcimg12.dei.unipd.it>
X-Enigmail-Version: 0.95.0
Subject: Re: receipe for libmicrohttpd
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
X-List-Received-Date: Thu, 30 Apr 2009 14:27:57 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Ottavio Campana wrote:
> I wrote the receipe for libmicrohttpd, a LPGL library used to embedded a
> web server in programs.
>
> It works for me, but I'd like to have some feedback from you, if it is
> good or not and if you'd like to add it to OE.
>
> Ottavio
>
> PR = "r1"
> PN = "libmicrohttpd"
> DESCRIPTION = "GNU libmicrohttpd is a small C library that is supposed to make it easy to run an HTTP server as part of another application"
> HOMEPAGE = "http://www.gnu.org/software/libmicrohttpd/"
> SECTION = "libs"
> LICENSE = "LGPL"
>
> SRC_URI = "ftp://ftp.gnu.org/gnu/libmicrohttpd/libmicrohttpd-0.4.1.tar.gz"
>
> inherit autotools pkgconfig
>
> do_stage() {
>         oe_runmake DESTDIR="${D}" install
>         autotools_stage_all
> }
>
> do_qa_staging () {
> }
>
>   
You need to run the recipe through oe-stylize (found in contrib directory).

Why did you override do_qa_staging() ?

Apart from this recipe looks good, cleanup and submit as a git-diff.

Graeme



