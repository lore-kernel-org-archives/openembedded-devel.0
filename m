Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <tasskjapp@gmail.com>) id 1P60bV-00010s-JB
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Oct 2010 14:38:47 +0200
Received: by ewy1 with SMTP id 1so1573981ewy.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Oct 2010 05:38:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:references:in-reply-to
	:content-type:content-transfer-encoding;
	bh=pxHhS84yEJLnw0R7r7FIO/kariRxnmZjleTvVJc7X0A=;
	b=q5tGsu0A5hIfHTnwcE6da+3UevNo9m2aVn5tKpPTc8R14KagrCuX+FOzN2ErtT5v21
	WKpSyzy+WuhGJ1fOqsa2auY7Yj0VEOIqqgSHfm01VpcOKZnTCoeauthWgWjqUEZ87llE
	ARPEDB/3AqeYf/VDlTO/mFIeFdEy77lP4jlXU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	b=jEz4eQEnCcUesAfdMuC+hJ1deSc8pHAgdBUcVX+SwUnBqKv4ILZWowODHqNuiRkav7
	GlxkOopCqGPj4iZ4XIb4PM02uedQotL6+yOD8nyiseRBU+ZTPHagLVOkHuJqde9E/QBc
	ymoaI6htRaDPOqhRYWmMPIqdXmTuAjoeUUDA0=
Received: by 10.213.114.17 with SMTP id c17mr3663924ebq.62.1286973497350;
	Wed, 13 Oct 2010 05:38:17 -0700 (PDT)
Received: from [192.168.0.40] (147.84-49-231.nextgentel.com [84.49.231.147])
	by mx.google.com with ESMTPS id x54sm4790376eeh.17.2010.10.13.05.38.15
	(version=SSLv3 cipher=RC4-MD5); Wed, 13 Oct 2010 05:38:16 -0700 (PDT)
Message-ID: <4CB5A86D.6020304@gmail.com>
Date: Wed, 13 Oct 2010 14:39:09 +0200
From: Tasslehoff Kjappfot <tasskjapp@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.12) Gecko/20100915 Thunderbird/3.0.8
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <mailman.1290.1286961912.3514.openembedded-devel@lists.openembedded.org>
	<4CB58BAD.5090806@gmail.com>
In-Reply-To: <4CB58BAD.5090806@gmail.com>
X-SA-Exim-Connect-IP: 209.85.215.47
X-SA-Exim-Mail-From: tasskjapp@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: apr-util_1.3.4.bb fails, looking at host includes
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
X-List-Received-Date: Wed, 13 Oct 2010 12:38:47 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/13/2010 12:36 PM, Tasslehoff Kjappfot wrote:
> On 10/13/2010 11:25 AM, 
> openembedded-devel-request@lists.openembedded.org wrote:
>> >  I'm trying to compile log4cxx, but it fails compiling apr-util, 
>> saying
>> >  that it is looking at host includes.
>> >
>> >  I suspect the following from log.do_configure is a problem:
>> >
>> >  /checking for pg_config... /usr/bin/pg_config
>> >     adding "-I/usr/include/postgresql" to CPPFLAGS
>> >     adding "-L/usr/lib" to LDFLAGS/
>> >
>> >  But I have no idea how to fix it...
>> >
>> >  - Tasslehoff
>> >  _______________________________________________
>> >  Openembedded-devel mailing list
>> >  Openembedded-devel@lists.openembedded.org
>> >  
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>> >
>> This may not be related but I ran into apr-util looking at the host
>> machine as well when I was trying to build subversion. I can not
>> remember now the exact package I installed on the build machine that
>> fixed it. So maybe trying searching for some packages that deal with
>> apr-util that you dont have on your build machine. I could be way off
>> for yours but seems very similar to what I had to do. Hope this helps
>> some
> Thanks. I read about your woes before my post :)
>
> I've installed pretty much every apr-util-package I can find on my 
> Ubuntu 10.04, and did an "apt-get build-dep subversion" in 
> desperation, but still the same error.
>
> - Tasslehoff

Solved by configuring apr-util without postgresql.

 From 97377e3b09a6b62dcd25e1fa403e4ec667497267 Mon Sep 17 00:00:00 2001
From: Tasslehoff Kjappfot <tasskjapp@gmail.com>
Date: Wed, 13 Oct 2010 14:35:01 +0200
Subject: [PATCH] add --without-pgsql to configure


Signed-off-by: Tasslehoff Kjappfot <tasskjapp@gmail.com>
---
  recipes/apr/apr-util_1.3.4.bb |    1 +
  1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/recipes/apr/apr-util_1.3.4.bb b/recipes/apr/apr-util_1.3.4.bb
index cc6781b..5e31171 100644
--- a/recipes/apr/apr-util_1.3.4.bb
+++ b/recipes/apr/apr-util_1.3.4.bb
@@ -14,6 +14,7 @@ EXTRA_OECONF = 
"--with-apr=${STAGING_BINDIR_CROSS}/apr-1-config \
          --with-gdbm=${STAGING_DIR_HOST}${layout_prefix} \
          --without-sqlite2 \
          --without-sqlite3 \
+                --without-pgsql \
          --with-expat=${STAGING_DIR_HOST}${layout_prefix}"


-- 
1.7.0.4




