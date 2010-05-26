Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rep.dot.nop@gmail.com>) id 1OHB4b-0003h6-8g
	for openembedded-devel@lists.openembedded.org;
	Wed, 26 May 2010 09:30:41 +0200
Received: by fxm9 with SMTP id 9so1794672fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 May 2010 00:26:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:received:date:from:to:cc
	:subject:message-id:references:mime-version:content-type
	:content-disposition:in-reply-to:user-agent;
	bh=RrB8E1t+bqaMWTn5mGORe2W4awSEgpBp0m7iCxNBPvU=;
	b=HyBdmpPp2vWu81v1u/pwOtCeKuPPfCQjAPra36EidVmGy6iUYk1zVz0F/O4u5vNNAa
	2PpXpFGWcYK4d1a9Y1YqVSHKqb1MkGb3DpintypFcB7pe5NT+Aj0tufdEYGRxeHd6wDs
	M3ZtkROiTjbc7nTsieIZMwbzCpOkXfGQe3E/c=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=mzOR0u/MJE29q/BXr5EcuRvK5e4rHeB9Rut1d09QKSVKAVe32Ix2D6iFAWlVqXJikG
	tKFVQ6I11O87CWEny+RjIrZf4gmrE6H+eeEUp3r6IUwUgTkC08VuGYuIPGyo9JBa1IIT
	s1HTBZjqWWeawfVFRFy5fsr5KPYxGbU/PeRE4=
Received: by 10.223.46.135 with SMTP id j7mr7369334faf.105.1274858793452;
	Wed, 26 May 2010 00:26:33 -0700 (PDT)
Received: from s42.loc (85-127-94-237.dynamic.xdsl-line.inode.at
	[85.127.94.237])
	by mx.google.com with ESMTPS id u12sm28706150fah.16.2010.05.26.00.26.32
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 26 May 2010 00:26:32 -0700 (PDT)
Received: from cow by s42.loc with local (Exim 4.71)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1OHBC2-0000pc-M4; Wed, 26 May 2010 09:38:22 +0200
Date: Wed, 26 May 2010 09:38:22 +0200
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100526073822.GA31532@mx.loc>
References: <1274854676-5931-1-git-send-email-koen@openembedded.org>
MIME-Version: 1.0
In-Reply-To: <1274854676-5931-1-git-send-email-koen@openembedded.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: rep.dot.nop@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Chase Maupin <chase.maupin@ti.com>, Koen Kooi <k-kooi@ti.com>
Subject: Re: [PATCH 1/7] Usermanual/common_use_cases: Fix documentation errors
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
X-List-Received-Date: Wed, 26 May 2010 07:30:41 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 26, 2010 at 08:17:50AM +0200, Koen Kooi wrote:
>From: Chase Maupin <chase.maupin@ti.com>
>
>* Fixed up typos and other errors in the documentation.
>
>Signed-off-by: Chase Maupin <chase.maupin@ti.com>
>Signed-off-by: Koen Kooi <k-kooi@ti.com>
>---
> docs/usermanual/chapters/common_use_cases.xml |   45 +++++++++++++-----------
> 1 files changed, 24 insertions(+), 21 deletions(-)
>
>diff --git a/docs/usermanual/chapters/common_use_cases.xml b/docs/usermanual/chapters/common_use_cases.xml
>index 7ae3ee5..9adb66a 100644
>--- a/docs/usermanual/chapters/common_use_cases.xml
>+++ b/docs/usermanual/chapters/common_use_cases.xml

>@@ -575,7 +578,7 @@ $ <command>bitbake</command> meta-toolchain-qte
>             should start by downloading the SDK and untar it to the root folder
>             (<filename>/</filename>). Once this operation is finished you will
>             find a new directory <filename>/usr/local/angstrom/arm/</filename> and
>-            it contains the <filename>environment-setup</filename> to setup the
>+            it contains the <filename>environment-setup</filename>file to setup the

missing space before "file" ?

>             <emphasis>QMAKESPEC</emphasis> and various other paths.
>             </para>


