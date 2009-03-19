Received: from [74.125.44.155] (helo=yx-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <taroth@gmail.com>) id 1LkMjI-0002sY-Hk
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Mar 2009 19:12:32 +0100
Received: by yx-out-1718.google.com with SMTP id 3so457261yxi.42
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Mar 2009 11:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:user-agent:mime-version:content-type;
	bh=uQGECjYxCifW7DsRsnihba6iXnnP3kikJvEBd00a5u4=;
	b=ThDTpMul6Xi3/YAdTXYq0QTakwboIi1b1XNu1oBNAz+A/x0vMBYZJwZJ0Eyj25+tBn
	PJkG3FjMm94hHEOO3xS0pBPcOOj+h/879PgQHri90T6s0Q2LMpsGaODJs6hK9S5fMWXV
	czv/BMMuBG8npsZMxguVFchEWc4VI+ldZ+FYw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:user-agent:mime-version
	:content-type;
	b=tAwWtgAHSDhEt3lolbbIFiI5c2plt4Wq8vH0Np+PkzVX2uZi9j4PCPCkAhJvOlL5sl
	p03TCKiHhZC7DyfjOkJFPlLwSUKBH+qeD9YxqKT1nawwbwXcSvK6eUsH6dMVt8FrR6nf
	mGh6ioxdiuA1RTzmWFa5+A3Z2Xxm47geAIy6s=
Received: by 10.142.156.2 with SMTP id d2mr1055070wfe.179.1237486293737;
	Thu, 19 Mar 2009 11:11:33 -0700 (PDT)
Received: from dorkboy (99-203-159-164.pools.spcsdns.net [99.203.159.164])
	by mx.google.com with ESMTPS id 22sm2146932wfd.26.2009.03.19.11.11.32
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 19 Mar 2009 11:11:33 -0700 (PDT)
Date: Thu, 19 Mar 2009 11:11:27 -0700 (PDT)
From: "Theodore A. Roth" <taroth@gmail.com>
To: OpenEmbedded Development List <openembedded-devel@lists.openembedded.org>
Message-ID: <alpine.DEB.1.00.0903191110370.9227@localhost.localdomain>
User-Agent: Alpine 1.00 (DEB 882 2007-12-20)
MIME-Version: 1.0
Subject: [PATCH] class_siteinfo.xml: Replace packages/ with recipes/.
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
X-List-Received-Date: Thu, 19 Mar 2009 18:12:32 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


---
 docs/usermanual/reference/class_siteinfo.xml |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/docs/usermanual/reference/class_siteinfo.xml b/docs/usermanual/reference/class_siteinfo.xml
index 4d66e85..82dbd84 100644
--- a/docs/usermanual/reference/class_siteinfo.xml
+++ b/docs/usermanual/reference/class_siteinfo.xml
@@ -148,7 +148,7 @@
 
     <variablelist>
       <varlistentry>
-        <term>org.openembedded.dev/packages/&lt;packagename&gt;/site-&lt;version&gt;/</term>
+        <term>org.openembedded.dev/recipes/&lt;packagename&gt;/site-&lt;version&gt;/</term>
 
         <listitem>
           <para>This directory is for site files which are specific to a
@@ -158,7 +158,7 @@
       </varlistentry>
 
       <varlistentry>
-        <term>org.openembedded.dev/packages/&lt;packagename&gt;/site/</term>
+        <term>org.openembedded.dev/recipes/&lt;packagename&gt;/site/</term>
 
         <listitem>
           <para>This directory is for site files which are specific to a
@@ -177,4 +177,4 @@
       </varlistentry>
     </variablelist>
   </section>
-</section>
\ No newline at end of file
+</section>
-- 
1.5.4.3


Signed-off-by: Theodore A. Roth <taroth@gmail.com>


