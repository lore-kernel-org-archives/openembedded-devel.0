Return-Path: <marc@cpdesign.com.au>
X-Greylist: delayed 1058 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 19 May 2015 01:06:27 UTC
Received: from s36.web-servers.com.au (s36.web-servers.com.au [118.127.46.63])
	by mail.openembedded.org (Postfix) with ESMTP id E626760962
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 May 2015 01:06:27 +0000 (UTC)
Received: from ppp59-167-120-30.static.internode.on.net ([59.167.120.30]:50424
	helo=dev2.localnet) by s36.web-servers.com.au with esmtpsa
	(TLSv1.2:DHE-RSA-AES256-GCM-SHA384:256) (Exim 4.85)
	(envelope-from <marc@cpdesign.com.au>)
	id 1YuViC-000vDn-Ok; Tue, 19 May 2015 10:48:48 +1000
From: Marc Reilly <marc@cpdesign.com.au>
To: Steven Descheemaeker <stevend@limotec.be>
Date: Tue, 19 May 2015 10:42:10 +1000
Message-ID: <2040476.ASQcAD4fVn@dev2>
User-Agent: KMail/4.11.5 (Linux/3.11.10-29-desktop; KDE/4.11.5; x86_64; ; )
In-Reply-To: <1431959981.7345.2.camel@pco026>
References: <1431959981.7345.2.camel@pco026>
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - s36.web-servers.com.au
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - cpdesign.com.au
X-Get-Message-Sender-Via: s36.web-servers.com.au: authenticated_id:
	marc@cpdesign.com.au
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: CUPS ppd drivers
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 19 May 2015 01:06:28 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Steven,


I got printing going a couple of years ago for HP printers, (the only type we 
needed to support). I haven't been keeping track since, so I'm not sure what 
the current state of recipes in yocto is.

We only need to be able to print pdfs. It's not fast, but it works.

On Monday, May 18, 2015 04:39:41 PM Steven Descheemaeker wrote:
> Hello,
> 
> I'm trying to add printer support to my embedded board. I'm able to
> build cups but there aren't any driver packages.
> 
> Are there any recent packages for printer drivers? I already tried to
> build gutenprint/foomatic myself but I'm relatively new to yocto so I'm
> not that good in writing recipes my own.
> 
> Anyone can help me out with this ?


What type of printer are you using?

For HP printers, use the hplip drivers. There is a detect/add printer script 
which is handy for adding USB printers. 
For other brands, I'm not sure. I think there were some recipes for canon and 
epson printers.

Below is a list of the packages in the image related to printing, the python 
packages are for the hplip add scripts, and the perl is (i think) for the 
foomatic filters.

Cheers,
Marc



IMAGE_PRINTING_INSTALL = " \
	ghostscript \
	ghostscript-cups \
	cups \
	cups-doc \
	cups-lib \
	cups-libimage \
	foomatic-filters \
	poppler \
	poppler-data \
	hplip \
	hplip-ppd \
	hplip-cups \
	hplip-backend \
	hplip-filter \
	python-syslog \ 
	python-pprint \
	python-compression \
	python-shell \
	python-xml \
	python-unixadmin \
	python-html \
	python-resource \
	python-terminal \
	python-lang \
	python-stringold \
	python-netclient \
	python-fcntl \
	"

PRINTPERL = " \
	perl-module-strict \
	perl-module-posix \
	perl-module-fcntl  \
	perl-module-exporter-heavy \
	perl-module-cwd \
	perl-module-sigtrap \
	perl-module-io-handle \
	perl-module-data-dumper \
	perl-module-bytes \
	"





