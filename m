Received: from [212.90.198.182] (helo=balrog.cybernet.ch)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <robin.farine@terminus.org>) id 1Ho3Sg-0005tc-24
	for openembedded-devel@openembedded.org; Tue, 15 May 2007 22:17:35 +0200
Received: from tilia.local (cust.dyn.83-173-255-87.cybernet.ch [83.173.255.87])
	by balrog.cybernet.ch (8.13.8/8.13.8) with ESMTP id l4FKHH4E051008
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 May 2007 22:17:19 +0200 (CEST)
	(envelope-from robin.farine@terminus.org)
Received: from localhost ([127.0.0.1] ident=rfarine)
	by tilia.local with esmtp (Exim 4.63)
	(envelope-from <robin.farine@terminus.org>) id 1Ho3Sa-000110-DU
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 May 2007 22:17:28 +0200
From: Robin Farine <robin.farine@terminus.org>
To: openembedded-devel@openembedded.org
Date: Tue, 15 May 2007 22:17:27 +0200
User-Agent: KMail/1.9.5
References: <200705151322.39110.robin.farine@terminus.org>
	<c384c5ea0705151138n4087e20cx1f2971a69573091d@mail.gmail.com>
In-Reply-To: <c384c5ea0705151138n4087e20cx1f2971a69573091d@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <200705152217.27815.rfarine@tilia.local>
X-Scanned-By: MIMEDefang 2.61 on 212.90.198.182
Subject: Re: RFC: machine customized ixp4xx NPE firmware
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 15 May 2007 20:17:37 -0000
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Tuesday May 15 2007 20:38, Leon Woestenberg wrote:
> On 5/15/07, Robin Farine <robin.farine@terminus.org> wrote:
> > +IXP4XX_NPE_FIRWMARE_DEFINES ?= "\
> > +-DIX_NPEDL_NPEIMAGE_NPEB_ETH_LEARN_FILTER_SPAN_FIREWALL"
> > +
> >  do_compile() {
> >         mv ${WORKDIR}/IxNpeMicrocode.h ${S}/
> > -       gcc -Wall IxNpeMicrocode.c -o IxNpeMicrocode
> > +       gcc -Wall ${IXP4XX_NPE_FIRWMARE_DEFINES}
> > IxNpeMicrocode.c -o
>
> Please change IXP4XX_NPE_FIRWMARE_DEFINES into IXP4X
> IX_NPE_FIRMWARE_DEFINES.

Ah, you mean s/FIRWMARE/FIRMWARE/, yes, makes sense :-). I'll fix 
this and submit the patch to the bug tracker.

> The idea looks ok.

Thanks for reviewing it.

Regards,

Robin


