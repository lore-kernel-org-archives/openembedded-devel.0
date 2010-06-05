Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1OL0ES-0005pC-4o
	for openembedded-devel@lists.openembedded.org;
	Sat, 05 Jun 2010 22:44:40 +0200
Received: by fxm9 with SMTP id 9so1441734fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 05 Jun 2010 13:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:mime-version:content-type:content-disposition:user-agent;
	bh=Ek+K42+KkHteeBhxN14ji5lVA3xTD6XAUFVFd0rFn1M=;
	b=erYftdm0Sh3pzsRdCkFbev728vZOx5E9RiEVlboFAC8w0WJ/PMIFYYvrhCtlN/5pwo
	mUI05moauPFtpOhzGr9tXgkJzR+iGoifz60usaI4amGub5wduaiqo9GzymxXY8cxhgi3
	8RPaCFi9BTjPqjwNzBZUOmTJSWOqcCsuuWQ94=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	b=fFJ7/DyE8OeHA6+Y47ftoHFshoaGjfZTZPLWW+p7U+dgWKLmEnkVxEysn1R7R0dfdg
	zBZLdtgptS5R04aI5mxrRfgmFxgY8KuJr1R0fUJJKa8VobQumCmHUeUkiwhJCl68zLiE
	+Ybxt+rb6qgGk4nXzwC3ap440izcUacgZbj7k=
Received: by 10.223.21.23 with SMTP id h23mr13449401fab.21.1275770421891;
	Sat, 05 Jun 2010 13:40:21 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 2sm11843049fav.13.2010.06.05.13.40.20
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 05 Jun 2010 13:40:21 -0700 (PDT)
Date: Sat, 5 Jun 2010 22:40:19 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100605204019.GA1403@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Latest binutils-cross-2.20.1-r10.0 build issue with binutils-2.20.1 on gentoo host
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
X-List-Received-Date: Sat, 05 Jun 2010 20:44:40 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

FYI:

If you run into issue
ar: can't set BFD default target to `x86_64-pc-linux-gnu': Invalid bfd target

Like I did in:
http://tinderbox.openembedded.net/packages/601631/

Then here is what I used as workarround/hack:
enabled multitarget USE

unmasked and added keywords for 2.20.51.0.8 version

added --enable-plugins --enable-threads to eclass (as noted in changelog
http://gcc.gnu.org/ml/gcc/2010-05/msg00632.html)

jama portage # diff -uNr eclass/toolchain-binutils.eclass
~/toolchain-binutils.eclass 
--- eclass/toolchain-binutils.eclass    2010-04-20 01:08:10.000000000
+0200
+++ /root/toolchain-binutils.eclass     2010-06-05 22:36:36.000000000
+0200
@@ -223,6 +223,8 @@
                --includedir=${INCPATH} \
                --enable-64-bit-bfd \
                --enable-shared \
+               --enable-plugins \
+               --enable-threads \
                --disable-werror \
                ${myconf} ${EXTRA_ECONF}"
        echo ./configure ${myconf}

applied small patch to binutils
diff -uNr binutils-2.20.51.0.8.orig//bfd/elf32-tic6x.c binutils-2.20.51.0.8/bfd/elf32-tic6x.c
--- binutils-2.20.51.0.8.orig//bfd/elf32-tic6x.c        2010-04-13 15:26:40.000000000 +0200
+++ binutils-2.20.51.0.8/bfd/elf32-tic6x.c      2010-06-05 21:35:36.000000000 +0200
@@ -787,11 +787,12 @@
       else
        {
          bfd_boolean warned;
+         bfd_boolean ignored = FALSE;
 
          RELOC_FOR_GLOBAL_SYMBOL (info, input_bfd, input_section, rel,
                                   r_symndx, symtab_hdr, sym_hashes,
                                   h, sec, relocation,
-                                  unresolved_reloc, warned);
+                                  unresolved_reloc, warned, ignored);
        }
 
       if (sec != NULL && elf_discarded_section (sec))

and now binutils-cross compiled fine for me..

Regards,
-- 
Jansa 'JaMa' Martin     jabber: Martin.Jansa@gmail.com


