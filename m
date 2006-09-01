Received: from [202.173.155.195] (helo=birgitte.twibble.org)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <lenehan@twibble.org>) id 1GIxvt-00020L-8Y
	for openembedded-devel@lists.openembedded.org;
	Fri, 01 Sep 2006 03:34:58 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
	by birgitte.twibble.org (Postfix) with ESMTP id A34929DD82;
	Fri,  1 Sep 2006 11:32:37 +1000 (EST)
Received: from birgitte.twibble.org ([127.0.0.1])
	by localhost (birgitte [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 14609-03; Fri, 1 Sep 2006 11:32:35 +1000 (EST)
Received: from nynaeve.twibble.org (nynaeve.twibble.org [202.173.155.194])
	by birgitte.twibble.org (Postfix) with ESMTP id C6B199DD72;
	Fri,  1 Sep 2006 11:32:35 +1000 (EST)
Received: by nynaeve.twibble.org (Postfix, from userid 500)
	id A8F16FC29D7; Fri,  1 Sep 2006 11:32:35 +1000 (EST)
Date: Fri, 1 Sep 2006 11:32:35 +1000
From: Jamie Lenehan <lenehan@twibble.org>
To: Alain2210 <alain2210@free.fr>
Message-ID: <20060901013235.GA12885@twibble.org>
References: <1156967236.44f5eb4411b36@imp5-g19.free.fr>
Mime-Version: 1.0
In-Reply-To: <1156967236.44f5eb4411b36@imp5-g19.free.fr>
User-Agent: Mutt/1.4.2.1i
X-Virus-Scanned: by amavisd at twibble.org
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: gd package and cross compile badness
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 01 Sep 2006 01:34:58 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 30, 2006 at 09:47:16PM +0200, Alain2210 wrote:
> Hello,
> 
> I'm trying to compile tetex with org.openembedded.dev but it needs to compile gd
> (gd_2.0.33) but it does not work. It seems to be a problem in configure. In the
> config.log
> I can see
> CROSS COMPILE Badness: /usr/include in INCLUDEPATH: /usr/include
> cc1: internal compiler error: Aborted
> 
> I have not well understood the message on http://www.openembedded.org/
> about this. So I'm writing to this list.

The configure script is looking in /usr/include for headers, but
those headers are for your host system and not for the target system.
I suspect you have one of those distro's that include the X header in
/usr/include only and not in /usr/X11R6/include and so it's the
search for the X headers that is the issue.

It looks for the X headers because they are needed if freetype or xpm
is support is being included in gd. It looks like neither of these
are included, so disabling the check for X is probably the correct
fix:

# 
# old_revision [63b7883c8cd45c0306b301ca925831ff27775b20]
# 
# patch "packages/gd/gd_2.0.33.bb"
#  from [09dd91fdad9775cef7f151a0565b024ee673a635]
#    to [1216c7c3c1dba874b78d93bcaa926ba3217bb075]
# 
============================================================
--- packages/gd/gd_2.0.33.bb	09dd91fdad9775cef7f151a0565b024ee673a635
+++ packages/gd/gd_2.0.33.bb	1216c7c3c1dba874b78d93bcaa926ba3217bb075
@@ -13,7 +13,8 @@ EXTRA_OECONF += " --with-zlib=${STAGING_
 EXTRA_OECONF += " --with-zlib=${STAGING_LIBDIR}/.. \
                   --with-png=${STAGING_LIBDIR}/.. \
                   --with-jpeg=${STAGING_LIBDIR}/.. \
-                  --without-xpm"
+                  --without-xpm \
+                  --without-x"
 
 EXTRA_OEMAKE = "LDFLAGS=-L${STAGING_LIBDIR}"
 

-- 
 Jamie Lenehan <lenehan@twibble.org>


