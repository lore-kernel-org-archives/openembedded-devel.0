Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1PAEEO-00037b-Of
	for openembedded-devel@lists.openembedded.org;
	Mon, 25 Oct 2010 06:00:21 +0200
Received: by iwn41 with SMTP id 41so229641iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Oct 2010 20:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:references:in-reply-to
	:content-type:content-transfer-encoding;
	bh=fa7LJNVlZzh/ILlFdwGRocFlQxpENlp4h+kt4NAhzg4=;
	b=Gs865kC/Xt2D4DlyvBwVI6LnzqfsLVDfeDLBJidfcIhgYzJ18RfSK9osMwaB08RTRc
	/eRBNAkxlf8EL0Sm4+UYyf46tJxPmhszODrTE/9/seh9gTbgT5stNaNR2WqFahr58DYo
	8hMvzFqpEHxF3OqWcEIcpMWI+jku4LBycBkb8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	b=YyktoQHdHSyLVwF4N+nDFVF3s0bJIIP7To5SLCRsqdfWNhgOXiOEjnbZVda4WlJsEq
	OaXQgVhkONFdumSdBPlDIPk8Bpd05QYnRQ1Gbdn0OZyQTUwBvr6gLl2QJa9ZH3JR9+4p
	7BTqXG03yN/ODBrHt/pffSeJJVfUkB8ICQd38=
Received: by 10.42.99.3 with SMTP id u3mr4357112icn.124.1287979177721;
	Sun, 24 Oct 2010 20:59:37 -0700 (PDT)
Received: from [10.0.0.5] (eth7090.sa.adsl.internode.on.net [150.101.58.177])
	by mx.google.com with ESMTPS id u6sm7350482ibd.12.2010.10.24.20.59.34
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 24 Oct 2010 20:59:36 -0700 (PDT)
Message-ID: <4CC500A2.7020702@gmail.com>
Date: Mon, 25 Oct 2010 14:29:30 +1030
From: Graham Gower <graham.gower@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.14) Gecko/20101020 Thunderbird/3.0.9
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <AANLkTinXYcNN=iozP-aXPDuFzQqM13KDf5my1W6DTap6@mail.gmail.com>
In-Reply-To: <AANLkTinXYcNN=iozP-aXPDuFzQqM13KDf5my1W6DTap6@mail.gmail.com>
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Race issues (lzma-native)
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
X-List-Received-Date: Mon, 25 Oct 2010 04:00:21 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 10/24/2010 07:29 PM, Andrea Adami wrote:
> Hello,
> 
> during first build of console image I notice a strange fault:
> subsequent builds are ok.
> My scripts builds console-image and opie-image.
> 
> ERROR: Task 2411
> (virtual:native:/oe/openembedded/recipes/lzma/lzma_4.65.bb,
> do_distribute_sources) failed with exit code '1'
> NOTE: Unpacking ../sources/lzma465.tar.bz2 to
> tmp/work/i686-linux/lzma-native-4.65-r4.1/
> NOTE: package lzma-native-4.65-r4.1: task do_distribute_sources: Started
> NOTE: package lzma-native-4.65-r4.1: task SRC_DISTRIBUTECOMMAND: Failed
> ERROR: Function 'SRC_DISTRIBUTECOMMAND' failed
> 
> 
> Looking at the
> run.SRC_DISTRIBUTECOMMAND.18268   16384 (failing)
> run.SRC_DISTRIBUTECOMMAND.9570     34334
> 
> it looks like the file is not complete / malformed:
> 
> package_generate_ipkg_conf() {
> <------>mkdir -p /oe/build/tmp/sysroots/i686-linux/etc/
> <------>echo "src oe file:/oe/build/tmp/deploy/glibc/ipk" >
> /oe/build/tmp/sysroots/i686-linux/etc/opkg.conf
> <------>echo "src oe file:/
> EOF
> 
> run.do_distribute_sources.18268  is empty, while second time
> run.do_distribute_sources.9570   1051 contains  def do_distribute_sources(d):
> 
> This seems indeed a race issue...
> 
> Andrea
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

I can reproduce this one quite easily. Reverting a6a23f73 seems to make it
disappear. Alternately the change below works, but I'm not convinced this is 
the right fix.

Can someone with greater insight explain what causes this race?

-Graham


diff --git a/classes/src_distribute.bbclass b/classes/src_distribute.bbclass
index 795a5cf..98d8d88 100644
--- a/classes/src_distribute.bbclass
+++ b/classes/src_distribute.bbclass
@@ -1,7 +1,7 @@
 SRC_DISTRIBUTE_DLONLY ?= "0"
 SRC_DISTRIBUTECOMMAND[func] = "1"
 
-addtask distribute_sources before do_build after do_fetch
+addtask distribute_sources before do_build after do_unpack
 python do_distribute_sources () {
 	bb.build.exec_func("do_fetch", d)
 


