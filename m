Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SOErJ-0003yz-ET
	for openembedded-devel@lists.openembedded.org;
	Sat, 28 Apr 2012 23:07:13 +0200
Received: by pbbrq2 with SMTP id rq2so1958573pbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Apr 2012 13:57:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:x-enigmail-version:content-type
	:content-transfer-encoding;
	bh=EkRokV1UgkEkkz+6/xCxYXt4D1S3aEzTDs4FBoJ9rLY=;
	b=BwzzYYr8Cz6tKmVwpdT76kadn7WiOgM/p9TCGEsw5qIMp5Id8kPhbMpEmJao73EaoZ
	JWuk9XSvnpXRc6X3tj6HjBycXr8/YczyI5CfnVkvO+H9pLPkxpMhtcxmmsI/TuoWA2aW
	01JBK7xpO2A1pFfSJMPShb4wAp9dGdDxEzziCIEUV74+I/vTkCVzv8BQZxiJv3Pek2Eg
	IiLRJuGi+GAGKKGM4+po+t7a/UZJ1a0wc7UoFtzcVyDynXqZVKRgITWpgUOAWvoYZ9nt
	Ms4qozrwc0C8icGJOB0UV3/FBi5T3G5ftioHOBgSmLUALicJ9DOXwway8LoNRRyMRpXe
	E4vQ==
Received: by 10.68.242.101 with SMTP id wp5mr8609391pbc.146.1335646652937;
	Sat, 28 Apr 2012 13:57:32 -0700 (PDT)
Received: from [192.168.1.104] (99-57-140-209.lightspeed.sntcca.sbcglobal.net.
	[99.57.140.209])
	by mx.google.com with ESMTPS id qe7sm10659081pbc.56.2012.04.28.13.57.30
	(version=SSLv3 cipher=OTHER); Sat, 28 Apr 2012 13:57:31 -0700 (PDT)
Message-ID: <4F9C59B8.9000106@gmail.com>
Date: Sat, 28 Apr 2012 13:57:28 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:11.0) Gecko/20120411 Thunderbird/11.0.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <CAOHjBZuGf-wG2jpSR1R9sM_KawN+5H9ZS_ivikYgfMvLJVVtXQ@mail.gmail.com>
In-Reply-To: <CAOHjBZuGf-wG2jpSR1R9sM_KawN+5H9ZS_ivikYgfMvLJVVtXQ@mail.gmail.com>
X-Enigmail-Version: 1.4.1
Subject: Re: [oe-core] THISDIR usage
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
X-List-Received-Date: Sat, 28 Apr 2012 21:07:13 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 04/11/2012 03:23 AM, Giuseppe Condorelli wrote:
> Hi, I moved to OE-Core (working on stable version dowloaded as tar
> file from cgit.openembedded.org). I'm in trouble trying to include
> a source through .bbappend file, located under my meta-<personal>
> subtree.
> 
> FILESPATHBASE_prepend := "${THISDIR}/files:" SRC_URI +=
> "file://myfile.tar.gz"
> 

assuming you have set the layer properly and bitbake is able to find
it and parse it you will do

FILESEXTRAPATHS := "${THISDIR}/files"
SRC_URI += "file://myfile.tar.gz"

that should do it.

Check first if your layer is being added to the parse it should be shown
in build header that is dumped first by bitbake before it starts
building its also in cooker.log file in build dir.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iEYEARECAAYFAk+cWbgACgkQuwUzVZGdMxTXOwCdH0ltQ+crP/jqJG2q/hS/QYwY
BEgAnjrSE5qYynydngZL/i1ZfRywV/DU
=v7Cy
-----END PGP SIGNATURE-----


