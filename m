Received: from [64.233.184.228] (helo=wr-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <cliff.brake@gmail.com>) id 1H3xFE-00078J-AJ
	for openembedded-devel@lists.openembedded.org;
	Mon, 08 Jan 2007 17:21:08 +0100
Received: by wr-out-0506.google.com with SMTP id i31so93672wra
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 08 Jan 2007 08:19:28 -0800 (PST)
Received: by 10.78.193.19 with SMTP id q19mr5501869huf.1168273167976;
	Mon, 08 Jan 2007 08:19:27 -0800 (PST)
Received: by 10.78.164.17 with HTTP; Mon, 8 Jan 2007 08:19:27 -0800 (PST)
Message-ID: <f96d234e0701080819q7a8017d3q922b055670163c54@mail.gmail.com>
Date: Mon, 8 Jan 2007 11:19:27 -0500
From: "Cliff Brake" <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
	"Marcin Juszkiewicz" <openembedded@hrw.one.pl>
In-Reply-To: <200701081618.46665.openembedded@hrw.one.pl>
MIME-Version: 1.0
References: <200701081618.46665.openembedded@hrw.one.pl>
Subject: Re: Status of ARM machines in OE
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
X-List-Received-Date: Mon, 08 Jan 2007 16:21:08 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 1/8/07, Marcin Juszkiewicz <openembedded@hrw.one.pl> wrote:

> compulab-pxa270 - use binary driver for flash so only hardfloat
> distributions
> can use this machine:
>
> arm-angstrom-linux-gnueabi-ld: ERROR: drivers/block/cl_flash/CL_FlashDrv uses FPA instructions, whereas drivers/block/cl_flash/fdrv.o does not
> arm-angstrom-linux-gnueabi-ld: failed to merge target specific data of file drivers/block/cl_flash/CL_FlashDrv
>
> Full log:
> http://ewi546.ewi.utwente.nl/tinderbox/showlog.pl?machine_id=177&logfile=20070107145519.log

Hi Marcin,

Thanks for doing the builds -- very interesting.

The issue with this drive is it uses the old abi, so non-eabi builds
should work.  I recently added a note in the kernel bb.  Softfloat is
working fine.  Is there any easy way in angstrom to specify oabi?

Thanks,
Cliff

-- 
=======================
Cliff Brake
http://bec-systems.com


