Received: from [66.249.82.227] (helo=wx-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <leon.woestenberg@gmail.com>) id 1Ho1v9-00012A-6B
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 May 2007 20:38:51 +0200
Received: by wx-out-0506.google.com with SMTP id s14so2007686wxc
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 May 2007 11:38:37 -0700 (PDT)
Received: by 10.90.98.3 with SMTP id v3mr6639223agb.1179254317529;
	Tue, 15 May 2007 11:38:37 -0700 (PDT)
Received: by 10.90.50.5 with HTTP; Tue, 15 May 2007 11:38:37 -0700 (PDT)
Message-ID: <c384c5ea0705151138n4087e20cx1f2971a69573091d@mail.gmail.com>
Date: Tue, 15 May 2007 20:38:37 +0200
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <200705151322.39110.robin.farine@terminus.org>
MIME-Version: 1.0
References: <200705151322.39110.robin.farine@terminus.org>
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
X-List-Received-Date: Tue, 15 May 2007 18:38:52 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello Robin,

On 5/15/07, Robin Farine <robin.farine@terminus.org> wrote:
> +IXP4XX_NPE_FIRWMARE_DEFINES ?= "\
> +-DIX_NPEDL_NPEIMAGE_NPEB_ETH_LEARN_FILTER_SPAN_FIREWALL"
> +
>  do_compile() {
>         mv ${WORKDIR}/IxNpeMicrocode.h ${S}/
> -       gcc -Wall IxNpeMicrocode.c -o IxNpeMicrocode
> +       gcc -Wall ${IXP4XX_NPE_FIRWMARE_DEFINES} IxNpeMicrocode.c -o
>
Please change IXP4XX_NPE_FIRWMARE_DEFINES into IXP4X
IX_NPE_FIRMWARE_DEFINES.

The idea looks ok.

Regards,

Leon.


