Return-Path: <stevend@limotec.be>
Received: from mailrelay107.isp.belgacom.be (mailrelay107.isp.belgacom.be
	[195.238.20.134])
	by mail.openembedded.org (Postfix) with ESMTP id 6AE086E26B
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 May 2015 06:02:21 +0000 (UTC)
X-Cloudmark-SP-Filtered: true
X-Cloudmark-SP-Result: v=1.1 cv=pojTLeLEEG+IB9MeyQ9xnWKWJHiyH+4Hnj5iAYu/pCk=
	c=1 sm=2
	a=IkcTkHD0fZMA:10 a=GFPcLUtVJV0o3bHeZV0A:9 a=QEXdDO2ut3YA:10
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: A2A7CAC90FpV/3wytdVcgj+FIcZhglMCgX8BAQEBAQGFLgEBBCNWEAsYAgImAgJXBog+BrQ9pDcBAQEBAQEEAgEfgSGKGYUFB4JogUUFtGsjYYEmH4FUgzMBAQE
Received: from 124.50-181-213.adsl-static.isp.belgacom.be (HELO
	[123.123.100.26]) ([213.181.50.124])
	by relay.skynet.be with ESMTP; 19 May 2015 08:02:22 +0200
Message-ID: <1432015346.7345.5.camel@pco026>
From: Steven Descheemaeker <stevend@limotec.be>
To: Marc Reilly <marc@cpdesign.com.au>
Date: Tue, 19 May 2015 08:02:26 +0200
In-Reply-To: <2040476.ASQcAD4fVn@dev2>
References: <1431959981.7345.2.camel@pco026> <2040476.ASQcAD4fVn@dev2>
X-Mailer: Evolution 3.4.4-3 
Mime-Version: 1.0
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
X-List-Received-Date: Tue, 19 May 2015 06:02:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit


Marc Reilly schreef op di 19-05-2015 om 10:42 [+1000]:
> Hi Steven,
> 
> 
> I got printing going a couple of years ago for HP printers, (the only type we 
> needed to support). I haven't been keeping track since, so I'm not sure what 
> the current state of recipes in yocto is.
> 
> We only need to be able to print pdfs. It's not fast, but it works.
> 
> On Monday, May 18, 2015 04:39:41 PM Steven Descheemaeker wrote:
> > Hello,
> > 
> > I'm trying to add printer support to my embedded board. I'm able to
> > build cups but there aren't any driver packages.
> > 
> > Are there any recent packages for printer drivers? I already tried to
> > build gutenprint/foomatic myself but I'm relatively new to yocto so I'm
> > not that good in writing recipes my own.
> > 
> > Anyone can help me out with this ?
> 
> 
> What type of printer are you using?
> 
> For HP printers, use the hplip drivers. There is a detect/add printer script 
> which is handy for adding USB printers. 
> For other brands, I'm not sure. I think there were some recipes for canon and 
> epson printers.
> 
> Below is a list of the packages in the image related to printing, the python 
> packages are for the hplip add scripts, and the perl is (i think) for the 
> foomatic filters.
> 
> Cheers,
> Marc
> 
> 
> 
> IMAGE_PRINTING_INSTALL = " \
> 	ghostscript \
> 	ghostscript-cups \
> 	cups \
> 	cups-doc \
> 	cups-lib \
> 	cups-libimage \
> 	foomatic-filters \
> 	poppler \
> 	poppler-data \
> 	hplip \
> 	hplip-ppd \
> 	hplip-cups \
> 	hplip-backend \
> 	hplip-filter \
> 	python-syslog \ 
> 	python-pprint \
> 	python-compression \
> 	python-shell \
> 	python-xml \
> 	python-unixadmin \
> 	python-html \
> 	python-resource \
> 	python-terminal \
> 	python-lang \
> 	python-stringold \
> 	python-netclient \
> 	python-fcntl \
> 	"
> 
> PRINTPERL = " \
> 	perl-module-strict \
> 	perl-module-posix \
> 	perl-module-fcntl  \
> 	perl-module-exporter-heavy \
> 	perl-module-cwd \
> 	perl-module-sigtrap \
> 	perl-module-io-handle \
> 	perl-module-data-dumper \
> 	perl-module-bytes \
> 	"
> 
> 
> 
> 

Hello Marc,

For HP I already found hplip indeed, but I need more than only HP as
printer brand. I'm searching for recipes like gutenprint/foomatic with a
large amount of printer drivers for different brands.

kind regards 

-- 
Steven Descheemaeker
Software developer
Limotec BVBA
Bosstraat 21
8570 Vichte


