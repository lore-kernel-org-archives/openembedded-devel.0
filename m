Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <giuseppe.condorelli@gmail.com>) id 1SHuql-0001wS-PW
	for openembedded-devel@lists.openembedded.org;
	Wed, 11 Apr 2012 12:32:31 +0200
Received: by iaag37 with SMTP id g37so1128187iaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Apr 2012 03:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=1a/eYDzW1RUCMxGtX0RDqOQrWFVCrmDno5VwW5DbiQM=;
	b=hkxrmmdFGmz0lKbGmqINtHgjifb3pBt3i+i/W3al63H20ysaUjz5XEw684n53YnK2o
	SEOXPpSFNZYhg8Hk2mEcqY/5eFm5wxfGbLI64XgwDfCLDHWFkaBQSrlJBDIXgED0+bgU
	/x1CGOR+w8TM+fUrK6/V4v4DItdrGs3f5G3z+CENkxQJdPLXyPD3iuO0WGVX+WZxX2Al
	swLlhsO0Aopnz2qoRGXLnC1MDDpTfNtX5KP7NcsB+mR0wc3TtFKKehBQciDq87Ea7/qQ
	FErrBBtyhea/xfPbfmj7pCTcwPwnseEWHaTQ10Bm6sYmg6KQOMXfjeuXariAX5xDl4Tl
	mz1Q==
MIME-Version: 1.0
Received: by 10.43.68.132 with SMTP id xy4mr8944116icb.54.1334139791274; Wed,
	11 Apr 2012 03:23:11 -0700 (PDT)
Received: by 10.231.170.15 with HTTP; Wed, 11 Apr 2012 03:23:11 -0700 (PDT)
Date: Wed, 11 Apr 2012 12:23:11 +0200
Message-ID: <CAOHjBZuGf-wG2jpSR1R9sM_KawN+5H9ZS_ivikYgfMvLJVVtXQ@mail.gmail.com>
From: Giuseppe Condorelli <giuseppe.condorelli@gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: [oe-core] THISDIR usage
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
X-List-Received-Date: Wed, 11 Apr 2012 10:32:32 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi, I moved to OE-Core (working on stable version dowloaded as tar file
from cgit.openembedded.org).
I'm in trouble trying to include a source through .bbappend file, located
under my meta-<personal> subtree.

FILESPATHBASE_prepend := "${THISDIR}/files:"
SRC_URI += "file://myfile.tar.gz"

results in a no such file or directory. Please can you tell me if I'm
missing anything?

Thanks,
Giuseppe

