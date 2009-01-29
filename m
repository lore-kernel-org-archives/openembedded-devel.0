Received: from [209.85.132.246] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dbaryshkov@gmail.com>) id 1LSSY4-0005TK-Ul
	for openembedded-devel@lists.openembedded.org;
	Thu, 29 Jan 2009 09:46:57 +0100
Received: by an-out-0708.google.com with SMTP id d40so1986461and.42
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Jan 2009 00:39:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=2MoAT8/pONVFW0/ASHKRrvR2Dw54Wq/749Qu4mL9f8w=;
	b=Cnp3ieH+/Vrs+pxufPUZarvNQ2AHpwS7FeWwoLztvwIDgse3IetRmNcXl7Le+BvNWA
	vIBx8L/thgW+tVNHfFx6wzgs3J1st1hcWZQqb1E71LMbeKCH9yW/gyY6QIYFKd/H2qPU
	UUsb874chFPYjoOzbuyelUc3AaHf2ycCl87sc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	b=ENpGmxgcqSMBpEHQSnB0iol1bQoFRijqtjpO4LaRiyS52eYOLL9UTcTXKgfiOJDqj9
	uMcvMVBf6qVnFuZgTdrqqD7XvpR6trgjKTcsrj8M8Z95T2YQxGGvRtEnp1uFOKTvDq9C
	qIjs3s/PlO92/yuekpTJ5x+BFCp8f14h6JH/g=
MIME-Version: 1.0
Received: by 10.100.91.3 with SMTP id o3mr291585anb.158.1233218354622; Thu, 29 
	Jan 2009 00:39:14 -0800 (PST)
In-Reply-To: <48239d390901282324j203a7111i6993ee223c12e109@mail.gmail.com>
References: <48239d390901282324j203a7111i6993ee223c12e109@mail.gmail.com>
Date: Thu, 29 Jan 2009 11:39:14 +0300
Message-ID: <bc64b4640901290039g76152012na95522723349968c@mail.gmail.com>
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: Sergey Lapin <slapinid@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: maintainers for wireshark/tshark, net-snmp, libpcap, tcpdump
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
X-List-Received-Date: Thu, 29 Jan 2009 08:46:57 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

2009/1/29 Sergey Lapin <slapinid@gmail.com>:
> Hi, all!
>
> Is there any maintainers for the following recipes:?
>
> o.o.d/packages/wireshark/tshark_0.99.4.bb
> o.o.d/packages/wireshark/wireshark_0.99.4.bb
> o.o.s/packages/net-snmp/net-snmp_*.bb
> o.o.s/packages/libpcap/libpcap_*.bb
> o.o.d/packages/tcpdump/tcpdump_*.bb
>
> I have a set of patches implementing IEEE802.15.4 stuff, so these are
> needed to be upgraded and patched.
>
> wireshark/tshark: buildability

While you at at it,  could you please also bump the version of wshark/tshark
to the upstream one?

> net-snmp: recipe for svn trunk with fixed release (net-snmp recipe is
> unbuildable currently
>   probably that could be fixed, too. Some libtool issue is there.).
> libpcap: upgrade to latest upstream (1.0.0), minor patching for
> ARPHRD_* stuff, does not change normal use
> tcpdump: upgrade to latest upstream (4.0.0) minor patching to properly
> react on DLT_IEEE802_15_4
>
> None of these patches change normal use of tools, only adds minor functionality.
>
> So, if there's no objections I'll push this stuff, and if somebody interested,
> I'll send patches beforehand.
>
> All the best,
> S.
>



-- 
With best wishes
Dmitry


