Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rep.dot.nop@gmail.com>) id 1OMSr9-0004uH-HB
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Jun 2010 23:30:55 +0200
Received: by bwz14 with SMTP id 14so1864609bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 Jun 2010 14:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:date:from:to:cc
	:subject:message-id:references:mime-version:content-type
	:content-disposition:in-reply-to:user-agent;
	bh=8jYfaKlmSOwNNwQ4QMCtB9FTVMJgn/b+XwV1zRaRgnc=;
	b=Om+kwP7yat/9Ig3xmQaFQ+uvbZ3y2abkS+Isq4TTniVynFjSATw5YDLQ/N4kjoU1Tn
	/LnWx5/IzGEy8LS+SbzsrUnQlitjMKwPbcFVtV+3DDhGorDi6qvcpdllHlBVyF36tMPk
	H/X155tmMmObfnjVda+EbOcw4pHqBX49nvrio=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=K7262NiAFAjMqT3nOsjOqRdoFDEd3RVMwhsASSi3H593fAORnh38yOlbUNszkVnwSE
	HF7u1WNDp6a/vkY1woHFr4vdOivZmczMEvhQyuPPZ2Om2HGfst3MRgejqCo93yIgBCIJ
	4P8TJhQ18NuZ7oDaKGhwlmqAYmE39usTpF19I=
Received: by 10.204.79.222 with SMTP id q30mr607053bkk.93.1276118779100;
	Wed, 09 Jun 2010 14:26:19 -0700 (PDT)
Received: from s42.loc (85-127-249-17.dynamic.xdsl-line.inode.at
	[85.127.249.17])
	by mx.google.com with ESMTPS id z17sm31251769bkx.18.2010.06.09.14.26.17
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 09 Jun 2010 14:26:18 -0700 (PDT)
Received: from cow by s42.loc with local (Exim 4.71)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1OMSn8-00023p-T9; Wed, 09 Jun 2010 23:26:30 +0200
Date: Wed, 9 Jun 2010 23:26:30 +0200
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: Phil Blundell <philb@gnu.org>
Message-ID: <20100609212630.GS14941@mx.loc>
References: <19c1b8a91002212154y766540d9vb091badff1198e0e@mail.gmail.com>
	<1276103437-2755-1-git-send-email-rep.dot.nop@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1276103437-2755-1-git-send-email-rep.dot.nop@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: rep.dot.nop@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@lists.openembedded.org
Subject: RFC feature/dep picking heuristics
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
X-List-Received-Date: Wed, 09 Jun 2010 21:30:56 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 09, 2010 at 07:10:34PM +0200, Bernhard Reutner-Fischer wrote:
>Hi,
>
>These are independent.
>
>1) uClibc: redo configuration
>  improve configury of uClibc
[]
>3) busybox: picking IPv6 per default is not up to the package
>  first, busybox needs a better configury, like it's done for uclibc
>  in 1).
>  Second, who picks features and with what preference? packages? user?
>  distro? machine? See FIXME in 1).
>  This patchlet works around the real issue. Comments on how to tackle
>  the underlying issue (or how it's solved elsewhere if it already is,
>  i didn't see where/how ?) are _very_ welcome.

that FIXME in 1) reads:
index ee18fc8..b40fbf5 100644
--- a/conf/distro/include/uclibc.inc
+++ b/conf/distro/include/uclibc.inc
@@ -9,3 +9,11 @@ PREFERRED_PROVIDER_virtual/libintl_avr32 = "proxy-libintl"
 PREFERRED_PROVIDER_virtual/libc = "uclibc"
 PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-initial = "uclibc-initial"
 PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-for-gcc = "uclibc"
+
+# libc settings
+DISTRO_FEATURES += "${@['', '
+nls'][bb.data.getVar('ENABLE_BINARY_LOCALE_GENERATION', d, 1) == '1']}"
+MACHINE_FEATURES += "${@['', ' bx'][bb.data.getVar('ARM_INSTRUCTION_SET', d, 1)
+== 'thumb']}"
+# FIXME: We enable IPv4 per default to avoid alot of breakage.
+# FIXME: Figure out an acceptable way to negotiate either
+# FIXME: desired features or hard requirements, either top-down or bottom-up.
+DISTRO_FEATURES += " ipv4"


Problem description:

[all of the following is rather obvious, please accept my apologies for
being redundant and possibly not 100% accurate to keep this brief]

Two realms: Hardware / Software
Both of them provide optional features or impose hard constraints on the
setup.

I) hardware/kernel/libc
  Think arm thumb interworking bx or not any or all of them.
    libc can use BX or fallback but only for thumb and for some
    -mtune's (IIRC).
  networking.
    - none
    - socket
    - ipv4 (requires socket)
    - ipv6 (requires socket)
    - ipv4 || ipv6
  nls.
    - locales to generate (GLIBC_GENERATE_LOCALES; uclibc can use the same)
    - several other options, namely wchar (think mc or mutt -- if forgot
      which one -- which requires wchar if not patched)

II) packages
  consider micro-base-image for libc=uclibc
  consider recipes are equipped with HANDLE_FEATURE (big TODO, RFC).
  assume HANDLE_FEATURE is auto-filled off configure.ac for the most
    part.
  that one selects sysvinit (bug per se but no relevant for now)
  sysvinit uses inet_ntoa() or something to that effect
    unconditionally -> not buildable since not base_contains HANDLE_FEATURE ipv4

Now my question is:
How can i fit a set of requirements to a set of config options that make
up a system (ideally without changing anything)?

If i have to change something, how should the decision-flow look like to
weight constraints against possibly provided features? What's the
precedence of the following parts:
o HW hard constraints
o HW soft constraints (optional features)
o kernel/Lowlevel hard constraints
o kernel/Lowlevel soft constraints (optional features)
o libc hard constraints (unconfigurable vs. configurable)
o libc soft constraints (optional features)
o package hard constraints (sysvinit requires ipv4)
o package soft constraints (optional features, like iptables/busybox ipv6)

TIA for clarifications or pointers to existing docs covering OE in this
respect && cheers,


