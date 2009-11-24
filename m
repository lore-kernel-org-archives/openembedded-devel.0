Received: from mail-fx0-f216.google.com ([209.85.220.216])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <d.vinokuroff@gmail.com>) id 1ND1b3-0003Iu-7T
	for openembedded-devel@lists.openembedded.org;
	Tue, 24 Nov 2009 21:02:48 +0100
Received: by fxm8 with SMTP id 8so7285823fxm.27
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Nov 2009 12:01:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:references:in-reply-to
	:content-type; bh=s2QhVbA4GBVqkFuPAw0wm0WbxjBEfbuhiqqJCGtwVls=;
	b=BFDmza0sWjKXXHHaom4MXWMHl82CDUrlPq1s7QwpFbfGarDogWYUNnDdbBaRRgTmYy
	E/yRLn0TYyhrQqo5hLQMWBUDHc2WZs0AhdoyNO2WehkWXs5d2QPh4OuRH86VctPYs7uZ
	C4kYcbzWhJhHYYkhj5lACRTEGRj2iugh01lXA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type;
	b=a1mifpP8eH29+Zj2PU2RjMgv8Ut/AgqrrOf5VlZf2YAbouFwcc7S8CXNoMRCf5MG5J
	s0bmxeEO94s/soUyPd8d/ZQM7IWqc1pugX6t+8774/OUxBzzhT5v8Ip4Ci3q1JF+G2K1
	pKiYVBWyH25twT4ICKqduCyTyf6TAIZJhBfaw=
Received: by 10.86.203.35 with SMTP id a35mr5877339fgg.44.1259092876395;
	Tue, 24 Nov 2009 12:01:16 -0800 (PST)
Received: from ?192.168.0.101? ([94.180.8.192])
	by mx.google.com with ESMTPS id 3sm10413651fge.20.2009.11.24.12.01.14
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 24 Nov 2009 12:01:15 -0800 (PST)
Message-ID: <4B0C3B50.8010901@gmail.com>
Date: Wed, 25 Nov 2009 01:00:16 +0500
From: Dmitry Vinokurov <d.vinokuroff@gmail.com>
User-Agent: Thunderbird 2.0.0.23 (X11/20091001)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4B0C2825.2070001@gmail.com>
In-Reply-To: <4B0C2825.2070001@gmail.com>
X-SA-Exim-Connect-IP: 209.85.220.216
X-SA-Exim-Mail-From: d.vinokuroff@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: opkg-sdk_svn build failure
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
X-List-Received-Date: Tue, 24 Nov 2009 20:02:48 -0000
Content-Type: multipart/mixed; boundary="------------000701000603030701090501"

--------------000701000603030701090501
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Dmitry Vinokurov wrote:
> Hello,
>
> I'm trying to build QTE SDK according to OE manual chapter "Creating 
> and Using a Qt Embedded SDK". Command "bitbake meta-toolchain-qte" 
> fails with:
> ---------------------------------------
> ERROR: function do_compile failed
> ERROR: see log in 
> /home/raydan/work/oe/build/tmp/work/x86_64-armv5te-sdk-oe-linux-gnueabi/opkg-sdk-0.1.6+svnr363-r16/temp/log.do_compile.19556 
>
> ---------------------------------------
>
> Tail of log contains following lines:
> ---------------------------------------
> cc1: warnings being treated as errors
> hash_table.c: In function 'hash_print_stats':
> hash_table.c:81: error: format '%d' expects type 'int', but argument 3 
> has type 'long unsigned int'
> ---------------------------------------
>
> Ready to provide any additional information, if needed.
>
Possible patch to include in opkg.inc attached.

--
Best Regards, 
Dmitry Vinokurov 
<d.vinokuroff@gmail.com>

--- opkg/libopkg/hash_table.c.orig	2009-11-25 00:48:49.000000000 +0500
+++ opkg/libopkg/hash_table.c	2009-11-25 00:49:16.000000000 +0500
@@ -64,7 +64,7 @@
 void
 hash_print_stats(hash_table_t *hash)
 {
-	printf("hash_table: %s, %d bytes\n"
+	printf("hash_table: %s, %ld bytes\n"
 		"\tn_buckets=%d, n_elements=%d, n_collisions=%d\n"
 		"\tmax_bucket_len=%d, n_used_buckets=%d, ave_bucket_len=%.2f\n"
 		"\tn_hits=%d, n_misses=%d\n",


--------------000701000603030701090501--
