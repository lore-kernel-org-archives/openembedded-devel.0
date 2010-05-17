Received: from mail-qy0-f172.google.com ([209.85.221.172])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <aalonso00@gmail.com>) id 1OE5H9-0006mo-1l
	for openembedded-devel@lists.openembedded.org;
	Mon, 17 May 2010 20:42:55 +0200
Received: by qyk2 with SMTP id 2so7147194qyk.20
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 May 2010 11:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=+AAxJ4gA0a5wiuT66Xjo13DFwBPyIUKozuQz2cgPbTY=;
	b=qiuttvyO9zd6VskDRbrliyx4twGa0YAhZsB6wqkJu9TnyCkYCBn3DQiIj5HBItgeCH
	NnCGz50N43QMBQkAjH+AvNZJfhiKkZiFaN5naSk/rpXybaTCTO+NsD+NI7AW3mDzJfkU
	KxMx4s4kRAAkQo7vMC8TxW/frOMQKxJ7Z6mFM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=RZJQZvadVpCzdGz6uK2k/N95uw8blWZ19K+jowBAijGzyxBghYVJnrAtcV1hHXJdhI
	PLhWQFghCJFpgiTiB+og7eCtd7cd4al1Ahc8WyErDWQYD7hmELXU9aIdPm0HcQrUblNk
	/5mQkJ5ZfQ8PXxbpO2QjFqwc1nkRZ912OUMfE=
MIME-Version: 1.0
Received: by 10.224.87.215 with SMTP id x23mr927570qal.331.1274121511629; Mon, 
	17 May 2010 11:38:31 -0700 (PDT)
Received: by 10.229.230.77 with HTTP; Mon, 17 May 2010 11:38:31 -0700 (PDT)
Date: Mon, 17 May 2010 13:38:31 -0500
Message-ID: <AANLkTinM-N-vAT4yP0ptz0UcMBNsLHpQZ1er2VwnsDDv@mail.gmail.com>
From: Adrian Alonso <aalonso00@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.221.172
X-SA-Exim-Mail-From: aalonso00@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Microblaze gcc 4.5.0 support
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
X-List-Received-Date: Mon, 17 May 2010 18:42:56 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi, I been working on adding OE support for microblaze arch
I have a repo in gitorious [1] holding the changes I made so far;
trying to build console-image fails on gcc-cross-initial compilation
with the error shown on log [2]
"configure: error: cannot compute suffix of object files: cannot compile"

I also update gcc-svn.inc recipe to use gcc-microblaze branch
SRC_URI_xlnx-mb-gen = "svn://gcc.gnu.org/svn/gcc/branches;module=microblaze
And I get the same error shown in gcc-4.5.0

From log error I see that OE is generates the suffix info but fails for
microblaze arch

   1.  set -e; for ml in `cat fixinc_list`; do \
   2. |         sysroot_headers_suffix=`echo ${ml} | sed -e 's/;.*$//'`; \
   3. |         multi_dir=`echo ${ml} | sed -e 's/^[^;]*;//'`; \
   4. |         fix_dir=include-fixed${multi_dir}; \


Can some one help me out figuring what is missing??


[1] http://gitorious.org/oe-microblaze/oe-microblaze
<http://gitorious.org/oe-microblaze/oe-microblaze>[2]
http://pastebin.com/kqC8AP1s

-- 
Saludos
Adrian Alonso
http://aalonso.wordpress.com

