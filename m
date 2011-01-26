Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>) id 1PiCEV-0001Yj-Rg
	for openembedded-devel@lists.openembedded.org;
	Wed, 26 Jan 2011 21:44:53 +0100
Received: by bwz10 with SMTP id 10so1713732bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Jan 2011 12:44:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=LwZK7Pop2XyNBidcJ/aV+FINdZKL911RefjLETqi52k=;
	b=VE18Y8OeQAjldVpCXfluzYBeL1Bjcilh3PNquTR/SrGzPJSKaZFxxC/oYt1MZJ7Woc
	s0sVh/iEKi3X29lw4XbnlXD6LZONzhSM2Bm1/oPPkonuBZrLUI6x8+xO5zGLD5PGJ09m
	DF2omN7Z5HnsCbk9OfxMDAR6aT/DTeQuLiVvs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=la3uJrRV+VOI7PuscQVzcd2+SPXZZN0YSV0nD7B+Eu17IM95LzY2YLYEa4MCOTNrK0
	Ju8SVEe8arPxWMfFKm/u68TykYFTFxEHSHTN+Bcr7FJ0D1SVSxhd9v37mt/a0oIQ5dD1
	iWY0Qxuzc3gTwoCEobsQiqxTz+mjqtd7KUKNM=
Received: by 10.204.113.9 with SMTP id y9mr799688bkp.201.1296073593478;
	Wed, 26 Jan 2011 12:26:33 -0800 (PST)
Received: from s42.loc (85-127-155-31.dynamic.xdsl-line.inode.at
	[85.127.155.31])
	by mx.google.com with ESMTPS id j11sm7720445bka.0.2011.01.26.12.26.31
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 26 Jan 2011 12:26:32 -0800 (PST)
Received: from cow by s42.loc with local (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1PiBwk-0003QI-Bd; Wed, 26 Jan 2011 21:26:30 +0100
Date: Wed, 26 Jan 2011 21:26:30 +0100
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110126202630.GC714@mx.loc>
References: <1295363929-13246-1-git-send-email-kergoth@gmail.com>
	<1295363929-13246-4-git-send-email-kergoth@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1295363929-13246-4-git-send-email-kergoth@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Chris Larson <chris_larson@mentor.com>
Subject: Re: [PATCH 4/4] bin/install: implement -D internally
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
X-List-Received-Date: Wed, 26 Jan 2011 20:44:53 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jan 18, 2011 at 08:18:49AM -0700, Chris Larson wrote:
>From: Chris Larson <chris_larson@mentor.com>
>
>Signed-off-by: Chris Larson <chris_larson@mentor.com>
>---
> bin/install |   13 ++++++++++++-
> 1 files changed, 12 insertions(+), 1 deletions(-)
>
>diff --git a/bin/install b/bin/install
>index 4ad8172..1c938755 100755
>--- a/bin/install
>+++ b/bin/install
>@@ -1,9 +1,13 @@
> #!/bin/sh
>+#
>+# Portability notes:
>+# - We allow what SuSv3 defines

erm, SuSv3 is superseded by SUSv4 for quite some time now. And i wasn't
aware that SUS specified install(1) (please show me where, i don't see
it).

Without the comment above:
Acked-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>

>+# - We implement -D internally
> 
> source $(dirname $0)/wrapper.sh
> 
> saved=""
>-while getopts dbCcMpSsvB:f:g:m:o: opt; do
>+while getopts dbCcMpSsvB:f:g:m:o:D opt; do
>     case "$opt" in
>         s)
>             # Ignore strip argument
>@@ -12,6 +16,9 @@ while getopts dbCcMpSsvB:f:g:m:o: opt; do
>             save "-$opt"
>             save "$OPTARG"
>             ;;
>+        D)
>+            createleading="1"
>+            ;;
>         \?)
>             exit 1
>             ;;
>@@ -25,4 +32,8 @@ for arg; do
>     save "$arg"
> done
> 
>+if [ $# == 2 -a -n "$createleading" ]; then
>+    install -d $(dirname $2)
>+fi
>+
> exec_real


