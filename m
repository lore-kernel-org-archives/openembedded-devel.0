Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <graham.gower@gmail.com>) id 1PVwE1-0005N5-5z
	for openembedded-devel@lists.openembedded.org;
	Fri, 24 Dec 2010 02:13:41 +0100
Received: by pwi8 with SMTP id 8so563211pwi.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Dec 2010 17:13:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:content-type
	:content-transfer-encoding;
	bh=Xr7457nQFgM0ApHYbkcrR4vBAjbJv3CoQiBs4Jun41E=;
	b=lzaiJ2ke3XinIl2S9A4oiWQpzn627cVHoUuar66M89/SbBUvCZS/G7TWJzITCvqarw
	WqvOP0qqWwjDNdzM7pM72ry35LNOmJKPj8JThhpr4OK/9RuHnyMRY6p4eZcnQ/kJpUgD
	xsGSePpfDOMrKMbPICL0/X1B+L83UTI0ycmls=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	b=WYF+5wUZTZnVf3tsq/wqDw3njmBQvxv9edVsN0ktKzRYxhUdeVxXKnnHofPXd3oOtA
	CBaGtujWEMwCHh5NZFMyOaB68v9rmZ10oIKBk623gix7aFwg7x6QiaMfc4Y7jmb8UA4N
	dvVtoKzFwT1AZmeej1vpSbe/QOfKQFuSQj2Cs=
Received: by 10.143.16.6 with SMTP id t6mr7061265wfi.113.1293153210927;
	Thu, 23 Dec 2010 17:13:30 -0800 (PST)
Received: from [10.0.0.5] (eth7090.sa.adsl.internode.on.net [150.101.58.177])
	by mx.google.com with ESMTPS id
	q13sm11502579wfc.5.2010.12.23.17.13.28
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 23 Dec 2010 17:13:30 -0800 (PST)
Message-ID: <4D13F3B4.2050104@gmail.com>
Date: Fri, 24 Dec 2010 11:43:24 +1030
From: Graham Gower <graham.gower@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.15) Gecko/20101113 Thunderbird/3.0.10
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH] ublibc.inc, micro-uclibc.conf: Avoid gettext in uclibc systems.
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
X-List-Received-Date: Fri, 24 Dec 2010 01:13:41 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit


Signed-off-by: Graham Gower <graham.gower@gmail.com>
---
 conf/distro/include/uclibc.inc |    2 +-
 conf/distro/micro-uclibc.conf  |    2 ++
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/conf/distro/include/uclibc.inc b/conf/distro/include/uclibc.inc
index dd00647..200fac2 100644
--- a/conf/distro/include/uclibc.inc
+++ b/conf/distro/include/uclibc.inc
@@ -3,7 +3,7 @@ OVERRIDES =. "libc-uclibc:"
 
 # The things uclibc can provide.  We default to wanting uclibc to provide them.
 PREFERRED_PROVIDER_virtual/libiconv ?= "libiconv"
-PREFERRED_PROVIDER_virtual/libintl ?= "gettext"
+PREFERRED_PROVIDER_virtual/libintl ?= "proxy-libintl"
 #fix some iconv issues, needs to be adjusted when doing uclibc builds
 PREFERRED_PROVIDER_virtual/libintl_avr32 = "proxy-libintl"
 PREFERRED_PROVIDER_virtual/libc = "uclibc"
diff --git a/conf/distro/micro-uclibc.conf b/conf/distro/micro-uclibc.conf
index fb1887c..85ea9b3 100644
--- a/conf/distro/micro-uclibc.conf
+++ b/conf/distro/micro-uclibc.conf
@@ -24,3 +24,5 @@ require conf/distro/micro.conf
 # Use overrides for micro as well
 OVERRIDES .= ":micro"
 
+# Don't let glib-2.0 pull in gettext
+USE_NLS_glib-2.0 = "no"
-- 
1.7.1



