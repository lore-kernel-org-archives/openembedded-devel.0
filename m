Received: from [209.85.220.167] (helo=mail-fx0-f167.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <piernik@gmail.com>) id 1LeYPg-0003CA-G1
	for openembedded-devel@lists.openembedded.org;
	Tue, 03 Mar 2009 18:28:16 +0100
Received: by fxm11 with SMTP id 11so2472474fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Mar 2009 09:24:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:sender:date:from:to:subject
	:message-id:in-reply-to:references:x-mailer:x-face:mime-version
	:content-type; bh=0/0hAPfj8DbuKqT2PsV1AmSu8fwTIK5DbqGf/Q83wsw=;
	b=pXM+PNdHQUeg/hVHDy7r3riRdmolTms+L+weP0Ko6RYjrkAQSSYW+afs7mGKTnIWnI
	XtKAJ2aqabmDgbZG9YAyljF7XBiNjXrewc2jHlHlFSGisdstoLMUIHyYwe8ozNYFDm1c
	rONsvEFdaiAOyXArOweEYZgqwNgzsOAhXZsyo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:date:from:to:subject:message-id:in-reply-to:references
	:x-mailer:x-face:mime-version:content-type;
	b=uPsbgX649Iwi+lJ44qZL7GjfdRWWqeydzs0BBXgSgnhzOnwQl02PM4Cn+t1N2Vx2Ui
	+C8NG2/K2Udd8mSJOT5ahpctwTCTIkwRH8b/Iw/ZSG76Pa7RKw1sKqGtNB/cfYFtgNqm
	henpeWta6sbQq28sIhrrqUivmDNR66vQxEus0=
Received: by 10.86.50.8 with SMTP id x8mr8093032fgx.14.1236101050426;
	Tue, 03 Mar 2009 09:24:10 -0800 (PST)
Received: from mobil.site (87-205-79-201.adsl.inetia.pl [87.205.79.201])
	by mx.google.com with ESMTPS id d4sm889726fga.15.2009.03.03.09.24.09
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 03 Mar 2009 09:24:10 -0800 (PST)
Sender: Krzysztof Kotlenga <piernik@gmail.com>
Date: Tue, 3 Mar 2009 18:22:31 +0100
From: Krzysztof Kotlenga <pocek@users.sf.net>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090303182231.2a9b2007@mobil.site>
In-Reply-To: <ac9c93b10903030453g6bdfb268ubb30f3854e667d12@mail.gmail.com>
References: <20090211213312.919E8189338@amethyst.openembedded.net>
	<20090303133626.5706500e@mobil.site>
	<ac9c93b10903030453g6bdfb268ubb30f3854e667d12@mail.gmail.com>
X-Mailer: Claws Mail 3.7.0 (GTK+ 2.12.9; i586-suse-linux-gnu)
X-Face: U{.sZrXl+;
	-boiB]N4=wPdrR|YT0!fcISDza0Y}=n*z')0S{iZW<Uy$s~&}09$vR^IuFq,E0)iS]JFG0-3Wmow(MTQ!]rN*<Pa(<PO:*9RFU_\(15s:]Pj}lCTcP(,pUZLy"[4/jpF1l^Y4z!>jV!F"n+n2Rpp8jcp53&OWJgn?AJcD2
Mime-Version: 1.0
Subject: Re: [oe-commits] Frans Meulenbroeks : opkg: fix bug that occured with file names of exactly 100 chars in the tar file
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
X-List-Received-Date: Tue, 03 Mar 2009 17:28:17 -0000
X-Groupsio-MsgNum: 8109
Content-Type: multipart/mixed; boundary="MP_/yjzLPbm7eIRbCrGfNr=GAJs"

--MP_/yjzLPbm7eIRbCrGfNr=GAJs
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Frans Meulenbroeks wrote:

> Anyway, appending the 0 byte is no good as tar_entry->name[100] is
> already out of bounds.

http://tiny.cc/964UD looks good enough. It's interesting that we have
to trace bugs already fixed upstream years ago.

-- 
kjk

--MP_/yjzLPbm7eIRbCrGfNr=GAJs
Content-Type: text/x-patch
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=opkg.diff

Index: libbb/unarchive.c
===================================================================
--- libbb/unarchive.c	(revision 201)
+++ libbb/unarchive.c	(working copy)
@@ -600,16 +600,16 @@
                 linkname = NULL;
         } else
 #endif
-        if (tar.formated.prefix[0] == 0) {
-                tar_entry->name = strdup(tar.formated.name);
-        } else {                                              
-                tar_entry->name = concat_path_file(tar.formated.prefix, tar.formated.name);
+        {
+                tar_entry->name = xstrndup(tar.formated.name, 100);
+
+                if (tar.formated.prefix[0]) {
+                        char *temp = tar_entry->name;
+                        tar_entry->name = concat_path_file(tar.formated.prefix, temp);
+                        free(temp);
+                }
         }
 
-	if (strlen(tar_entry->name) > 100) {
-		tar_entry->name[100] = 0;
-	}
-
 	// tar_entry->name = xstrdup(tar.formated.name);
 
 /*

--MP_/yjzLPbm7eIRbCrGfNr=GAJs--
