Received: from [209.85.162.176] (helo=el-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <slapinid@gmail.com>) id 1LSROB-0002j7-GJ
	for openembedded-devel@lists.openembedded.org;
	Thu, 29 Jan 2009 08:32:39 +0100
Received: by el-out-1112.google.com with SMTP id v27so2177938ele.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Jan 2009 23:24:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:cc:content-type:content-transfer-encoding;
	bh=FmQYXwddaDFy2KE1+ETL3tCtSoo76933Rw0mgDJEshk=;
	b=Qau5To0RhxJZw8IZrAqYzNGvQIoHYW8A5vRQssNE3eNZDu+xS1x9NbYNAFV3djmaYU
	Vvx9DjxpCt97iOkC4tmpAZttNfKYi84uZPPzw85QsbAATcwfJ+yt244mky6EOkmDoZNB
	RkqVTory6LCG2cmeeMpVfq//ipFaJ7oJSVpuU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	b=fRiPmxf4WO7DIdva/F+tPnWWs+m70xg69fUJOuJpBC3aQzJX+YvquJ/pJV0eXN1ao1
	HZuxwYZyV/nBc4jt1j9v3FUINLaDQ/6IquVZ09JIMaeIQAK+yTD7xBFF2mya6t6RpGGC
	/LAQfZW3W7s3kBmXW797YaDwvfqq1PsShnOFE=
MIME-Version: 1.0
Received: by 10.150.98.4 with SMTP id v4mr1553898ybb.141.1233213899288; Wed, 
	28 Jan 2009 23:24:59 -0800 (PST)
Date: Thu, 29 Jan 2009 10:24:59 +0300
Message-ID: <48239d390901282324j203a7111i6993ee223c12e109@mail.gmail.com>
From: Sergey Lapin <slapinid@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Dmitry <dbaryshkov@gmail.com>
Subject: maintainers for wireshark/tshark, net-snmp, libpcap, tcpdump
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
X-List-Received-Date: Thu, 29 Jan 2009 07:32:40 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi, all!

Is there any maintainers for the following recipes:?

o.o.d/packages/wireshark/tshark_0.99.4.bb
o.o.d/packages/wireshark/wireshark_0.99.4.bb
o.o.s/packages/net-snmp/net-snmp_*.bb
o.o.s/packages/libpcap/libpcap_*.bb
o.o.d/packages/tcpdump/tcpdump_*.bb

I have a set of patches implementing IEEE802.15.4 stuff, so these are
needed to be upgraded and patched.

wireshark/tshark: buildability
net-snmp: recipe for svn trunk with fixed release (net-snmp recipe is
unbuildable currently
   probably that could be fixed, too. Some libtool issue is there.).
libpcap: upgrade to latest upstream (1.0.0), minor patching for
ARPHRD_* stuff, does not change normal use
tcpdump: upgrade to latest upstream (4.0.0) minor patching to properly
react on DLT_IEEE802_15_4

None of these patches change normal use of tools, only adds minor functionality.

So, if there's no objections I'll push this stuff, and if somebody interested,
I'll send patches beforehand.

All the best,
S.


