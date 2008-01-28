Received: from [209.85.128.186] (helo=fk-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <pmiscml@gmail.com>) id 1JJTEK-00020L-DV
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 Jan 2008 13:36:52 +0100
Received: by fk-out-0910.google.com with SMTP id 18so1148249fks.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Jan 2008 04:36:56 -0800 (PST)
Received: by 10.78.201.10 with SMTP id y10mr7103428huf.11.1201523816450;
	Mon, 28 Jan 2008 04:36:56 -0800 (PST)
Received: from widy.localdomain ( [88.231.81.34])
	by mx.google.com with ESMTPS id 2sm2611546nfv.26.2008.01.28.04.36.54
	(version=SSLv3 cipher=OTHER); Mon, 28 Jan 2008 04:36:55 -0800 (PST)
Date: Mon, 28 Jan 2008 14:48:21 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20080128144821.1b6f2741@widy.localdomain>
In-Reply-To: <479D9AA9.8020704@student.utwente.nl>
References: <479D9AA9.8020704@student.utwente.nl>
X-Mailer: Claws Mail 3.0.2 (GTK+ 2.12.1; i686-pc-linux-gnu)
Mime-Version: 1.0
Subject: Re: [oe-commits] org.oe.dev gnuplot: update 4.2.2, add 4.3.0+cvs
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
X-List-Received-Date: Mon, 28 Jan 2008 12:36:52 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 28 Jan 2008 10:04:41 +0100
Koen Kooi <k.kooi@student.utwente.nl> wrote:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> Hi,
> 
> - --
> gnuplot: update 4.2.2, add 4.3.0+cvs
> * restructure patch directories
> * update angstrom-preferred
> 
> Author: xjqian at openembedded.org
> 
> [snip]
> 
> conf/distro/include/angstrom-2007-preferred-versions.inc
> - --
> 
> I've seen a few updates to that file, but no mails about that. Let me
> paste the top few lines of
> conf/distro/include/angstrom-2007-preferred-versions.inc:
> 
> # This is a lock-down file for stability purposes
> # If you change anything, send a mail to
> angstrom-distro-devel@linuxtogo.org # stating the change and the
> reason.

Hm, but why that file is in .dev branch at all? What was idea of
removing 2007 .conf and leaving preferred-versions? Doing a grep, it is
referenced only by angstrom-2007-for-openmoko.inc, so shouldn't it be
merged there or renamed to make it clear that it relates more to
openmoko?

Alternatively, maybe indeed rename it to 2008 and start using right
away, as there're funky downgrades happen in 2008 already (abiword).

Anyway, here's what I have in it (the first 2 are gpephone-related,
old versions are non-buildable).

--- conf/distro/include/angstrom-2007-preferred-versions.inc
cb176be489c8cc84cc322cac2f96f85758f594fe +++
conf/distro/include/angstrom-2007-preferred-versions.inc
444321ceb910033c367422f9e305c6a7dc45b0e8 @@ -886,7 +886,7 @@
PREFERRED_VERSION_libgeda ?= "20050820" PREFERRED_VERSION_libgc ?=
"6.7" PREFERRED_VERSION_libgcrypt ?= "1.2.3"
PREFERRED_VERSION_libgeda ?= "20050820"
-PREFERRED_VERSION_libgemwidget ?= "0.1"
+PREFERRED_VERSION_libgemwidget ?= "1.0" PREFERRED_VERSION_libglade ?=
"2.6.2" PREFERRED_VERSION_libglademm ?= "2.4.1"
 PREFERRED_VERSION_libgmime ?= "2.1.7"
@@ -918,7 +918,7 @@ PREFERRED_VERSION_libhtml-mason-perl ?= 
 PREFERRED_VERSION_libhildonhelp ?= "1.9.1"
 PREFERRED_VERSION_libhildonmime ?= "1.9.5"
 PREFERRED_VERSION_libhtml-mason-perl ?= "1.35"
-PREFERRED_VERSION_libiac ?= "0.1"
+PREFERRED_VERSION_libiac ?= "1.0"
 PREFERRED_VERSION_libice ?= "1.0.4"
 PREFERRED_VERSION_libiconv ?= "1.11"
 PREFERRED_VERSION_libid3 ?= "1.1"
@@ -946,7 +946,7 @@ PREFERRED_VERSION_libmikmod ?= "3.2.0-be
 PREFERRED_VERSION_libmatchbox ?= "1.9"
 PREFERRED_VERSION_libmath-bigint-gmp-perl ?= "1.18"
 PREFERRED_VERSION_libmikmod ?= "3.2.0-beta2"
-PREFERRED_VERSION_libmimedir ?= "0.3.1"
+PREFERRED_VERSION_libmimedir ?= "0.4.2"
 PREFERRED_VERSION_libmng ?= "1.0.8"
 PREFERRED_VERSION_libmodplug ?= "0.7"
 PREFERRED_VERSION_libmodule-build-perl ?= "0.2805"


> 
> So please send a mail, it's not hard....
> 

[]


