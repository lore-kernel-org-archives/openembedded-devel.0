Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P6R8q-0006IX-1k
	for openembedded-devel@lists.openembedded.org;
	Thu, 14 Oct 2010 18:58:57 +0200
Received: by iwn2 with SMTP id 2so4117432iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Oct 2010 09:58:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=wU7dzKh4K0SGE7O/n/nnCutNldOxUU56forcasVnQW4=;
	b=m0K/lZrywRdLGTI4/PK/3Lszp76onRsLo5MGCBCsOyaF6/uqFYGOMC+roP/zy0G3ME
	DSgwaBr4Kj9Tm2i4CwXfFIPUSYLgrw5CWRCgXPsvnCQ6D3MnkaSvPlg4pdfkpSw/sfbT
	MxnZIEKi9E0Zk7CDKiRPZxtlIB+MY+lb86MZc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=bAn+AK8VUQAKXqfvxPtcpl1ikUobO93kpAWsuYzEZoC3PY5/XuWtOeoCGb3LswOrGP
	CFwmuI4wGOz8qlNgnuBxDT2VVTHzUAocnbJfWZuucNz/U9vp3tIgw/b2IMunfOU2nHw2
	kSibYCT4QYKh/ltdNRQB9RptqCHOEV4SzPEz4=
MIME-Version: 1.0
Received: by 10.231.155.212 with SMTP id t20mr8740635ibw.37.1287075506454;
	Thu, 14 Oct 2010 09:58:26 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Thu, 14 Oct 2010 09:58:23 -0700 (PDT)
Date: Thu, 14 Oct 2010 18:58:23 +0200
Message-ID: <AANLkTikq1TNg1Y=f7tVjpkZR8Hre1FoGyK1gUGTKNDKB@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: empty strings
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
X-List-Received-Date: Thu, 14 Oct 2010 16:58:57 -0000
Content-Type: text/plain; charset=ISO-8859-1

triggered by a remark on irc, I decided to do a grep on "" in all our recipes.
That gave some interesting observations. I've fixed a few things from
the type X += "" or X_append = ""
See the patch set I just send.

However there are also a few things that are not so obvious and for
which I want to ask your opinion, Some seem useless, others are
probably needed, but wanted to raise all issues that could be
unneeded.
Note that the recipes are just examples, ofthen there are more recipes
that have the same pattern.

libvorbis/libvorbis_1.2.3.bb:EXTRA_OECONF = ""
aircrack/aircrack_2.1.bb:DEPENDS = ""
apt/apt-native.inc:PACKAGES = ""  (this is a native recipe, isn't this
always the case for native recipes ? )
bind/bind_9.3.1.bb:RPEDENDS = "" (this one has a DEPENDS on openssl, I
would expect it also to rdepend on openssl in this case)
c3110x/cx3110x_1.1.bb:export LDFLAGS = ""
classpath/classpath.inc:RPROVIDES_${PN} = ""
fuse/fuse-module_2.7.4.bb:      LDFLAGS=""
glibc/glibc_2.10.1.bb:  CPPFLAGS="" oe_runconf (I was wondering of the
resetting CPPFLAGS is useful, didn't really dig into this one)
gs/gs-fonts-std_8.11.bb:HOMEPAGE = ""
gsoap/gsoap-native_2.7.13.bb:EXTRA_OEMAKE = ""
ipkg/ipkg-native.inc:PROVIDES = ""  (hm, no provides)
meta/staging-linkage_1.0.bb:SRC_URI = ""
psmisc/psmisc.inc:FILES_${PN} = "" (guess all files are added to other
packages, if that is so, should there be a line like this?)
tmake/tmake_1.11.bb:FILES = ""
ttf-fonts/ttf-hunkyfonts_0.3.0.bb:RRECOMMENDS_${PN}-dbg = "" (seems
somewhat strange to me)


this one also looked weird; guess it is ok but found it odd that these are reset
hplip/hplip_2.8.10.bb:EXTRA_OEMAKE = 'BUILD_SYS="" HOST_SYS=""'

I would like opinions on which of these constructs is useful and which
not. (and yes, I know an assingment may be used to nullify an earlier
assingment in an .inc file and I am also aware of cases where there is
something like X_virtclass_native = "" which is used to nullify
non-native assignments to X.

Enjoy, Frans


