Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1TCDvi-0003hn-Kl
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 Sep 2012 20:14:22 +0200
Received: by obblz20 with SMTP id lz20so5095631obb.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 Sep 2012 11:01:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-originating-ip:in-reply-to:references:from:date
	:message-id:subject:to:content-type:x-gm-message-state;
	bh=8TOpGI5MDwNZu6AZCxgXNU6Ra8yfidqIr+y0gyVt2rc=;
	b=CQ+PcXb6vdNbmoVspWVxXPaBLyZSn72VtMfA81l/848LB8Scjv5TakHTo5HRTnLb9l
	HE+Lyp1h3+QGOSX3bfk/E1VD8DnqKrXsSMzbhmyKMw1vXcrbq7vA5bnxLPDXP2+xhJtA
	Hqj1TGduZlVfbURVV9FnwRZhitJgsI/oveliwUD8KVYRuaW2vGNFfumjTgyKmI4EKrkU
	lG6lN5rxqpDA91OJ0J2f4da3SED5f7WiPu9Wl+NXyrIv2aRzdHyLva7bBtc6XhBSnc5+
	tE9yTXmEoUqQD+OcoXxqnvSimwpdOVbgNVAhsa6mTpNhnk4iJ6AeqMZYigTgfW69PejH
	nWJg==
Received: by 10.60.13.226 with SMTP id k2mr117824oec.14.1347559299251; Thu, 13
	Sep 2012 11:01:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.76.93.35 with HTTP; Thu, 13 Sep 2012 11:01:17 -0700 (PDT)
X-Originating-IP: [89.121.200.106]
In-Reply-To: <5049AD56.8010808@communistcode.co.uk>
References: <5048B901.3060103@communistcode.co.uk>
	<1346943545.2673.198.camel@phil-desktop>
	<5048BC6D.8080904@communistcode.co.uk>
	<1346944157.2673.199.camel@phil-desktop>
	<5048BE25.2070004@communistcode.co.uk>
	<1346944624.2673.200.camel@phil-desktop>
	<5048BF04.2000904@communistcode.co.uk>
	<5048C7D5.70301@communistcode.co.uk>
	<1346947708.2673.201.camel@phil-desktop>
	<5048CC32.30705@communistcode.co.uk>
	<1346948364.2673.203.camel@phil-desktop>
	<5048D11C.9050108@communistcode.co.uk>
	<5049AD56.8010808@communistcode.co.uk>
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Thu, 13 Sep 2012 21:01:17 +0300
Message-ID: <CAK18fxE_rZFLr7qRKtrvye-ScChCD5htfGBaF4XRtuxufpEwdA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Gm-Message-State: ALoCoQlsMB9geTsR+CVAZO5R7QPXwGvgwY9Z9GYpDLvV3pOrSolxxY3AQO/QiAFlSSJKDyDVF077
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Issues building tinyXML
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
X-List-Received-Date: Thu, 13 Sep 2012 18:14:23 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Sep 7, 2012 at 11:16 AM, Jack Mitchell <ml@communistcode.co.uk>wrote:

> I think this has it cracked now.Phil, note the -fpic, is that in the right
> place?
>
>
> DESCRIPTION = "A simple, small, C++ XML parser that can be easily
> integrated into other programs"
>
> LICENSE = "zlib"
> LIC_FILES_CHKSUM = "file://tinyxml.cpp;endline=**23;md5=**
> b97285d8fafcc49b761ca785816cc3**97"
>
> SRC_URI = "http://ftp.debian.org/debian/**pool/main/t/tinyxml/${PN}_${**
> PV}.orig.tar.gz<http://ftp.debian.org/debian/pool/main/t/tinyxml/$%7BPN%7D_$%7BPV%7D.orig.tar.gz>
> "
>
> SRC_URI[md5sum] = "**c1b864c96804a10526540c664ade67**f0"
> SRC_URI[sha256sum] = "**15bdfdcec58a7da30adc87ac2b078e**
> 4417dbe5392f3afb719f9ba6d06264**5593"
>
> S = "${WORKDIR}/tinyxml"
>
> TINYXML_USE_STL = "YES"
>
> do_compile() {
>   oe_runmake LD="${CXX}"
>
>   ${CXX} -fpic -shared -o lib${PN}.so.0.${PV} \
>     -Wl,-soname,lib${PN}.so.0 $(ls *.o | grep -v xmltest)
>
> }
>

I would define:
LD = "${CXX}"
And then use a append not overwrite the whole compile rule.


> do_install() {
>
>   install -d -m 0755 ${D}${libdir}
>   install -d -m 0755 ${D}${includedir}
>
>   install -m 0755 lib${PN}.so.0.${PV} ${D}${libdir}
>   install -m 0644 ${PN}.h tinystr.h ${D}${includedir}
>
>   (cd ${D}${libdir}
>
>     ln -s lib${PN}.so.0.${PV} lib${PN}.so.0
>     ln -s lib${PN}.so.0.${PV} lib${PN}.so
>   )
>
What are these parentheses for?

>
> }
>
>
ag

